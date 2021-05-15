VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{60CC5D62-2D08-11D0-BDBE-00AA00575603}#1.0#0"; "DCSYSTRAY.OCX"
Begin VB.Form frmCalcSolver 
   Caption         =   "Advanced Calculation Solver"
   ClientHeight    =   3615
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6735
   Icon            =   "frmCalcSolver.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   3615
   ScaleWidth      =   6735
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate"
      Enabled         =   0   'False
      Height          =   350
      Left            =   2640
      TabIndex        =   18
      Top             =   2940
      Width           =   1095
   End
   Begin SysTrayCtl.cSysTray cstTray 
      Left            =   0
      Top             =   0
      _ExtentX        =   900
      _ExtentY        =   900
      InTray          =   0   'False
      TrayIcon        =   "frmCalcSolver.frx":09CA
      TrayTip         =   "Calculation Solver"
   End
   Begin VB.Frame fraDecimal 
      Caption         =   "Decimals"
      Height          =   852
      Left            =   3840
      TabIndex        =   15
      Top             =   2640
      Width           =   972
      Begin VB.TextBox txtDecimal 
         Height          =   285
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   16
         Top             =   360
         Width           =   255
      End
      Begin VB.VScrollBar vsbDecimal 
         Height          =   285
         Left            =   480
         Max             =   10
         TabIndex        =   17
         Top             =   360
         Width           =   255
      End
   End
   Begin VB.Frame fraLogBase 
      Caption         =   "Log Base"
      Height          =   855
      Left            =   1440
      TabIndex        =   14
      Top             =   2640
      Width           =   1092
      Begin VB.TextBox txtLogBase 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   612
      End
   End
   Begin VB.Frame fraEntry 
      Caption         =   "Entry:"
      Height          =   855
      Left            =   120
      TabIndex        =   12
      Top             =   120
      Width           =   6495
      Begin VB.TextBox txtEntry 
         Height          =   525
         Left            =   120
         TabIndex        =   0
         Top             =   240
         Width           =   6255
      End
   End
   Begin VB.Frame fraAnswer 
      Caption         =   "Answers:"
      Height          =   1455
      Left            =   120
      TabIndex        =   11
      Top             =   1080
      Width           =   6495
      Begin VB.TextBox txtAnswer 
         Height          =   1125
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   240
         Width           =   6255
      End
   End
   Begin VB.Frame fraAngMode 
      Caption         =   "Angle Mode"
      Height          =   855
      Left            =   120
      TabIndex        =   10
      Top             =   2640
      Width           =   1215
      Begin VB.OptionButton optAngMode 
         Caption         =   "Radians"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   3
         Top             =   490
         Width           =   900
      End
      Begin VB.OptionButton optAngMode 
         Caption         =   "Degrees"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Value           =   -1  'True
         Width           =   900
      End
   End
   Begin VB.Frame fraAnsType 
      Caption         =   "Base Mode"
      Height          =   855
      Left            =   4920
      TabIndex        =   9
      Top             =   2640
      Width           =   1695
      Begin VB.OptionButton optBaseMode 
         Caption         =   "Hex"
         Height          =   255
         Index           =   2
         Left            =   960
         TabIndex        =   7
         Top             =   240
         Width           =   660
      End
      Begin VB.OptionButton optBaseMode 
         Caption         =   "Oct"
         Height          =   255
         Index           =   3
         Left            =   960
         TabIndex        =   8
         Top             =   490
         Width           =   660
      End
      Begin VB.OptionButton optBaseMode 
         Caption         =   "Bin"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   490
         Width           =   660
      End
      Begin VB.OptionButton optBaseMode 
         Caption         =   "Dec"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Value           =   -1  'True
         Width           =   660
      End
   End
   Begin MSComctlLib.Toolbar tlbLine 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   1111
      ButtonWidth     =   609
      ButtonHeight    =   953
      Appearance      =   1
      _Version        =   393216
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileCalculate 
         Caption         =   "&Calculate"
         Enabled         =   0   'False
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuFileClear 
         Caption         =   "C&lear"
         Shortcut        =   {F7}
      End
      Begin VB.Menu separator 
         Caption         =   "-"
         Index           =   0
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
         Shortcut        =   ^Q
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuEditCut 
         Caption         =   "Cu&t"
         Shortcut        =   ^X
      End
      Begin VB.Menu mnuEditCopy 
         Caption         =   "&Copy"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuEditPaste 
         Caption         =   "&Paste"
         Shortcut        =   ^V
      End
      Begin VB.Menu mnuEditSelectAll 
         Caption         =   "Select &All"
         Shortcut        =   ^A
      End
      Begin VB.Menu separator2 
         Caption         =   "-"
         Index           =   0
      End
      Begin VB.Menu mnuEditAngle 
         Caption         =   "A&ngle Mode"
         Begin VB.Menu mnuEditAngleMode 
            Caption         =   "Degrees"
            Checked         =   -1  'True
            Index           =   0
         End
         Begin VB.Menu mnuEditAngleMode 
            Caption         =   "Radians"
            Index           =   1
         End
      End
      Begin VB.Menu mnuEditBase 
         Caption         =   "&Base Mode"
         Begin VB.Menu mnuEditBaseMode 
            Caption         =   "Decimal"
            Checked         =   -1  'True
            Index           =   0
         End
         Begin VB.Menu mnuEditBaseMode 
            Caption         =   "Binary"
            Index           =   1
         End
         Begin VB.Menu mnuEditBaseMode 
            Caption         =   "Hexadecimal"
            Index           =   2
         End
         Begin VB.Menu mnuEditBaseMode 
            Caption         =   "Octal"
            Index           =   3
         End
      End
      Begin VB.Menu mnuEditInsert 
         Caption         =   "&Insert"
         Begin VB.Menu mnuEditInsertLastAns 
            Caption         =   "Last Answer"
            Shortcut        =   {F9}
         End
         Begin VB.Menu mnuEditInsertLastEntry 
            Caption         =   "Last Entry"
            Shortcut        =   {F11}
         End
      End
      Begin VB.Menu separator3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditSettings 
         Caption         =   "&Settings"
         Begin VB.Menu mnuEditSettingsDefault 
            Caption         =   "&Default"
         End
         Begin VB.Menu mnuEditSettingsRemove 
            Caption         =   "&Remove"
         End
      End
      Begin VB.Menu separator4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditOptions 
         Caption         =   "&Options"
      End
   End
   Begin VB.Menu mnuMath 
      Caption         =   "&Math"
      Begin VB.Menu mnuMathConstants 
         Caption         =   "&Constants"
      End
      Begin VB.Menu mnuMathGraph 
         Caption         =   "&Graph"
      End
      Begin VB.Menu mnuMathStatistics 
         Caption         =   "&Statistics"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpSyntax 
         Caption         =   "&Syntax"
      End
      Begin VB.Menu separator5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "&About"
      End
   End
