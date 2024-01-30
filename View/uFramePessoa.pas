unit uFramePessoa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  uniPanel,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniPageControl,
  uniGUIBaseClasses,
  uFrameModelo, uniLabel, uniButton, uniBitBtn, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit, uniGroupBox,
  uniDBEdit, uniDateTimePicker, uniCheckBox, uniDBCheckBox, uniDBDateTimePicker;

type
  TFramePessoa = class(TFrameModelo)
    editCampoFiltro: TUniEdit;
    panelGeral: TUniPanel;
    groupDadosGerais: TUniGroupBox;
    editCpf: TUniDBEdit;
    editNome: TUniDBEdit;
    groupTelefones: TUniGroupBox;
    editTelefoneCelular: TUniDBEdit;
    editTelefoneComercial: TUniDBEdit;
    groupEnderecos: TUniGroupBox;
    editLogradouro: TUniDBEdit;
    editBairro: TUniDBEdit;
    editQuadra: TUniDBEdit;
    editLote: TUniDBEdit;
    editDataNascimento: TUniDBDateTimePicker;
    editRegistroGeral: TUniDBEdit;
    groupOperador: TUniGroupBox;
    groupConfiguracoes: TUniGroupBox;
    checkVendedor: TUniDBCheckBox;
    editUsuario: TUniDBEdit;
    editSenha: TUniDBEdit;
    checkOperador: TUniDBCheckBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure queryManutencaoBeforePost(DataSet: TDataSet);
    procedure gridConsultaDblClick(Sender: TObject);
    procedure editCampoFiltroKeyPress(Sender: TObject; var Key: Char);
  protected
    procedure MostraManute; override;
  end;

implementation

{$R *.dfm}

uses
  MainModule;

procedure TFramePessoa.editCampoFiltroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  try
    queryConsulta.Close;
    queryConsulta.SQL.Clear;
    queryConsulta.SQL.Add('select * from pessoa');

    if Trim(editCampoFiltro.Text) <> EmptyStr then
    begin
      queryConsulta.SQL.Add('where nome ilike :pnome');
      queryConsulta.SQL.Add('or cpf ilike :pnome');

      queryConsulta.ParamByName('pnome').Value := '%' + Trim(editCampoFiltro.Text) + '%';
    end;

    queryConsulta.Open;
  except
  end;
end;

procedure TFramePessoa.gridConsultaDblClick(Sender: TObject);
begin
  inherited;
  PageControlModelo.ActivePage := tsManutencao;
end;

procedure TFramePessoa.MostraManute;
begin
  inherited;
  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add('select * from pessoa');
  queryManutencao.SQL.Add('where pessoa_id = :ppessoa_id');

  if queryConsulta.Active then
    queryManutencao.ParamByName('ppessoa_id').AsInteger := queryConsulta.FieldByName('pessoa_id').AsInteger
  else
    queryManutencao.ParamByName('ppessoa_id').AsInteger := 0;

  queryManutencao.Open;
end;

procedure TFramePessoa.queryManutencaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('pessoa_id').AsInteger := UniMainModule.GerarSequence('seq_pessoa_id');
end;

procedure TFramePessoa.UniFrameCreate(Sender: TObject);
begin
  inherited;

  editCampoFiltro.MaxLength := 50;
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
  queryManutencao.Open;

  queryConsulta.Close;
  queryConsulta.SQL.Clear;
  queryConsulta.SQL.Add('select * from pessoa');
  queryConsulta.Open;
end;

initialization
  RegisterClass(TFramePessoa);

end.
