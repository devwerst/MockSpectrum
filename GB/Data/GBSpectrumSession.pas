unit GBSpectrumSession;

interface

uses
  Contnrs, GBConst, GBData, GBModvar, GBModuleLink;

type
  TGBSession = Class(Tobject)
  public
    GB          : TGBData;
    projections : TObjectList;

    constructor Create;  reintroduce;
    destructor  Destroy; override;
    procedure CreateProjection(modSet : GB_TByteSet);
    procedure DestroyProjection(proj:byte);

    function  GetModuleActive(proj, modID : byte):boolean;

    function  GetModule(proj, modID : byte):TGBModule;
    procedure AppendModule(proj, modID : byte; Module : TGBModule);

    function  GetLink(proj, modID : byte):TGBModuleLink;
    procedure AppendModuleLink(proj, modID : byte; link : TGBModuleLink);
  End;

implementation

uses
  GBUtil,
  System.Classes, System.SysUtils,
  GBProjection;

constructor TGBSession.Create;
begin
  inherited Create;
  GB := TGBData.Create;
  projections := TObjectList.Create;
end;

destructor  TGBSession.Destroy;
begin
  Projections.Free;
  GB.Free;
end;

procedure TGBSession.CreateProjection(modSet : GB_TByteSet);
var
  projection : TProjection;
begin
  log('Creating projection');
  projection := TProjection.Create(modSet);
  projections.add(projection);

  GB.SetFinalProj(GB.GetFinalProj+1);

  log('Projection ' + intToStr(GB.GetFinalProj) + ' Created');
end;

procedure TGBSession.DestroyProjection(proj:byte);
begin
  //not neccessary to implement
end;

function  TGBSession.GetModuleActive(proj, modID : byte):boolean;
begin
  result :=  (projections.items[proj-1] as TProjection).ModuleActive(modID);
end;

function  TGBSession.GetModule(proj, modID : byte):TGBModule;
begin
  result :=  (projections.items[proj-1] as TProjection).GetModule(modID);
end;

procedure TGBSession.AppendModule(proj, modID : byte; Module : TGBModule);
var
  projection : TProjection;
begin
  log('Appending module ' + modIDToStr(modID));
  projection := projections.items[proj-1] as TProjection;
  if projection.ModuleActive(modID) then
    projection.SetModule(modID, module);
  log('Module ' + modIDToStr(modID)+' Appended');
end;


function  TGBSession.GetLink(proj, modID : byte):TGBModuleLink;
begin
  result :=  (projections.items[proj-1] as TProjection).GetLink(modID);
end;

procedure TGBSession.AppendModuleLink(proj, modID : byte; link : TGBModuleLink);
begin
  log('Appending module link' + modIDToStr(modID));
  (projections.items[proj-1] as TProjection).SetLink(modID, link);
  log('Module link' + modIDToStr(modID)+' Appended');
end;


end.
