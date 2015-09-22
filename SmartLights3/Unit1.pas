unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.ScrollBox, FMX.Memo,
  FMX.StdCtrls, REST.Client, Data.Bind.ObjectScope, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    Switch1: TSwitch;
    Memo1: TMemo;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    procedure Button1Click(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
  private
    { Private declarations }
    FUsername: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.JSON;

procedure TForm1.Button1Click(Sender: TObject);
var
  Value: TJSONValue;
  ErrNo: Integer;
begin
  RESTRequest1.Execute;

  Value := RESTResponse1.JSONValue;

  if Value.TryGetValue<Integer>('[0].error.type', ErrNo) then
  begin
    if ErrNo = 101 then
    begin
      ShowMessage('브리지 중앙 버튼을 눌러주세요.');
      Exit;
    end;
  end;

  if Value.TryGetValue<string>('[0].success.username',
        FUsername) then
  begin
    ShowMessage('등록되었습니다.');
  end;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
var
  onoff_param: string;
begin
  if FUsername = '' then
  begin
    ShowMessage('등록을 해주세요.');
    Switch1.IsChecked := False;
    Exit;
  end;

  if Switch1.IsChecked then
    onoff_param := '{"on":true}'
  else
    onoff_param := '{"on":false}';

  RESTRequest2.Params.
    ParameterByName('username').Value := FUsername;
  RESTRequest2.Params.
    ParameterByName('body').Value := onoff_param;
  RESTRequest2.Execute;
end;

end.
