unit uFrameTipoGasto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton,
  uniBitBtn, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniDBCheckBox, uniEdit, uniDBEdit,
  uniImageList;

type
  TFrameTipoGasto = class(TFrameModelo)
    panelDados: TUniPanel;
    gridManutencao: TUniDBGrid;
    editDescricao: TUniDBEdit;
    checkAtivo: TUniDBCheckBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure queryManutencaoBeforePost(DataSet: TDataSet);
    procedure queryManutencaoAfterPost(DataSet: TDataSet);
    procedure queryManutencaoNewRecord(DataSet: TDataSet);
  end;

implementation

{$R *.dfm}

uses MainModule;

procedure TFrameTipoGasto.queryManutencaoAfterPost(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.Refresh;
end;

procedure TFrameTipoGasto.queryManutencaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('tipogasto_id').AsInteger := UniMainModule.GerarSequence('seq_tipogasto_id');
end;

procedure TFrameTipoGasto.queryManutencaoNewRecord(DataSet: TDataSet);
begin
  inherited;
  queryManutencao.FieldByName('ativo').AsBoolean := True;
end;

procedure TFrameTipoGasto.UniFrameCreate(Sender: TObject);
begin
  tsConsulta.Visible := False;
  inherited;

  editDescricao.MaxLength := 200;

  queryManutencao.Close;
  queryManutencao.SQL.Clear;
  queryManutencao.Open('select tipogasto_id, descricao, ativo from tipo_gasto');

  dsManutencaoStateChange(nil);
end;

initialization
  RegisterClass(TFrameTipoGasto);

end.
