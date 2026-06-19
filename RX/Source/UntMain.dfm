object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Update Farmatec'
  ClientHeight = 631
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
    Height = 612
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
          Caption = 'Update Farmatec'
          TabOrder = 0
          OnClick = btnUpdateClick
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 395
          Top = 4
          Width = 169
          Height = 27
          Align = alLeft
          Caption = 'Update OTC Health Plan Number'
          TabOrder = 1
          Visible = False
          OnClick = Button2Click
        end
        object btnConvertPassword: TButton
          AlignWithMargins = True
          Left = 570
          Top = 4
          Width = 169
          Height = 27
          Align = alLeft
          Caption = 'Fix Bill Later'
          TabOrder = 2
          OnClick = btnConvertPasswordClick
        end
        object EditNPI: TEdit
          AlignWithMargins = True
          Left = 745
          Top = 4
          Width = 121
          Height = 27
          Align = alLeft
          TabOrder = 3
          TextHint = 'Enter pharmacy SPI'
          Visible = False
          ExplicitHeight = 21
        end
        object Button4: TButton
          AlignWithMargins = True
          Left = 872
          Top = 4
          Width = 89
          Height = 27
          Align = alLeft
          Caption = 'Update OTC'
          TabOrder = 4
          OnClick = Button4Click
        end
        object Button5: TButton
          AlignWithMargins = True
          Left = 179
          Top = 4
          Width = 210
          Height = 27
          Align = alLeft
          Caption = 'Create Foreing Keys'
          TabOrder = 5
          OnClick = Button5Click
        end
        object Button8: TButton
          AlignWithMargins = True
          Left = 967
          Top = 4
          Width = 89
          Height = 27
          Align = alLeft
          Caption = 'Reindex'
          TabOrder = 6
          OnClick = Button8Click
        end
      end
      object PageControlInfo: TPageControl
        Left = 0
        Top = 35
        Width = 1077
        Height = 549
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
            Height = 290
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
            Height = 521
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
        object Button6: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 157
          Height = 28
          Align = alLeft
          Caption = 'Update OTC from Claims'
          TabOrder = 0
          OnClick = Button6Click
        end
        object Button7: TButton
          AlignWithMargins = True
          Left = 167
          Top = 4
          Width = 186
          Height = 28
          Align = alLeft
          Caption = 'Erase Prescripton Fields'
          TabOrder = 1
          OnClick = Button7Click
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 612
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
