unit uFormModalModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, uniButton;

type
  TFormModalModelo = class(TUniForm)
    buttonConfirmar: TUniButton;
    buttonCancelar: TUniButton;
    panelBotoes: TUniPanel;
    procedure buttonConfirmarClick(Sender: TObject);
    procedure buttonCancelarClick(Sender: TObject);
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

procedure TFormModalModelo.buttonConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormModalModelo.buttonCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
