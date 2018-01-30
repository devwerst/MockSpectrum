unit GBModuleMessage;

interface

uses
  GBConst;

  procedure GBModMessage(modID : byte; msg : TGBModMessage);

implementation

uses
  DPMain, HVMain;

procedure GBModMessage(modID : byte; msg : TGBModMessage);
begin
  case modID of
    GB_DP : DPModMessage(msg);
    GB_HV : HVModMessage(msg);
  end;
end;

end.
