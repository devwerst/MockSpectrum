unit FPProj;

interface

uses
  GBSpectrumSession, FPData, FPInterface;

type
  TFPProj = Class(TObject)
  private
    proj      : byte;
    GBSession : TGBSession;
    FP        : TFPData;
    DP        : IFP_DP_Inf;
  public
    Constructor Create(proj : byte; GBSession : TGBSession);
    procedure Calculate;
  End;

implementation

uses
  GBConst, GBUtil;

Constructor TFPProj.Create(proj : byte; GBSession : TGBSession);
begin
  log('Creating FPProj');
  FP := GBSession.GetModule(proj, GB_FP) as TFPData;
  DP := GBSession.GetLink(proj, GB_DP) as IFP_DP_Inf;
  self.Proj := proj;
  self.GBSession := GBSession;
end;

procedure TFPProj.Calculate;
var
  tfr : double;
begin
  log('Start FPProj calculation');

  log('FP Calls DP');
  tfr := DP.GetTFR(1);
  FP.SetTFR(1, tfr/2);

  log('finish FPProj calculation');
end;

end.
