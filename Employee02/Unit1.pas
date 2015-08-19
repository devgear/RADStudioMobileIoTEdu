unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.ListBox, FMX.Layouts, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.ListView, FMX.TabControl, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, System.Actions, FMX.ActnList,
  FMX.WebBrowser;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ToolBar2: TToolBar;
    Label2: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    Button1: TButton;
    Label5: TLabel;
    Label6: TLabel;
    TabItem3: TTabItem;
    ToolBar3: TToolBar;
    Label7: TLabel;
    Button2: TButton;
    WebBrowser1: TWebBrowser;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.TabIndex := 0;
end;

procedure TForm1.ListBoxItem4Click(Sender: TObject);
var
  PhoneNo: string;
  PhoneDlrSvc: IFMXPhoneDialerService;
begin
  if TPlatformServices.Current.
    SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneDlrSvc)) then
  begin
    PhoneNo := Label5.Text;
    PhoneNo := PhoneNo.Replace('-', '');
    PhoneDlrSvc.Call(PhoneNo);
  end;
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

end.
