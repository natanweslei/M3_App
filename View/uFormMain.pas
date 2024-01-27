unit uFormMain;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIRegClasses,
  uniGUIForm,
  uniPanel,
  uniPageControl,
  uniGUIBaseClasses,
  uniTreeView,
  Vcl.Imaging.pngimage,
  uniImage,
  uniGUIFrame,
  Vcl.Menus,
  uniMainMenu,
  uniImageList,
  uniTreeMenu;

type
  TFormMain = class(TUniForm)
    PageControlMain: TUniPageControl;
    TabSheetMain: TUniTabSheet;
    UniImage1: TUniImage;
    UniMenuItems1: TUniMenuItems;
    UniTreeMenu1: TUniTreeMenu;
    MenuEmpresa: TUniMenuItem;
    MenuFuncionario: TUniMenuItem;
    MenuTipoGasto: TUniMenuItem;
    MenuVeiculo: TUniMenuItem;
    MenuCliente: TUniMenuItem;
    MenuEntradaVeiculos: TUniMenuItem;
    MenuSaidaVeiculos: TUniMenuItem;
    MenuManutencaoVeiculos: TUniMenuItem;
    procedure MenuTipoGastoClick(Sender: TObject);
    procedure MenuVeiculoClick(Sender: TObject);
    procedure MenuClienteClick(Sender: TObject);
    procedure MenuEmpresaClick(Sender: TObject);
    procedure MenuFuncionarioClick(Sender: TObject);
  private
  public
    Procedure OpenFrame(AClassName: string; ACaption: string);
  end;

function FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  uFormModelo,
  uFraFormModelo,
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
  LActivePage_id: Integer;
  LTabSheet: TUniTabSheet;
  LFrameClass: TUniFrameClass;
  LFrame: TUniFrame;
begin
  if AClassName = EmptyStr then
    Exit;

  LActivePage_id := -1;

  for i := 0 to PageControlMain.PageCount -1 do
  begin
    if PageControlMain.Pages[i].Caption <> ACaption then
      Continue;

    PageControlMain.ActivePageIndex := i;
    LActivePage_id := 0;
    Break;
  end;

  if LActivePage_id = -1 then
  begin
    LTabSheet             := TUniTabSheet.Create(Self);
    LTabSheet.Name        := AClassName;
    LTabSheet.Closable    := True;
    LTabSheet.PageControl := PageControlMain;

    LFrameClass       := TUniFrameClass(FindClass(AClassName));
    LFrame            := LFrameClass.Create(LTabSheet);
    LFrame.Align      := alClient;
    LFrame.Parent     := LTabSheet;
    LTabSheet.Caption := ACaption;

    PageControlMain.ActivePage := LTabSheet;
  end;
end;

procedure TFormMain.MenuEmpresaClick(Sender: TObject);
begin
  OpenFrame('TFraFormEmpresa', 'Empresa');
end;

procedure TFormMain.MenuFuncionarioClick(Sender: TObject);
begin
//  OpenFrame('TFormFuncionario', 'MenuFuncionario');
  OpenFrame('TFraFormModelo', 'Funcionario');
end;

procedure TFormMain.MenuTipoGastoClick(Sender: TObject);
begin
  OpenFrame('TFraFormTipoGasto', 'Tipo de Gasto');
end;

procedure TFormMain.MenuVeiculoClick(Sender: TObject);
begin
  OpenFrame('TFraFormVeiculo', 'Veiculo');
end;

procedure TFormMain.MenuClienteClick(Sender: TObject);
begin
  OpenFrame('TFraFormCliente', 'Cliente');
end;

initialization
  RegisterAppFormClass(TFormMain);

end.
