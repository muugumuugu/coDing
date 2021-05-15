VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmOptions 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Options"
   ClientHeight    =   4332
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   6264
   ControlBox      =   0   'False
   Icon            =   "frmOptions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4332
   ScaleWidth      =   6264
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   350
      Left            =   3840
      TabIndex        =   35
      Top             =   3840
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   350
      Left            =   5040
      TabIndex        =   34
      Top             =   3840
      Width           =   1095
   End
   Begin TabDlg.SSTab tbsOptions 
      Height          =   3615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6045
      _ExtentX        =   10668
      _ExtentY        =   6371
      _Version        =   393216
      Tabs            =   2
      Tab             =   1
      TabsPerRow      =   6
      TabHeight       =   520
      TabCaption(0)   =   "Defaults"
      TabPicture(0)   =   "frmOptions.frx":09CA
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "fraAngMode"
      Tab(0).Control(1)=   "fraAnsType"
      Tab(0).Control(2)=   "fraLogBase"
      Tab(0).Control(3)=   "fraDecimal"
      Tab(0).Control(4)=   "cmdDefaultsSave"
      Tab(0).Control(5)=   "cmdDefaultsOriginal"
      Tab(0).ControlCount=   6
      TabCaption(1)   =   "Font"
      TabPicture(1)   =   "frmOptions.frx":09E6
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "lblBGColor"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "lblPreview"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "lblColor"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "lblEffects"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "lblFont"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "lblStyle"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "lblSize"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "cmbFont(2)"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "cmbFont(1)"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "cmbFont(0)"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "cmdBGChange"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).Control(11)=   "picBGColor"
      Tab(1).Control(11).Enabled=   0   'False
      Tab(1).Control(12)=   "txtPreview"
      Tab(1).Control(12).Enabled=   0   'False
      Tab(1).Control(13)=   "cmdChange"
      Tab(1).Control(13).Enabled=   0   'False
      Tab(1).Control(14)=   "picColor"
      Tab(1).Control(14).Enabled=   0   'False
      Tab(1).Control(15)=   "chkUnderline"
      Tab(1).Control(15).Enabled=   0   'False
      Tab(1).Control(16)=   "chkStrikethru"
      Tab(1).Control(16).Enabled=   0   'False
      Tab(1).Control(17)=   "cmdFontApply"
      Tab(1).Control(17).Enabled=   0   'False
      Tab(1).Control(18)=   "cmdFontOriginal"
      Tab(1).Control(18).Enabled=   0   'False
      Tab(1).ControlCount=   19
      Begin VB.CommandButton cmdFontOriginal 
         Caption         =   "Original"
         Height          =   350
         Left            =   120
         TabIndex        =   36
         Top             =   3120
         Width           =   1095
      End
      Begin VB.CommandButton cmdDefaultsOriginal 
         Caption         =   "Original"
         Height          =   350
         Left            =   -74880
         TabIndex        =   33
         Top             =   3120
         Width           =   1095
      End
      Begin VB.CommandButton cmdDefaultsSave 
         Caption         =   "Save"
         Enabled         =   0   'False
         Height          =   350
         Left            =   -70200
         TabIndex        =   32
         Top             =   3120
         Width           =   1095
      End
      Begin VB.CommandButton cmdFontApply 
         Caption         =   "Apply"
         Enabled         =   0   'False
         Height          =   350
         Left            =   4800
         TabIndex        =   31
         Top             =   3120
         Width           =   1095
      End
      Begin VB.Frame fraDecimal 
         Caption         =   "Decimals"
         Height          =   1215
         Left            =   -70680
         TabIndex        =   28
         Top             =   480
         Width           =   1455
         Begin VB.VScrollBar vsbDecimal 
            Height          =   285
            Left            =   720
            Max             =   10
            TabIndex        =   30
            Top             =   480
            Width           =   255
         End
         Begin VB.TextBox txtDecimal 
            Height          =   285
            Left            =   480
            Locked          =   -1  'True
            TabIndex        =   29
            Top             =   480
            Width           =   255
         End
      End
      Begin VB.Frame fraLogBase 
         Caption         =   "Log Base"
         Height          =   1095
         Left            =   -72720
         TabIndex        =   26
         Top             =   1920
         Width           =   3615
         Begin VB.TextBox txtLogBase 
            Alignment       =   2  'Center
            Height          =   285
            Left            =   600
            TabIndex        =   27
            Top             =   480
            Width           =   2415
         End
      End
      Begin VB.Frame fraAnsType 
         Caption         =   "Base Mode"
         Height          =   2535
         Left            =   -74880
         TabIndex        =   21
         Top             =   480
         Width           =   1935
         Begin VB.OptionButton optBaseMode 
            Caption         =   "Decimal"
            Height          =   255
            Index           =   0
            Left            =   360
            TabIndex        =   25
            Top             =   480
            Value           =   -1  'True
            Width           =   1020
         End
         Begin VB.OptionButton optBaseMode 
            Caption         =   "Binary"
            Height          =   255
            Index           =   1
            Left            =   360
            TabIndex        =   24
            Top             =   960
            Width           =   900
         End
         Begin VB.OptionButton optBaseMode 
            Caption         =   "Octal"
            Height          =   255
            Index           =   3
            Left            =   360
            TabIndex        =   23
            Top             =   1920
            Width           =   780
         End
         Begin VB.OptionButton optBaseMode 
            Caption         =   "Hexadecimal"
            Height          =   255
            Index           =   2
            Left            =   360
            TabIndex        =   22
            Top             =   1440
            Width           =   1380
         End
      End
      Begin VB.Frame fraAngMode 
         Caption         =   "Angle Mode"
         Height          =   1215
         Left            =   -72720
         TabIndex        =   18
         Top             =   480
         Width           =   1695
         Begin VB.OptionButton optAngMode 
            Caption         =   "Degrees"
            Height          =   255
            Index           =   0
            Left            =   360
            TabIndex        =   20
            Top             =   360
            Value           =   -1  'True
            Width           =   900
         End
         Begin VB.OptionButton optAngMode 
            Caption         =   "Radians"
            Height          =   255
            Index           =   1
            Left            =   360
            TabIndex        =   19
            Top             =   720
            Width           =   900
         End
      End
      Begin VB.CheckBox chkStrikethru 
         Caption         =   "Strikethrough"
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   1560
         Width           =   1455
      End
      Begin VB.CheckBox chkUnderline 
         Caption         =   "Underline"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   1800
         Width           =   1455
      End
      Begin VB.PictureBox picColor 
         Height          =   375
         Left            =   2040
         ScaleHeight     =   324
         ScaleWidth      =   324
         TabIndex        =   8
         Top             =   1560
         Width           =   375
      End
      Begin VB.CommandButton cmdChange 
         Caption         =   "Change..."
         Height          =   375
         Left            =   2520
         TabIndex        =   7
         Top             =   1560
         Width           =   1095
      End
      Begin VB.TextBox txtPreview 
         Alignment       =   2  'Center
         Height          =   495
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   6
         Top             =   2520
         Width           =   5775
      End
      Begin VB.PictureBox picBGColor 
         Height          =   375
         Left            =   4200
         ScaleHeight     =   324
         ScaleWidth      =   324
         TabIndex        =   5
         Top             =   1560
         Width           =   375
      End
      Begin VB.CommandButton cmdBGChange 
         Caption         =   "Change..."
         Height          =   375
         Left            =   4680
         TabIndex        =   4
         Top             =   1560
         Width           =   1095
      End
      Begin VB.ComboBox cmbFont 
         Height          =   288
         Index           =   0
         Left            =   240
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   720
         Width           =   2775
      End
      Begin VB.ComboBox cmbFont 
         Height          =   288
         Index           =   1
         ItemData        =   "frmOptions.frx":0A02
         Left            =   3240
         List            =   "frmOptions.frx":0A12
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   720
         Width           =   1455
      End
      Begin VB.ComboBox cmbFont 
         Height          =   288
         Index           =   2
         ItemData        =   "frmOptions.frx":0A3A
         Left            =   4920
         List            =   "frmOptions.frx":0A50
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   720
         Width           =   975
      End
      Begin VB.Label lblSize 
         AutoSize        =   -1  'True
         Caption         =   "Size:"
         Height          =   192
         Left            =   4800
         TabIndex        =   17
         Top             =   480
         Width           =   348
      End
      Begin VB.Label lblStyle 
         AutoSize        =   -1  'True
         Caption         =   "Style:"
         Height          =   192
         Left            =   3120
         TabIndex        =   16
         Top             =   480
         Width           =   396
      End
      Begin VB.Label lblFont 
         AutoSize        =   -1  'True
         Caption         =   "Font:"
         Height          =   192
         Left            =   120
         TabIndex        =   15
         Top             =   480
         Width           =   348
      End
      Begin VB.Label lblEffects 
         AutoSize        =   -1  'True
         Caption         =   "Effects:"
         Height          =   192
         Left            =   120
         TabIndex        =   14
         Top             =   1320
         Width           =   516
      End
      Begin VB.Label lblColor 
         AutoSize        =   -1  'True
         Caption         =   "Text Color:"
         Height          =   192
         Left            =   1920
         TabIndex        =   13
         Top             =   1320
         Width           =   768
      End
      Begin VB.Label lblPreview 
         AutoSize        =   -1  'True
         Caption         =   "Preview:"
         Height          =   192
         Left            =   120
         TabIndex        =   12
         Top             =   2280
         Width           =   612
      End
      Begin VB.Label lblBGColor 
         AutoSize        =   -1  'True
         Caption         =   "Text Background Color:"
         Height          =   192
         Left            =   4080
         TabIndex        =   11
         Top             =   1320
         Width           =   1680
      End
   End
   Begin MSComDlg.CommonDialog cdgColor 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327680
      CancelError     =   -1  'True
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkStrikethru_Click()

    'Turn on / off strikethrough option
    Select Case chkStrikethru.Value
        Case 1
            txtPreview.FontStrikethru = True
        Case 0
            txtPreview.FontStrikethru = False
    End Select

    'Enable Apply button
    cmdFontApply.Enabled = True

