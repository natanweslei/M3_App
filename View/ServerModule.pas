unit ServerModule;

interface

uses
  Classes,
  SysUtils,
  uniGUIServer,
  uniGUIMainModule,
  uniGUIApplication,
  uIdCustomHTTPServer,
  uniGUITypes;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
  protected
    procedure FirstInit; override;
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
begin
//  MimeTable.AddMimeType('eot', 'application/font', False);
//  MimeTable.AddMimeType('svg', 'application/font', False);
//  MimeTable.AddMimeType('ttf', 'application/font', False);
//  MimeTable.AddMimeType('woff', 'application/font', False);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
