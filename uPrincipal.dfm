object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Liga'#231#245'es'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 447
    Height = 25
    ButtonHeight = 25
    Caption = 'ToolBar1'
    Ctl3D = False
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 25
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 183
    Width = 447
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 40
    object Sistema1: TMenuItem
      Caption = '&Sistema '
      object CadastrodeCliente1: TMenuItem
        Caption = 'Cadastro de &Clientes'
        OnClick = CadastrodeCliente1Click
      end
      object CadastrodeHistrico1: TMenuItem
        Caption = 'Cadastro de &Hist'#243'rico'
      end
      object MovimentodeLigao1: TMenuItem
        Caption = 'Movimento de &Liga'#231#227'o'
      end
      object ConsultadeLigao1: TMenuItem
        Caption = 'C&onsulta de Liga'#231#227'o'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sai&r'
        ShortCut = 32883
        OnClick = Sair1Click
      end
    end
  end
end
