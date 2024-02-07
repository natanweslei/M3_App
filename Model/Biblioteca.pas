unit Biblioteca;

interface

uses
  Vcl.Controls, Vcl.StdCtrls, uniDBEdit;

type
  TUpperCaseHelper = class helper for TControl
  public
    procedure SetUpperCaseCharCase;
  end;

implementation

procedure TUpperCaseHelper.SetUpperCaseCharCase;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      TUniDBEdit(Components[i]).CharCase := ecUpperCase;
  end;
end;

end.
