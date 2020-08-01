object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Obter Latitude e Longitude'
  ClientHeight = 528
  ClientWidth = 857
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbPesquisa: TLabel
    Left = 263
    Top = 36
    Width = 586
    Height = 30
    AutoSize = False
    Caption = 'Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbLogradouro: TLabel
    Left = 8
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Logradouro:'
  end
  object lbBairro: TLabel
    Left = 35
    Top = 33
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object lbCidade: TLabel
    Left = 30
    Top = 58
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object lbEstado: TLabel
    Left = 30
    Top = 83
    Width = 37
    Height = 13
    Caption = 'Estado:'
  end
  object lbCEP: TLabel
    Left = 44
    Top = 108
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lbNumero: TLabel
    Left = 26
    Top = 133
    Width = 41
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object lbSearchTimeout: TLabel
    Left = 735
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Search Timeout:'
  end
  object btnPesquisar: TButton
    Left = 263
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 0
    OnClick = btnPesquisarClick
  end
  object WebBrowser: TWebBrowser
    Left = 8
    Top = 157
    Width = 841
    Height = 363
    TabOrder = 1
    ControlData = {
      4C000000EB560000842500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object edtLogradouro: TEdit
    Left = 69
    Top = 5
    Width = 174
    Height = 21
    TabOrder = 2
    Text = 'Rua Ant'#244'nio Fortes'
  end
  object edtBairro: TEdit
    Left = 69
    Top = 30
    Width = 174
    Height = 21
    TabOrder = 3
    Text = 'Engenheiro Luciano Cavalcante'
  end
  object edtCidade: TEdit
    Left = 69
    Top = 55
    Width = 174
    Height = 21
    TabOrder = 4
    Text = 'Fortaleza'
  end
  object edtEstado: TEdit
    Left = 69
    Top = 80
    Width = 174
    Height = 21
    TabOrder = 5
    Text = 'CE'
  end
  object edtCep: TEdit
    Left = 69
    Top = 105
    Width = 174
    Height = 21
    TabOrder = 6
    Text = '60813460'
  end
  object edtNumero: TEdit
    Left = 69
    Top = 130
    Width = 174
    Height = 21
    TabOrder = 7
    Text = '330'
  end
  object btnSair: TButton
    Left = 346
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 8
    OnClick = btnSairClick
  end
  object edtSearchTimeout: TEdit
    Left = 818
    Top = 5
    Width = 31
    Height = 21
    TabOrder = 9
    Text = '7'
  end
  object btnParar: TButton
    Left = 427
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 10
    OnClick = btnPararClick
  end
  object tPesquisa: TTimer
    Enabled = False
    OnTimer = tPesquisaTimer
    Left = 72
    Top = 198
  end
  object tErro: TTimer
    Enabled = False
    OnTimer = tErroTimer
    Left = 119
    Top = 199
  end
end
