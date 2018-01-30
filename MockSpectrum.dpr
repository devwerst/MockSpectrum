program MockSpectrum;

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
  DPLink in 'DP\Main\DPLink.pas',
  HVData in 'HV\Data\HVData.pas',
  HVProj in 'HV\Calc\HVProj.pas',
  HVMain in 'HV\Main\HVMain.pas',
  HVLink in 'HV\Main\HVLink.pas',
  GBConst in 'GB\Data\GBConst.pas',
  GBModuleMessage in 'GB\Main\GBModuleMessage.pas',
  GBModvar in 'GB\Data\GBModvar.pas',
  GBUtil in 'GB\Main\GBUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGBMainForm, GBMainForm);
  Application.Run;
end.
