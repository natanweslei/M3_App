object FrmCustomers: TFrmCustomers
  Left = 0
  Top = 0
  Width = 1005
  Height = 673
  Hint = 'Customers'
  TabOrder = 0
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1005
    Height = 145
    Hint = ''
    Align = alTop
    TabOrder = 0
    Caption = ''
    object UniDBEdit1: TUniDBEdit
      Left = 16
      Top = 16
      Width = 300
      Height = 22
      Hint = ''
      DataField = 'Company'
      TabOrder = 1
      FieldLabel = 'Company'
    end
    object UniDBEdit2: TUniDBEdit
      Left = 16
      Top = 56
      Width = 300
      Height = 22
      Hint = ''
      DataField = 'Phone'
      TabOrder = 2
      InputMask.Mask = '(999) 999 99 99'
      FieldLabel = 'Phone'
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 16
      Top = 96
      Width = 300
      Hint = ''
      ListField = 'country'
      KeyField = 'country'
      ListFieldIndex = 0
      DataField = 'country'
      TabOrder = 3
      Color = clWindow
    end
    object UniDBMemo1: TUniDBMemo
      Left = 320
      Top = 16
      Width = 337
      Height = 102
      Hint = ''
      DataField = 'Address'
      TabOrder = 4
    end
    object UniDBNavigator1: TUniDBNavigator
      Left = 695
      Top = 40
      Width = 257
      Height = 24
      Hint = ''
      TabOrder = 5
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 145
    Width = 1005
    Height = 528
    Hint = ''
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    Columns = <
      item
        FieldName = 'Company'
        Filtering.Enabled = True
        Title.Alignment = taCenter
        Title.Caption = 'Company'
        Width = 400
        Sortable = True
      end
      item
        FieldName = 'Phone'
        Filtering.Enabled = True
        Title.Alignment = taCenter
        Title.Caption = 'Phone'
        Width = 192
        Sortable = True
      end
      item
        FieldName = 'Country'
        Filtering.Enabled = True
        Title.Alignment = taCenter
        Title.Caption = 'Country'
        Width = 137
        Sortable = True
      end
      item
        FieldName = 'Address'
        Filtering.Enabled = True
        Title.Alignment = taCenter
        Title.Caption = 'Address'
        Width = 333
        Sortable = True
      end>
  end
end
