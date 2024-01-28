unit uFrameEmpresa;

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
  uniPanel,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniPageControl,
  uniGUIBaseClasses,
  uniLabel,
  uFrameModelo,
  uniButton, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniDBEdit,
  uniEdit;

type
  TFrameEmpresa = class(TFrameModelo)
    panelGeral: TUniPanel;
    panelTelefones: TUniPanel;
    panelEndereco: TUniPanel;
    editNomeEmpresa: TUniDBEdit;
    editRazaoSocial: TUniDBEdit;
    editCnpj: TUniDBEdit;
    editTelefoneComercial: TUniDBEdit;
    editTelefoneCelular: TUniDBEdit;
    editLogradouro: TUniDBEdit;
    editBairro: TUniDBEdit;
    editQuadra: TUniDBEdit;
    editLote: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameEmpresa.UniFrameCreate(Sender: TObject);
begin
  inherited;
  queryConsulta.Close;
  queryConsulta.SQL.Add('select');
  queryConsulta.SQL.Add('  empresa_id,');
  queryConsulta.SQL.Add('	 nome_fantasia,');
  queryConsulta.SQL.Add('	 nome_social,');
  queryConsulta.SQL.Add('	 cnpj,');
  queryConsulta.SQL.Add('	 telefone_comercial,');
  queryConsulta.SQL.Add('	 telefone_celular,');
  queryConsulta.SQL.Add('	 logradouro,');
  queryConsulta.SQL.Add('	 quadra,');
  queryConsulta.SQL.Add('	 lote,');
  queryConsulta.SQL.Add('	 bairro');
  queryConsulta.SQL.Add('from');
  queryConsulta.SQL.Add('	 EMPRESA');
  queryConsulta.Open;
end;

initialization
  RegisterClass(TFrameEmpresa);

end.
