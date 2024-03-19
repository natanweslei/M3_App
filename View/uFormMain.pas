unit uFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniPanel, uniPageControl,
  uniGUIBaseClasses, uniTreeView, Vcl.Imaging.pngimage, uniImage, uniGUIFrame, Vcl.Menus,
  uniMainMenu, uniImageList, uniTreeMenu;

type
  TFormMain = class(TUniForm)
    PageControlMain: TUniPageControl;
    TabSheetMain: TUniTabSheet;
    UniMenuItems: TUniMenuItems;
    UniTreeMenu: TUniTreeMenu;
    MenuManutencao: TUniMenuItem;
    menuSair: TUniMenuItem;
    menuSimulador: TUniMenuItem;
    submenuVeiculo: TUniMenuItem;
    submenuEntrada: TUniMenuItem;
    submenuVenda: TUniMenuItem;
    submenuGastos: TUniMenuItem;
    menuCadastro: TUniMenuItem;
    submenuEmpresa: TUniMenuItem;
    submenuPessoa: TUniMenuItem;
    submenuTipoGasto: TUniMenuItem;
    menuFinanceiro: TUniMenuItem;
    submenuContasReceber: TUniMenuItem;
    procedure menuSairClick(Sender: TObject);
    procedure menuSimuladorClick(Sender: TObject);
    procedure submenuEmpresaClick(Sender: TObject);
    procedure submenuPessoaClick(Sender: TObject);
    procedure submenuTipoGastoClick(Sender: TObject);
    procedure submenuVeiculoClick(Sender: TObject);
    procedure submenuEntradaClick(Sender: TObject);
    procedure submenuVendaClick(Sender: TObject);
    procedure submenuGastosClick(Sender: TObject);
    procedure submenuContasReceberClick(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
  public
    Procedure OpenFrame(AClassName: string; ACaption: string);
  end;

function FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  uFrameModelo,
  uFormModalSimulador,
  uFormAlertaFinanceiro,
  uniGUIVars,
  MainModule,
  uniGUIApplication;

function FormMain: TFormMain;
begin
  Result := TFormMain(UniMainModule.GetFormInstance(TFormMain));
end;

procedure TFormMain.OpenFrame(AClassName: string; ACaption: string);
var
  i: Integer;
  LActivePageId: Integer;
  LTabSheet: TUniTabSheet;
//  LFormClass: TUniFormClass;
//  LForm: TUniForm;
  LFrameClass: TUniFrameClass;
  LFrame: TUniFrame;
begin
  if AClassName = EmptyStr then
    Exit;

  LActivePageId := -1;

  for i := 0 to PageControlMain.PageCount -1 do
  begin
    if PageControlMain.Pages[i].Caption <> ACaption then
      Continue;

    PageControlMain.ActivePageIndex := i;
    LActivePageId := 0;
    Break;
  end;

  if LActivePageId = -1 then
  begin
    LTabSheet                  := TUniTabSheet.Create(Self);
    LTabSheet.Name             := AClassName;
    LTabSheet.Closable         := True;
    LTabSheet.PageControl      := PageControlMain;
    LTabSheet.Caption          := ACaption;
    LTabSheet.Align            := alClient;
    LTabSheet.AlignWithMargins := True;

    LFrameClass       := TUniFrameClass(FindClass(AClassName));
    LFrame            := LFrameClass.Create(LTabSheet);
    LFrame.Align      := alClient;
    LFrame.Parent     := LTabSheet;

//    LFormClass             := TUniFormClass(FindClass('T' + AClassName));
//    LForm                  := LFormClass.Create(UniApplication);
//    LForm.Align            := alClient;
//    LForm.Parent           := LFrame;
//    LForm.BorderStyle      := bsSingle;
//    LForm.AlignWithMargins := True;

    PageControlMain.ActivePage := LTabSheet;
  end;
end;

procedure TFormMain.submenuEmpresaClick(Sender: TObject);
begin
  OpenFrame('TFrameEmpresa', 'Empresa');
end;

procedure TFormMain.submenuPessoaClick(Sender: TObject);
begin
  OpenFrame('TFrameManutencaoPessoa', 'Pessoa');
end;

procedure TFormMain.submenuTipoGastoClick(Sender: TObject);
begin
  OpenFrame('TFrameTipoGasto', 'Tipo de Gasto');
end;

procedure TFormMain.submenuVeiculoClick(Sender: TObject);
begin
  OpenFrame('TFrameManutencaoVeiculo', 'Manutenção de Veículos');
end;

procedure TFormMain.submenuEntradaClick(Sender: TObject);
begin
  OpenFrame('TFrameManutencaoEntrada', 'Manutenção de Entradas');
end;

procedure TFormMain.submenuVendaClick(Sender: TObject);
begin
  OpenFrame('TFrameManutencaoVenda', 'Manutenção de Vendas');
end;

procedure TFormMain.submenuGastosClick(Sender: TObject);
begin
  OpenFrame('TFrameManutencaoGasto', 'Manutenção de Gastos');
end;

procedure TFormMain.submenuContasReceberClick(Sender: TObject);
begin
  OpenFrame('TFrameManutencaoContasReceber', 'Manutenção de Contas a Receber');
end;

//procedure TFormMain.UniFormShow(Sender: TObject);
//var
//  LUniMenu: TUniTreeNode;
//  LTabSheet : TUniTabSheet;
//begin
//  LUniMenu := UniTreeMenu.Selected;
//  LTabSheet := LUniMenu.Data;
//
//  if Assigned(LTabSheet) then
//    LTabSheet.Free;
//
//  LUniMenu.Free;
//end;

procedure TFormMain.UniFormAfterShow(Sender: TObject);
begin
  if UniMainModule.GlobalAcessoOperador.AlertaFinanceiroVencido then
  begin
    if UniMainModule.TemFinanceiroVencido > 0 then
      FormAlertaFinanceiro.ShowModal;
  end;
end;

procedure TFormMain.UniFormCreate(Sender: TObject);
begin

  UniMenuItems.Items.Find('Cadastro', True).Visible := UniMainModule.GlobalAcessoOperador.CadastroEmpresa or
                                                       UniMainModule.GlobalAcessoOperador.CadastroPessoa or
                                                       UniMainModule.GlobalAcessoOperador.CadastroTipoGasto;

  UniMenuItems.Items.Find('Empresa', True).Visible       := UniMainModule.GlobalAcessoOperador.CadastroEmpresa;
  UniMenuItems.Items.Find('Pessoa', True).Visible        := UniMainModule.GlobalAcessoOperador.CadastroPessoa;
  UniMenuItems.Items.Find('Tipo de Gasto', True).Visible := UniMainModule.GlobalAcessoOperador.CadastroTipoGasto;

  UniMenuItems.Items.Find('Manutenção', True).Visible := UniMainModule.GlobalAcessoOperador.ManutencaoVeiculo or
                                                         UniMainModule.GlobalAcessoOperador.ManutencaoVenda or
                                                         UniMainModule.GlobalAcessoOperador.ManutencaoGasto;

  UniMenuItems.Items.Find('Veículo', True).Visible    := UniMainModule.GlobalAcessoOperador.ManutencaoVeiculo;
  UniMenuItems.Items.Find('Venda', True).Visible      := UniMainModule.GlobalAcessoOperador.ManutencaoVenda;
  UniMenuItems.Items.Find('Gasto', True).Visible      := UniMainModule.GlobalAcessoOperador.ManutencaoGasto;


  UniMenuItems.Items.Find('Financeiro', True).Visible       := UniMainModule.GlobalAcessoOperador.ManutencaoContasReceber;
  UniMenuItems.Items.Find('Contas a Receber', True).Visible := UniMainModule.GlobalAcessoOperador.ManutencaoContasReceber;

  UniMenuItems.Items.Find('Simulador', True).Visible := UniMainModule.GlobalAcessoOperador.Simulador;
end;

procedure TFormMain.menuSimuladorClick(Sender: TObject);
begin
  FormModalSimulador.ShowModal;
end;

procedure TFormMain.menuSairClick(Sender: TObject);
begin
  Self.UniApplication.Terminate;
end;

initialization
  RegisterAppFormClass(TFormMain);

end.
