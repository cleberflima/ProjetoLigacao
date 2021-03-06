inherited frmConsulta: TfrmConsulta
  Caption = 'Consulta de Movimenta'#231#227'o'
  ClientHeight = 375
  ClientWidth = 639
  OnActivate = FormActivate
  ExplicitWidth = 655
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Width = 639
    Caption = ' Consulta de Movimenta'#231#227'o'
  end
  object grpPesquisa: TGroupBox
    Left = 0
    Top = 33
    Width = 639
    Height = 64
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 1
    ExplicitLeft = -114
    ExplicitWidth = 551
    DesignSize = (
      639
      64)
    object edtPNome: TLabeledEdit
      Left = 11
      Top = 32
      Width = 305
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Ctl3D = False
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      ParentCtl3D = False
      TabOrder = 0
      ExplicitWidth = 217
    end
    object btnFiltrar: TBitBtn
      Left = 560
      Top = 28
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Filtrar'
      TabOrder = 1
      OnClick = btnFiltrarClick
      ExplicitLeft = 472
    end
    object edtPDataIni: TDateTimePicker
      Left = 322
      Top = 32
      Width = 113
      Height = 19
      Anchors = [akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 42681.631615300920000000
      Time = 42681.631615300920000000
      MinDate = 36892.000000000000000000
      TabOrder = 2
      ExplicitLeft = 280
    end
    object edtPDataFim: TDateTimePicker
      Left = 441
      Top = 32
      Width = 113
      Height = 19
      Anchors = [akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 42681.631615300920000000
      Time = 42681.631615300920000000
      MinDate = 36892.000000000000000000
      TabOrder = 3
      ExplicitLeft = 399
    end
  end
  object grdClientes: TDBGrid
    Left = 0
    Top = 97
    Width = 639
    Height = 278
    Align = alClient
    Ctl3D = False
    DataSource = dm.dsConsulta
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'MOV_DETALHE_ID'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_LIG'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO_LIG'
        Title.Alignment = taCenter
        Title.Caption = 'TIPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACAO'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 247
        Visible = True
      end>
  end
end
