object AsignaRecepcion: TAsignaRecepcion
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
    object JvDBUltimGrid1: TJvDBUltimGrid
      Left = 2
      Top = 16
      Width = 908
      Height = 376
      Align = alClient
      DataSource = DTS1
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = JvDBUltimGrid1DrawColumnCell
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
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
      Width = 317
      Height = 24
      Caption = ' Cambio de Estado a Recepcionado '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ToolButton1: TToolButton
      Left = 317
      Top = 0
      Width = 399
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object SALE: TJvBitBtn
      Left = 716
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
    object Imprimir1: TMenuItem
      Caption = 'Marcar como Recepcionado'
      Enabled = False
      OnClick = Imprimir1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Filtrar1: TMenuItem
      Caption = 'Filtrar'
      RadioItem = True
      OnClick = Filtrar1Click
    end
    object DesactivarFiltro1: TMenuItem
      Caption = 'Desactivar Filtro'
      Checked = True
      Enabled = False
      RadioItem = True
      OnClick = DesactivarFiltro1Click
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
    Left = 128
    Top = 96
  end
  object JvDBGridExcelExport1: TJvDBGridExcelExport
    Caption = 'Exporting to MS Excel...'
    Grid = JvDBUltimGrid1
    AutoFit = False
    Left = 326
    Top = 235
  end
end
