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
    UniImage1: TUniImage;
    UniMenuItems1: TUniMenuItems;
    UniTreeMenu1: TUniTreeMenu;
    MenuEmpresa: TUniMenuItem;
    MenuPessoa: TUniMenuItem;
    MenuTipoGasto: TUniMenuItem;
    MenuManutencaoVeiculos: TUniMenuItem;
    menuSair: TUniMenuItem;
    ImageListMain: TUniNativeImageList;
    menuSimulador: TUniMenuItem;
    procedure MenuTipoGastoClick(Sender: TObject);
    procedure MenuEmpresaClick(Sender: TObject);
    procedure MenuPessoaClick(Sender: TObject);
    procedure MenuManutencaoVeiculosClick(Sender: TObject);
    procedure menuSairClick(Sender: TObject);
    procedure menuSimuladorClick(Sender: TObject);
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

procedure TFormMain.MenuEmpresaClick(Sender: TObject);
begin
  OpenFrame('TFrameEmpresa', 'Empresa');
end;

procedure TFormMain.MenuPessoaClick(Sender: TObject);
begin
  OpenFrame('TFramePessoa', 'Pessoa');
end;

procedure TFormMain.MenuTipoGastoClick(Sender: TObject);
begin
  OpenFrame('TFrameTipoGasto', 'Tipo de Despesa');
end;

procedure TFormMain.MenuManutencaoVeiculosClick(Sender: TObject);
begin
  OpenFrame('TFrameManutencaoVeiculo', 'Ve�culo');
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
