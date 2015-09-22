unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Switch1: TSwitch;
    StatusBar1: TStatusBar;
    Text1: TText;
    Image1: TImage;
    Rectangle1: TRectangle;
    Text2: TText;
    FloatAnimation1: TFloatAnimation;
    procedure Switch1Switch(Sender: TObject);
  private
    { Private declarations }
    procedure StartAlert;
    procedure StopAlert; // Ctrl + Shift + C
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.StartAlert;
begin
  FloatAnimation1.Enabled := True;
  Rectangle1.Visible := True;
end;

procedure TForm1.StopAlert;
begin
  FloatAnimation1.Enabled := False;
  Rectangle1.Visible := False;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  if Switch1.IsChecked then
    StartAlert
  else
    StopAlert;
end;

end.
