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
  uFraFormModelo in 'View\uFraFormModelo.pas' {FraFormModelo: TUniFrame},
  uFraFormEmpresa in 'View\uFraFormEmpresa.pas' {FraFormEmpresa: TUniFrame},
  uFraFormTipoGasto in 'View\uFraFormTipoGasto.pas' {FraFormTipoGasto: TUniFrame},
  uFraFormVeiculo in 'View\uFraFormVeiculo.pas',
  uFraFormCliente in 'View\uFraFormCliente.pas' {FraFormCliente: TUniFrame},
  uFraFormFuncionario in 'View\uFraFormFuncionario.pas' {FraFormFuncionario: TUniFrame};

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
