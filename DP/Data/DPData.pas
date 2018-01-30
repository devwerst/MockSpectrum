unit DPData;

interface

uses
  GBModvar;

type
  TDPData = class(TGBModule)
  private
    POP : array of array of double;
    TFR : array of double;
    LE  : array of double;
    SingleAgeOption : byte;
  public

    constructor Create(yrRange:integer); reintroduce;
    destructor  Destroy; override;

    function  GetPop(Sex, t : byte):double;
    procedure SetPop(Sex, t : byte; val : double);

    function  GetTFR(t : byte):double;
    procedure SetTFR(t : byte; val : double);

    function  GetLE(t : byte):double;
    procedure SetLE(t : byte; val : double);

    function  GetSingleAgeOption : byte;
    procedure SetSingleAgeOption(val : byte);
  end;

implementation

uses
  GBUtil;
{ TDPData }

constructor TDPData.Create(yrRange: integer);
begin
  setLength(POP, 3, yrRange+1);
  setLength(TFR, yrRange+1);
  setLength(LE, yrRange+1);
  singleAgeOption := 1;
  Log('Creating DP module');
end;

destructor TDPData.Destroy;
begin
  finalize(POP);
  finalize(TFR);
  finalize(LE);
  inherited;
end;

function TDPData.GetLE(t: byte): double;
begin
  result := LE[t];
end;

function TDPData.GetPop(Sex, t: byte): double;
begin
  result := Pop[Sex, t];
end;

function TDPData.GetSingleAgeOption: byte;
begin
  result := SingleAgeOption;
end;

function TDPData.GetTFR(t: byte): double;
begin
  result := TFR[t];
end;

procedure TDPData.SetTFR(t: byte; val: double);
begin
  TFR[t] := val;
end;

procedure TDPData.SetLE(t: byte; val: double);
begin
  LE[t] := val;
end;

procedure TDPData.SetPop(Sex, t: byte; val: double);
begin
  Pop[Sex, t] := val;
end;

procedure TDPData.SetSingleAgeOption(val: byte);
begin
  SingleAgeOption := val;
end;


end.
