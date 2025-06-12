unit Main;

interface

uses
  dxGenAI, cxControls, Vcl.Forms, Vcl.Controls, cxTextEdit, cxMemo, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, System.Classes;

type
  TAIDemoMainForm = class(TForm)
    cxMemo: TcxMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AIDemoMainForm: TAIDemoMainForm;

implementation

{$R *.dfm}

procedure TAIDemoMainForm.FormCreate(Sender: TObject);
begin
  // OpenAI
  // TdxGenAIChatClient.Create('https://api.openai.com/v1', 'YOUR-API-KEY', 'gpt-4o-mini');

  // DeepSeek
  // TdxGenAIChatClient.Create('https://api.deepseek.com/v1', 'YOUR-API-KEY', 'deepseek-chat');

  // Google Gemini
  // TdxGenAIChatClient.Create('https://generativelanguage.googleapis.com/v1beta/openai', 'YOUR-API-KEY', 'gemini-2.0-flash');
end;

end.
