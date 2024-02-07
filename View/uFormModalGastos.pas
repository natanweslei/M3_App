unit uFormModalGastos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses,
  uniScrollBox, uniButton, uniGUIBaseClasses, uniPanel, uniImageList;

type
  TFormModalTipoGasto = class(TFormModalModelo)
    scrollGasto: TUniScrollBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormModalTipoGasto: TFormModalTipoGasto;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormModalTipoGasto: TFormModalTipoGasto;
begin
  Result := TFormModalTipoGasto(UniMainModule.GetFormInstance(TFormModalTipoGasto));
end;

end.
