unit HVLink;

interface

uses
  GBSpectrumSession;

function HV_GetDPPop(proj: byte; GBSession : TGBSession; sex, t : byte):double;

implementation

uses
  DPData, GBConst;

function HV_GetDPPop(proj: byte; GBSession : TGBSession; sex, t : byte):double;
begin
  result := (GBSession.GetModule(proj, GB_DP) as TDPData).GetPop(sex, t);
end;


end.
