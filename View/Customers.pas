unit Customers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, MainModule,
  uniGUIClasses, uniGUIFrame, uniEdit, uniDBEdit, uniGUIBaseClasses, uniPanel,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniBasicGrid,
  uniDBGrid, uniDBNavigator, uniMemo, uniDBMemo, Data.DB, Data.Win.ADODB,
  Datasnap.DBClient;

type
  TFrmCustomers = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniDBMemo1: TUniDBMemo;
    UniDBNavigator1: TUniDBNavigator;
    UniDBGrid1: TUniDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



initialization
  RegisterClass(TFrmCustomers);

end.
