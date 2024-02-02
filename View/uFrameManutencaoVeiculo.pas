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
    buttonDespesasVeiculo: TUniButton;
    queryConsulta: TFDQuery;
    dsConsulta: TDataSource;
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
    procedure buttonEntradaVeiculoClick(Sender: TObject);
    procedure buttonVendaVeiculoClick(Sender: TObject);
    procedure buttonDespesasVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonCadastroVeiculoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalModelo, uFormModalVeiculo, uFormModalEntrada, uFormModalVenda, uFormModalDespesas;

procedure TFrameManutencaoVeiculo.buttonCadastroVeiculoClick(Sender: TObject);
begin
  if queryConsulta.Active then
    FormModalVeiculo.VeiculoId := queryConsulta.FieldByName('veiculo_id').AsInteger;

  FormModalVeiculo.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      queryConsulta.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.buttonEntradaVeiculoClick(Sender: TObject);
begin
//  FormModalEntrada.VeiculoId := que
  FormModalEntrada.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryConsulta.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.buttonVendaVeiculoClick(Sender: TObject);
begin
  FormModalVenda.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryConsulta.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.buttonDespesasVeiculoClick(Sender: TObject);
begin
  FormModalDespesas.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryConsulta.Refresh;
    end
  );
end;

procedure TFrameManutencaoVeiculo.UniFrameCreate(Sender: TObject);
begin
  queryConsulta.Close;
  queryConsulta.SQL.Clear;
  queryConsulta.SQL.Add('select * from veiculo');
  queryConsulta.Open;
end;

initialization
  RegisterClass(TFrameManutencaoVeiculo);

end.