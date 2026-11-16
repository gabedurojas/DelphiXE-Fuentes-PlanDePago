object Frm_Filtros: TFrm_Filtros
  Left = 418
  Top = 377
  BorderIcons = []
  Caption = 'Filtro - ESC (Cancela Filtro)'
  ClientHeight = 161
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object JvgGroupBox2: TJvgGroupBox
    Left = 0
    Top = 0
    Width = 648
    Height = 161
    Align = alClient
    Caption = 'Opciones de Filtrado'
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
    object Label1: TLabel
      Left = 6
      Top = 22
      Width = 110
      Height = 13
      Caption = 'Nombre de la Columna:'
    end
    object Label2: TLabel
      Left = 288
      Top = 22
      Width = 71
      Height = 13
      Caption = 'Valor a buscar:'
    end
    object Label3: TLabel
      Left = 189
      Top = 22
      Width = 64
      Height = 13
      Caption = 'Tipo de Filtro:'
    end
    object Label4: TLabel
      Left = 466
      Top = 22
      Width = 86
      Height = 13
      Caption = 'Tipo de Operador:'
    end
    object Label5: TLabel
      Left = 6
      Top = 74
      Width = 70
      Height = 13
      Caption = 'Filtro a realizar:'
    end
    object COLUMNA: TComboBox
      Left = 6
      Top = 37
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = COLUMNAExit
      OnKeyDown = FormKeyDown
      OnKeyPress = COLUMNAKeyPress
    end
    object VALOR: TEdit
      Left = 288
      Top = 37
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnExit = VALORExit
      OnKeyDown = FormKeyDown
      OnKeyPress = VALORKeyPress
    end
    object BUSCAR: TButton
      Left = 261
      Top = 130
      Width = 125
      Height = 25
      Caption = 'Filtrar'
      Enabled = False
      TabOrder = 3
      OnClick = BUSCARClick
      OnKeyDown = FormKeyDown
    end
    object TIPO: TComboBox
      Left = 186
      Top = 37
      Width = 92
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = TIPOExit
      OnKeyDown = FormKeyDown
      OnKeyPress = TIPOKeyPress
    end
    object OPERA: TComboBox
      Left = 466
      Top = 37
      Width = 97
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Text = 'SELECCIONAR'
      OnExit = OPERAExit
      OnKeyDown = FormKeyDown
      OnKeyPress = OPERAKeyPress
      Items.Strings = (
        'SELECCIONAR'
        'AND'
        'OR')
    end
    object AGREGAR: TButton
      Left = 572
      Top = 33
      Width = 71
      Height = 25
      Caption = 'Agregar'
      TabOrder = 5
      OnClick = AGREGARClick
      OnKeyDown = FormKeyDown
    end
    object FILTRO: TEdit
      Left = 6
      Top = 87
      Width = 633
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
      OnChange = FILTROChange
      OnKeyDown = FormKeyDown
    end
  end
end
