unit dxGenAI;

interface

uses
  Threading, GenAI, GenAI.Types, dxAI, dxAI.Commands.Text;

type

  { TdxGenAIChatClient }

  TdxGenAIChatClient = class(TdxAIChatClient)
  private
    FGenAI: IGenAI;
    FModel: string;
    function PerformChatRequest(const AMessages: IEnumerable<TdxAIChatMessage>;
      const AOptions: TdxAIChatOptions): TdxAIChatResponse;
    class function ConvertMessages(const AMessages: IEnumerable<TdxAIChatMessage>): TArray<TMessagePayload>; static;
    class function ConvertResponse(AChat: TChat): TdxAIChatResponse; static;
    class procedure SetupChatParams(AChatParams: TChatParams; AOptions: TdxAIChatOptions);
  public
    constructor Create(const ABaseUrl, AAPIKey, AModel: string);
    function GetResponseAsync(const AMessages: IEnumerable<TdxAIChatMessage>; const AOptions: TdxAIChatOptions = nil;
      const ACancellationToken: TObject = nil): IFuture<TdxAIChatResponse>; override;
  end;

implementation

{ TdxGenAIChatClient }

constructor TdxGenAIChatClient.Create(const ABaseUrl, AAPIKey, AModel: string);
begin
  inherited Create;
  FGenAI := TGenAIFactory.CreateInstance(AApiKey);
  FGenAI.BaseURL := ABaseUrl;
  FModel := AModel;
end;

class function TdxGenAIChatClient.ConvertMessages(const AMessages: IEnumerable<TdxAIChatMessage>): TArray<TMessagePayload>;
var AGenAIMessage: TMessagePayload;
  ADxMessage: TdxAIChatMessage;
begin
  Result := [];
  for ADxMessage in AMessages do
  begin
    AGenAIMessage := TMessagePayload.Create;
    AGenAIMessage.Role(ADxMessage.Role.Value)
                 .Content(ADxMessage.Text);
    Result := Result + [AGenAIMessage];
  end;
end;

class function TdxGenAIChatClient.ConvertResponse(AChat: TChat): TdxAIChatResponse;
var ADxMessage: TdxAIChatMessage;
  AChoice: TChoice;
  AMessageText: string;
begin
  ADxMessage := TdxAIChatMessage.Create;
  ADxMessage.Role := TdxAIChatRole.Assistant;
  Result := TdxAIChatResponse.Create(ADxMessage, TdxAIChatFinishReason.Error);
  try
    for AChoice in AChat.Choices do
    begin
      if AChoice.Message.Refusal <> '' then
        AMessageText := AChoice.Message.Refusal
      else
        AMessageText := AChoice.Message.Content;
      ADxMessage.Contents.Add(TdxAITextContent.Create(AMessageText));
      // Merging multiple different choices
      Result.FinishReason := TdxAIChatFinishReason.Create(AChoice.FinishReason.ToString);
    end;
  except
    Result.Free;
  end;
end;

class procedure TdxGenAIChatClient.SetupChatParams(AChatParams: TChatParams; AOptions: TdxAIChatOptions);
begin
  AChatParams.Temperature(AOptions.Temperature)
             .MaxCompletionTokens(AOptions.MaxTokens)
             .TopP(AOptions.TopP)
             .FrequencyPenalty(AOptions.FrequencyPenalty)
             .PresencePenalty(AOptions.PresencePenalty)
             .Stop(AOptions.StopSequences.ToArray);
  if AOptions.ToolMode.GetIsAuto then
    AChatParams.ToolChoice(TToolChoice.auto)
  else if AOptions.ToolMode.GetIsRequired then
    AChatParams.ToolChoice(TToolChoice.required)
  else
    AChatParams.ToolChoice(TToolChoice.none);
end;

function TdxGenAIChatClient.GetResponseAsync(const AMessages: IEnumerable<TdxAIChatMessage>;
  const AOptions: TdxAIChatOptions; const ACancellationToken: TObject): IFuture<TdxAIChatResponse>;
begin
  Result := TTask.Future<TdxAIChatResponse>(
    function: TdxAIChatResponse
    begin
      Result := PerformChatRequest(AMessages, AOptions);
    end);
  Result.Start;
end;

function TdxGenAIChatClient.PerformChatRequest(const AMessages: IEnumerable<TdxAIChatMessage>;
  const AOptions: TdxAIChatOptions): TdxAIChatResponse;
var AChat: TChat;
  AGenAIMessages: TArray<TMessagePayload>;
begin
  AGenAIMessages := ConvertMessages(AMessages);
  AChat := FGenAI.Chat.Create(
    procedure (AParams: TChatParams)
    begin
      if AOptions <> nil then
        SetupChatParams(AParams, AOptions);
      AParams.Model(FModel);
      AParams.Messages(AGenAIMessages);
    end);
  Result := ConvertResponse(AChat);
end;

end.
