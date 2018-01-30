unit HVData;

interface

uses
  GBModvar;

type
  THVData = class(TGBModule)
  private
     PrEPVariable : double;
     RiskVariable : double;
  public
    constructor Create; reintroduce;

    function  GetPrEP:double;
    procedure SetPrEP(val:double);

    function  GetRisk:double;
    procedure SetRisk(val:double);

  end;
implementation

{ THVData }

constructor THVData.Create;
begin
  PrEPVariable := 0;
  RiskVariable := 0;
end;

function THVData.GetPrEP: double;
begin
  result := PrEPVariable;
end;


procedure THVData.SetPrEP(val: double);
begin
  PrEPVariable := val;
end;

function THVData.GetRisk: double;
begin
  result := RiskVariable;
end;

procedure THVData.SetRisk(val: double);
begin
  RiskVariable := val;
end;

end.
