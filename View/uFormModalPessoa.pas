unit uFormModalPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses,
  uniScrollBox, uniButton, uniGUIBaseClasses, uniPanel, uniImageList,
  uniDateTimePicker, uniDBDateTimePicker, uniGroupBox, uniMemo, uniDBMemo,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniEdit,
  uniDBEdit, uniBasicGrid, uniDBGrid, Datasnap.DBClient, uniCheckBox,
  uniDBCheckBox;

type
  TFormModalPessoa = class(TFormModalModelo)
    panelGeral: TUniPanel;
    groupDadosGerais: TUniGroupBox;
    editCpf: TUniDBEdit;
    editNome: TUniDBEdit;
    editDataNascimento: TUniDBDateTimePicker;
    editRegistroGeral: TUniDBEdit;
    groupTrabalho: TUniGroupBox;
    editTelefoneCelular: TUniDBEdit;
    editTelefoneComercial: TUniDBEdit;
    groupEnderecos: TUniGroupBox;
    editLogradouro: TUniDBEdit;
    editBairro: TUniDBEdit;
    editQuadra: TUniDBEdit;
    editLote: TUniDBEdit;
    groupOperador: TUniGroupBox;
    editUsuario: TUniDBEdit;
    editSenha: TUniDBEdit;
    groupConfiguracoes: TUniGroupBox;
    checkVendedor: TUniDBCheckBox;
    checkOperador: TUniDBCheckBox;
    editEmail: TUniDBEdit;
    editEmpresaTrabalho: TUniDBEdit;
    editProfissaoTrabalho: TUniDBEdit;
    editTelefoneTrabalho: TUniDBEdit;
    editEnderecoTrabalho: TUniDBEdit;
    editContato: TUniDBEdit;
    editContato2: TUniDBEdit;
    editContato3: TUniDBEdit;
    editContato4: TUniDBEdit;
    editTelefoneContato: TUniDBEdit;
    editTelefoneContato2: TUniDBEdit;
    editTelefoneContato3: TUniDBEdit;
    editTelefoneContato4: TUniDBEdit;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
    procedure buttonGravarClick(Sender: TObject);
    procedure checkOperadorClick(Sender: TObject);
  private
    FPessoaId: Integer;
  public
    property PessoaId: Integer read FPessoaId write FPessoaId;
  end;

function FormModalPessoa: TFormModalPessoa;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, CalculadoraFinanciamento, Math;

function FormModalPessoa: TFormModalPessoa;
begin
  Result := TFormModalPessoa(UniMainModule.GetFormInstance(TFormModalPessoa));
end;

procedure TFormModalPessoa.buttonGravarClick(Sender: TObject);
begin
  if Trim(queryManutencao.FieldByName('nome').AsString) = EmptyStr then
  begin
    MessageDlg('É necessário definir o nome!', mtWarning, [mbOK]);

    if editNome.CanFocus then
      editNome.SetFocus;

    Exit;
  end;

  inherited;
end;

procedure TFormModalPessoa.checkOperadorClick(Sender: TObject);
begin
  inherited;
  editUsuario.Enabled := checkOperador.Checked;
  editSenha.Enabled := checkOperador.Checked;
end;

procedure TFormModalPessoa.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  checkOperadorClick(nil);

  queryManutencao.FieldByName('pessoa_id').AsInteger := UniMainModule.GerarSequence('seq_pessoa_id');
end;

procedure TFormModalPessoa.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if queryManutencao.Active then
    queryManutencao.Close;
end;

procedure TFormModalPessoa.UniFormShow(Sender: TObject);
begin
  inherited;

  editCpf.MaxLength := 20;
  editNome.MaxLength := 200;
  editTelefoneCelular.MaxLength := 20;
  editTelefoneComercial.MaxLength := 20;
  editLogradouro.MaxLength := 60;
  editBairro.MaxLength := 60;
  editQuadra.MaxLength := 5;
  editLote.MaxLength := 5;
  editRegistroGeral.MaxLength := 20;
  editUsuario.MaxLength := 20;
  editSenha.MaxLength := 20;

  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add('select * from pessoa');
  queryManutencao.SQL.Add('where pessoa_id = :ppessoa_id');
  queryManutencao.ParamByName('ppessoa_id').AsInteger := FPessoaId;
  queryManutencao.Open;

  checkOperadorClick(nil);
end;

end.
