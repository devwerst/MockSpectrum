unit HVMain;

interface

uses
  GBConst;

procedure HVModMessage(msg : TGBModMessage);

implementation

uses
  HVProj, HVData, GBSpectrumSession;

procedure HVModMessage(msg : TGBModMessage);
var
  GBSession : TGBSession;
  HVProject : THVProj;
  HV        : THVData;
begin
  GBSession := msg.Session as TGBSession;
  case msg.msgID of
    GB_CREATE:
    begin
      //Setting up globals
    end;
    GB_DESTROY:
    begin
      //destroying globals
    end;
    GB_CALC:
    begin
      HVProject := THVProj.Create(msg.Proj, msg.session as TGBSession);
      HVProject.Calculate;
      HVProject.Free;
    end;
    GB_CLOSE:
    begin

    end;
    GB_NEW:
    begin
      HV := THVData.Create;
      GBSession.AppendModule(msg.proj, GB_HV, HV);
    end;
    GB_EP_Refresh:
    begin

    end;
  end;

end;


end.
