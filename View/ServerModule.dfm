object UniServerModule: TUniServerModule
  OldCreateOrder = False
  AutoCoInitialize = True
  TempFolder = 'temp\'
  Title = 'Garagem 1.0'
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomCSS.Strings = (
    '.LoginBackground'
    '{'
    '   background:url('#39'files/img/background.png'#39') repeat fixed;'
    '} '
    ''
    '.HandPoint'
    '{'
    'cursor: pointer;'
    '}')
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  OnBeforeInit = UniGUIServerModuleBeforeInit
  Height = 150
  Width = 215
end
