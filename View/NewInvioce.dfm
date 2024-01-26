object FrmNewInvoice: TFrmNewInvoice
  Left = 0
  Top = 0
  Width = 869
  Height = 573
  Hint = 'New Invoice'
  TabOrder = 0
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 869
    Height = 81
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 16
      Top = 16
      Width = 353
      Hint = ''
      ListField = 'Company'
      KeyField = 'id'
      ListFieldIndex = 0
      TabOrder = 1
      Color = clWindow
      FieldLabel = 'Customer'
    end
    object edTotal: TUniNumberEdit
      Left = 392
      Top = 16
      Width = 233
      Hint = ''
      TabOrder = 2
      ReadOnly = True
      FieldLabel = 'Total'
      DecimalSeparator = ','
    end
    object UniButton1: TUniButton
      Left = 640
      Top = 13
      Width = 113
      Height = 25
      Hint = ''
      Caption = 'Save'
      TabOrder = 3
    end
    object UniDBNavigator1: TUniDBNavigator
      Left = 16
      Top = 53
      Width = 241
      Height = 25
      Hint = ''
      TabOrder = 4
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 81
    Width = 869
    Height = 492
    Hint = ''
    RowEditor = True
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    Summary.Enabled = True
    Columns = <
      item
        FieldName = 'Product'
        Title.Alignment = taCenter
        Title.Caption = 'Product'
        Width = 300
        Sortable = True
      end
      item
        FieldName = 'Quantity'
        Title.Alignment = taCenter
        Title.Caption = 'Quantity'
        Width = 185
        Sortable = True
        ShowSummary = True
      end
      item
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = 'Price'
        Width = 133
        Sortable = True
      end
      item
        FieldName = 'Total'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Width = 198
        ReadOnly = True
        Sortable = True
        ShowSummary = True
      end>
  end
end