End
Attribute VB_Name = "frmCalcSolver"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim CurrentFocus As String
Dim RegEdit As Boolean
Dim StringLocation As Long

Private Sub cmdCalculate_Click()

    'Load main calculation routine
    CalculateEntry

    'Clear text box
    txtEntry.Text = ""

End Sub

Private Sub cstTray_MouseUp(Button As Integer, Id As Long)

    'Restore window
    If Button = 1 Then
        Me.WindowState = vbMaximized
        Me.Show
    End If

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    'Enter key calls the clicking of the Calculate
    'button
    If KeyCode = vbKeyReturn And cmdCalculate.Enabled Then
        cmdCalculate_Click
    End If

End Sub

Private Sub Form_Load()

    'Load form settings
    LoadFormSettings
    RegEdit = True

    'Enable decimal type on Decimal mode
    If optBaseMode(0).Value Then
        fraDecimal.Enabled = True
        txtDecimal.Enabled = True
        vsbDecimal.Enabled = True
    Else
        fraDecimal.Enabled = False
        txtDecimal.Enabled = False
        vsbDecimal.Enabled = False
    End If

    'Set default dimensions for variable arrays (used later
    'in the Major Parsing routines (Level 3)
    ReDim ValueArray(0)
    ReDim VariableArray(0)

End Sub

