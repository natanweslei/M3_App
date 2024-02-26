unit uFramePainelFiltro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDateTimePicker, uniGUIBaseClasses,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniRadioGroup,
  uniEdit, uniGroupBox, uniRadioButton;

type
  TFramePainelFiltro = class(TUniFrame)
    comboPessoa: TUniDBLookupComboBox;
    comboVeiculo: TUniDBLookupComboBox;
    editDataInicial: TUniDateTimePicker;
    editDataFinal: TUniDateTimePicker;
    editPesquisa: TUniEdit;
    groupData: TUniGroupBox;
    radioIgual: TUniRadioButton;
    radioEntre: TUniRadioButton;
    radioNaoFiltrar: TUniRadioButton;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  MainModule;

procedure TFramePainelFiltro.UniFrameCreate(Sender: TObject);
begin
  UniMainModule.queryCadastroPessoa.Open('select * from pessoa');
  UniMainModule.queryCadastroVeiculo.Open('select * from veiculo');
end;

procedure TFramePainelFiltro.UniFrameDestroy(Sender: TObject);
begin
  if UniMainModule.queryCadastroPessoa.Active then
    UniMainModule.queryCadastroPessoa.Close;

  if UniMainModule.queryCadastroVeiculo.Active then
    UniMainModule.queryCadastroVeiculo.Close;
end;

end.
