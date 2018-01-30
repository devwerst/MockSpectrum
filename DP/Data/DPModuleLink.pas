unit DPModuleLink;

interface

uses
  HVInterface, FPInterface, DPData, GBModuleLink;

type
  TDPModuleLink = class(TGBModuleLink, IHV_DP_Inf, IFP_DP_Inf)
  private
    DP : TDPData;
  public
    constructor Create(DP : TDPData); reintroduce;

    //for HV
    function GetPop(sex, t : byte):double;

    //for family planning
    function GetTFR(t:byte):double;
  end;

implementation

{ HVExpose }

constructor TDPModuleLink.Create(DP : TDPData);
begin
  self.DP := DP;
end;

function TDPModuleLink.GetPop(sex, t:byte): double;
begin
  result := DP.GetPop(sex, t);
end;

function TDPModuleLink.GetTFR(t : byte): double;
begin
  result := DP.GetTFR(t);
end;


end.
