unit uFraFormVeiculo;

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
  uniGUIBaseClasses;

type
  TFraFormVeiculo = class(TFraFormModelo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TFraFormVeiculo);

end.