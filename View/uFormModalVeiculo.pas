unit uFormModalVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses,
  uniScrollBox, uniButton, uniGUIBaseClasses, uniPanel, uniImageList, uniEdit,
  uniDBEdit, uniMultiItem, uniComboBox, uniDBComboBox, uniMemo, uniDBMemo,
  uniGroupBox;

type
  TFormModalVeiculo = class(TFormModalModelo)
    scrollVeiculo: TUniScrollBox;
    comboMarca: TUniDBComboBox;
    editModelo: TUniDBEdit;
    editVersao: TUniDBEdit;
    editPlaca: TUniDBEdit;
    editAnoFabricacao: TUniDBEdit;
    editAnoModelo: TUniDBEdit;
    editRenavam: TUniDBEdit;
    editNumeroCrv: TUniDBEdit;
    editChassi: TUniDBEdit;
    comboCombustivel: TUniDBComboBox;
    memoObservacaoVeiculo: TUniDBMemo;
    memoObservacao: TUniDBMemo;
    comboSituacao: TUniDBComboBox;
    groupDados: TUniGroupBox;
    groupVeiculo: TUniGroupBox;
    procedure queryManutencaoBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure buttonExcluirClick(Sender: TObject);
    procedure buttonGravarClick(Sender: TObject);
  private
    FVeiculoId: Integer;
  public
    property VeiculoId: Integer read FVeiculoId write FVeiculoId;
  end;

function FormModalVeiculo: TFormModalVeiculo;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormModalVeiculo: TFormModalVeiculo;
begin
  Result := TFormModalVeiculo(UniMainModule.GetFormInstance(TFormModalVeiculo));
end;

procedure TFormModalVeiculo.buttonExcluirClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TFormModalVeiculo.buttonGravarClick(Sender: TObject);
begin
  if Trim(editPlaca.Text) = EmptyStr then
  begin
    MessageDlg('É necessário informar a placa!', mtWarning, [mbOK]);

    if editPlaca.CanFocus then
      editPlaca.SetFocus;

    Exit;
  end;

  inherited;
end;

procedure TFormModalVeiculo.queryManutencaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('veiculo_id').AsInteger := UniMainModule.GerarSequence('seq_veiculo_id');
end;

procedure TFormModalVeiculo.UniFormCreate(Sender: TObject);
begin
  inherited;

  editModelo.MaxLength := 100;
  editVersao.MaxLength := 20;
  editPlaca.MaxLength := 20;
  editAnoFabricacao.MaxLength := 20;
  editAnoModelo.MaxLength := 20;
  editRenavam.MaxLength := 20;
  editNumeroCrv.MaxLength := 20;
  editChassi.MaxLength := 20;
end;

procedure TFormModalVeiculo.UniFormShow(Sender: TObject);
begin
  inherited;

  queryManutencao.Close;
  queryManutencao.SQL.Add('select * from veiculo');
  queryManutencao.SQL.Add('where veiculo_id = :pveiculo_id');
  queryManutencao.ParamByName('pveiculo_id').AsInteger := FVeiculoId;
  queryManutencao.Open;
end;

end.
