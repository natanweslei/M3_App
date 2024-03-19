unit uFrameManutencaoPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, uniGUIFrame,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniPageControl, uniGUIBaseClasses, uFrameModelo, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniImageList, uniGUITypes, uniDBImage, uniFileUpload, uniImage, uniDBNavigator,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniEdit;

type
  TFrameManutencaoPessoa = class(TUniFrame)
    panelFiltro: TUniPanel;
    panelBotoes: TUniPanel;
    buttonCadastroPessoa: TUniButton;
    buttonAcesso: TUniButton;
    dsPessoa: TDataSource;
    queryPessoa: TFDQuery;
    gridPessoa: TUniDBGrid;
    procedure buttonCadastroPessoaClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure gridPessoaDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure queryPessoaAfterScroll(DataSet: TDataSet);
    procedure buttonAcessoClick(Sender: TObject);
  private
    procedure ExecutaPesquisa;
  end;

implementation

{$R *.dfm}

uses
  MainModule, uFormModalPessoa, uFormModalAcesso;

procedure TFrameManutencaoPessoa.buttonAcessoClick(Sender: TObject);
begin
  if queryPessoa.Active then
    FormModalAcesso.PessoaId := queryPessoa.FieldByName('pessoa_id').AsInteger;

  FormModalAcesso.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryPessoa.Refresh;
    end
  );
end;

procedure TFrameManutencaoPessoa.buttonCadastroPessoaClick(Sender: TObject);
begin
  if queryPessoa.Active then
    FormModalPessoa.PessoaId := queryPessoa.FieldByName('pessoa_id').AsInteger;

  FormModalPessoa.ShowModal(
    procedure(ASender: TComponent; AResult: Integer)
    begin
      if AResult = mrOk then
        queryPessoa.Refresh;
    end
  );
end;

procedure TFrameManutencaoPessoa.ExecutaPesquisa;
var
  LFiltro: string;

  function WhereAnd: string;
  begin
    if LFiltro = EmptyStr then
      Result := ' where '
    else
      Result := ' and ';
  end;
begin
  LFiltro := EmptyStr;

  queryPessoa.Close;
  queryPessoa.SQL.Clear;
  queryPessoa.SQL.Add('select * from pessoa');
  queryPessoa.Open;
end;

procedure TFrameManutencaoPessoa.gridPessoaDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if Odd(gridPessoa.DataSource.DataSet.RecNo) then
    Attribs.Color := $00E9E9E9
  else
    Attribs.Color := clWhite;
end;

procedure TFrameManutencaoPessoa.queryPessoaAfterScroll(DataSet: TDataSet);
begin
  buttonAcesso.Enabled := queryPessoa.FieldByName('operador').AsBoolean;
end;

procedure TFrameManutencaoPessoa.UniFrameCreate(Sender: TObject);
begin
  ExecutaPesquisa;
end;

procedure TFrameManutencaoPessoa.UniFrameDestroy(Sender: TObject);
begin
  if queryPessoa.Active then
    queryPessoa.Close;
end;

initialization
  RegisterClass(TFrameManutencaoPessoa);

end.
