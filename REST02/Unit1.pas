unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.StdCtrls, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.ObjectScope, FMX.ListView,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListView1: TListView;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


{$IFDEF ANDROID}
uses
  Androidapi.Helpers, FMX.Helpers.Android, Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net, Androidapi.JNI.GraphicsContentViewText,
  System.NetEncoding;
{$ENDIF}

function OpenURL(const URL: string): Boolean;
{$IFDEF ANDROID}
var
  Intent: JIntent;
begin
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
    TJnet_Uri.JavaClass.parse(StringToJString(TURLEncoding.URL.Encode(URL))));
  try
    SharedActivity.startActivity(Intent);
    Exit(True);
  except
      Exit(False);
  end;
end;
{$ELSE}
begin
  ShowMessage(URL);
end;
{$ENDIF}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  URL: string;
begin
  URL := FDMemTable1.FieldByName('link').AsString;

  OpenURL(URL);
end;

end.
