unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.Objects, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, Data.Bind.ObjectScope, FMX.ListView,
  FMX.Controls.Presentation, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Edit, FMX.WebBrowser, FMX.MediaLibrary.Actions, FMX.StdActns,
  Data.Bind.DBScope, FMX.ListView.Appearances, FMX.ListView.Adapters.Base;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListView1: TListView;
    ToolBar2: TToolBar;
    Label2: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    TabItem3: TTabItem;
    ToolBar3: TToolBar;
    ListBox2: TListBox;
    Label5: TLabel;
    Button2: TButton;
    Button3: TButton;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    Image2: TImage;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    Label6: TLabel;
    Label7: TLabel;
    TabItem4: TTabItem;
    ToolBar4: TToolBar;
    Button6: TButton;
    Label8: TLabel;
    WebBrowser1: TWebBrowser;
    Button7: TButton;
    Button8: TButton;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}

uses
  FMX.Platform, FMX.PhoneDialer, Unit2, Data.DB;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  dmData.FDQuery1.Cancel;

  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ImageBitmap, Thumbnail: TBitmap;
  ImgStream, ThumbStream: TMemoryStream;
begin
  ImgStream := TMemoryStream.Create;
  ThumbStream := TMemoryStream.Create;
  try
    ImageBitmap := Image2.Bitmap;
    Thumbnail := ImageBitmap.CreateThumbnail(100, 100);

    ImageBitmap.SaveToStream(ImgStream);
    Thumbnail.SaveToStream(ThumbStream);

    (dmData.FDQuery1.FieldByName('THUMB') as TBlobField).LoadFromStream(ThumbStream);
    (dmData.FDQuery1.FieldByName('IMAGE') as TBlobField).LoadFromStream(ImgStream);
  finally
    ImgStream.Free;
    ThumbStream.Free;
  end;


  dmData.FDQuery1.Post;

  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  dmData.FDQuery1.Insert;

  ChangeTabAction1.Tab := TabItem3;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  dmData.FDQuery1.Edit;

  ChangeTabAction1.Tab := TabItem3;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
{$IFDEF ANDROID}
  if Key = vkHardwareBack then
  begin
    if TabControl1.TabIndex = 1 then
    begin
      ChangeTabAction1.Tab := TabItem1;
      ChangeTabAction1.ExecuteTarget(nil);
      Key := 0;
    end;
  end;
{$ENDIF}
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Image2.Bitmap.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TForm1.Label6Click(Sender: TObject);
var
  PhoneDlrSvc: IFMXPhoneDialerService;
begin
  if TPlatformServices.Current.
    SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneDlrSvc)) then
  begin
    PhoneDlrSvc.Call(Label6.Text);
  end;
end;

// 웹사이트 클릭
procedure TForm1.Label7Click(Sender: TObject);
begin
Log.d('log message(%d, %d)', [1, 3]);

  WebBrowser1.URL := Label7.Text;
  WebBrowser1.Navigate;

  Label8.Text := WebBrowser1.URL;

  ChangeTabAction1.Tab := TabItem4;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  Image2.Bitmap.Assign(Image);
end;

procedure TForm1.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  Image2.Bitmap.Assign(Image);
end;

end.