End Sub

Private Sub chkUnderline_Click()

    'Turn on / off underline option
    Select Case chkUnderline.Value
        Case 1
            txtPreview.FontUnderline = True
        Case 0
            txtPreview.FontUnderline = False
    End Select

    'Enable Apply button
    cmdFontApply.Enabled = True

End Sub

Private Sub cmbFont_Click(Index As Integer)

    Select Case Index

        'Font
        Case 0
            txtPreview.Text = cmbFont(0).Text
            txtPreview.Font = cmbFont(0).Text

        'Font style
        Case 1
            Select Case cmbFont(1).Text
                Case "Bold Italic"
                    txtPreview.FontBold = True
                    txtPreview.FontItalic = True
                Case "Bold"
                    txtPreview.FontBold = True
                    txtPreview.FontItalic = False
                Case "Italic"
                    txtPreview.FontBold = False
                    txtPreview.FontItalic = True
                Case "Regular"
                    txtPreview.FontBold = False
                    txtPreview.FontItalic = False
            End Select

        'Font size
        Case 2
            txtPreview.FontSize = Val(cmbFont(2).Text)
    End Select

    'Enable Apply button
    cmdFontApply.Enabled = True

End Sub

Private Sub cmdBGChange_Click()
On Error GoTo ErrorHandler

    'Display color dialog box
    cdgColor.ShowColor
    picBGColor.BackColor = cdgColor.Color
    txtPreview.BackColor = cdgColor.Color

    'Enable Save button
    cmdFontApply.Enabled = True

    Exit Sub

