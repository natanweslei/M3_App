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
  uniDBGrid;

type
  TFrameModelo = class(TUniFrame)
    PageControlModelo: TUniPageControl;
    tsConsulta: TUniTabSheet;
    gridConsulta: TUniDBGrid;
    panelFiltros: TUniPanel;
    tsManutencao: TUniTabSheet;
    panelBotoes: TUniPanel;
    procedure UniFrameDestroy(Sender: TObject);
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

procedure TFrameModelo.UniFrameDestroy(Sender: TObject);
begin
//  if qry.active then
//    qry.Close;
end;

end.
