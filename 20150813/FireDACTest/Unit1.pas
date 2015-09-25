unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.FMXUI.Wait, FMX.ListView.Types, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ListView1: TListView;
    ListView2: TListView;
    Button2: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    FDQuery2: TFDQuery;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button2Click(Sender: TObject);
var
  Item: TListViewItem;
  ThumbStream: TMemoryStream;
begin
  FDQuery2.Close;
  FDQuery2.SQL.Text := 'SELECT * FROM EMPLOYEES';
  FDQuery2.Open;

  FDQuery2.First;
  ListView2.BeginUpdate;
  while not FDQuery2.Eof do
  begin
    Item :=  ListView2.Items.Add;
    Item.Text := FDQuery2.FieldByName('NAME').AsString;
    Item.Detail := FDQuery2.FieldByName('TITLE').AsString;

    FDQuery2.Next;
  end;
  ListView2.EndUpdate;
end;

//var
//  Thumbnail: TBitmap;
//  ImgStream, ThumbStream: TMemoryStream;
//begin
//  if FDQuery1.UpdateStatus = TUpdateStatus.usUnmodified then
//    FDQuery1.Edit;
//
//  ImgStream := TMemoryStream.Create;
//  ThumbStream := TMemoryStream.Create;
//  try
//    ABitmap.SaveToStream(ImgStream);
//    Thumbnail := ABitmap.CreateThumbnail(100, 100);
//    Thumbnail.SaveToStream(ThumbStream);
//
//    (FDQuery1.FieldByName('BOOK_IMAGE') as TBlobField).LoadFromStream(ImgStream);
//    (FDQuery1.FieldByName('BOOK_THUMB') as TBlobField).LoadFromStream(ThumbStream);
//  finally
//    ImgStream.Free;
//    ThumbStream.Free;
//  end;


end.
