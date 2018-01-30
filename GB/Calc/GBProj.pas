unit GBProj;

interface

uses
  GBSpectrumSession;

procedure GB_Calculate(proj : byte; GBSession : TGBSession);

implementation

uses
  GBConst, GBModuleMessage;

procedure GB_Calculate(proj : byte; GBSession : TGBSession);
var
  msg : TGBModMessage;
  modID,
  firstProj,
  finalProj : byte;
begin
  if proj <> 0 then
  begin
    firstProj := proj;
    finalProj := proj;
  end
  else
  begin
    firstProj := 1;
    finalProj := GBSession.GB.GetFinalProj;

  end;


  msg.msgID   := GB_CALC;
  msg.Session := GBSession;

  for proj := firstProj to finalProj do
    for modID := 1 to  GB_Max_Modules do
      if GBSession.GetModuleActive(proj, modID) then
      begin
        msg.proj := proj;
        GBModMessage(modID, msg);
      end;
end;

end.
