unit FPModuleLink;

interface

uses
  DPInterface, FPData, GBModuleLink;

type
  TFPModuleLink = class(TGBModuleLink, IDP_FP_Inf)
  private
    FP : TFPData;
  public
    constructor Create(FP : TFPData); reintroduce;
    function GetTFR(t:byte):double;
  end;

implementation

{ HVExpose }

constructor TFPModuleLink.Create(FP: TFPData);
begin
  self.FP := FP;
end;

function TFPModuleLink.GetTFR(t:byte): double;
begin
  result := FP.GetTFR(t);
end;


end.
