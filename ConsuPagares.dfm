object Estadistica_Pagares: TEstadistica_Pagares
  Left = 281
  Top = 159
  Caption = '...'
  ClientHeight = 528
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    794
    528)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 29
    Width = 794
    Height = 126
    Align = alTop
    Caption = 'Seleccione'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label11: TLabel
      Left = 177
      Top = 70
      Width = 45
      Height = 13
      Caption = 'N'#176' CUIM:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label6: TLabel
      Left = 164
      Top = 19
      Width = 57
      Height = 13
      Caption = 'Nro Pagare:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 156
      Top = 47
      Width = 67
      Height = 13
      Caption = 'Fecha Desde:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel
      Left = 331
      Top = 48
      Width = 64
      Height = 13
      Caption = 'Fecha Hasta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 351
      Top = 70
      Width = 9
      Height = 14
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Shape4: TShape
      Left = 197
      Top = 108
      Width = 15
      Height = 13
      Brush.Color = clYellow
      Shape = stCircle
    end
    object Label45: TLabel
      Left = 220
      Top = 108
      Width = 86
      Height = 13
      Caption = 'ENTREGADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape2: TShape
      Left = 314
      Top = 109
      Width = 15
      Height = 13
      Shape = stCircle
    end
    object Label13: TLabel
      Left = 333
      Top = 109
      Width = 94
      Height = 13
      Caption = 'SIN ENTREGAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 6
      Top = 107
      Width = 183
      Height = 13
      Caption = 'Estados de los PAGARES --->>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object R1: TRadioButton
      Left = 10
      Top = 21
      Width = 126
      Height = 18
      Caption = 'Por NroPagare'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = R1Click
    end
    object R4: TRadioButton
      Left = 9
      Top = 84
      Width = 65
      Height = 17
      Caption = 'Todos'
      TabOrder = 2
      Visible = False
      OnClick = R4Click
    end
    object CARNET: TEdit
      Left = 227
      Top = 64
      Width = 91
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 3
      Text = '00-00000000-0'
      Visible = False
      OnKeyPress = CARNETKeyPress
    end
    object CODIGO: TMaskEdit
      Left = 227
      Top = 13
      Width = 64
      Height = 21
      EditMask = '99999999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 4
      Text = '00000   '
      OnExit = CODIGOExit
      OnKeyPress = CODIGOKeyPress
    end
    object FECEMI: TMaskEdit
      Left = 227
      Top = 39
      Width = 78
      Height = 21
      EditMask = '!99/99/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
      Text = '  /  /    '
      Visible = False
      OnExit = FECEMIExit
      OnKeyPress = FECEMIKeyPress
    end
    object FECVEN: TMaskEdit
      Left = 405
      Top = 41
      Width = 79
      Height = 21
      EditMask = '!99/99/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
      Text = '  /  /    '
      Visible = False
      OnExit = FECVENExit
      OnKeyPress = FECVENKeyPress
    end
    object R2: TRadioButton
      Left = 9
      Top = 42
      Width = 79
      Height = 17
      Caption = 'Por Fecha'
      TabOrder = 1
      OnClick = R2Click
    end
    object R3: TRadioButton
      Left = 9
      Top = 65
      Width = 135
      Height = 17
      Caption = 'Por Contribuyente'
      TabOrder = 7
      OnClick = R3Click
    end
    object buscar: TJvBitBtn
      Left = 553
      Top = 42
      Width = 110
      Height = 43
      Hint = 'Sale y Cierra Ventana'
      Caption = 'BUSCAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        08000000000000040000CE0E0000D80E00000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00FFFFFFFFFFFF
        FFFFFF0000000000000000006D6D6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000DBDBDBDBFF93FF93930000006D6D6DFFFFFFFFFFFFFFFFFFFFFFFF0000
        DBDBDBDBDBDBDBFF93FF939393939300006D6D6DFFFFFFFFFFFFFFFFFF009393
        DBDBDBDBDBDBDBFF93FF93939393939393006D6D6DFFFFFFFFFFFFFF00939393
        DBDBDBDBDBDBDBFF93FF9393939393939393006D6D6DFFFFFFFFFF0093939393
        DBDBDB00000000000000000093939393939393006D6D6DFFFFFF009393939393
        000000FFFFFFFFFFFFFFFFFF0000009393939393006D6DFFFFFF009393930000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000939393006D6D6DFFFF00939300FFFF
        FFFF00000000000000000000FFFFFFFFFF009393006D6D6DFFFF009300FFFFFF
        000093939393939393939393000000FFFFFF0093006D6D6D6DFF0000FFFFFF00
        93939393939393939393939393939300FFFFFF00006D6D6D6DFF00FFFFFF006E
        939393939393939393FFFFFF9393939300FFFFFF006D6D6D6DFF00FFFF009393
        6E9393939393939393939393FF93936E9300FFFF006D6D6DFFFF00FFFF009393
        936E6EDB9393939393939393FF6E6E939300FFFF006D6D6DFFFF00FFFF009393
        9393DBFFDB6E6E6E6E6E6E6E6E9393939300FFFF006D6DFFFFFF00FFFFFF0093
        939393DB93939393939393939393B69300FFFFFF006DFFFFFFFFFF00FFFFFF00
        93939393939393939393939393939300FFFFFF00FFFFFFFFFFFFFFFF00FFFFFF
        000000939393939393939393930000FFFFFF00FFFFFFFFFFFFFFFFFFFF00FFFF
        FFFFFF00000000000000000000FFFFFFFF006D6DFFFFFFFFFFFFFFFFFFFF0000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000092006D6DFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFFFF0000DBDBDB92006D6DFFFFFFFFFFFFFFFFFFFF
        FFFFFF00000000000000000000DBFFFFDBDBDB00006D6DFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00DBFFFFDB000000006D6DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000006D6DFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00246D2400000000006D6DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00246D2400000000006DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00246D240000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00246D2400000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00246D24000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00246D240000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = buscarClick
    end
    object Button1: TJvBitBtn
      Left = 669
      Top = 42
      Width = 104
      Height = 43
      Hint = 'Sale y Cierra Ventana'
      Caption = 'Exporta a'#13#10' Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        08000000000000040000CE0E0000D80E00000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        FFFF00000000FFFAD10000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00D1D1
        0000FAFAD1D100FFFAD1D100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FAFAD1
        D100FFFAFAD1D100FFFAD1D100FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFAFA
        D1D100FFFAFAD1D100FFFAD1D1000000FFFFFFFFFFFFFFFFFFFFFF000000FFFA
        FAD1D100FFFAFAD1D100FFFA0000DB00FFFFFFFFFFFFFFFFFFFF00FAD1D100FF
        FAFAD1D100FFFAFAD1D10000DBDBDB00FF0000FFFFFFFFFFFFFF00FFFAD1D100
        FFFAFAD1D100FFFA0000DBDBDBDBDB0000DB00FFFFFFFFFFFFFFFF00FFFAD1D1
        00FFFAFAD1D10000DBDBDBDBFFDBDB00DBDB00FFFFFFFFFFFFFFFFFF00FFFAD1
        D100FFFA0000DBDBDBDBFFFFFFDBDB00DBDB00FFFFFFFFFFFFFFFFFFFF00FFFA
        D1D10000DBDBDBDBFFFFFFFFFFDBDB00DBDB0000FFFFFFFFFFFFFFFFFFFF00FF
        0000DBDBDBDBFFFFFFFFFFFFFFDBDB00DBDB00D100FFFFFFFFFFFFFFFFFFFF00
        DBDBDBDBFFFFFFFFFFFFFFFFFFDBDB00DBDB00D1D100FFFFFFFFFFFFFFFFFF00
        DBDBFFFFFFFFFFFFFFFFFFFFFFDBDB00DBDB00FAD1D100FFFFFFFFFFFFFFFF00
        DB6DFFFFFFFFFFFFFFFFFFFFFFDBDB00DBDB00FAFAD1D100FFFFFFFFFFFFFF00
        DB6DFFFFFFFFFFFFFFFFFFFFFFDBDB00DBDB00FAFAFAD1D100FFFFFFFFFFFF00
        DB6DFFFFFFFFFFFFFFFFFFFFFFDBDB00DBDB00FAFAFAFAD100FFFFFFFFFFFF00
        DB6DFFFFFFFFFFFFFFFFFFFFFFDBDB00DBDB00FAFAFAFAD100FFFFFFFFFFFF00
        DB6DFFFFFFFFFFFFFFFFFFFF6DDBDB00DBDB00FAFAFAD10000FFFFFFFF000000
        DB6DFFFFFFFFFFFFFFFF6D6DDBDB0000DBDB00FAFFFF0000FFFFFFFF00D1D100
        DB6DFFFFFFFFFFFF6D6DDBDB0000FF6DDBDB00FF0000FFFFFFFFFFFF00FAFA00
        DB6DFFFFFFFF6D6DDBDB0000FF6D6DDBDB000000FFFFFFFFFFFFFFFF00FAFA00
        DB6DFFFF6D6DF8F80000FF6D6DDBDB000000FFFFFFFFFFFFFFFFFFFFFF000000
        DB6D6D6DF8F8F8F8006D6DDBDB000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        DBF8F8F8F8F8F8F800F8F8000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        FCF8F8F8F8F8FCFC00F8F800FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        FCF8F8F8FCFC0000F8F8F800FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        FCF8FCFC0000F8F8F8FCFC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        FCFC0000F8F8F8FCFC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FCF8FCFC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF00FCFC0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = Button1Click
    end
    object pend: TCheckBox
      Left = 564
      Top = 105
      Width = 183
      Height = 17
      Caption = 'Solo Pendientes de Entrega?'
      Checked = True
      State = cbChecked
      TabOrder = 10
      Visible = False
    end
    object afiliado: TJvBitBtn
      Left = 320
      Top = 62
      Width = 25
      Height = 23
      Hint = 'Buscar y Asignar el Cliente'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000004040409F9F9F606060202020000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000404040BFBFBFDFDFDFBF
        BFBF808080909090606060202020000000FFFFFFFFFFFFFFFFFFFFFFFF000000
        404040BFBFBFDFDFDFBFBFBF9F9F9F7F7F7F7F7F7F5050505050509090906060
        60000000FFFFFFFFFFFF505050BFBFBFDFDFDFBFBFBF9F9F9F7F7F7F7F7F7F5F
        5F5F9F5F5FFF3F00FF7F00606060505050000000FFFFFFFFFFFF404040A0A0A0
        BFBFBF7F7F7F7F7F7F5F5F5F9F9F9FEFAFAFFF3F00FFBF00BF0000505050B0B0
        B0202020FFFFFFFFFFFFFFFFFFFFFFFF404040A0A0A09F9F9FDFDFDFCF9090FF
        3F00FFBF00BF00007F7F7FEFEFAFCFCFCF707070000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF404040A0A0A0CF8F8FFFBF00BF00007F7F40FFFF00FFFF00EFEF
        AFB0B0B0202020FFFFFFFFFFFF0000003F3F3F7F7F3F7F7F3F505050BFBFBF7F
        40407F7F40BFBF007F7F3F7F7F00FFFF3FCFCFCF707070000000202020BFBFBF
        FFFF7FFFFF7FFFFF7FAFAF705050507F7F40AFAF30BFBFBF7F7FDF7F7F7FFFFF
        00EFEFAFB0B0B02020207F7F7FFFFF7FFFFF7FFFFF7FFFFFBFDFDF9F80808070
        7070FFFF00DFDFDFEFEFEFDFDF9FBFBF00BFBF3FC0C0C0404040BFBF7FFFFF7F
        FFFF7FFFFF7FFFFF7FFFFF7FAFAF70404040FFFF00EFEF30EFEF30BFBF006F6F
        308080807070702020207F7F40FFFF7FFFFF7FFFFF7FFFFF7FFFFF7F9F9F5F70
        70707F7F00BFBF006F6F30808080707070202020FFFFFFFFFFFF202020DFDF9F
        FFFF7FFFFF7FFFFF7FFFFF7F5F5F5FA0A0A0909090808080707070202020FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF2020207F7F40BFBF7F9F9F5F50505020202020
        2020707070202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = afiliadoClick
    end
  end
  object R5: TRichEdit
    Left = 2
    Top = 368
    Width = 791
    Height = 87
    Anchors = [akLeft, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -4
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'R5')
    ParentFont = False
    TabOrder = 4
  end
  object Barra1: TStatusBar
    Left = 0
    Top = 509
    Width = 794
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 155
    Width = 794
    Height = 191
    Align = alClient
    Caption = 'Total de Registros Encontrados :'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 790
      Height = 125
      Align = alClient
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 140
      Width = 790
      Height = 49
      Align = alBottom
      Caption = 'Pagare Seleccionado'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 22
        Width = 40
        Height = 13
        Caption = 'Numero:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 370
        Top = 20
        Width = 38
        Height = 13
        Caption = 'Importe:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 494
        Top = 20
        Width = 61
        Height = 13
        Caption = 'Otro Importe:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 109
        Top = 22
        Width = 9
        Height = 14
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pagare: TJvBitBtn
        Left = 632
        Top = 8
        Width = 151
        Height = 31
        Hint = 'Sale y Cierra Ventana'
        Caption = 'Estado Entregado'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = pagareClick
      end
      object PS1: TMaskEdit
        Left = 51
        Top = 16
        Width = 54
        Height = 21
        Color = clYellow
        Enabled = False
        EditMask = '99999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '00000   '
        OnExit = CODIGOExit
        OnKeyPress = CODIGOKeyPress
      end
      object PS2: TMaskEdit
        Left = 415
        Top = 14
        Width = 64
        Height = 21
        Color = clYellow
        Enabled = False
        EditMask = '99999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '00000   '
        OnExit = CODIGOExit
        OnKeyPress = CODIGOKeyPress
      end
      object PS3: TMaskEdit
        Left = 561
        Top = 15
        Width = 64
        Height = 21
        Color = clYellow
        Enabled = False
        EditMask = '99999999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '00000   '
        OnExit = CODIGOExit
        OnKeyPress = CODIGOKeyPress
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 346
    Width = 794
    Height = 163
    Align = alBottom
    Caption = 'Total de Registros Detalle Encontrados :'
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 790
      Height = 146
      Align = alClient
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnTitleClick = DBGrid2TitleClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 794
    Height = 29
    ButtonHeight = 25
    Caption = 'ToolBar1'
    TabOrder = 5
    DesignSize = (
      794
      29)
    object Label12: TLabel
      Left = 0
      Top = 0
      Width = 406
      Height = 25
      Caption = 'Consultas Pagares Generados por Plan de Pago'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ToolButton1: TToolButton
      Left = 406
      Top = 0
      Width = 271
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object JvBitBtn1: TJvBitBtn
      Left = 677
      Top = 0
      Width = 86
      Height = 25
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
      OnClick = JvBitBtn1Click
    end
  end
  object DataSource1: TDataSource
    Left = 106
  end
  object DataSource2: TDataSource
    Left = 20
    Top = 240
  end
  object FormularioEmb: TJvEmbeddedFormLink
    Left = 500
    Top = 13
  end
end
