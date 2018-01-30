unit DPProj;

interface

uses
  GBSpectrumSession, DPData;

type
  TDPProj = Class(TObject)
  private
    proj      : byte;
    GBSession : TGBSession;
    DP        : TDPData;
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
  DP.SetTFR(1, DP_GetHVPrEP(proj, GBSession));

  log('finish DPProj calculation');
end;

end.
