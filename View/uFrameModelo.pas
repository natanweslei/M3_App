unit uFrameModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, uniGUIForm, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel,
  uniPageControl, uniBasicGrid, uniDBGrid,  uniLabel, uniButton, uniBitBtn, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniImageList;

type
  TFrameModelo = class(TUniFrame)
    PageControlModelo: TUniPageControl;
    tsConsulta: TUniTabSheet;
    gridConsulta: TUniDBGrid;
    panelFiltros: TUniPanel;
    tsManutencao: TUniTabSheet;
    containerBotoes: TUniContainerPanel;
    buttonNovo: TUniButton;
    buttonExcluir: TUniButton;
    buttonCancelar: TUniButton;
    buttonGravar: TUniButton;
    dsConsulta: TDataSource;
    dsManutencao: TDataSource;
    queryConsulta: TFDQuery;
    queryManutencao: TFDQuery;
    imageListFrameModelo: TUniNativeImageList;
    procedure UniFrameDestroy(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonNovoClick(Sender: TObject);
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonExcluirClick(Sender: TObject);
    procedure buttonGravarClick(Sender: TObject);
    procedure queryConsultaAfterScroll(DataSet: TDataSet);
    procedure dsManutencaoStateChange(Sender: TObject);
  protected
    procedure MostraManutencao; virtual;
  end;

implementation

{$R *.dfm}

uses
  MainModule;

procedure TFrameModelo.buttonNovoClick(Sender: TObject);
begin
  if not queryManutencao.Active then
    queryManutencao.Open;

  queryManutencao.Insert;
end;

procedure TFrameModelo.dsManutencaoStateChange(Sender: TObject);
begin
  if dsManutencao.State in [dsBrowse, dsInactive] then
  begin
    buttonNovo.Enabled := True;
    buttonExcluir.Enabled := True;
    buttonCancelar.Enabled := False;
    buttonGravar.Enabled := False;
  end
  else if dsManutencao.State in dsEditModes then
  begin
    buttonNovo.Enabled := False;
    buttonExcluir.Enabled := False;
    buttonCancelar.Enabled := True;
    buttonGravar.Enabled := True;
  end;
end;

procedure TFrameModelo.buttonGravarClick(Sender: TObject);
begin
  queryManutencao.Post;

  if queryConsulta.Active then
    queryConsulta.Refresh;

  if tsConsulta.Visible then
    PageControlModelo.ActivePage := tsConsulta;
end;

procedure TFrameModelo.buttonExcluirClick(Sender: TObject);
begin
  MessageDlg(
    'Deseja realmente excluir o registro?',
    mtConfirmation,
    mbYesNo,
    procedure(Sender: TComponent; ARes: Integer)
    begin
      if ARes <> mrYes then
        Exit;

      queryManutencao.Delete;
      if queryConsulta.Active then
      begin
        queryConsulta.Refresh;
        queryConsulta.First;
      end;
    end
  );
end;

procedure TFrameModelo.buttonCancelarClick(Sender: TObject);
begin
  if queryManutencao.State in dsEditModes then
    queryManutencao.Cancel;
end;

procedure TFrameModelo.MostraManutencao;
begin

end;

procedure TFrameModelo.queryConsultaAfterScroll(DataSet: TDataSet);
begin
  MostraManutencao;
end;

procedure TFrameModelo.UniFrameCreate(Sender: TObject);
begin
  PageControlModelo.ActivePage := tsConsulta;

  if gridConsulta.CanFocus then
    gridConsulta.SetFocus;
end;

procedure TFrameModelo.UniFrameDestroy(Sender: TObject);
begin
  if queryConsulta.Active then
    queryConsulta.Close;

  if queryManutencao.Active then
    queryManutencao.Close;
end;

end.