Private Sub Form_Resize()

    'Form cannot be resized when minimized so display
    'tray icon and exit routine
    If Me.WindowState = vbMinimized Then
        cstTray.InTray = True
        Me.Hide
        Exit Sub
    End If

    'Remove tray icon
    cstTray.InTray = False
    Me.Show

    'Set dimension limits (6015 x 4305 twips)
    If Me.Width < 6855 Then
        Me.Width = 6855
    ElseIf Me.Height < 4305 Then
        Me.Height = 4305
    End If

    'Set width values on form resize

    'Text boxes
    txtEntry.Width = Me.Width - 600
    fraEntry.Width = txtEntry.Width + 240
    txtAnswer.Width = Me.Width - 600
    fraAnswer.Width = txtAnswer.Width + 240

    'Frames
    fraLogBase.Left = ((Me.Width - fraAngMode.Width - fraLogBase.Width - cmdCalculate.Width - fraDecimal.Width - fraAnsType.Width - 360) / 4) + (fraAngMode.Width + fraAngMode.Left)
    cmdCalculate.Left = ((Me.Width - fraAngMode.Width - fraLogBase.Width - cmdCalculate.Width - fraDecimal.Width - fraAnsType.Width - 360) / 4) + (fraLogBase.Width + fraLogBase.Left)
    fraDecimal.Left = ((Me.Width - fraAngMode.Width - fraLogBase.Width - cmdCalculate.Width - fraDecimal.Width - fraAnsType.Width - 360) / 4) + (cmdCalculate.Width + cmdCalculate.Left)
    fraAnsType.Left = ((Me.Width - fraAngMode.Width - fraLogBase.Width - cmdCalculate.Width - fraDecimal.Width - fraAnsType.Width - 360) / 4) + (fraDecimal.Width + fraDecimal.Left)

    'Set height values on form resize

    'Text boxes
    fraAnswer.Height = Me.Height - 2850
    txtAnswer.Height = fraAnswer.Height - 330

    'Frames
    fraAngMode.Top = fraAnswer.Height + fraAnswer.Top + 120
    fraLogBase.Top = fraAnswer.Height + fraAnswer.Top + 120
    cmdCalculate.Top = fraAnswer.Height + fraAnswer.Top + 380
    fraDecimal.Top = fraAnswer.Height + fraAnswer.Top + 120
    fraAnsType.Top = fraAnswer.Height + fraAnswer.Top + 120

End Sub

Private Sub Form_Terminate()
Dim i As Integer

    'Save settings
    SaveFormSettings

    'End program
    End

End Sub

Private Sub Form_Unload(Cancel As Integer)

    'Save settings
    SaveFormSettings

    'End program
    End

End Sub

Private Sub mnuEditAngleMode_Click(Index As Integer)

    'Correspond menu clicking with radio button
    'clicking
    optAngMode_Click Index
    optAngMode(Index).Value = True

End Sub

Private Sub mnuEditBaseMode_Click(Index As Integer)

    'Correspond menu clicking with radio button
    'clicking
    optBaseMode_Click Index
    optBaseMode(Index).Value = True

End Sub

Private Sub mnuEditCopy_Click()

    Select Case CurrentFocus
        'Copy the selected text
        Case "Entry"
            If txtEntry.SelText <> "" Then
                Clipboard.SetText (txtEntry.SelText)
            End If
        Case "Answer"
            If txtAnswer.SelText <> "" Then
                Clipboard.SetText (txtAnswer.SelText)
            End If
    End Select

End Sub

Private Sub mnuEditCut_Click()

    'Copy the text
    mnuEditCopy_Click

    Select Case CurrentFocus
        'Get the current cursor location in the text
        'box; delete the selected text; set the cursor
        'location back to its original place
        Case "Entry"
            StringLocation = txtEntry.SelStart
            txtEntry.Text = Left(txtEntry.Text, txtEntry.SelStart) + Right(txtEntry.Text, Len(txtEntry.Text) - (txtEntry.SelStart + txtEntry.SelLength))
            txtEntry.SelStart = StringLocation
    End Select

End Sub

Private Sub mnuEditInsertLastAns_Click()

    'Insert the last answer into the entry box
    txtEntry.SetFocus
    txtEntry.Text = txtEntry.Text + CStr(PrevAnswer)
    txtEntry.SelStart = Len(txtEntry.Text)

End Sub

Private Sub mnuEditInsertLastEntry_Click()

    'Insert the last entry into the entry box
    txtEntry.SetFocus
    txtEntry.Text = txtEntry.Text + PrevEntry
    txtEntry.SelStart = Len(txtEntry.Text)

