program
  M3APP;

uses
  uniGUIISAPI,
  Forms,
  uFormLogin in 'View\uFormLogin.pas' {FormLogin: TUniLoginForm},
  uFormMain in 'View\uFormMain.pas' {FormMain: TUniForm},
  MainModule in 'View\MainModule.pas' {UniMainModule: TUniGUIMainModule},
  ServerModule in 'View\ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  uFrameModelo in 'View\uFrameModelo.pas' {FrameModelo: TUniFrame},
  uFrameTipoGasto in 'View\uFrameTipoGasto.pas' {FraFormTipoGasto: TUniFrame},
  uFrameManutencaoVeiculo in 'View\uFrameManutencaoVeiculo.pas' {FrameManutencaoVeiculo},
  uFramePessoa in 'View\uFramePessoa.pas' {FramePessoa: TUniFrame},
  uAPI in 'API\uAPI.pas',
  uFormModalModelo in 'View\uFormModalModelo.pas' {FormModalModelo: TUniForm},
  uFrameEmpresa in 'View\uFrameEmpresa.pas' {FrameEmpresa: TUniFrame},
  uFormModalVeiculo in 'View\uFormModalVeiculo.pas' {FormModalVeiculo: TUniForm},
  uFormModalEntrada in 'View\uFormModalEntrada.pas' {FormModalEntrada: TUniForm},
  uFormModalVenda in 'View\uFormModalVenda.pas' {FormModalVenda: TUniForm},
  uFormModalGastos in 'View\uFormModalGastos.pas' {FormModalTipoGasto: TUniForm},
  uFormModalSimulador in 'View\uFormModalSimulador.pas' {FormModalSimulador: TUniForm},
  CalculadoraFinanciamento in 'Model\CalculadoraFinanciamento.pas',
  Biblioteca in 'Model\Biblioteca.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
