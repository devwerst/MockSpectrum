unit HVProj;

interface

uses
  GBSpectrumSession, HVData, HVInterface;

type
  THVProj = Class(TObject)
  private
    proj      : byte;
    GBSession : TGBSession;
    HV        : THVData;
    DP        : IHV_DP_Inf;
  public
    Constructor Create(proj : byte; GBSession : TGBSession);
    procedure Calculate;
  End;

implementation

uses
  GBConst, GBUtil, HVLink;

Constructor THVProj.Create(proj : byte; GBSession : TGBSession);
begin
  log('Creating HVProj');
  HV := GBSession.GetModule(proj, GB_HV) as THVData;
  DP := GBSession.GetLink(proj, GB_DP) as IHV_DP_Inf;
  self.Proj := proj;
  self.GBSession := GBSession;
end;

procedure THVProj.Calculate;
var
  pop : double;
begin
  log('Start HVProj calculation');

  log('HV Calls DP');
  pop := DP.GetPop(0, 1);
  HV.SetPrEP(pop);

  log('finish HVProj calculation');
end;

end.
