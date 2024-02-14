unit uFrameManutencaoEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList;

type
  TFrameManutencaoEntrada = class(TUniFrame)
    panelBotoes: TUniPanel;
    buttonEntradaVeiculo: TUniButton;
    dsEntrada: TDataSource;
    queryEntrada: TFDQuery;
    gridEntrada: TUniDBGrid;
    panelFiltro: TUniPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonEntradaVeiculoClick(Sender: TObject);
  private
    procedure ExecutaPesquisa(AFiltro: string);
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalEntrada;

procedure TFrameManutencaoEntrada.buttonEntradaVeiculoClick(Sender: TObject);
begin
  if queryEntrada.Active then
    FormModalEntrada.EntradaId := queryEntrada.FieldByName('entrada_id').AsInteger;

  FormModalEntrada.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryEntrada.Refresh;
    end
  );
end;

procedure TFrameManutencaoEntrada.ExecutaPesquisa(AFiltro: string);
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
  queryEntrada.SQL.Add('on veiculo.veiculo_id = entrada.veiculo_id');

  queryEntrada.SQL.Add('inner join pessoa');
  queryEntrada.SQL.Add('on pessoa.pessoa_id = entrada.pessoa_id');

  if AFiltro <> EmptyStr then
    queryEntrada.SQL.Add(AFiltro);

  queryEntrada.Open;
end;

procedure TFrameManutencaoEntrada.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa(EmptyStr);
end;

initialization
  RegisterClass(TFrameManutencaoEntrada);

end.