ErrorHandler:

    'Cancel was pressed
    If Err.Number = 32755 Then
        Exit Sub
    End If

End Sub

Private Sub cmdCancel_Click()

    'Close form without saving
    Unload Me

End Sub

Private Sub cmdChange_Click()
On Error GoTo ErrorHandler

    'Display color dialog box
    cdgColor.ShowColor
    picColor.BackColor = cdgColor.Color
    txtPreview.ForeColor = cdgColor.Color

    'Enable Apply button
    cmdFontApply.Enabled = True

    Exit Sub

ErrorHandler:

    'Cancel was pressed
    If Err.Number = 32755 Then
        Exit Sub
    End If

End Sub

Private Sub cmdDefaultsOriginal_Click()

    'Restore original settings
    optAngMode(0).Value = True
    optBaseMode(0).Value = True
    txtLogBase.Text = "10"
    txtDecimal.Text = "F"
    vsbDecimal.Value = 0

    'Enable Save button
    cmdDefaultsSave.Enabled = True

End Sub

Private Sub cmdDefaultsSave_Click()
Dim i As Long
Dim Message As String

    'Request confirmation to save changes
    Message = MsgBox("Save changes to default settings?", vbYesNo, "Save Changes")
    If Message = vbNo Then
        Exit Sub
    End If

    'Save default settings to Registry
    For i = 0 To 1
        If optAngMode(i).Value = True Then
            Exit For
        End If
    Next i
    SaveSetting App.Title, "Defaults", "AngMode", i
    For i = 0 To 3
        If optBaseMode(i).Value = True Then
            Exit For
        End If
    Next i
    SaveSetting App.Title, "Defaults", "BaseMode", i
    SaveSetting App.Title, "Defaults", "LogBase", txtLogBase.Text
    SaveSetting App.Title, "Defaults", "Decimals", txtDecimal.Text

    'Disable Save button
    cmdDefaultsSave.Enabled = False

