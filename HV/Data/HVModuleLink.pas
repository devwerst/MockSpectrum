unit HVModuleLink;

interface

uses
  DPInterface, HVData, GBModuleLink;

type
  THVModuleLink = class(TGBModuleLink, IDP_HV_Inf)
  private
    HV : THVData;
  public
    constructor Create(HV : THVData); reintroduce;
    function GetPrEP:double;
    function GetRisk:double;
  end;

implementation

{ HVExpose }

constructor THVModuleLink.Create(HV: THVData);
begin
  self.HV := HV;
end;

function THVModuleLink.GetPrEP: double;
begin
  result := HV.GetPrEP;
end;

function THVModuleLink.GetRisk: double;
begin
  result := HV.GetRisk;
end;

end.
