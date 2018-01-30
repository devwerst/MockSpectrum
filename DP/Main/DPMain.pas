unit DPMain;

interface

uses
  GBConst;

procedure DPModMessage(msg : TGBModMessage);

implementation

uses
  DPProj, DPData, DPModuleLink, GBSpectrumSession;

procedure DPModMessage(msg : TGBModMessage);
var
  GBSession : TGBSession;
  DPProject : TDPProj;
  DP        : TDPData;
  link      : TDPModuleLink;
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
      DPProject := TDPProj.Create(msg.Proj, msg.session as TGBSession);
      DPProject.Calculate;
      DPProject.Free;
    end;
    GB_CLOSE:
    begin

    end;
    GB_NEW:
    begin
      DP := TDPData.Create(5);
      GBSession.AppendModule(msg.proj, GB_DP, DP);

      link := TDPModuleLink.Create(DP);
      GBSession.AppendModuleLink(msg.proj, GB_DP, link);
    end;
    GB_EP_Refresh:
    begin

    end;
  end;
end;


end.
