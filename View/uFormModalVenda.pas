unit uFormModalVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormModalModelo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniGUIClasses,
  uniScrollBox, uniButton, uniGUIBaseClasses, uniPanel, uniImageList;

type
  TFormModalVenda = class(TFormModalModelo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormModalVenda: TFormModalVenda;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FormModalVenda: TFormModalVenda;
begin
  Result := TFormModalVenda(UniMainModule.GetFormInstance(TFormModalVenda));
end;

end.
