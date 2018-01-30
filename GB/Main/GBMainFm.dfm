object GBMainForm: TGBMainForm
  Left = 0
  Top = 0
  Caption = 'GBMainForm'
  ClientHeight = 398
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CreateProjectionBtn: TButton
    Left = 48
    Top = 40
    Width = 201
    Height = 25
    Caption = 'CreateProjectionBtn'
    TabOrder = 0
    OnClick = CreateProjectionBtnClick
  end
  object CalculateBtn: TButton
    Left = 48
    Top = 96
    Width = 201
    Height = 25
    Caption = 'CalculateBtn'
    TabOrder = 1
    OnClick = CalculateBtnClick
  end
end
