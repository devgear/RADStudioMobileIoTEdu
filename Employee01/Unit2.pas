unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Comp.Client;

type
  TdmData = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDQuery1IDX: TFDAutoIncField;
    FDQuery1NAME: TStringField;
    FDQuery1TITLE: TStringField;
    FDQuery1PHONE: TStringField;
    FDQuery1IMAGE: TBlobField;
    FDQuery1THUMB: TBlobField;
    FDQuery1SITE: TStringField;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;

procedure TdmData.FDConnection1BeforeConnect(Sender: TObject);
begin
{$IFNDEF MSWINDOWS}
  FDConnection1.Params.Values['Database'] :=
    TPath.Combine(TPath.GetDocumentsPath, 'EMPLOYEE.db');
{$ENDIF}
end;

end.
