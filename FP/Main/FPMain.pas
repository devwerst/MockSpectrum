unit FPMain;

interface

uses
  GBConst;

procedure FPModMessage(msg : TGBModMessage);

implementation

uses
  FPProj, FPData, GBSpectrumSession, FPModuleLink;

procedure FPModMessage(msg : TGBModMessage);
var
  GBSession : TGBSession;
  FPProject : TFPProj;
  FP        : TFPData;
  Link      : TFPModuleLink;
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
      FPProject := TFPProj.Create(msg.Proj, msg.session as TGBSession);
      FPProject.Calculate;
      FPProject.Free;
    end;
    GB_CLOSE:
    begin

    end;
    GB_NEW:
    begin
      FP := TFPData.Create(5);
      GBSession.AppendModule(msg.proj, GB_FP, FP);

      link := TFPModuleLink.Create(FP);
      GBSession.AppendModuleLink(msg.proj, GB_FP, link);
    end;
    GB_EP_Refresh:
    begin

    end;
  end;

end;


end.
