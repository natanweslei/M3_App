unit uFraFormModelo;

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
  uniDBGrid;

type
  TFraFormModelo = class(TUniFrame)
    panelBotoes: TUniPanel;
    PageControlModelo: TUniPageControl;
    tsConsulta: TUniTabSheet;
    tsManutencao: TUniTabSheet;
    gridConsulta: TUniDBGrid;
    panelFiltros: TUniPanel;
  private
//    FPrograma: TUniForm;
  public
//		function FormPrograma(): TUniForm;
  end;

implementation

{$R *.dfm}

//function TFraFormModelo.FormPrograma: TUniForm;
//begin
//	Result := FPrograma;
//end;

end.
