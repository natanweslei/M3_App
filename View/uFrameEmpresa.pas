unit uFrameEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniLabel, uFrameModelo, uniButton, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniDBEdit, uniEdit, uniGroupBox;

type
  TFrameEmpresa = class(TFrameModelo)
    panelGeral: TUniPanel;
    editNomeEmpresa: TUniDBEdit;
    editRazaoSocial: TUniDBEdit;
    editCnpj: TUniDBEdit;
    editTelefoneComercial: TUniDBEdit;
    editTelefoneCelular: TUniDBEdit;
    editLogradouro: TUniDBEdit;
    editBairro: TUniDBEdit;
    editQuadra: TUniDBEdit;
    editLote: TUniDBEdit;
    groupDadosGerais: TUniGroupBox;
    groupTelefones: TUniGroupBox;
    groupEnderecos: TUniGroupBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure gridConsultaDblClick(Sender: TObject);
    procedure queryManutencaoBeforePost(DataSet: TDataSet);
  protected
    procedure MostraManute; override;
  end;

implementation

{$R *.dfm}

uses
  MainModule;

const
  SqlBase =
    'select ' +
    '  empresa_id, ' +
    '	 nome_fantasia, ' +
    '	 nome_social, ' +
    '	 cnpj, ' +
    '	 telefone_comercial, ' +
    '	 telefone_celular, ' +
    '	 logradouro, ' +
    '	 quadra, ' +
    '	 lote, ' +
    '	 bairro ' +
    'from ' +
    '	 EMPRESA ';

procedure TFrameEmpresa.gridConsultaDblClick(Sender: TObject);
begin
  inherited;
  PageControlModelo.ActivePage := tsManutencao;
end;

procedure TFrameEmpresa.MostraManute;
begin
  inherited;
  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add(SqlBase);
  queryManutencao.SQL.Add('where empresa_id = :pempresa_id');

  if queryConsulta.Active then
    queryManutencao.ParamByName('pempresa_id').AsInteger := queryConsulta.FieldByName('empresa_id').AsInteger
  else
    queryManutencao.ParamByName('pempresa_id').AsInteger := 0;

  queryManutencao.Open;
end;

procedure TFrameEmpresa.queryManutencaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('empresa_id').AsInteger := UniMainModule.GerarSequence('seq_empresa_id');
end;

procedure TFrameEmpresa.UniFrameCreate(Sender: TObject);
begin
  inherited;
  editNomeEmpresa.MaxLength := 200;
  editRazaoSocial.MaxLength := 200;
  editCnpj.MaxLength := 14;
  editTelefoneComercial.MaxLength := 20;
  editTelefoneCelular.MaxLength := 20;
  editLogradouro.MaxLength := 100;
  editBairro.MaxLength := 100;
  editQuadra.MaxLength := 20;
  editLote.MaxLength := 20;

  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.SQL.Add(SqlBase);
  queryManutencao.Open;

  queryConsulta.Close;
  queryConsulta.SQL.Clear;
  queryConsulta.SQL.Add(SqlBase);
  queryConsulta.Open;
end;

initialization
  RegisterClass(TFrameEmpresa);

end.
