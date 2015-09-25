unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.ListView, Datasnap.DSConnect;

type
  TForm2 = class(TForm)
    ClientDataSet1: TClientDataSet;
    SQLConnection1: TSQLConnection;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    DSProviderConnection1: TDSProviderConnection;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Edit2: TEdit;
    Button3: TButton;
    Button4: TButton;
    LinkControlToField1: TLinkControlToField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses Unit3;

procedure TForm2.Button1Click(Sender: TObject);
var
  Method: TServerMethods1Client;
begin
  Method :=TServerMethods1Client.Create(SQLConnection1.DBXConnection);

  ShowMessage(Method.DSIntToStr(10));

  Method.Free;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  SQLConnection1.Params.Values['HostName'] := Edit1.Text;
  SQLConnection1.Connected := True;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ClientDataSet1.Edit;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  ClientDataSet1.Post;
  ClientDataSet1.ApplyUpdates(-1);
end;

end.
