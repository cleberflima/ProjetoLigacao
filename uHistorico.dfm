inherited frmHistorico: TfrmHistorico
  Caption = 'Cadastro de Hist'#243'rico'
  ClientHeight = 395
  ClientWidth = 583
  OnActivate = FormActivate
  OnCreate = FormCreate
  ExplicitWidth = 599
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Width = 583
    Caption = ' Cadastro de Hist'#243'rico'
    ExplicitWidth = 583
  end
  object grpPesquisa: TGroupBox
    Left = 0
    Top = 33
    Width = 583
    Height = 64
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 1
    DesignSize = (
      583
      64)
    object Label3: TLabel
      Left = 377
      Top = 16
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
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
    object edtPDescricao: TLabeledEdit
      Left = 138
      Top = 32
      Width = 233
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
      ParentCtl3D = False
      TabOrder = 1
    end
    object btnFiltrar: TBitBtn
      Left = 504
      Top = 28
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Filtrar'
      TabOrder = 2
      OnClick = btnFiltrarClick
    end
    object edtPTipo: TComboBox
      Left = 377
      Top = 32
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      Items.Strings = (
        ''
        'A'
        'R')
    end
  end
  object grpDados: TGroupBox
    Left = 0
    Top = 97
    Width = 583
    Height = 64
    Align = alTop
    Caption = 'Hist'#243'rico de liga'#231#227'o'
    TabOrder = 2
    DesignSize = (
      583
      64)
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 455
      Top = 16
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tipo'
    end
    object edtDescricao: TDBEdit
      Left = 11
      Top = 35
      Width = 438
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'DESCRICAO'
      DataSource = dm.dsHistorico
      ParentCtl3D = False
      TabOrder = 0
    end
    object DBComboBox1: TDBComboBox
      Left = 455
      Top = 35
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'TIPO_LIG'
      DataSource = dm.dsHistorico
      Items.Strings = (
        'A'
        'R')
      TabOrder = 1
    end
  end
  object grdHistorico: TDBGrid
    Left = 0
    Top = 161
    Width = 583
    Height = 234
    Align = alClient
    Ctl3D = False
    DataSource = dm.dsHistorico
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
        FieldName = 'HISTORICO'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_LIG'
        Title.Alignment = taCenter
        Title.Caption = 'TIPO'
        Width = 100
        Visible = True
      end>
  end
end
