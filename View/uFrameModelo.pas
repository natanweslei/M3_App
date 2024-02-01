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
    procedure MostraManute; virtual;
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

procedure TFrameModelo.MostraManute;
begin

end;

procedure TFrameModelo.queryConsultaAfterScroll(DataSet: TDataSet);
begin
  MostraManute;
end;

procedure TFrameModelo.UniFrameCreate(Sender: TObject);
begin
//  buttonIncluir.Caption  := '<i class="fa fa fa-file-o         fa-2x" aria-hidden="true"></i><br>Inserir';
//  buttonAlterar.Caption  := '<i class="fa fa fa-file-text-o    fa-2x" aria-hidden="true"></i><br>Alterar';
//  buttonExcluir.caption  := '<i class="fa fa fa-minus-square-o fa-2x" aria-hidden="true"></i><br>Excluir';
//  buttonCancelar.Caption := '<i class="fa fa fa fa-rotate-left fa-2x" aria-hidden="true"></i><br>Cancelar';
//  buttonGravar.Caption   := '<i class="fa fa-check-square-o    fa-2x" aria-hidden="true"></i><br>Gravar';

//  BtFiltrar.Caption   := '<i class="fa fa fa-search-plus    fa-2x" aria-hidden="true"></i>Filtrar' ;//'<span class="glyphicon glyphicon-zoom-in btn btn-default btn-lg"> Filtrar</span>';
                         //'<i class="fa fa fa-search-plus       fa-2x" aria-hidden="true"></i>Filtrar';

  if tsConsulta.Visible then
  begin
    PageControlModelo.ActivePage := tsConsulta;

    if gridConsulta.CanFocus then
      gridConsulta.SetFocus;
  end;
end;

procedure TFrameModelo.UniFrameDestroy(Sender: TObject);
begin
  if queryConsulta.Active then
    queryConsulta.Close;

  if queryManutencao.Active then
    queryManutencao.Close;
end;

end.
