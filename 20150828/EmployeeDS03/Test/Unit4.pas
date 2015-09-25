unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, FMX.ListView.Types,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TForm4 = class(TForm)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    ListView1: TListView;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
var
  Item: TListViewItem;
  NameFld,
  TitleFld: TField;
begin
  SQLConnection1.Connected := True;
  ClientDataSet1.Active := True;

  NameFld := ClientDataSet1.FieldByName('Name');
  TitleFld := ClientDataSet1.FieldByName('Title');

  ListView1.BeginUpdate;
  try
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      Item := ListView1.Items.Add;
      Item.Text := NameFld.AsString;
      Item.Detail := TitleFld.AsString;

      ClientDataSet1.Next;
    end;
  finally
    ListView1.EndUpdate;
  end;
end;

end.
