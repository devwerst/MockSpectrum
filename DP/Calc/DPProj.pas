unit DPProj;

interface

uses
  GBSpectrumSession, DPData, DPInterface;

type
  TDPProj = Class(TObject)
  private
    proj      : byte;
    GBSession : TGBSession;
    DP        : TDPData;
    HV        : IDP_HV_Inf;
  public
    Constructor Create(proj : byte; GBSession : TGBSession);
    procedure Calculate;
  End;

implementation

uses
  GBConst, GBUtil, DPLink;

Constructor TDPProj.Create(proj : byte; GBSession : TGBSession);
begin
  log('Creating DPProj');
  DP := GBSession.GetModule(proj, GB_DP) as TDPData;
  HV := GBSession.GetLink(proj, GB_HV) as IDP_HV_Inf;
  self.Proj := proj;
  self.GBSession := GBSession;
end;

procedure TDPProj.Calculate;
begin
  log('Start DPProj calculation');

  DP.SetPOP(0, 1, 1000);
  DP.SetPOP(1, 1, 500);
  DP.SetPOP(2, 1, 500);

  DP.SetLE(1, 60);

  log('DP Calls HV');
  if assigned(HV) then //same as module active
    DP.SetTFR(1, HV.GetPrEP);

  log('finish DPProj calculation');
end;

end.
