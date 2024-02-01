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
  TFormModalGastos = class(TFormModalModelo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormModalGastos: TFormModalGastos;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormModalGastos: TFormModalGastos;
begin
  Result := TFormModalGastos(UniMainModule.GetFormInstance(TFormModalGastos));
end;

end.
