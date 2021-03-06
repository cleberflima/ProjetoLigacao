﻿inherited frmCliente: TfrmCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 303
  OnActivate = FormActivate
  OnCreate = FormCreate
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Caption = ' Cadastro de Cliente'
  end
  object grpPesquisa: TGroupBox
    Left = 0
    Top = 33
    Width = 437
    Height = 64
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 1
    DesignSize = (
      437
      64)
    object edtPCodigo: TLabeledEdit
      Left = 11
      Top = 32
      Width = 121
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo'
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtPNome: TLabeledEdit
      Left = 138
      Top = 32
      Width = 87
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtPFone: TLabeledEdit
      Left = 231
      Top = 32
      Width = 121
      Height = 19
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'Telefone'
      ParentCtl3D = False
      TabOrder = 2
    end
    object btnFiltrar: TBitBtn
      Left = 358
      Top = 28
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Filtrar'
      TabOrder = 3
      OnClick = btnFiltrarClick
    end
  end
  object grpDados: TGroupBox
    Left = 0
    Top = 97
    Width = 437
    Height = 64
    Align = alTop
    Caption = 'Dados do Cliente'
    TabOrder = 2
    DesignSize = (
      437
      64)
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 309
      Top = 16
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Telefone'
    end
    object edtNome: TDBEdit
      Left = 11
      Top = 35
      Width = 292
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'NOME'
      DataSource = dm.dsCliente
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtFone: TDBEdit
      Left = 309
      Top = 35
      Width = 121
      Height = 19
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'TELEFONE'
      DataSource = dm.dsCliente
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object grdClientes: TDBGrid
    Left = 0
    Top = 161
    Width = 437
    Height = 105
    Align = alClient
    Ctl3D = False
    DataSource = dm.dsCliente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentCtl3D = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENTE_ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 266
    Width = 437
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object btnMovLigação: TBitBtn
      Left = 11
      Top = 6
      Width = 94
      Height = 25
      Caption = 'Registrar Liga'#231#227'o'
      TabOrder = 0
      OnClick = btnMovLigaçãoClick
    end
  end
end
