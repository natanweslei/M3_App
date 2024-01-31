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
  uFormModalModelo in 'View\uFormModalModelo.pas' {FormModalModelo: TUniForm},
  uFrameModelo in 'View\uFrameModelo.pas' {FrameModelo: TUniFrame},
  uFrameEmpresa in 'View\uFrameEmpresa.pas' {FrameEmpresa: TUniFrame},
  uFrameTipoGasto in 'View\uFrameTipoGasto.pas' {FraFormTipoGasto: TUniFrame},
  uFrameManutencaoVeiculo in 'View\uFrameManutencaoVeiculo.pas' {FrameManutencaoVeiculo},
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
