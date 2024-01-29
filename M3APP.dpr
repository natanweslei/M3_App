program
  M3APP;

uses
  uniGUIISAPI,
  Forms,
  Customers in 'View\Customers.pas' {FrmCustomers: TUniFrame},
  uFormLogin in 'View\uFormLogin.pas' {FormLogin: TUniLoginForm},
  uFormMain in 'View\uFormMain.pas' {FormMain: TUniForm},
  MainModule in 'View\MainModule.pas' {UniMainModule: TUniGUIMainModule},
  NewInvioce in 'View\NewInvioce.pas' {FrmNewInvoice: TUniFrame},
  ServerModule in 'View\ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  uFormModelo in 'View\uFormModelo.pas' {FormModelo: TUniForm},
  uFormEmpresa in 'View\uFormEmpresa.pas' {FormEmpresa: TUniForm},
  uFrameModelo in 'View\uFrameModelo.pas' {FrameModelo: TUniFrame},
  uFrameEmpresa in 'View\uFrameEmpresa.pas' {FrameEmpresa: TUniFrame},
  uFrameTipoGasto in 'View\uFrameTipoGasto.pas' {FraFormTipoGasto: TUniFrame},
  uFrameVeiculo in 'View\uFrameVeiculo.pas' {FrameVeiculo},
  uFramePessoa in 'View\uFramePessoa.pas' {FramePessoa: TUniFrame},
  uAPI in 'API\uAPI.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
