unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, System.Beacon,
  System.Beacon.Components;

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
    Beacon1: TBeacon;
    Timer1: TTimer;
    procedure Switch1Switch(Sender: TObject);
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FBeacon: IBeacon;

    procedure StartAlert;
    procedure StopAlert; // Ctrl + Shift + C
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Beacon1BeaconEnter(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  FBeacon := ABeacon;
end;

procedure TForm1.Beacon1BeaconExit(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  FBeacon := nil;
end;

procedure TForm1.StartAlert;
begin
  FloatAnimation1.Start;
  Rectangle1.Visible := True;
end;

procedure TForm1.StopAlert;
begin
  FloatAnimation1.Stop;
  Rectangle1.Visible := False;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  Beacon1.Enabled := Switch1.IsChecked;
  if not Beacon1.Enabled then
    StopAlert;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Assigned(FBeacon) then
  begin
    Text1.Text :=
      Format('위험지역과의 거리: %0.2f m', [FBeacon.Distance]);

    if FBeacon.Distance < 1 then
    begin
      StartAlert;
    end
    else
    begin
      StopAlert;
    end;
  end;
end;

end.