End Sub

Private Sub cmdFontApply_Click()

    '***************************
    'Apply user-defined settings
    '***************************

    'Font
    frmCalcSolver.txtEntry.Font = cmbFont(0).Text
    frmCalcSolver.txtAnswer.Font = cmbFont(0).Text

    'Font style
    Select Case cmbFont(1).Text
        Case "Regular"
            frmCalcSolver.txtEntry.FontBold = False
            frmCalcSolver.txtEntry.FontItalic = False
            frmCalcSolver.txtAnswer.FontBold = False
            frmCalcSolver.txtAnswer.FontItalic = False
        Case "Italic"
            frmCalcSolver.txtEntry.FontBold = False
            frmCalcSolver.txtEntry.FontItalic = True
            frmCalcSolver.txtAnswer.FontBold = False
            frmCalcSolver.txtAnswer.FontItalic = False
        Case "Bold"
            frmCalcSolver.txtEntry.FontBold = True
            frmCalcSolver.txtEntry.FontItalic = False
            frmCalcSolver.txtAnswer.FontBold = False
            frmCalcSolver.txtAnswer.FontItalic = False
        Case "Bold Italic"
            frmCalcSolver.txtEntry.FontBold = True
            frmCalcSolver.txtEntry.FontItalic = True
            frmCalcSolver.txtAnswer.FontBold = False
            frmCalcSolver.txtAnswer.FontItalic = False
    End Select

    'Font size
    frmCalcSolver.txtEntry.FontSize = Val(cmbFont(2).Text)
    frmCalcSolver.txtAnswer.FontSize = Val(cmbFont(2).Text)

    'Font strikethrough
    Select Case chkStrikethru.Value
        Case 0
            frmCalcSolver.txtEntry.FontStrikethru = False
            frmCalcSolver.txtAnswer.FontStrikethru = False
        Case 1
            frmCalcSolver.txtEntry.FontStrikethru = True
            frmCalcSolver.txtAnswer.FontStrikethru = True
    End Select

    'Font underline
    Select Case chkUnderline.Value
        Case 0
            frmCalcSolver.txtEntry.FontUnderline = False
            frmCalcSolver.txtAnswer.FontUnderline = False
        Case 1
            frmCalcSolver.txtEntry.FontUnderline = True
            frmCalcSolver.txtAnswer.FontUnderline = True
    End Select

    'Font color
    frmCalcSolver.txtEntry.ForeColor = picColor.BackColor
    frmCalcSolver.txtAnswer.ForeColor = picColor.BackColor
    frmCalcSolver.txtEntry.BackColor = picBGColor.BackColor
    frmCalcSolver.txtAnswer.BackColor = picBGColor.BackColor

    'Disable Apply button
    cmdFontApply.Enabled = False

End Sub

Private Sub cmdFontOriginal_Click()

    'Restore original settings
    cmbFont(0).Text = "MS Sans Serif"
    cmbFont(1).Text = "Regular"
    cmbFont(2).Text = "8"
    chkStrikethru.Value = 0
    chkUnderline.Value = 0
    picColor.BackColor = vbBlack
    txtPreview.ForeColor = vbBlack
    picBGColor.BackColor = vbWhite
    txtPreview.BackColor = vbWhite

    'Enable Apply button
    cmdFontApply.Enabled = True

End Sub

