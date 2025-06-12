program DevExpressAIDemo;

uses
  Vcl.Forms,
  Main in 'Main.pas' {AIDemoMainForm},
  dxGenAI in 'dxGenAI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAIDemoMainForm, AIDemoMainForm);
  Application.Run;
end.
