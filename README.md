<!-- default badges list -->
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T1026838)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
[![](https://img.shields.io/badge/💬_Leave_Feedback-feecdd?style=flat-square)](#does-this-example-address-your-development-requirementsobjectives)
<!-- default badges end -->
# VCL AI Assistant Example

This is a simple example project demonstrating how to integrate AI functionality into a DevExpress VCL controls using a 3rd-party AI library (GenAI) available via the GetIt Package Manager.
VCL developers can switch between different AI providers and explore commands that DevExpress AI assistants adds to text controls such as TcxMemo or TdxRichEditControl.

<Screenshot or video goes here>


## Prerequisites

 - Microsoft Windows 10 or newer
 - Embarcadero RAD Studio IDE 12.0 or newer (Community Edition is not supported)
 - The [GenAI](https://getitnow.embarcadero.com/genai-optimized-openai-integration-wrapper/) package installed from GetIt
 - DevExpress VCL Components v25.1.3 or newer

## Running the example
In order to connect to an AI provider the developer must uncomment on of the following lines and provide relevant API key.
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

<!-- feedback -->
## Does this example address your development requirements/objectives?

[<img src="https://www.devexpress.com/support/examples/i/yes-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=example-repository-template&~~~was_helpful=yes) [<img src="https://www.devexpress.com/support/examples/i/no-button.svg"/>](https://www.devexpress.com/support/examples/survey.xml?utm_source=github&utm_campaign=example-repository-template&~~~was_helpful=no)

(you will be redirected to DevExpress.com to submit your response)
<!-- feedback end -->
