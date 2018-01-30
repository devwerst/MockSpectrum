unit GBModuleMessage;

interface

uses
  GBConst;

  procedure GBModMessage(modID : byte; msg : TGBModMessage);

implementation

uses
 {$ifdef hasHV} HVMain,{$EndIf}
 {$ifdef hasFP} FPMain,{$EndIf}
  DPMain;

procedure GBModMessage(modID : byte; msg : TGBModMessage);
begin
  case modID of
    GB_DP : DPModMessage(msg);
    {$ifdef hasHV}GB_HV : HVModMessage(msg);{$EndIf}
    {$ifdef hasFP}GB_FP : FPModMessage(msg);{$EndIf}
  end;
end;

end.
