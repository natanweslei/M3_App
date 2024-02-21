unit uFormStatusFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniRadioGroup;

type
  TFormStatusFinanceiro = class(TUniForm)
    radioStatusFinanceiro: TUniRadioGroup;
    buttonConfirmar: TUniButton;
    buttonCancelar: TUniButton;
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonConfirmarClick(Sender: TObject);
  private
    FFinanceiroId: Integer;
  public
    property FinanceiroId: Integer read FFinanceiroId write FFinanceiroId;
  end;

function FormStatusFinanceiro: TFormStatusFinanceiro;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, FireDAC.Comp.Client, FireDAC.Stan.Param;

function FormStatusFinanceiro: TFormStatusFinanceiro;
begin
  Result := TFormStatusFinanceiro(UniMainModule.GetFormInstance(TFormStatusFinanceiro));
end;

procedure TFormStatusFinanceiro.buttonCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormStatusFinanceiro.buttonConfirmarClick(Sender: TObject);
begin
  if radioStatusFinanceiro.ItemIndex = -1 then
  begin
    MessageDlg('É necessário selecionar o status financeiro!', mtWarning, [mbOK]);

    if radioStatusFinanceiro.CanFocus then
      radioStatusFinanceiro.SetFocus;

    Exit;
  end;

  MessageDlg(
    'Deseja realmente alterar o status financeiro do registro?',
    mtConfirmation,
    mbYesNo,
    procedure(Sender: TComponent; ARes: Integer)
    var
      queryStatusFinanceiro: TFDQuery;
    begin
      if ARes <> mrYes then
        Exit;

      queryStatusFinanceiro := TFDQuery.Create(nil);
      queryStatusFinanceiro.Connection := UniMainModule.Conexao;
      queryStatusFinanceiro.SQL.Add('update financeiro set status_financeiro = :pstatus where financeiro_id = :pfinanceiro_id');
      queryStatusFinanceiro.ParamByName('pstatus').Value := radioStatusFinanceiro.Items[radioStatusFinanceiro.ItemIndex];
      queryStatusFinanceiro.ParamByName('pfinanceiro_id').Value := FFinanceiroId;
      queryStatusFinanceiro.ExecSQL;
      queryStatusFinanceiro.Free;

      ModalResult := mrOk;
    end
  );
end;

end.