End Sub

Private Sub mnuEditPaste_Click()
On Error Resume Next

    Select Case CurrentFocus
        'Get the current cursor location in the text
        'box; paste in the text; set the cursor
        'location back to its original place
        Case "Entry"
            StringLocation = txtEntry.SelStart
            txtEntry.Text = Left(txtEntry.Text, txtEntry.SelStart) + Clipboard.GetText + Right(txtEntry.Text, Len(txtEntry.Text) - txtEntry.SelStart)
            txtEntry.SelStart = StringLocation + Len(Clipboard.GetText)
    End Select

End Sub

Private Sub mnuEditSelectAll_Click()

    'Select all entry text
    txtEntry.SetFocus
    txtEntry.SelStart = 0
    txtEntry.SelLength = Len(txtEntry.Text)

End Sub

Private Sub mnuEditSettingsDefault_Click()
On Error Resume Next
Dim i As Integer
Dim Message As String

    'Display "Are you sure" box
    Message = MsgBox("Are you sure you wish to restore the default settings?", vbQuestion + vbYesNo, "Default Settings")

    'If the user does not wish to load the
    'default settings, exit the routine
    If Message = vbNo Then
        Exit Sub
    End If

    'Apply the default settings to the form
    PrevAnswer = "0"
    PrevEntry = ""
    txtLogBase.Text = GetSetting(App.Title, "Defaults", "LogBase", "10")
    optAngMode(CInt(GetSetting(App.Title, "Defaults", "AngMode", "0"))).Value = True
    txtDecimal.Text = GetSetting(App.Title, "Defaults", "Decimals", "F")
    If txtDecimal.Text = "F" Then
        i = 10
    Else
        i = Val(txtDecimal.Text)
    End If
    vsbDecimal.Value = Abs(i - 10)
    optBaseMode(CInt(GetSetting(App.Title, "Defaults", "BaseMode", "0"))).Value = True

    'Save settings in the Registry on exit
    RegEdit = True

End Sub

Private Sub mnuEditSettingsRemove_Click()
On Error Resume Next
Dim Message As String

    'Display "Are you sure" box
    Message = MsgBox("Are you sure you wish to remove the" + vbNewLine + "current settings from the Registry?", vbQuestion + vbYesNo, "Remove Settings")

    'If the user does not wish to remove the
    'current settings, exit the routine
    If Message = vbNo Then
        Exit Sub
    End If

    'Remove the settings from Registry
    DeleteSetting App.Title, "Previous"
    DeleteSetting App.Title, "Settings"
    DeleteSetting App.Title, "Defaults"

    'Set the default settings on the form
    'alone, without editing the Registry
    PrevAnswer = 0
    PrevEntry = ""
    txtLogBase.Text = "10"
    optAngMode(0).Value = True
    txtDecimal.Text = "F"
    vsbDecimal.Value = 0
    optBaseMode(0).Value = True

    'Don't save settings in the Registry
    'on exit
    RegEdit = False

    'Display "results" dialog box
    Message = MsgBox("Registry settings removed.", vbInformation, "Remove Settings")

End Sub

Private Sub mnuFileCalculate_Click()

    'Correspond with Calculate button clicking
    cmdCalculate_Click

End Sub

Private Sub mnuFileClear_Click()

    'If the entry box is empty, clear the answer box;
    'if the entry box is not empty, clear it.
    Select Case txtEntry.Text
        Case ""
            txtAnswer.Text = ""
        Case Else
            txtEntry.Text = ""
    End Select

End Sub

Private Sub mnuFileExit_Click()

    'End program
    Unload Me
    End

End Sub

Private Sub mnuHelpAbout_Click()

    'Display about screen
    frmAbout.Show vbModal, Me

End Sub

Public Sub mnuHelpSyntax_Click()

    'Disable modally displayed form menu items
    mnuEditOptions.Enabled = False
    mnuMathConstants.Enabled = False
    mnuHelpAbout.Enabled = False

    'Display help screen
    frmHelp.Show , Me

End Sub

Private Sub mnuMathConstants_Click()

    'Display Constants window
    frmConstants.Show vbModal, Me

End Sub

Private Sub mnuMathGraph_Click()

    'Disable modally displayed form menu items
    mnuEditOptions.Enabled = False
    mnuMathConstants.Enabled = False
    mnuHelpAbout.Enabled = False

    'Display Graph form
    frmGraph.Show , Me

