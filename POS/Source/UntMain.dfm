object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Update POS'
  ClientHeight = 505
  ClientWidth = 1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1085
    Height = 486
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Main Update'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1077
        Height = 35
        Align = alTop
        TabOrder = 0
        object btnUpdate: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 169
          Height = 27
          Align = alLeft
          Caption = 'Update POS'
          TabOrder = 0
          OnClick = btnUpdateClick
        end
        object Button8: TButton
          AlignWithMargins = True
          Left = 179
          Top = 4
          Width = 89
          Height = 27
          Align = alLeft
          Caption = 'Reindex'
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button1: TButton
          AlignWithMargins = True
          Left = 274
          Top = 4
          Width = 169
          Height = 27
          Align = alLeft
          Caption = 'Drop unnecessary tables'
          TabOrder = 2
          OnClick = Button1Click
          ExplicitLeft = 419
          ExplicitTop = 2
        end
      end
      object PageControlInfo: TPageControl
        Left = 0
        Top = 35
        Width = 1077
        Height = 423
        ActivePage = TabSheet3
        Align = alClient
        TabOrder = 1
        object TabSheet3: TTabSheet
          Caption = 'Create'
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 1069
            Height = 201
            Align = alTop
            TabOrder = 0
          end
          object Panel3: TPanel
            Left = 0
            Top = 201
            Width = 1069
            Height = 30
            Align = alTop
            TabOrder = 1
            object Label1: TLabel
              Left = 16
              Top = 8
              Width = 29
              Height = 13
              Caption = 'Errors'
            end
          end
          object MemoErrors: TMemo
            Left = 0
            Top = 231
            Width = 1069
            Height = 164
            Align = alClient
            TabOrder = 2
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Drop'
          ImageIndex = 1
          object Memo2: TMemo
            Left = 0
            Top = 0
            Width = 1069
            Height = 395
            Align = alClient
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Miscellaneous'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1077
        Height = 36
        Align = alTop
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 486
    Width = 1085
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object TimerCreateNewFields: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerCreateNewFieldsTimer
    Left = 468
    Top = 280
  end
end
