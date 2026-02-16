<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/1000886390/25.1.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T1296609)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
# DevExpress VCL - Integrate a Third-Party AI/LLM Provider Library

This simple example integrates AI into DevExpress VCL Controls using a 3rd-party AI library (GenAI) available via the GetIt Package Manager.
VCL developers can switch between different AI providers and utilize commands that DevExpress AI Assistant adds to DevExpress Text Editors (such as [TcxMemo](https://docs.devexpress.com/VCL/cxMemo.TcxMemo) or [TdxRichEditControl](https://docs.devexpress.com/VCL/dxRichEdit.Control.TdxRichEditControl)).

![DevExpress VCL AI Example](/CS/Images/vcl-text-editor-ai-demo.gif)

> [!NOTE]
> Until Embarcadero ships official AI-related SDK libraries, VCL developers can plug in third-party libraries or leverage own implementation to support different AI providers. For example, the DevExpress VCL Rich Text Editor demo ("%Public%\DevExpress VCL Demos\MegaDemos\Product Demos\ExpressRichEditControl\dxAI.ChatClient.Azure.pas" uses our Azure OpenAI service deployment via a simple `TdxAIAzureChatClient` implementation (extends our base `TdxAIChatClient` API).

<Screenshot or video goes here>

 ## Prerequisites

 - Microsoft Windows 10 or newer
 - Embarcadero RAD Studio IDE 12.0 or newer (Community Edition is not supported)
 - The [GenAI](https://getitnow.embarcadero.com/genai-optimized-openai-integration-wrapper/) package installed from GetIt
 - DevExpress VCL Components v25.1.3 or newer

## Running the example

To connect to an AI provider, uncomment the `TdxGenAIChatClient.Create` call for the required AI provider (OpenAI, DeepSeek, or Google Gemini) and insert a valid API key instead of `'YOUR-API-KEY'`:

```
procedure TAIDemoMainForm.FormCreate(Sender: TObject);
var
  Client: TdxAIChatClient;
begin
  // OpenAI
  // Client := TdxGenAIChatClient.Create('https://api.openai.com/v1', 'YOUR-API-KEY', 'gpt-4o-mini');

  // DeepSeek
  // Client := TdxGenAIChatClient.Create('https://api.deepseek.com/v1', 'YOUR-API-KEY', 'deepseek-chat');

  // Google Gemini
  // Client := TdxGenAIChatClient.Create('https://generativelanguage.googleapis.com/v1beta/openai', 'YOUR-API-KEY', 'gemini-2.0-flash');

  TdxAIChatClients.AddChatClient(Client);
end;
```

> [!NOTE]
> DevExpress AI-powered Extensions follow the "bring your own key" principle. DevExpress does not offer a REST API and does not ship any built-in LLMs/SLMs. You need an active subscription for the required AI service to obtain the REST API endpoint, key, and model deployment name. These variables must be specified at application startup to register AI clients and enable DevExpress AI-powered Extensions in your application.

<!-- feedback -->
## Does This Example Address Your Development Requirements/Objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=vcl-ai-memo-example&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=vcl-ai-memo-example&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->


