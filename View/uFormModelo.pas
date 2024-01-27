unit uFormModelo;

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
  uniGUIForm,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniPageControl,
  uniGUIBaseClasses;

type
  TFormModelo = class(TUniForm)
    PageControlModelo: TUniPageControl;
    tsConsulta: TUniTabSheet;
    gridConsulta: TUniDBGrid;
    panelFiltros: TUniPanel;
    tsManutencao: TUniTabSheet;
    panelBotoes: TUniPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//function FormModelo: TFormModelo;

implementation

uses
  uniGUIApplication;//, MainModule;

{$R *.dfm}

//function FormModelo: TFormModelo;
//begin
//  Result := TFormModelo(UniMainModule.GetFormInstance(TFormModelo));
//end;

end.
