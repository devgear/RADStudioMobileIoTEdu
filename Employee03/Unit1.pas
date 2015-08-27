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
  FMX.WebBrowser;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListView1: TListView;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
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
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    TabItem3: TTabItem;
    ToolBar3: TToolBar;
    Label3: TLabel;
    Button2: TButton;
    WebBrowser1: TWebBrowser;
    TabItem4: TTabItem;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
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

uses
  FMX.PhoneDialer, FMX.Platform;

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

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
  TabControl1.TabPosition := TTabPosition.None;
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

end.
