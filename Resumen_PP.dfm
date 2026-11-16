object ResumenPP: TResumenPP
  Left = 358
  Top = 143
  BorderStyle = bsNone
  Caption = 'Lista de Titulares'
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object JvgGroupBox3: TJvgGroupBox
    Left = 0
    Top = 29
    Width = 912
    Height = 394
    Align = alClient
    Caption = 'Lista de Creados en el d'#237'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Border.Inner = bvSpace
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaCenter
    CaptionBorder.Inner = bvSpace
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.Active = False
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clPurple
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    FullHeight = 0
    object JvDBGrid2: TJvDBGrid
      Left = 2
      Top = 70
      Width = 908
      Height = 322
      Align = alClient
      DataSource = DTS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -12
      TitleFont.Name = 'Arial Narrow'
      TitleFont.Style = [fsBold]
      OnDblClick = JvDBGrid2DblClick
      AlternateRowColor = clSkyBlue
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 16
      TitleRowHeight = 20
    end
    object labusqueda: TJvgGroupBox
      Left = 2
      Top = 16
      Width = 908
      Height = 54
      Align = alTop
      Caption = 'B'#250'squeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      Border.Inner = bvSpace
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaCenter
      CaptionBorder.Inner = bvSpace
      CaptionBorder.Outer = bvNone
      CaptionBorder.Bold = False
      CaptionGradient.Active = False
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clPurple
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      FullHeight = 0
      object Label5: TLabel
        Left = 15
        Top = 26
        Width = 69
        Height = 13
        Caption = 'Fecha Plan:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 212
        Top = 26
        Width = 48
        Height = 13
        Caption = 'Usuario:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object busca: TJvBitBtn
        Left = 770
        Top = 10
        Width = 99
        Height = 35
        Caption = 'Buscar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          2A070000424D2A070000000000003604000028000000190000001B0000000100
          080000000000F4020000C40E0000C40E00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6080708F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6000000F6F6A5A4ADADF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6000000FFF75C5CA5A5A508F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F600
          0000F6F7AEA564AEA5AE07F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6
          07B66565A665AD07F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F608B7AF65
          5DA6A5F707F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6BFB7B76665A5A5
          F7F6F6F6F6F6F6F6F6F6F6F6F6F6F6000000F6F6F6F6BFB7B75D65A5AD07F6F6
          F60808F6F6F6F6F6F6F6F6000000F6F6F6F6F6BFB7AE6564A5F7F7F7A4A4ACAC
          F7ED08F6F6F6F6000000F6F6F6F6F6F6BFB7AEA5ADADACF509F6F607F7ACAC08
          F6F6F6000000F6F6F6F6F6F6F6F6F6ADA4F707FFFFF6FFFFF607A4A407F6F600
          0000F6F6F6F6F6F6F6F6FFF7EDF6FFFFF6F6FFFFFFFF07A4F7F6F6000000F6F6
          F6F6F6F6F6F6F6F509FF090909FFFFF6FFFFFFF7A407F6000000F6F6F6F6F6F6
          F6F60909090909FFFFF6F6FFFFFFFF079B08F6000000F6F6F6F6F6F6F6F60909
          FF090909FF09FFFFFFFFF6FFA307F6000000F6F6F6F6F6F6F6F6090909090909
          FFFFFF08FFF6F6FFA407F6000000F6F6F6F6F6F6F6F607FF09FFFF09FF09FF09
          FFF6F6FFA408F6000000F6F6F6F6F6F6F6F6F607F609090909FF09FFFFFFFF08
          A308F6000000F6F6F6F6F6F6F6F6F6F5FFFF09FF090909090808FFF7F7F6F600
          0000F6F6F6F6F6F6F6F6F607F5FFFF0909090909FFFFF5AC08F6F6000000F6F6
          F6F6F6F6F6F6F6F60708FFFFFF09F6F6FFF5ED08FFF6F6000000F6F6F6F6F6F6
          F6F6F6FFF6ED07090909F609F5F708FFFFF6F6000000F6F6F6F6F6F6F6F6F6F6
          F6F6FFF5A3F7F50709F6FFF6F6F6F6000000F6F6F6F6F6F6F6F6F6F6F6F6F6FF
          FFFFFFFFFFFFF6FFFFF6F6000000}
        ParentFont = False
        TabOrder = 0
        OnClick = buscaClick
      end
      object fechaD: TMaskEdit
        Left = 90
        Top = 20
        Width = 81
        Height = 24
        EditMask = '!99/99/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
        OnExit = fechaDExit
        OnKeyPress = fechaDKeyPress
      end
      object combodatos: TComboBox
        Left = 262
        Top = 22
        Width = 491
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        Text = 'COMBODATOS'
        OnExit = combodatosExit
        OnKeyPress = combodatosKeyPress
      end
    end
  end
  object Barra1: TStatusBar
    Left = 0
    Top = 423
    Width = 912
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 400
      end
      item
        Width = 300
      end>
  end
  object JvToolBar1: TJvToolBar
    Left = 0
    Top = 0
    Width = 912
    Height = 29
    ButtonHeight = 24
    Caption = 'JvToolBar1'
    TabOrder = 2
    DesignSize = (
      912
      29)
    object Label12: TLabel
      Left = 0
      Top = 0
      Width = 416
      Height = 24
      Caption = ' Res'#250'menes de Planes y Pagar'#233's para Entrega '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ToolButton1: TToolButton
      Left = 416
      Top = 0
      Width = 399
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object SALE: TJvBitBtn
      Left = 815
      Top = 0
      Width = 88
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        42010000424D4201000000000000760000002800000013000000110000000100
        040000000000CC0000000000000000000000100000001000000000000000A584
        0000FFDE5200007B7B0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
        1111111000001111111111111111111000001111105111111111111000001111
        1005111111111110000011111040511111111110000011111104051111111110
        0000111111034051111111100000111111103405111111100000111555503440
        5111111000001110000003440511111000001111034444333051111000001111
        1034440000011110000011111103444051111110000011111110344405111110
        0000111111110333305111100000111111111000000511100000111111111111
        111111100000}
      ParentFont = False
      TabOrder = 0
      OnClick = SALEClick
    end
  end
  object DTS1: TDataSource
    Left = 34
    Top = 160
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 35
    Top = 226
    object Filtrar1: TMenuItem
      Caption = 'Filtrar'
      RadioItem = True
      Visible = False
      OnClick = Filtrar1Click
    end
    object DesactivarFiltro1: TMenuItem
      Caption = 'Desactivar Filtro'
      Checked = True
      Enabled = False
      RadioItem = True
      Visible = False
      OnClick = DesactivarFiltro1Click
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      Enabled = False
      OnClick = Imprimir1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ExportaraExcel1: TMenuItem
      Caption = 'Exportar a Excel'
      Enabled = False
      OnClick = ExportaraExcel1Click
    end
  end
  object FormularioEmb: TJvEmbeddedFormLink
    Left = 98
    Top = 98
  end
  object JvDBGridExcelExport1: TJvDBGridExcelExport
    Caption = 'Exporting to MS Excel...'
    Grid = JvDBGrid2
    AutoFit = False
    Left = 162
    Top = 155
  end
  object frxReport1: TfrxReport
    Version = '4.15.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42506.824095150500000000
    ReportOptions.LastChange = 45589.376598900460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 334
    Top = 141
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
        Name = 'Fecha'
        Value = #39'04/08/2016'#39
      end
      item
        Name = 'Usuario'
        Value = #39'BRA'#209'A JUAN ANGEL'#39
      end
      item
        Name = 'NroUsuario'
        Value = '120'
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
      object ReportTitle1: TfrxReportTitle
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Left = 1.000000000000000000
          Width = 716.220472440000000000
          Height = 86.929190000000000000
          ShowHint = False
        end
        object Logo1: TfrxPictureView
          Left = 268.346630000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 79.370130000000000000
          ShowHint = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Municipalidad de la Ciudad de Formosa')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 12.338590000000000000
          Top = 24.574830000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Administraci'#243'n de Ingresos Municipales')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 385.512060000000000000
          Top = 7.559060000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'RESUMEN DE ENTREGA DE PLANES Y PAGARES')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 480.000310000000000000
          Top = 26.456710000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Fecha]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 347.716760000000000000
          Top = 26.456710000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'FECHA:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 480.000310000000000000
          Top = 45.354360000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Usuario]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 347.716760000000000000
          Top = 45.354360000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'NOMBRE USUARIO:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 480.000310000000000000
          Top = 64.252010000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[NroUsuario]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 347.716760000000000000
          Top = 64.252010000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'N'#176' USUARIO:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 45.354360000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape8: TfrxShapeView
          Left = 1.000000000000000000
          Width = 716.220472440000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clGradientInactiveCaption
        end
        object Shape5: TfrxShapeView
          Left = 1.000000000000000000
          Top = 18.897650000000000000
          Width = 716.220472440000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = clGradientInactiveCaption
        end
        object Memo26: TfrxMemoView
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            ' - - - - - - - Lista de Planes Generados - - - - - - -')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 665.197280000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Cant. Objetos')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 204.094620000000000000
          Top = 18.897650000000000000
          Width = 268.346630000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Contribuyente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Estado - Usuario')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176' Plan Pago')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Orden')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 204.094620000000000000
          Top = 18.897650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 472.441250000000000000
          Top = 18.897650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo8: TfrxMemoView
          Left = 472.441250000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Cant. Cuotas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 517.795610000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Imp. Cuota')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line8: TfrxLineView
          Left = 665.197280000000000000
          Top = 18.897650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 517.795610000000000000
          Top = 18.897650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo10: TfrxMemoView
          Left = 585.827150000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Fecha Carga')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line10: TfrxLineView
          Left = 585.827150000000000000
          Top = 18.897650000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape4: TfrxShapeView
          Left = 1.000000000000000000
          Top = 1.000000000000000000
          Width = 716.220472440000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Line4: TfrxLineView
          Left = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 204.094620000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1Orden: TfrxMemoView
          Left = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Orden'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."Orden"]')
          ParentFont = False
        end
        object frxDBDataset1Impuesto: TfrxMemoView
          Left = 42.574830000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Identificador'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."Identificador"]')
          ParentFont = False
        end
        object frxDBDataset1Detalle: TfrxMemoView
          Left = 207.653680000000000000
          Top = 2.000000000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'Contribuyente'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."Contribuyente"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 472.441250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 517.795610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 585.827150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 665.197280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo11: TfrxMemoView
          Left = 476.220780000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CantCuotas'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."CantCuotas"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 521.575140000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ImporteCuota'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."ImporteCuota"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 589.606680000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'FechaCarga'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."FechaCarga"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 668.976810000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CantObjetos'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."CantObjetos"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 117.165430000000000000
          Top = 0.220470000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."Estado"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Top = 170.078850000000000000
        Width = 718.110700000000000000
      end
      object Footer1: TfrxFooter
        Height = 11.338590000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
      end
    end
  end
end
