unit NewInvioce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, unipagecontrol,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, Data.DB,
  Data.Win.ADODB, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniEdit, uniButton, uniBasicGrid, uniDBGrid, uniDBNavigator, Datasnap.DBClient;

type
  TFrmNewInvoice = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    edTotal: TUniNumberEdit;
    UniButton1: TUniButton;
    UniDBGrid1: TUniDBGrid;
    UniDBNavigator1: TUniDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  MainModule,
  uFormMain;

initialization
  RegisterClass(TFrmNewInvoice);

end.
