unit GBProjection;

interface

uses
  GBConst, GBModvar, GBModuleLink;

type
  TProjection = Class(TObject)
  public
    moduleSet   : GB_TByteSet;
    modules     : array [1..GB_Max_Modules] of TGBModule;
    modulelinks : array [1..GB_Max_Modules] of TGBModuleLink;
    constructor Create(moduleSet : GB_TByteSet); reintroduce;

    function  ModuleActive(modID:byte):boolean;

    procedure SetModule(modID : byte; module : TGBModule);
    function  GetModule(modID : byte): TGBModule;

    function  GetLink(modID : byte): TGBModuleLink;
    procedure SetLink(modID : byte; link: TGBModuleLink);

  End;

implementation
uses
  GBUtil;

constructor TProjection.Create(moduleSet : GB_TByteSet);
var
  modID : byte;
begin
  self.moduleSet := moduleSet;
  for modID := 1 to GB_Max_Modules do
  begin
    modules[modID] := nil;
    moduleLinks[modID] := nil;
  end;
end;

function TProjection.ModuleActive(modID:byte):boolean;
begin
  result := false;
  if modID in moduleSet then
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

function  TProjection.GetLink(modID : byte): TGBModuleLink;
begin
  log('Linking module '+ modIDToStr(modID));
  result := moduleLinks[modID];
end;

procedure TProjection.SetLink(modID : byte; link: TGBModuleLink);
begin
  log('Setting module link'+ modIDToStr(modID));
  if assigned(moduleLinks[modID]) then
  begin
    moduleLinks[modID].Free;
    moduleLinks[modID] := nil; //basically freeAndNil()
  end;
  moduleLinks[modID] := link;
end;

end.
