program MockSpectrum_OnlyDP;

uses
  Vcl.Forms,
  GBMainFm in 'GB\Main\GBMainFm.pas' {GBMainForm},
  DPData in 'DP\Data\DPData.pas',
  DPProj in 'DP\Calc\DPProj.pas',
  DPMain in 'DP\Main\DPMain.pas',
  GBProj in 'GB\Calc\GBProj.pas',
  GBData in 'GB\Data\GBData.pas',
  GBProjection in 'GB\Data\GBProjection.pas',
  GBSpectrumSession in 'GB\Data\GBSpectrumSession.pas',
  GBConst in 'GB\Data\GBConst.pas',
  GBModuleMessage in 'GB\Main\GBModuleMessage.pas',
  GBModvar in 'GB\Data\GBModvar.pas',
  GBUtil in 'GB\Main\GBUtil.pas',
  DPInterface in 'GB\Links\DPInterface.pas',
  GBModuleLink in 'GB\Data\GBModuleLink.pas',
  DPModuleLink in 'DP\Data\DPModuleLink.pas',
  HVInterface in 'GB\Links\HVInterface.pas',
  FPInterface in 'GB\Links\FPInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGBMainForm, GBMainForm);
  Application.Run;
end.
