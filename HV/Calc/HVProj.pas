unit HVProj;

interface

uses
  GBSpectrumSession, HVData;

type
  THVProj = Class(TObject)
  private
    proj      : byte;
    GBSession : TGBSession;
    HV        : THVData;
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
  self.Proj := proj;
  self.GBSession := GBSession;
end;

procedure THVProj.Calculate;
var
  pop : double;
begin
  log('Start HVProj calculation');

  log('HV Calls DP');
  pop := HV_GetDPPop(proj, GBSession, 0, 1);
  HV.SetPrEP(pop);

  log('finish HVProj calculation');
end;

end.
