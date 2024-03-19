unit uFormModalAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, uniButton, uniScrollBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniImageList, uniCheckBox,
  uniDBCheckBox, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TFormModalAcesso = class(TUniForm)
    buttonCancelar: TUniButton;
    panelBotoes: TUniPanel;
    dsManutencao: TDataSource;
    queryManutencao: TFDQuery;
    buttonGravar: TUniButton;
    imageListFormModalModelo: TUniNativeImageList;
    buttonFechar: TUniButton;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBCheckBox5: TUniDBCheckBox;
    UniDBCheckBox6: TUniDBCheckBox;
    UniDBCheckBox7: TUniDBCheckBox;
    UniDBCheckBox8: TUniDBCheckBox;
    UniDBCheckBox9: TUniDBCheckBox;
    comboPessoa: TUniDBLookupComboBox;
    checkAlertaFinanceiroVencido: TUniDBCheckBox;
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonGravarClick(Sender: TObject);
    procedure dsManutencaoStateChange(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure buttonFecharClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
  private
    FPessoaId: Integer;
  public
    property PessoaId: Integer read FPessoaId write FPessoaId;
  end;

function FormModalAcesso: TFormModalAcesso;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function FormModalAcesso: TFormModalAcesso;
begin
  Result := TFormModalAcesso(UniMainModule.GetFormInstance(TFormModalAcesso));
end;

procedure TFormModalAcesso.buttonGravarClick(Sender: TObject);
begin
  queryManutencao.Post;
end;

procedure TFormModalAcesso.buttonFecharClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormModalAcesso.buttonCancelarClick(Sender: TObject);
begin
  if queryManutencao.State in dsEditModes then
    queryManutencao.Cancel;
end;

procedure TFormModalAcesso.dsManutencaoStateChange(Sender: TObject);
begin
  if dsManutencao.State in [dsBrowse, dsInactive] then
  begin
    buttonCancelar.Enabled := False;
    buttonGravar.Enabled := False;
  end
  else if dsManutencao.State in dsEditModes then
  begin
    buttonCancelar.Enabled := True;
    buttonGravar.Enabled := True;
  end;
end;

procedure TFormModalAcesso.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  queryManutencao.FieldByName('pessoa_id').AsInteger := FPessoaId;
  queryManutencao.FieldByName('acesso_id').AsInteger := UniMainModule.GerarSequence('seq_acesso_id');
end;

procedure TFormModalAcesso.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if queryManutencao.Active then
    queryManutencao.Close;

  if UniMainModule.queryCadastroPessoa.Active then
    UniMainModule.queryCadastroPessoa.Close;
end;

procedure TFormModalAcesso.UniFormShow(Sender: TObject);
begin
  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add('select * from acesso');
  queryManutencao.SQL.Add('where pessoa_id = :ppessoa_id');
  queryManutencao.ParamByName('ppessoa_id').AsInteger := FPessoaId;
  queryManutencao.Open;

  UniMainModule.queryCadastroPessoa.Close;
  UniMainModule.queryCadastroPessoa.SQL.Clear;
  UniMainModule.queryCadastroPessoa.SQL.Add('select * from pessoa');
  UniMainModule.queryCadastroPessoa.SQL.Add('where pessoa_id = :ppessoa_id');
  UniMainModule.queryCadastroPessoa.ParamByName('ppessoa_id').AsInteger := FPessoaId;
  UniMainModule.queryCadastroPessoa.Open;

  comboPessoa.KeyValue := FPessoaId;
end;

end.
