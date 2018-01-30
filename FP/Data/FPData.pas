unit FPData;

interface

uses
  GBModvar;

type
  TFPData = class(TGBModule)
  private
     TFR : array of double;
  public
    constructor Create(yrRange:byte); reintroduce;

    function  GetTFR(t:byte):double;
    procedure SetTFR(t:byte; val:double);

  end;
implementation

{ THVData }

constructor TFPData.Create(yrRange:byte);
begin
  SetLength(TFR, yrRange+1);
end;

function TFPData.GetTFR(t : byte): double;
begin
  result := TFR[t];
end;


procedure TFPData.SetTFR(t : byte; val: double);
begin
  TFR[t] := val;
end;

end.
