unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Unit3,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, FMX.Controls.Presentation,
  FMX.StdCtrls, Data.DB, Data.SqlExpr, FMX.ListView.Types, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Edit, Data.Bind.Components, Data.Bind.DBScope,
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

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
  ClientDataSet1.Post;
  ClientDataSet1.ApplyUpdates(-1);
end;

end.
