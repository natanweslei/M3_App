unit uFrameManutencaoVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList;

type
  TFrameManutencaoVeiculo = class(TUniFrame)
    panelBotoes: TUniPanel;
    panel: TUniPanel;
    gridVeiculo: TUniDBGrid;
    buttonCadastroVeiculo: TUniButton;
    buttonEntradaVeiculo: TUniButton;
    buttonVendaVeiculo: TUniButton;
    buttonGastosVeiculo: TUniButton;
    queryVeiculo: TFDQuery;
    dsVeiculo: TDataSource;
    ImageListManutencaoVeiculo: TUniNativeImageList;
    PageControlVeiculo: TUniPageControl;
    tsVeiculo: TUniTabSheet;
    tsDespesas: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    tsEntrada: TUniTabSheet;
    tsVenda: TUniTabSheet;
    tsFinanceiro: TUniTabSheet;
    PageControlFinanceiro: TUniPageControl;
    tsContasPagar: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    dsEntrada: TDataSource;
    queryEntrada: TFDQuery;
    gridEntrada: TUniDBGrid;
    gridContasPagar: TUniDBGrid;
    procedure buttonEntradaVeiculoClick(Sender: TObject);
    procedure buttonVendaVeiculoClick(Sender: TObject);
    procedure buttonGastosVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonCadastroVeiculoClick(Sender: TObject);
    procedure queryVeiculoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalModelo, uFormModalVeiculo, uFormModalEntrada, uFormModalVenda, uFormModalGastos;

procedure TFrameManutencaoVeiculo.buttonCadastroVeiculoClick(Sender: TObject);
begin
  if queryVeiculo.Active then
    FormModalVeiculo.VeiculoId := queryVeiculo.FieldByName('veiculo_id').AsInteger;

  FormModalVeiculo.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      queryVeiculo.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.buttonEntradaVeiculoClick(Sender: TObject);
begin
//  FormModalEntrada.EntradaId := que
  FormModalEntrada.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryVeiculo.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.buttonVendaVeiculoClick(Sender: TObject);
begin
  FormModalVenda.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryVeiculo.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.queryVeiculoAfterScroll(DataSet: TDataSet);
begin
  queryEntrada.Close;
  queryEntrada.SQL.Clear;
  queryEntrada.SQL.Add('select');
  queryEntrada.SQL.Add('    entrada.entrada_id,');
  queryEntrada.SQL.Add('    entrada.data_entrada,');
  queryEntrada.SQL.Add('    entrada.valor_veiculo,');
  queryEntrada.SQL.Add('    entrada.veiculo_id,');
  queryEntrada.SQL.Add('    veiculo.placa || '' - '' || veiculo.modelo as veiculo,');
  queryEntrada.SQL.Add('    entrada.pessoa_id || '' - '' || pessoa.nome as fornecedor');
  queryEntrada.SQL.Add('from entrada');

  queryEntrada.SQL.Add('inner join veiculo');
  queryEntrada.SQL.Add('on entrada.veiculo_id = veiculo.veiculo_id');

  queryEntrada.SQL.Add('inner join pessoa');
  queryEntrada.SQL.Add('on entrada.pessoa_id = pessoa.pessoa_id');

  if queryVeiculo.RecordCount > 0 then
  begin
    queryEntrada.SQL.Add('where entrada.veiculo_id = :pveiculo_id');
    queryEntrada.ParamByName('pveiculo_id').AsInteger := queryVeiculo.FieldByName('veiculo_id').AsInteger;
  end;

  queryEntrada.Open;
end;

procedure TFrameManutencaoVeiculo.buttonGastosVeiculoClick(Sender: TObject);
begin
  FormModalTipoGasto.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryVeiculo.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.UniFrameCreate(Sender: TObject);
begin
  queryVeiculo.Close;
  queryVeiculo.SQL.Clear;
  queryVeiculo.SQL.Add('select * from veiculo');
  queryVeiculo.Open;
end;

initialization
  RegisterClass(TFrameManutencaoVeiculo);

end.
