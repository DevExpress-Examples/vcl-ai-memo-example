object AIDemoMainForm: TAIDemoMainForm
  Left = 0
  Top = 0
  Caption = 'AI Demo'
  ClientHeight = 571
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object cxMemo: TcxMemo
    Left = 0
    Top = 0
    Align = alClient
    Lines.Strings = (
      
        'The DevExpress VCL component suite is taking a big step toward m' +
        'odernization with our new Hybrid Reporting Platform (ExpressRepo' +
        'rts) - a bridge that leverages the '
      
        'DevExpress JavaScript Report Designer and Viewer for use in nati' +
        've VCL apps (using modern web-based design capabilities via WebV' +
        'iew and ASP.NET Core). All required '
      
        '.NET and JS dependencies are embedded into a single self-contain' +
        'ed EXE file transparently. As such, you can use Delphi/C++Builde' +
        'r for many report customizations.')
    Properties.ScrollBars = ssVertical
    TabOrder = 0
    ExplicitLeft = 416
    ExplicitTop = 152
    ExplicitWidth = 185
    ExplicitHeight = 89
    Height = 571
    Width = 920
  end
end
