<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/1000886390/25.1.3%2B)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
# VCL AI Assistant Example

This is a simple example project demonstrating how to integrate AI functionality into DevExpress VCL controls using a 3rd-party AI library (GenAI) available via the GetIt Package Manager.
VCL developers can switch between different AI providers and explore commands that DevExpress AI assistant adds to text editors (such as TcxMemo or TdxRichEditControl).

> [!NOTE]
> Until VCL/Embarcadero ships official AI-related SDK libraries, VCL developers can plug in third-party libraries or their own implementations to support different AI providers. For example, the DevExpress VCL Rich Text Editor demo ("%Public%\DevExpress VCL Demos\MegaDemos\Product Demos\ExpressRichEditControl\dxAI.ChatClient.Azure.pas" uses our Azure OpenAI service deployment via a simple `TdxAIAzureChatClient` implementation (extends our base `TdxAIChatClient` API).

<Screenshot or video goes here>

 ## Prerequisites

 - Microsoft Windows 10 or newer
 - Embarcadero RAD Studio IDE 12.0 or newer (Community Edition is not supported)
 - The [GenAI](https://getitnow.embarcadero.com/genai-optimized-openai-integration-wrapper/) package installed from GetIt
 - DevExpress VCL Components v25.1.3 or newer

## Running the example

To connect to an AI provider, uncomment a `TdxGenAIChatClient.Create` call for the required AI provider (OpenAI, DeepSeek, or Google Gemini) and insert a valid API key instead of `'YOUR-API-KEY'`:

```
procedure TAIDemoMainForm.FormCreate(Sender: TObject);
begin
  // OpenAI
  // TdxGenAIChatClient.Create('https://api.openai.com/v1', 'YOUR-API-KEY', 'gpt-4o-mini');

  // DeepSeek
  // TdxGenAIChatClient.Create('https://api.deepseek.com/v1', 'YOUR-API-KEY', 'deepseek-chat');

  // Google Gemini
  // TdxGenAIChatClient.Create('https://generativelanguage.googleapis.com/v1beta/openai', 'YOUR-API-KEY', 'gemini-2.0-flash');
end;
```

> [!NOTE]
> DevExpress AI-powered extensions follow the "bring your own key" principle. DevExpress does not offer a REST API and does not ship any built-in LLMs/SLMs. You need an active subscription for the required AI service to obtain the REST API endpoint, key, and model deployment name. These variables must be specified at application startup to register AI clients and enable DevExpress AI-powered Extensions in your application.

<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=vcl-ai-memo-example&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=vcl-ai-memo-example&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
