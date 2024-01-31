unit uFrameManutencaoVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrameManutencaoVeiculo = class(TUniFrame)
    panelBotoes: TUniPanel;
    panel: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    buttonCadastroVeiculo: TUniButton;
    buttonEntradaVeiculo: TUniButton;
    buttonSaidaVeiculo: TUniButton;
    buttonGastosVeiculo: TUniButton;
    queryConsulta: TFDQuery;
    dsConsulta: TDataSource;
    procedure buttonCadastroVeiculoClick(Sender: TObject);
    procedure buttonEntradaVeiculoClick(Sender: TObject);
    procedure buttonSaidaVeiculoClick(Sender: TObject);
    procedure buttonGastosVeiculoClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  MainModule;

procedure TFrameManutencaoVeiculo.buttonCadastroVeiculoClick(Sender: TObject);
begin
//veiculo
end;

procedure TFrameManutencaoVeiculo.buttonEntradaVeiculoClick(Sender: TObject);
begin
//entrada
end;

procedure TFrameManutencaoVeiculo.buttonSaidaVeiculoClick(Sender: TObject);
begin
//saida
end;

procedure TFrameManutencaoVeiculo.buttonGastosVeiculoClick(Sender: TObject);
begin
//gastos
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
