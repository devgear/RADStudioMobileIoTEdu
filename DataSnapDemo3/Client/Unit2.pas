unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.Edit, Data.Bind.DBScope,
  FMX.ListView, Datasnap.DBClient, Datasnap.DSConnect;

type
  TForm2 = class(TForm)
    SQLConnection1: TSQLConnection;
    Button1: TButton;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    LinkControlToField1: TLinkControlToField;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  Unit3;

procedure TForm2.Button1Click(Sender: TObject);
var
  Method: TServerMethods1Client;
begin
  Method := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
  try
    ShowMessage(Method.DSIntToStr(10));
  finally
    Method.Free;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ClientDataSet1.Edit;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  // 클라이언트만 적용
  ClientDataSet1.Post;

  // 서버에 적용
  ClientDataSet1.ApplyUpdates(-1);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  ClientDataSet1.Close;
  ClientDataSet1.CommandText := 'SELECT FIRST_NAME FROM EMPLOYEE';
  ClientDataSet1.Open;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  ShowMessage(ClientDataSet1.Fields.Count.ToString);
end;

end.