End Sub

Private Sub mnuEditOptions_Click()

    'Set mouse pointer
    MousePointer = vbHourglass

    'Display Options form
    frmOptions.Show vbModal, Me

    'Set mouse pointer
    MousePointer = vbDefault

End Sub

Private Sub mnuMathStatistics_Click()

    'Disable modally displayed form menu items
    mnuEditOptions.Enabled = False
    mnuMathConstants.Enabled = False
    mnuHelpAbout.Enabled = False

    'Display Statistics form
    frmStatistics.Show , Me

End Sub

Private Sub optAngMode_Click(Index As Integer)
Dim i As Integer

    'Correspond radio buttons with check marks in menu
    'system
    For i = 0 To 1
        mnuEditAngleMode(i).Checked = False
    Next i

    mnuEditAngleMode(Index).Checked = True

End Sub

Private Sub optBaseMode_Click(Index As Integer)
Dim i As Integer

    'Enable decimal type on Decimal mode
    If Index = 0 Then
        fraDecimal.Enabled = True
        txtDecimal.Enabled = True
        vsbDecimal.Enabled = True
    Else
        fraDecimal.Enabled = False
        txtDecimal.Enabled = False
        vsbDecimal.Enabled = False
    End If

    'Correspond radio buttons with check marks in menu
    'system
    For i = 0 To 3
        mnuEditBaseMode(i).Checked = False
    Next i

    mnuEditBaseMode(Index).Checked = True

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

End Sub

Private Sub vsbDecimal_GotFocus()

    'Fix "blinking" bug on the lower scroll button
    txtDecimal.SetFocus
    txtDecimal.SelStart = 0
    txtDecimal.SelLength = 1

End Sub

Private Sub txtAnswer_GotFocus()

    'Set CurrentFocus value and disable Cut and Paste
    'menu items
    CurrentFocus = "Answer"
    mnuEditCut.Enabled = False
    mnuEditPaste.Enabled = False

End Sub

Private Sub txtEntry_Change()

    'Disable Calculate button if the entry box is
    'empty and enable it if the box is not empty
    If txtEntry = "" Then
        cmdCalculate.Enabled = False
        mnuFileCalculate.Enabled = False
    Else
        cmdCalculate.Enabled = True
        mnuFileCalculate.Enabled = True
    End If

    'If the user starts typing with an
    'operator (minus the subtraction sign to
    'avoid confusion with a negative
    'symbol), automatically insert previous
    'answer
    If txtEntry.Text = "+" Or txtEntry.Text = "*" Or txtEntry.Text = "/" Then
        txtEntry.Text = "ans" + txtEntry.Text
        txtEntry.SelStart = Len(txtEntry.Text)
    End If

End Sub

Private Sub txtEntry_GotFocus()

    'Set CurrentFocus value and enable Cut and Paste
    'menu items
    CurrentFocus = "Entry"
    mnuEditCut.Enabled = True
    mnuEditPaste.Enabled = True

End Sub

Private Sub SaveFormSettings()
Dim i As Long
Dim RegTemp As String

    '*********************************
    'Save the settings to the Registry
    '*********************************

    If RegEdit = True Then

        'Previous answer / entry
        SaveSetting App.Title, "Previous", "PrevAnswer", CStr(PrevAnswer)
        SaveSetting App.Title, "Previous", "PrevEntry", CStr(PrevEntry)

        'Logarithm base
        SaveSetting App.Title, "Settings", "LogBase", txtLogBase.Text

        'Angle mode
        For i = 0 To 1
            If optAngMode(i).Value = True Then
                SaveSetting App.Title, "Settings", "AngMode", CStr(i)
            End If
        Next i

        'Decimals
        SaveSetting App.Title, "Settings", "Decimals", txtDecimal.Text

        'Base mode
        For i = 0 To 3
            If optBaseMode(i).Value = True Then
                SaveSetting App.Title, "Settings", "BaseMode", CStr(i)
            End If
        Next i

        'Window state (maximized, minimized, or normal)
        SaveSetting App.Title, "Settings", "WinState", Me.WindowState

        'Font
        SaveSetting App.Title, "Text", "Font", txtEntry.Font

        'Font style
        If txtEntry.FontBold Then
            RegTemp = RegTemp + "B"
        End If
        If txtEntry.FontItalic Then
            RegTemp = RegTemp + "I"
        End If
        If RegTemp = "" Then
            RegTemp = "R"
        End If
        SaveSetting App.Title, "Text", "Style", RegTemp

        'Font size
        SaveSetting App.Title, "Text", "Size", CStr(CInt(txtEntry.FontSize))

        'Font underline
        SaveSetting App.Title, "Text", "Underline", txtEntry.FontUnderline

        'Font strikethrough
        SaveSetting App.Title, "Text", "Strikethru", txtEntry.FontStrikethru

        'Font color
        SaveSetting App.Title, "Text", "Forecolor", txtEntry.ForeColor

        'Font background color
        SaveSetting App.Title, "Text", "Backcolor", txtEntry.BackColor
    End If

