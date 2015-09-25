unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, Fmx.Bind.GenData, Data.Bind.GenData, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Objects, FMX.ListBox, FMX.Layouts, FMX.StdCtrls,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.ListView,
  FMX.Controls.Presentation, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.WebBrowser, FMX.MediaLibrary.Actions, FMX.StdActns, FMX.Edit,
  Data.Bind.DBScope, FMX.Effects;

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
    ListBoxItem1: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    Image1: TImage;
    lblName: TLabel;
    lblTitle: TLabel;
    lblPhone: TLabel;
    lblSite: TLabel;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    TabItem3: TTabItem;
    ToolBar3: TToolBar;
    Label3: TLabel;
    Button2: TButton;
    WebBrowser1: TWebBrowser;
    TabItem4: TTabItem;
    ToolBar4: TToolBar;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    ListBox2: TListBox;
    ListBoxItem6: TListBoxItem;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    edtName: TEdit;
    edtTitle: TEdit;
    edtPhone: TEdit;
    edtSite: TEdit;
    Button5: TButton;
    Button6: TButton;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    OpenDialog1: TOpenDialog;
    Rectangle1: TRectangle;
    Image2: TImage;
    Button7: TButton;
    Button8: TButton;
    TabItem5: TTabItem;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    ShadowEffect1: TShadowEffect;
    Text1: TText;
    Edit1: TEdit;
    Edit2: TEdit;
    Button9: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldBitmap2: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure Image2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  FMX.PhoneDialer, FMX.Platform, Unit2, Data.DB;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  dmData.ClientDataSet1.Cancel;

  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  ImageBitmap, Thumbnail: TBitmap;
  ImgStream, ThumbStream: TMemoryStream;
begin
  ImgStream := TMemoryStream.Create;
  ThumbStream := TMemoryStream.Create;
  try
    ImageBitmap := Image2.Bitmap;
    ImageBitmap.SaveToStream(ImgStream);

    Thumbnail := ImageBitmap.CreateThumbnail(100, 100);
    Thumbnail.SaveToStream(ThumbStream);

    (dmData.ClientDataSet1.FieldByName('IMAGE') as TBlobField)
        .LoadFromStream(ImgStream);
    (dmData.ClientDataSet1.FieldByName('THUMB') as TBlobField)
        .LoadFromStream(ThumbStream);
  finally
    ImgStream.Free;
    ThumbStream.Free;
  end;

  dmData.ClientDataSet1.Post;
  dmData.ClientDataSet1.ApplyUpdates(-1);

  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  dmData.ClientDataSet1.Append;

  ChangeTabAction1.Tab := TabItem4;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  dmData.ClientDataSet1.Edit;


  ChangeTabAction1.Tab := TabItem4;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  dmData.SQLConnection1.Params.Values['HostName'] := Edit1.Text;
  dmData.SQLConnection1.Params.Values['Port'] := Edit2.Text;
  dmData.SQLConnection1.Connected := True;
  dmData.ClientDataSet1.Active := True;

  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Image2.Bitmap.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.ListBoxItem4Click(Sender: TObject);
var
  PhoneDlrSvc: IFMXPhoneDialerService;
begin
  if TPlatformServices.Current.
    SupportsPlatformService(IFMXPhoneDialerService,
    IInterface(PhoneDlrSvc)) then
  begin
    PhoneDlrSvc.Call(lblPhone.Text);
  end;
end;

procedure TForm1.ListBoxItem5Click(Sender: TObject);
begin
  ChangeTabAction1.Tab := TabItem3;
  ChangeTabAction1.ExecuteTarget(nil);

  Label3.Text := lblSite.Text;
  WebBrowser1.URL := lblSite.Text;
  WebBrowser1.Navigate;
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
