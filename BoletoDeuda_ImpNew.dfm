object Intima_ImpNew: TIntima_ImpNew
  Left = 259
  Top = 117
  Caption = 'Impresion de Boletos de Deuda'
  ClientHeight = 493
  ClientWidth = 868
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 868
    Height = 33
    ButtonHeight = 25
    Caption = 'ToolBar1'
    Color = clGradientInactiveCaption
    EdgeBorders = [ebLeft, ebTop, ebBottom]
    EdgeInner = esLowered
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      866
      29)
    object Label7: TLabel
      Left = 0
      Top = 0
      Width = 272
      Height = 25
      Caption = 'Impresi'#243'n de Boletos de Deuda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ToolButton1: TToolButton
      Left = 272
      Top = 0
      Width = 403
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object imprime: TJvBitBtn
      Left = 675
      Top = 0
      Width = 128
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'F4 - Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = imprimeClick
    end
    object ToolButton3: TToolButton
      Left = 803
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object SALE: TJvBitBtn
      Left = 811
      Top = 0
      Width = 94
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = SALEClick
    end
  end
  object Barra1: TStatusBar
    Left = 0
    Top = 474
    Width = 868
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object PC1: TRzPageControl
    Left = 0
    Top = 33
    Width = 868
    Height = 441
    Hint = ''
    ActivePage = TabSheet3
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = ImageList2
    ParentFont = False
    TabIndex = 0
    TabOrder = 2
    FixedDimension = 22
    object TabSheet3: TRzTabSheet
      ImageIndex = 0
      Caption = 'Lotes Existentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object JvDBGrid3: TJvDBGrid
        Left = 0
        Top = 0
        Width = 864
        Height = 415
        Align = alClient
        DataSource = DataSource2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -12
        TitleFont.Name = 'Arial Narrow'
        TitleFont.Style = [fsBold]
        OnCellClick = JvDBGrid3CellClick
        AlternateRowColor = clSkyBlue
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 20
      end
    end
    object TabSheet1: TRzTabSheet
      ImageIndex = 2
      Caption = 'Impresion de Boletas de Deuda'
      object JvGroupBox2: TJvGroupBox
        Left = 0
        Top = 383
        Width = 864
        Height = 32
        Align = alBottom
        Caption = ''
        TabOrder = 0
        object Label28: TLabel
          Left = 40
          Top = 8
          Width = 156
          Height = 16
          Caption = 'Intimaciones Impresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape2: TShape
          Left = 18
          Top = 10
          Width = 15
          Height = 13
          Brush.Color = clLime
          Shape = stCircle
        end
        object Shape3: TShape
          Left = 228
          Top = 10
          Width = 15
          Height = 13
          Shape = stCircle
        end
        object Label29: TLabel
          Left = 253
          Top = 8
          Width = 182
          Height = 16
          Caption = 'Intimaciones NO Impresas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object grilla2: TJvStringGrid
        Left = 0
        Top = 33
        Width = 864
        Height = 350
        Align = alClient
        ColCount = 18
        DefaultColWidth = 55
        DefaultRowHeight = 20
        FixedColor = clWhite
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        GradientEndColor = clWhite
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 1
        OnClick = grilla2Click
        OnDrawCell = grilla2DrawCell
        Alignment = taLeftJustify
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clNavy
        FixedFont.Height = -12
        FixedFont.Name = 'MS Sans Serif'
        FixedFont.Style = [fsBold]
        ColWidths = (
          65
          60
          82
          96
          305
          129
          70
          70
          70
          70
          70
          70
          70
          0
          0
          55
          55
          55)
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 864
        Height = 33
        Align = alTop
        TabOrder = 2
        object CheckBox1: TCheckBox
          Left = 11
          Top = 10
          Width = 209
          Height = 17
          Caption = 'Imprimir por Duplicado'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TRzTabSheet
      ImageIndex = 1
      Caption = 'Objetos Relacionados'
      object grilla5: TStringGrid
        Left = 0
        Top = 0
        Width = 864
        Height = 415
        Align = alClient
        DefaultColWidth = 100
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentFont = False
        TabOrder = 0
        ColWidths = (
          234
          83
          85
          72
          448)
      end
    end
  end
  object FormularioEmb: TJvEmbeddedFormLink
    Left = 784
    Top = 114
  end
  object frxReport2: TfrxReport
    Version = '4.15.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42506.824095150500000000
    ReportOptions.LastChange = 42866.409777569450000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 640
    Top = 120
    Datasets = <
      item
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'NomTitular'
        Value = #39'BRA'#209'A JUAN ANGEL'#39
      end
      item
        Name = 'CuimTitular'
        Value = #39'20-24525019-4'#39
      end
      item
        Name = 'NroUsuario'
        Value = '120'
      end
      item
        Name = 'FechaActual'
        Value = #39'01/01/2016'#39
      end
      item
        Name = 'Total'
        Value = '0'
      end
      item
        Name = 'NroImp'
        Value = #39#39
      end
      item
        Name = 'NroLote'
        Value = #39#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintOnPreviousPage = True
      ResetPageNumbers = True
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 854.173780000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 559.370440000000000000
          Top = 1.220470000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object Memo67: TfrxMemoView
          Left = 11.338590000000000000
          Top = 5.000000000000000000
          Width = 100.157499840000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Usu/Fecha Impresion:')
          ParentFont = False
        end
        object NroUsuario: TfrxMemoView
          Left = 119.165430000000000000
          Top = 5.000000000000000000
          Width = 60.472480000000000000
          Height = 13.228346460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[NroUsuario]')
          ParentFont = False
          VAlign = vaCenter
        end
        object TotalPages: TfrxMemoView
          Left = 638.740570000000000000
          Top = 1.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[TotalPages]')
        end
        object Memo34: TfrxMemoView
          Left = 182.196970000000000000
          Top = 4.779530000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 15.118120000000000000
        Top = 408.189240000000000000
        Width = 718.110700000000000000
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape6: TfrxShapeView
          Left = 1.000000000000000000
          Top = 0.897650000000000000
          Width = 716.220472440000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = clGradientInactiveCaption
        end
        object Memo69: TfrxMemoView
          Left = 162.260050000000000000
          Top = 1.897650000000000000
          Width = 45.354360000000000000
          Height = 11.338563150000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Capital')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 157.819110000000000000
          Top = 0.897650000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 335.086443310000000000
          Top = 0.897650000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 262.307130550000000000
          Top = 0.897650000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo74: TfrxMemoView
          Left = 342.716760000000000000
          Top = 1.897650000000000000
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Periodos Deudas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.897650000000000000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Rubro  / Objetos')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 264.866420000000000000
          Top = 1.897650000000000000
          Width = 64.252010000000000000
          Height = 11.338563150000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Importe Deuda')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 211.976500000000000000
          Top = 1.000000000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo13: TfrxMemoView
          Left = 216.976500000000000000
          Top = 2.000000000000000000
          Width = 41.574830000000000000
          Height = 11.338563150000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Interes')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DetailData2: TfrxDetailData
        Height = 30.236240000000000000
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape7: TfrxShapeView
          Left = 1.000000000000000000
          Width = 716.220472440000000000
          Height = 30.236240000000000000
          ShowHint = False
        end
        object Line12: TfrxLineView
          Left = 262.543370550000000000
          Height = 30.236240000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line34: TfrxLineView
          Left = 158.259862050000000000
          Height = 30.236240000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line44: TfrxLineView
          Left = 335.086443310000000000
          Height = 30.236240000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object frxDBDataSet1Rubro: TfrxMemoView
          Top = 2.779530000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Rubro'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."Rubro"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataSet1Capital: TfrxMemoView
          Left = 161.299320000000000000
          Top = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Capital'
          DataSetName = 'frxDBDataset2'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."Capital"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataSet1ImporteDeiuda: TfrxMemoView
          Left = 263.905690000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ImporteDeuda'
          DataSetName = 'frxDBDataset2'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."ImporteDeuda"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataSet1PeriodoDeida: TfrxMemoView
          Left = 338.173470000000000000
          Width = 377.953000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'PeriodoDeuda'
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."PeriodoDeuda"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 212.756030000000000000
          Top = 0.102350000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object frxDBDataSet1Interes: TfrxMemoView
          Left = 214.976500000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Interes'
          DataSetName = 'frxDBDataset2'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."Interes"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        Height = 3.779530000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
      end
      object Footer2: TfrxFooter
        Height = 295.023810000000000000
        Top = 498.897960000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 2.779530000000000000
          Top = 47.149660000000000000
          Width = 714.331170000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Se le reitera que de persistir el imcumplimiento esta AGENCIA, p' +
              'roseguir'#225' con las acciones tendientes a lograr su efectivo cobro' +
              ' por la v'#237'a JUDICIAL, libr'#225'ndose la correspondiente BOLETA DE DE' +
              'UDA, todo de acuerdo a lo establecido por le Art. 185 de la Orde' +
              'nanza N'#186' 1590/86, sus modificatorias y complementarias.')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 2.779530000000000000
          Top = 91.960730000000000000
          Width = 536.693260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Se deja constancia qua la Intimaci'#243'n que obedece a la presente, ' +
              'se encuentra incluida en Lote N'#186':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 2.779530000000000000
          Top = 111.181200000000000000
          Width = 714.331170000000000000
          Height = 71.811070000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Para mayor informaci'#243'n deber'#225' dirigirse a la Agencia de Recaudac' +
              'i'#243'n Municipal, sito en la calle Fotheringham N'#186' 1364 de esta ciu' +
              'dad en el horario administrativo.'
            
              'En caso de haber regularizado su situaci'#243'n antes de la recepci'#243'n' +
              ' de esta carta, le rogamos desestime la misma.'
            ''
            'Muchas gracias por su atenci'#243'n.')
          ParentFont = False
        end
        object Logo2: TfrxPictureView
          Left = 517.795610000000000000
          Top = 190.653680000000000000
          Width = 177.637910000000000000
          Height = 75.590600000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo12: TfrxMemoView
          Left = 506.457020000000000000
          Top = 262.464750000000000000
          Width = 205.984339840000000000
          Height = 24.566936460000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C.P. N. MOISES SEBASTIAN ROJAS'
            '  DIR. AGENCIA DE RECAUDACION')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 7.559060000000000000
          Top = 194.196970000000000000
          Width = 168.188622440000000000
          Height = 90.708720000000000000
          ShowHint = False
        end
        object Shape4: TfrxShapeView
          Left = 11.338590000000000000
          Top = 200.756030000000000000
          Width = 20.786952440000000000
          Height = 15.118120000000000000
          ShowHint = False
        end
        object Shape9: TfrxShapeView
          Left = 11.338590000000000000
          Top = 221.653680000000000000
          Width = 20.786952440000000000
          Height = 15.118120000000000000
          ShowHint = False
        end
        object Shape10: TfrxShapeView
          Left = 11.338590000000000000
          Top = 241.551330000000000000
          Width = 20.786952440000000000
          Height = 15.118120000000000000
          ShowHint = False
        end
        object Shape11: TfrxShapeView
          Left = 11.338590000000000000
          Top = 261.448980000000000000
          Width = 20.786952440000000000
          Height = 15.118120000000000000
          ShowHint = False
        end
        object Memo1: TfrxMemoView
          Left = 34.015770000000000000
          Top = 200.756030000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Entregado')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 34.015770000000000000
          Top = 221.653680000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Bajo Puerta')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 34.015770000000000000
          Top = 241.551330000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Rehusado')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 34.795300000000000000
          Top = 261.448980000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Direcci'#243'n Incorrecta')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 192.756030000000000000
          Top = 207.874150000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Firma')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 192.756030000000000000
          Top = 234.551330000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Aclaraci'#243'n')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 192.756030000000000000
          Top = 256.228510000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Fecha:')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 249.448980000000000000
          Top = 219.212740000000000000
          Width = 170.078850000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 249.448980000000000000
          Top = 245.669450000000000000
          Width = 241.889920000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 249.448980000000000000
          Top = 268.346630000000000000
          Width = 105.826840000000000000
          ShowHint = False
          Diagonal = True
        end
        object NroLote: TfrxMemoView
          Left = 540.472790000000000000
          Top = 91.708720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[NroLote]')
        end
        object Memo25: TfrxMemoView
          Left = 2.779530000000000000
          Top = 1.236240000000000000
          Width = 714.331170000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Para regularizar su situaci'#243'n y a fin de evitar el inicio del re' +
              'clamo judicial de la obligaciones adeudadas, deber'#225' efectuar el/' +
              'los pago/s omitido/s m'#225's los intereses resarcitorios correpondie' +
              'ntes y/o presentar las declaraciones juradas faltantes y comunic' +
              'ar la novedad; sin perjuicio de las multas que pudieran correspo' +
              'nder por la aplicaci'#243'n de las Ordenanzas vigentes. ')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 192.756030000000000000
          Top = 277.905690000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Caracter:')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 249.448980000000000000
          Top = 290.023810000000000000
          Width = 170.078850000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 301.582870000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Left = 1.000000000000000000
          Top = 78.929190000000000000
          Width = 716.220472440000000000
          Height = 105.826840000000000000
          ShowHint = False
        end
        object Shape3: TfrxShapeView
          Left = 1.000000000000000000
          Width = 716.220472440000000000
          Height = 79.370130000000000000
          ShowHint = False
        end
        object Logo1: TfrxPictureView
          Left = 4.779530000000000000
          Top = 3.779530000000000000
          Width = 71.811070000000000000
          Height = 75.590600000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          Left = 151.315090000000000000
          Top = 3.779530000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Municipalidad de la Ciudad de Formosa')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 155.094620000000000000
          Top = 22.677180000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Agencia de Recaudaci'#243'n')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 99.165430000000000000
          Top = 54.472480000000000000
          Width = 366.614410000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'C E D U L A   D E   I N T I M A C I O N')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.338590000000000000
          Top = 186.315090000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'ASUNTO: Notificaci'#243'n de Deuda a la fecha')
          ParentFont = False
        end
        object Shape8: TfrxShapeView
          Left = 1.000000000000000000
          Top = 283.362400000000000000
          Width = 716.220472440000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clGradientInactiveCaption
        end
        object Memo11: TfrxMemoView
          Left = 28.220470000000000000
          Top = 282.362400000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'ANEXO DE LIQUIDACION DE DEUDA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape5: TfrxShapeView
          Left = 483.779840000000000000
          Top = 3.779530000000000000
          Width = 228.661102440000000000
          Height = 71.811070000000000000
          ShowHint = False
        end
        object Memo14: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'INTIMACION N'#186':')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 491.338900000000000000
          Top = 49.133890000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fecha Calculo:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 7.559060000000000000
          Top = 82.267780000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DATOS DEL CONTRIBUYENTE')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 7.559060000000000000
          Top = 102.724490000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Se'#241'or/a/es:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 511.457020000000000000
          Top = 102.504020000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DNI N'#186':')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 7.559060000000000000
          Top = 122.401670000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Barrio:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 303.346630000000000000
          Top = 122.401670000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Calle:')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 622.063390000000000000
          Top = 122.401670000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Altura:')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 7.559060000000000000
          Top = 144.078850000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Depto:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 154.960730000000000000
          Top = 143.078850000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Mza.:')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 619.842920000000000000
          Top = 143.078850000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Torre:')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 389.291590000000000000
          Top = 143.078850000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Casa:')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 7.118120000000000000
          Top = 205.771800000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'De nuestra mayor consideraci'#243'n:')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 5.559060000000000000
          Top = 223.330860000000000000
          Width = 706.772110000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              '                                     Nos estamos comunicando de ' +
              'la AGENCIA DE RECAUDACION DE LA MUNICIPALIDAD DE FORMOSA, para i' +
              'nformarle que de acuerdo a los registros obrantes en nuestra bas' +
              'e de datos, a la fecha de corte citada en el asunto.'
            
              'Ud. registra uno o m'#225's saldos impagos respecto de las obligacion' +
              'es tributarias incluidas en el ANEXO de liquidaci'#243'n de deuda e i' +
              'ntereses que se detalla a continucaci'#243'n:')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 7.559060000000000000
          Top = 162.519790000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Domiclio:')
          ParentFont = False
        end
        object ElqueSuscribe: TfrxMemoView
          Left = 80.149660000000000000
          Top = 102.826840000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ElqueSuscribe]')
          ParentFont = False
        end
        object NroDni: TfrxMemoView
          Left = 562.149970000000000000
          Top = 102.826840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[NroDni]')
        end
        object DomTitular: TfrxMemoView
          Left = 74.149660000000000000
          Top = 161.740260000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[DomTitular]')
        end
        object Barrio: TfrxMemoView
          Left = 52.913420000000000000
          Top = 122.724490000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Barrio]')
          ParentFont = False
        end
        object Altura: TfrxMemoView
          Left = 663.197280000000000000
          Top = 122.944960000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Altura]')
          ParentFont = False
        end
        object Calle: TfrxMemoView
          Left = 341.937230000000000000
          Top = 122.724490000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Calle]')
          ParentFont = False
        end
        object Dpto: TfrxMemoView
          Left = 52.913420000000000000
          Top = 143.622140000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dpto]')
          ParentFont = False
        end
        object Mza: TfrxMemoView
          Left = 188.976500000000000000
          Top = 143.622140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Mza]')
          ParentFont = False
        end
        object Casa: TfrxMemoView
          Left = 430.866420000000000000
          Top = 142.622140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Casa]')
          ParentFont = False
        end
        object Torre: TfrxMemoView
          Left = 661.417750000000000000
          Top = 142.622140000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Torre]')
          ParentFont = False
        end
        object NroImp: TfrxMemoView
          Left = 600.945270000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[NroImp]')
        end
        object FechaActual: TfrxMemoView
          Left = 600.945270000000000000
          Top = 49.133890000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[FechaActual]')
        end
        object FechaActual1: TfrxMemoView
          Left = 249.448980000000000000
          Top = 186.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '[FechaActual]')
        end
      end
    end
  end
  object ImageList2: TImageList
    Left = 713
    Top = 117
    Bitmap = {
      494C010104000800C80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002020
      2000404040004040400020202000000000000000000000000000000000004040
      4000404040004040400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005050
      5000505050005050500090909000000000000000000000000000202020005050
      5000505050008080800040404000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006060
      60006F6F6F00000000009090900000000000000000000000000000000000DFDF
      DF00000000005050500040404000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006060
      60006F6F6F00000000009090900040404000404040004040400000000000DFDF
      DF00000000005050500060606000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000000000808080008080800000FFFF0000FFFF0000FFFF00808080008080
      80000000000000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020003030
      3000303030000000000050505000505050008080800050505000000000006F6F
      6F000000000050505000A0A0A000606060000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000030303000303030000000
      00006F6F6F00000000000000000000000000202020006F6F6F00000000000000
      0000000000003030300080808000909090000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000003F3F009FDFDF006F6F6F000000
      0000606060000000000000000000C0C0C0000000000060606000000000000000
      000000000000306F6F0050505000909090000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000007B7B0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000003F7F7F007FFFFF007FFFFF003F3F
      3F00303030000000000000000000606060000000000030303000000000000000
      0000000000007FBFBF0050505000909090000000000000000000000000000000
      0000FFFFFF0000FFFF000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000007B7B0000000000FFFFFF00000000000000
      0000000000000000000000000000000000003F7F7F007FFFFF007FFFFF007FFF
      FF003F7F7F003030300000000000000000003F7F7F0030303000000000000000
      00007FFFFF007FFFFF005050500090909000000000000000000000000000FFFF
      FF0000FFFF000000000000FFFF00FFFFFF0000000000FFFFFF0000FFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000000000FFFF
      FF00000000000000000000000000000000003F7F7F007FFFFF007FFFFF007FFF
      FF007FFFFF0030303000303030003F7F7F007FFFFF0030303000303030003F7F
      7F007FFFFF007FFFFF0050505000909090000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007B7B0000FFFF0000FFFF0000FFFF00007B7B00007B7B00007B7B000000
      0000FFFFFF000000000000000000000000003F7F7F007FFFFF007FFFFF007FFF
      FF007FFFFF0030303000303030003F7F7F007FFFFF0030303000303030003F7F
      7F007FFFFF007FFFFF005050500090909000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000007B7B0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000003F7F7F007FFFFF007FFFFF007FFF
      FF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFF
      FF007FFFFF007FFFFF0050505000909090000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B0000FFFF0000FFFF0000000000FFFFFF000000
      0000000000000000000000000000000000003F7F7F007FFFFF007FFFFF007FFF
      FF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFF
      FF007FFFFF007FFFFF004040400020202000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00808080008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007B7B0000FFFF0000FFFF0000000000FFFF
      FF00000000000000000000000000000000003F7F7F007FFFFF007FFFFF007FFF
      FF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFFFF007FFF
      FF007FFFFF00205F5F002020200000000000FFFF0000FFFF00000000000000FF
      FF00FFFFFF0000FFFF000000000000FFFF00FFFFFF0000FFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007B7B00007B7B00007B7B000000
      0000FFFFFF00000000000000000000000000000000003F3F00007F7F00007F7F
      00007F7F00007F7F00007F7F0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F00007F7F
      00007F7F00007F7F00003F3F0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E1E3F0008001FFFFC1C1F0000000FFFF
      C1C1F0000000F3FFC001F0000000F1FFC000F0000000F0FF8000F0000000F8FF
      0000F0000000F87F0000E0000000FC3F0000C0000000E00F000080000000E007
      000080008001F00700000000C003F81F00000000C003FC0F00010001C003FE07
      00070003C003FF0781FF0007C003FFFF00000000000000000000000000000000
      000000000000}
  end
  object DataSource2: TDataSource
    Left = 80
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList2
    Left = 363
    Top = 250
    object SeleccionarTodos1: TMenuItem
      Caption = 'Seleccionar Todos'
      ImageIndex = 1
      OnClick = SeleccionarTodos1Click
    end
    object EliminarSeleccin1: TMenuItem
      Caption = 'Eliminar Selecci'#243'n'
      ImageIndex = 3
      OnClick = EliminarSeleccin1Click
    end
  end
end
