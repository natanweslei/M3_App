unit uFrameEmpresa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  uniPanel,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniPageControl,
  uniGUIBaseClasses,
  uniLabel,
  uFrameModelo;

type
  TFrameEmpresa = class(TFrameModelo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TFrameEmpresa);

end.