Private Sub cmdOK_Click()

    'If changes were made to Defaults, request
    'confirmation to save
    If cmdDefaultsSave.Enabled = True Then
        cmdDefaultsSave_Click
    End If

    'If changes were made to Font, apply changes
    If cmdFontApply.Enabled = True Then
        cmdFontApply_Click
    End If

    'Close form
    Unload Me
    frmCalcSolver.SetFocus

End Sub

Private Sub Form_Load()
On Error Resume Next
Dim i As Long

    'Load default settings
    optAngMode(Val(GetSetting(App.Title, "Defaults", "AngMode", "0"))).Value = True
    optBaseMode(Val(GetSetting(App.Title, "Defaults", "BaseMode", "0"))).Value = True
    txtLogBase.Text = GetSetting(App.Title, "Defaults", "LogBase", "10")
    txtDecimal.Text = GetSetting(App.Title, "Defaults", "Decimals", "F")
    vsbDecimal_Change

    'Populate font list box
    cmbFont(0).Clear
    For i = 0 To (Screen.FontCount - 1)
        cmbFont(0).AddItem Screen.Fonts(i)
    Next i

    'Load font name into list box
    cmbFont(0).Text = frmCalcSolver.txtEntry.Font
    txtPreview.Text = frmCalcSolver.txtEntry.Font

    'Load font style into list box
    If frmCalcSolver.txtEntry.FontBold And frmCalcSolver.txtEntry.FontItalic Then
        cmbFont(1).Text = "Bold Italic"
        txtPreview.FontBold = True
        txtPreview.FontItalic = True
    ElseIf frmCalcSolver.txtEntry.FontBold And Not frmCalcSolver.txtEntry.FontItalic Then
        cmbFont(1).Text = "Bold"
        txtPreview.FontBold = True
    ElseIf Not frmCalcSolver.txtEntry.FontBold And frmCalcSolver.txtEntry.FontItalic Then
        cmbFont(1).Text = "Italic"
        txtPreview.FontItalic = True
    Else
        cmbFont(1).Text = "Regular"
    End If

    'Load font size into list box
    cmbFont(2).Text = CInt(frmCalcSolver.txtEntry.FontSize)
    txtPreview.FontSize = CInt(frmCalcSolver.txtEntry.FontSize)

    'Load underline into check box
    Select Case frmCalcSolver.txtEntry.FontUnderline
        Case False
            chkUnderline.Value = 0
        Case True
            chkUnderline.Value = 1
    End Select

    'Load strikethrough into check box
    Select Case frmCalcSolver.txtAnswer.FontStrikethru
        Case False
            chkStrikethru.Value = 0
        Case True
            chkStrikethru.Value = 1
    End Select

    'Load font color and background color into picture box
    picColor.BackColor = frmCalcSolver.txtEntry.ForeColor
    txtPreview.ForeColor = frmCalcSolver.txtEntry.ForeColor
    picBGColor.BackColor = frmCalcSolver.txtEntry.BackColor
    txtPreview.BackColor = frmCalcSolver.txtEntry.BackColor

    'Disable Save and Apply buttons
    cmdDefaultsSave.Enabled = False
    cmdFontApply.Enabled = False

    'Set default tab to be displayed
    tbsOptions.Tab = 0

End Sub

Private Sub optAngMode_Click(Index As Integer)

    'Enable Save button
    cmdDefaultsSave.Enabled = True

End Sub

Private Sub optBaseMode_Click(Index As Integer)

    'Enable Save button
    cmdDefaultsSave.Enabled = True

End Sub

Private Sub txtLogBase_Change()

    'Enable Save button
    cmdDefaultsSave.Enabled = True

End Sub

Private Sub vsbDecimal_Change()

    'Invert the counting order (10 = 0, 9 = 1, 8 = 2, etc.)
    DecIndex = Abs(vsbDecimal.Value - 10)

    'Display the number of decimals in the text box
    '(10 = Floating)
    If DecIndex = 10 Then
        txtDecimal.Text = "F"
    Else
        txtDecimal.Text = CStr(DecIndex)
    End If

    'Enable Save button
    cmdDefaultsSave.Enabled = True

End Sub

Private Sub vsbDecimal_GotFocus()

    'Fix "blinking" bug on the lower scroll button
    txtDecimal.SetFocus
    txtDecimal.SelStart = 0
    txtDecimal.SelLength = 1

End Sub