End Sub

Private Sub LoadFormSettings()
Dim i As Long
Dim RegTemp As String

    '*******************************
    'Load the settings from Registry
    '*******************************

    'Previous answer / entry
    PrevAnswer = CDbl(GetSetting(App.Title, "Previous", "PrevAnswer", "0"))
    PrevEntry = GetSetting(App.Title, "Previous", "PrevEntry")

    'Logarithm base
    txtLogBase.Text = GetSetting(App.Title, "Settings", "LogBase", "10")

    'Angle mode
    i = CInt(GetSetting(App.Title, "Settings", "AngMode", "0"))
    optAngMode(i).Value = True

    'Decimals
    txtDecimal.Text = GetSetting(App.Title, "Settings", "Decimals", "F")
    If txtDecimal.Text <> "F" Then
        vsbDecimal.Value = Abs(Val(txtDecimal.Text) - 10)
    End If

    'Base mode
    i = CInt(GetSetting(App.Title, "Settings", "BaseMode", "0"))
    optBaseMode(i).Value = True

    'Window state (maximized, minimized, or normal)
    Me.WindowState = GetSetting(App.Title, "Settings", "WinState", "2")

    'Font
    RegTemp = GetSetting(App.Title, "Text", "Font", "MS Sans Serif")
    txtEntry.Font = RegTemp
    txtAnswer.Font = RegTemp

    'Font style
    RegTemp = GetSetting(App.Title, "Text", "Style", "R")
    Select Case RegTemp
        Case "R"
            txtEntry.FontBold = False
            txtEntry.FontItalic = False
            txtAnswer.FontBold = False
            txtAnswer.FontItalic = False
        Case "I"
            txtEntry.FontBold = False
            txtEntry.FontItalic = True
            txtAnswer.FontBold = False
            txtAnswer.FontItalic = True
        Case "B"
            txtEntry.FontBold = True
            txtEntry.FontItalic = False
            txtAnswer.FontBold = True
            txtAnswer.FontItalic = False
        Case "BI"
            txtEntry.FontBold = True
            txtEntry.FontItalic = True
            txtAnswer.FontBold = True
            txtAnswer.FontItalic = True
    End Select

    'Font size
    i = GetSetting(App.Title, "Text", "Size", "8")
    txtEntry.FontSize = i
    txtAnswer.FontSize = i

    'Font underline
    RegTemp = GetSetting(App.Title, "Text", "Underline", "False")
    Select Case RegTemp
        Case "False"
            txtEntry.FontUnderline = False
            txtAnswer.FontUnderline = False
        Case "True"
            txtEntry.FontUnderline = True
            txtAnswer.FontUnderline = True
    End Select

    'Font strikethrough
    RegTemp = GetSetting(App.Title, "Text", "Strikethru", "False")
    Select Case RegTemp
        Case "False"
            txtEntry.FontStrikethru = False
            txtAnswer.FontStrikethru = False
        Case "True"
            txtEntry.FontStrikethru = True
            txtAnswer.FontStrikethru = True
    End Select

    'Font color
    i = Val(GetSetting(App.Title, "Text", "Forecolor", "-2147483640"))
    txtEntry.ForeColor = i
    txtAnswer.ForeColor = i

    'Font background color
    i = Val(GetSetting(App.Title, "Text", "Backcolor", "-2147483643"))
    txtEntry.BackColor = i
    txtAnswer.BackColor = i

End Sub
