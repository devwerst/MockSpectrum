unit GBData;

interface

uses
  GBConst;

type
  TGBData = Class(TObject)
  public
    projCount,
    language   : byte;
    country    : array [1..GB_Max_Proj] of integer;
    firstYear  : array [1..GB_Max_Proj] of integer;
    finalYear  : array [1..GB_Max_Proj] of integer;
    constructor Create; reintroduce;
    function  GetFinalProj:byte;
    procedure SetFinalProj(projCount:byte);
  End;

implementation

constructor TGBData.Create;
begin
  projCount := 0;
end;

function  TGBData.GetFinalProj:byte;
begin
  result := projCount;
end;

procedure TGBData.SetFinalProj(projCount:byte);
begin
  self.projCount := projCount;
end;

end.
