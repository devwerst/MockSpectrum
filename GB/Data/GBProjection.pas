unit GBProjection;

interface

uses
  GBConst, GBModvar;

type
  TProjection = Class(TObject)
  public
    modSet  : GB_TByteSet;
    modules : array [1..GB_Max_Modules] of TGBModule;
    constructor Create(modSet : GB_TByteSet); reintroduce;

    function  ModuleActive(modID:byte):boolean;
    procedure SetModule(modID : byte; module : TGBModule);
    function  GetModule(modID : byte): TGBModule;
  End;

implementation
uses
  GBUtil;

constructor TProjection.Create(modSet : GB_TByteSet);
var
  modID : byte;
begin
  self.modSet := modSet;
  for modID := 1 to GB_Max_Modules do
    modules[modID] := nil;
end;

function TProjection.ModuleActive(modID:byte):boolean;
begin
  result := false;
  if modID in modSet then
    result := true;
end;

procedure TProjection.SetModule(modID : byte; module : TGBModule);
begin
  log('Setting module '+ modIDToStr(modID));
  if assigned(modules[modID]) then
  begin
    modules[modID].Free;
    modules[modID] := nil; //basically freeAndNil()
  end;
  modules[modID] := module;
end;

function  TProjection.GetModule(modID : byte): TGBModule;
begin
  log('Getting module '+ modIDToStr(modID));
  result := modules[modID];
end;

end.
