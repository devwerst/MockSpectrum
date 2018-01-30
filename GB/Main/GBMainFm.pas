unit GBMainFm;

interface

uses
  GBSpectrumSession,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TGBMainForm = class(TForm)
    CreateProjectionBtn: TButton;
    CalculateBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CalculateBtnClick(Sender: TObject);
    procedure CreateProjectionBtnClick(Sender: TObject);
  private
    MySession : TGBSession;
  public
    { Public declarations }
  end;

var
  GBMainForm: TGBMainForm;

implementation

{$R *.dfm}
uses
  GBProj, GBConst, GBModuleMessage;

procedure TGBMainForm.CalculateBtnClick(Sender: TObject);
begin
  GB_Calculate(0, MySession);
end;

procedure TGBMainForm.CreateProjectionBtnClick(Sender: TObject);
var
  modID  : byte;
  modSet : GB_TByteSet;
  msg    : TGBModMessage;
begin

  modSet := [GB_DP, GB_HV];
  MySession.CreateProjection(modSet);

  msg.MsgID := GB_NEW;
  msg.Session := MySession;
  msg.Proj := MySession.GB.GetFinalProj;
  for modID in modSet do
  begin
    GBModMessage(modID, msg);
  end;
end;

procedure TGBMainForm.FormCreate(Sender: TObject);
begin
  MySession := TGBSession.Create;
end;

procedure TGBMainForm.FormDestroy(Sender: TObject);
begin
  MySession.Free;
end;

end.
