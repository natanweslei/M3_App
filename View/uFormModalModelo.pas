unit uFormModalModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, uniButton, uniScrollBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormModalModelo = class(TUniForm)
    buttonCancelar: TUniButton;
    panelBotoes: TUniPanel;
    scrollModelo: TUniScrollBox;
    dsManutencao: TDataSource;
    queryManutencao: TFDQuery;
    buttonNovo: TUniButton;
    buttonGravar: TUniButton;
    buttonExcluir: TUniButton;
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FormModalModelo: TFormModalModelo;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function FormModalModelo: TFormModalModelo;
begin
  Result := TFormModalModelo(UniMainModule.GetFormInstance(TFormModalModelo));
end;

procedure TFormModalModelo.buttonCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormModalModelo.buttonGravarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
