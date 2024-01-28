unit uFrameModelo;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  uniGUIForm,
  Forms,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIFrame,
  uniGUIBaseClasses,
  uniPanel,
  uniPageControl,
  uniBasicGrid,
  uniDBGrid, uniLabel, uniButton, uniBitBtn, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TAcaoCrud = (acaoIncluir, acaoAlterar, acaoExcluir, acaoListaVazia, acaoListaComRegistros);

  TFrameModelo = class(TUniFrame)
    PageControlModelo: TUniPageControl;
    tsConsulta: TUniTabSheet;
    gridConsulta: TUniDBGrid;
    panelFiltros: TUniPanel;
    tsManutencao: TUniTabSheet;
    containerBotoes: TUniContainerPanel;
    buttonIncluir: TUniButton;
    buttonAlterar: TUniButton;
    buttonExcluir: TUniButton;
    buttonCancelar: TUniButton;
    buttonGravar: TUniButton;
    dsConsulta: TDataSource;
    dsManutencao: TDataSource;
    queryConsulta: TFDQuery;
    queryManutencao: TFDQuery;
    procedure UniFrameDestroy(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure buttonIncluirClick(Sender: TObject);
    procedure buttonAlterarClick(Sender: TObject);
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonExcluirClick(Sender: TObject);
    procedure buttonGravarClick(Sender: TObject);
    procedure gridConsultaDblClick(Sender: TObject);
  protected
    procedure Modo(AAcao: TAcaoCrud); virtual;
    procedure MostraManute; virtual;
  public
//		function FormPrograma(): TUniForm;
  end;

implementation

{$R *.dfm}

uses
  MainModule;

procedure TFrameModelo.buttonIncluirClick(Sender: TObject);
begin
  Modo(acaoIncluir);

  if not queryManutencao.Active then
    queryManutencao.Open;

  queryManutencao.Insert;
end;

procedure TFrameModelo.gridConsultaDblClick(Sender: TObject);
begin
  MostraManute;
end;

procedure TFrameModelo.buttonAlterarClick(Sender: TObject);
begin
  Modo(acaoAlterar);

  try
    queryManutencao.Close;

    queryManutencao.Open;
  except
    Abort ;
  end ;
end;

procedure TFrameModelo.buttonExcluirClick(Sender: TObject);
begin
//  MessageDlg('Confirma a Exclusão ?', mtConfirmation, mbYesNo, DCallBack2);

  Modo(acaoExcluir);

  Try
    queryManutencao.Close;

    queryManutencao.Open;
  except
    ShowMessage('Você precisa selecionar um registro para fazer manutenção do mesmo.');
    Abort;
  end;

  if queryConsulta.Active then
    queryConsulta.Refresh;

  PageControlModelo.ActivePage := tsConsulta;
end;

procedure TFrameModelo.buttonCancelarClick(Sender: TObject);
begin
  if queryManutencao.State in dsEditModes then
    queryManutencao.Cancel;

  if queryManutencao.IsEmpty then
    Modo(acaoListaVazia)
  else
    Modo(acaoListacomRegistros);

  queryManutencao.Close;

  PageControlModelo.ActivePage := tsConsulta;
end;

procedure TFrameModelo.buttonGravarClick(Sender: TObject);
begin
  queryManutencao.Post;
  
//  if not queryManutencao.ApplyUpdates() = 0 then
//  Begin
//    ShowMessage(vError);
//    Abort ;
//  end;

  if queryConsulta.Active then
    queryConsulta.Refresh;

  PageControlModelo.ActivePage := tsConsulta;

  if queryConsulta.IsEmpty then
    Modo(acaoListaVazia)
  else
    Modo(acaoListacomRegistros);
end;

procedure TFrameModelo.Modo(AAcao: TAcaoCrud);
begin
  if AAcao in [acaoIncluir, acaoAlterar, acaoExcluir] then
  begin
    buttonIncluir.Enabled := False;
    buttonAlterar.Enabled := False;
    buttonExcluir.Enabled := False;
    buttonCancelar.Enabled := True;
    buttonGravar.Enabled := True;
  end
  else if AAcao in [acaoListaVazia] then
  begin
    buttonIncluir.Enabled := True;
    buttonAlterar.Enabled := False;
    buttonExcluir.Enabled := False;
    buttonCancelar.Enabled := False;
    buttonGravar.Enabled := False;
  end
  else if AAcao in [acaoListacomRegistros] then
  begin
    buttonIncluir.Enabled := True;
    buttonAlterar.Enabled := True;
    buttonExcluir.Enabled := True;
    buttonCancelar.Enabled := False;
    buttonGravar.Enabled := False;
  end;
end;

procedure TFrameModelo.MostraManute;
begin
  PageControlModelo.ActivePage := tsManutencao;
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
//  SetBut(tpListaVazia) ;
  PageControlModelo.ActivePage := tsConsulta ;
//  EdPesquisar.SetFocus
end;

procedure TFrameModelo.UniFrameDestroy(Sender: TObject);
begin
//  if qry.active then
//    qry.Close;
end;

end.
