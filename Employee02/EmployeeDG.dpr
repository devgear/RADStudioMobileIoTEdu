program EmployeeDG;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {dmData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
