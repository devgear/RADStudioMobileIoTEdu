unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.Objects, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, Data.Bind.ObjectScope, FMX.ListView,
  FMX.Controls.Presentation, FMX.TabControl, System.Actions, FMX.ActnList;

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
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ChangeTabAction1.Tab := TabItem1;
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

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

end.
