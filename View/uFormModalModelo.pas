unit uFormModalModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uniGUITypes,
  uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniPanel, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, uniButton, uniScrollBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniImageList;

type
  TFormModalModelo = class(TUniForm)
    buttonCancelar: TUniButton;
    panelBotoes: TUniPanel;
    dsManutencao: TDataSource;
    queryManutencao: TFDQuery;
    buttonNovo: TUniButton;
    buttonGravar: TUniButton;
    buttonExcluir: TUniButton;
    imageListFormModalModelo: TUniNativeImageList;
    buttonFechar: TUniButton;
    procedure buttonCancelarClick(Sender: TObject);
    procedure buttonGravarClick(Sender: TObject);
    procedure dsManutencaoStateChange(Sender: TObject);
    procedure buttonNovoClick(Sender: TObject);
    procedure buttonExcluirClick(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure buttonFecharClick(Sender: TObject);
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

procedure TFormModalModelo.buttonNovoClick(Sender: TObject);
begin
  if not queryManutencao.Active then
    queryManutencao.Open;

  queryManutencao.Insert;
end;

procedure TFormModalModelo.buttonGravarClick(Sender: TObject);
begin
  queryManutencao.Post;
end;

procedure TFormModalModelo.buttonExcluirClick(Sender: TObject);
begin
  MessageDlg(
    'Deseja realmente excluir o registro?',
    mtConfirmation,
    mbYesNo,
    procedure(Sender: TComponent; ARes: Integer)
    begin
      if ARes <> mrYes then
        Exit;

      queryManutencao.Delete;
    end
  );
end;

procedure TFormModalModelo.buttonFecharClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormModalModelo.buttonCancelarClick(Sender: TObject);
begin
  if queryManutencao.State in dsEditModes then
    queryManutencao.Cancel;
end;

procedure TFormModalModelo.dsManutencaoStateChange(Sender: TObject);
begin
  if dsManutencao.State in [dsBrowse, dsInactive] then
  begin
    buttonNovo.Enabled := True;
    buttonExcluir.Enabled := True;
    buttonCancelar.Enabled := False;
    buttonGravar.Enabled := False;
  end
  else if dsManutencao.State in dsEditModes then
  begin
    buttonNovo.Enabled := False;
    buttonExcluir.Enabled := False;
    buttonCancelar.Enabled := True;
    buttonGravar.Enabled := True;
  end;
end;

procedure TFormModalModelo.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if queryManutencao.Active then
    queryManutencao.Close;
end;

end.
