inherited frmMovDetalhe: TfrmMovDetalhe
  Caption = 'Movimento de Liga'#231#227'o'
  ClientHeight = 341
  ClientWidth = 551
  OnActivate = FormActivate
  OnCreate = FormCreate
  ExplicitWidth = 567
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Width = 551
    Caption = ' Movimento de Liga'#231#227'o'
    ExplicitWidth = 551
  end
  object grpDados: TGroupBox
    Left = 0
    Top = 33
    Width = 551
    Height = 64
    Align = alTop
    Caption = 'Dados do Cliente'
    TabOrder = 1
    ExplicitTop = 97
    DesignSize = (
      551
      64)
    object Label1: TLabel
      Left = 138
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 423
      Top = 16
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Telefone'
      ExplicitLeft = 309
    end
    object Label5: TLabel
      Left = 11
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Hor'#225'rio'
    end
    object edtNome: TDBEdit
      Left = 138
      Top = 35
      Width = 279
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'NOME'
      DataSource = dm.dsCliente
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtFone: TDBEdit
      Left = 423
      Top = 35
      Width = 121
      Height = 19
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'TELEFONE'
      DataSource = dm.dsCliente
      Enabled = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtDataHora: TEdit
      Left = 11
      Top = 35
      Width = 121
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'EDIT1'
    end
  end
  object grdClientes: TDBGrid
    Left = 0
    Top = 161
    Width = 551
    Height = 180
    Align = alClient
    Ctl3D = False
    DataSource = dm.dsMovDet
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentCtl3D = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MOV_DETALHE_ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HISTORICO'
        Title.Alignment = taCenter
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACAO'
        Title.Alignment = taCenter
        Width = 247
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 97
    Width = 551
    Height = 64
    Align = alTop
    Caption = 'Detalhe da Movimenta'#231#227'o'
    TabOrder = 3
    ExplicitTop = 161
    DesignSize = (
      551
      64)
    object Label3: TLabel
      Left = 11
      Top = 18
      Width = 41
      Height = 13
      Caption = 'Hist'#243'rico'
    end
    object Label4: TLabel
      Left = 232
      Top = 18
      Width = 58
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Observa'#231#227'o'
    end
    object edtObservacao: TDBEdit
      Left = 232
      Top = 37
      Width = 312
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'OBSERVACAO'
      DataSource = dm.dsMovDet
      TabOrder = 0
    end
    object edtHistorico: TDBLookupComboBox
      Left = 11
      Top = 37
      Width = 215
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'HISTORICO_ID'
      DataSource = dm.dsMovDet
      KeyField = 'HISTORICO'
      ListField = 'TIPO_LIG;HISTORICO;DESCRICAO'
      ListFieldIndex = 2
      ListSource = dm.dsHistorico
      TabOrder = 1
    end
  end
end
