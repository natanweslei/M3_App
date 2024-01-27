unit uFraFormEmpresa;

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
  uFraFormModelo,
  uniPanel,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniPageControl,
  uniGUIBaseClasses, uniLabel;

type
  TFraFormEmpresa = class(TFraFormModelo)
    UniLabel1: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TFraFormEmpresa);

end.
