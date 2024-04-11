// {$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module

{$ifndef UNIGUI_VCL}
{$E dll}
library
{$else}
{$E exe}
program
{$endif}
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
  uFrameManutencaoPessoa in 'View\uFrameManutencaoPessoa.pas' {FrameManutencaoPessoa: TUniFrame},
  uAPI in 'API\uAPI.pas',
  uFrameEmpresa in 'View\uFrameEmpresa.pas' {FrameEmpresa: TUniFrame},
  uFormModalVeiculo in 'View\uFormModalVeiculo.pas' {FormModalVeiculo: TUniForm},
  uFormModalEntrada in 'View\uFormModalEntrada.pas' {FormModalEntrada: TUniForm},
  uFormModalVenda in 'View\uFormModalVenda.pas' {FormModalVenda: TUniForm},
  uFormModalGasto in 'View\uFormModalGasto.pas' {FormModalTipoGasto: TUniForm},
  uFormModalSimulador in 'View\uFormModalSimulador.pas' {FormModalSimulador: TUniForm},
  CalculadoraFinanciamento in 'Model\CalculadoraFinanciamento.pas',
  Biblioteca in 'Model\Biblioteca.pas',
  uFrameManutencaoEntrada in 'View\uFrameManutencaoEntrada.pas' {FrameManutencaoEntrada: TUniFrame},
  uFrameManutencaoVenda in 'View\uFrameManutencaoVenda.pas' {FrameManutencaoVenda: TUniFrame},
  uFrameManutencaoGasto in 'View\uFrameManutencaoGasto.pas' {FrameManutencaoGasto: TUniFrame},
  CalculadoraPrice in 'Model\CalculadoraPrice.pas',
  uFrameManutencaoContasReceber in 'View\uFrameManutencaoContasReceber.pas' {FrameManutencaoContasReceber: TUniFrame},
  uFormStatusFinanceiro in 'View\uFormStatusFinanceiro.pas' {FormStatusFinanceiro: TUniForm},
  uFormModalContasReceber in 'View\uFormModalContasReceber.pas' {FormModalContasReceber: TUniForm},
  uFormAlertaFinanceiro in 'View\uFormAlertaFinanceiro.pas' {FormAlertaFinanceiro: TUniForm},
  uFormModalPessoa in 'View\uFormModalPessoa.pas' {FormModalPessoa: TUniForm},
  uFormModalModelo in 'View\uFormModalModelo.pas' {FormModalModelo: TUniForm},
  uFormModalAcesso in 'View\uFormModalAcesso.pas' {FormModalAcesso: TUniForm};

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.
