unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Ani, System.Beacon,
  System.Beacon.Components;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Switch1: TSwitch;
    Image1: TImage;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Rectangle1: TRectangle;
    Text1: TText;
    FloatAnimation1: TFloatAnimation;
    Beacon1: TBeacon;
    Timer1: TTimer;
    procedure Switch1Switch(Sender: TObject);
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FBeacon: IBeacon;

    procedure StartAlert;
    procedure StopAlert;
    // Ctrl + Shift + C
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

// 안드로이드는
  // Bluetooth, BluetoothAdmin 권한이 필요
  // Project Options > Uses Permmision

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

procedure TForm1.FormCreate(Sender: TObject);
begin
  StopAlert;
end;

procedure TForm1.StartAlert;
begin
  Rectangle1.Visible := True;
  FloatAnimation1.Enabled := True;
end;

procedure TForm1.StopAlert;
begin
  Rectangle1.Visible := False;
  FloatAnimation1.Enabled := False;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  Beacon1.Enabled := Switch1.IsChecked;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Assigned(FBeacon) then
  begin
    Label2.Text := '위험지역과의 거리: ' +
      FBeacon.Distance.ToString;

    if FBeacon.Distance <= 1 then
      StartAlert
    else
      StopAlert;
  end;
end;

end.
