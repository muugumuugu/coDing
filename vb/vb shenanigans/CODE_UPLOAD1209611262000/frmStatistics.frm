VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmStatistics 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Statistics"
   ClientHeight    =   5745
   ClientLeft      =   30
   ClientTop       =   630
   ClientWidth     =   8415
   Icon            =   "frmStatistics.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   383
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdAnalyse 
      Caption         =   "Analyse"
      Enabled         =   0   'False
      Height          =   348
      Left            =   1920
      TabIndex        =   48
      Top             =   1920
      Width           =   1095
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   348
      Left            =   3360
      TabIndex        =   47
      Top             =   1920
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog cdgList 
      Left            =   120
      Top             =   1920
      _ExtentX        =   688
      _ExtentY        =   688
      _Version        =   393216
      CancelError     =   -1  'True
      FileName        =   "*.csd"
      Filter          =   "CSD Files (*.csd)|*.csd|Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
      InitDir         =   "App.Path"
   End
   Begin VB.Frame fraBW 
      Caption         =   "Box-and-Whisker Plot"
      Height          =   5175
      Left            =   6480
      TabIndex        =   35
      Top             =   120
      Width           =   1815
      Begin VB.Label lblNotFive 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Five entries in the list are required for a box-and-whisker plot."
         Height          =   852
         Left            =   120
         TabIndex        =   45
         Top             =   360
         Visible         =   0   'False
         Width           =   1572
      End
      Begin VB.Label lblBW 
         Height          =   255
         Index           =   6
         Left            =   960
         TabIndex        =   44
         Top             =   4680
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.Label lblBW 
         Height          =   255
         Index           =   5
         Left            =   960
         TabIndex        =   43
         Top             =   480
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.Label lblOutlier 
         Alignment       =   2  'Center
         Caption         =   "*"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   42
         Top             =   4800
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.Label lblBW 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "max X"
         Height          =   192
         Index           =   4
         Left            =   960
         TabIndex        =   41
         Top             =   4920
         Visible         =   0   'False
         Width           =   432
      End
      Begin VB.Label lblBW 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Q3"
         Height          =   192
         Index           =   3
         Left            =   960
         TabIndex        =   40
         Top             =   3960
         Visible         =   0   'False
         Width           =   204
      End
      Begin VB.Label lblBW 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Median"
         Height          =   192
         Index           =   2
         Left            =   960
         TabIndex        =   39
         Top             =   2640
         Visible         =   0   'False
         Width           =   540
      End
      Begin VB.Label lblBW 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Q1"
         Height          =   192
         Index           =   1
         Left            =   960
         TabIndex        =   38
         Top             =   1320
         Visible         =   0   'False
         Width           =   204
      End
      Begin VB.Label lblOutlier 
         Alignment       =   2  'Center
         Caption         =   "*"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   37
         Top             =   210
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.Label lblBW 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "min X"
         Height          =   192
         Index           =   0
         Left            =   960
         TabIndex        =   36
         Top             =   240
         Visible         =   0   'False
         Width           =   384
      End
      Begin VB.Line linLine 
         Index           =   6
         Visible         =   0   'False
         X1              =   480
         X2              =   480
         Y1              =   4080
         Y2              =   4920
      End
      Begin VB.Line linLine 
         Index           =   0
         Visible         =   0   'False
         X1              =   480
         X2              =   480
         Y1              =   360
         Y2              =   1440
      End
      Begin VB.Line linLine 
         Index           =   5
         Visible         =   0   'False
         X1              =   720
         X2              =   240
         Y1              =   4080
         Y2              =   4080
      End
      Begin VB.Line linLine 
         Index           =   4
         Visible         =   0   'False
         X1              =   720
         X2              =   240
         Y1              =   2760
         Y2              =   2760
      End
      Begin VB.Line linLine 
         Index           =   3
         Visible         =   0   'False
         X1              =   720
         X2              =   240
         Y1              =   1440
         Y2              =   1440
      End
      Begin VB.Line linLine 
         Index           =   2
         Visible         =   0   'False
         X1              =   720
         X2              =   720
         Y1              =   1440
         Y2              =   4080
      End
      Begin VB.Line linLine 
         Index           =   1
         Visible         =   0   'False
         X1              =   240
         X2              =   240
         Y1              =   1440
         Y2              =   4080
      End
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   8
      Left            =   240
      Locked          =   -1  'True
      TabIndex        =   33
      Top             =   4200
      Width           =   1332
   End
   Begin VB.Frame fraList 
      Caption         =   "List (delimited by commas)"
      Height          =   1572
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6132
      Begin VB.TextBox txtList 
         Height          =   972
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   360
         Width           =   5652
      End
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   14
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   31
      Top             =   4920
      Width           =   1332
   End
   Begin MSComctlLib.StatusBar stbStatus 
      Align           =   2  'Align Bottom
      Height          =   252
      Left            =   0
      TabIndex        =   30
      Top             =   5484
      Width           =   8412
      _ExtentX        =   14843
      _ExtentY        =   450
      Style           =   1
      SimpleText      =   "Enter list delimited by commas"
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   15
      Left            =   4920
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   29
      Top             =   4920
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   13
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   28
      Top             =   4920
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   12
      Left            =   240
      Locked          =   -1  'True
      TabIndex        =   27
      Top             =   4920
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   11
      Left            =   4920
      Locked          =   -1  'True
      TabIndex        =   26
      Top             =   4200
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   10
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   21
      Top             =   4200
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   9
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   20
      Top             =   4200
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   7
      Left            =   4920
      Locked          =   -1  'True
      TabIndex        =   19
      Top             =   3480
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   6
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   18
      Top             =   3480
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   5
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   17
      Top             =   3480
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   4
      Left            =   240
      Locked          =   -1  'True
      TabIndex        =   16
      Top             =   3480
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   3
      Left            =   4920
      Locked          =   -1  'True
      TabIndex        =   15
      Top             =   2760
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   2
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   14
      Top             =   2760
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   1
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   2760
      Width           =   1332
   End
   Begin VB.TextBox txtStat 
      Height          =   288
      Index           =   0
      Left            =   240
      Locked          =   -1  'True
      TabIndex        =   12
      Top             =   2760
      Width           =   1332
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   555
      Left            =   0
      TabIndex        =   46
      Top             =   0
      Width           =   8415
      _ExtentX        =   14843
      _ExtentY        =   979
      ButtonWidth     =   609
      ButtonHeight    =   820
      Appearance      =   1
      _Version        =   393216
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Standard Error:"
      Height          =   195
      Index           =   8
      Left            =   120
      TabIndex        =   34
      Top             =   3960
      Width           =   1080
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Range:"
      Height          =   195
      Index           =   5
      Left            =   1680
      TabIndex        =   32
      Top             =   3240
      Width           =   525
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Deviations:"
      Height          =   195
      Index           =   15
      Left            =   4800
      TabIndex        =   25
      Top             =   4680
      Width           =   810
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Mode:"
      Height          =   195
      Index           =   1
      Left            =   1680
      TabIndex        =   24
      Top             =   2520
      Width           =   450
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Interquartile Range:"
      Height          =   195
      Index           =   14
      Left            =   3240
      TabIndex        =   23
      Top             =   4680
      Width           =   1395
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Variance"
      Height          =   195
      Index           =   6
      Left            =   3240
      TabIndex        =   22
      Top             =   3240
      Width           =   645
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Q3:"
      Height          =   195
      Index           =   12
      Left            =   120
      TabIndex        =   10
      Top             =   4680
      Width           =   240
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "max X:"
      Height          =   195
      Index           =   13
      Left            =   1680
      TabIndex        =   11
      Top             =   4680
      Width           =   465
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Median:"
      Height          =   195
      Index           =   11
      Left            =   4800
      TabIndex        =   9
      Top             =   3960
      Width           =   570
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Q1:"
      Height          =   195
      Index           =   10
      Left            =   3240
      TabIndex        =   8
      Top             =   3960
      Width           =   240
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "min X:"
      Height          =   195
      Index           =   9
      Left            =   1680
      TabIndex        =   7
      Top             =   3960
      Width           =   420
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Sample Size (n):"
      Height          =   195
      Index           =   4
      Left            =   120
      TabIndex        =   6
      Top             =   3240
      Width           =   1170
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Standard Deviation:"
      Height          =   195
      Index           =   7
      Left            =   4800
      TabIndex        =   5
      Top             =   3240
      Width           =   1410
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Sum of X²:"
      Height          =   195
      Index           =   3
      Left            =   4800
      TabIndex        =   4
      Top             =   2520
      Width           =   705
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Sum of X:"
      Height          =   195
      Index           =   2
      Left            =   3240
      TabIndex        =   3
      Top             =   2520
      Width           =   660
   End
   Begin VB.Label lblStat 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Mean:"
      Height          =   195
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   2520
      Width           =   450
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileAnalyse 
         Caption         =   "&Analyse"
         Enabled         =   0   'False
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuFileClear 
         Caption         =   "&Clear"
         Shortcut        =   {F7}
      End
      Begin VB.Menu separator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSave 
         Caption         =   "&Save List"
         Enabled         =   0   'False
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open List"
         Shortcut        =   ^O
      End
      Begin VB.Menu separator2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileClose 
         Caption         =   "C&lose"
         Shortcut        =   ^X
      End
   End
End
Attribute VB_Name = "frmStatistics"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAnalyse_Click()

    'Call the clicking of the corresponding menu item
    mnuFileAnalyse_Click

End Sub

Private Sub cmdClear_Click()

    'Call the clicking of the corresponding menu item
    mnuFileClear_Click

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    'F5 = Analyse button
    If KeyCode = vbKeyF5 Then
        If cmdAnalyse.Enabled = True Then
            cmdAnalyse_Click
        End If

    'F7 = Clear button
    ElseIf KeyCode = vbKeyF7 Then
        cmdClear_Click
    End If

End Sub

Private Sub Form_Load()

    'Set form as always on top
    SetWindowPos Me.hwnd, HWND_TOPMOST, Me.Left / Screen.TwipsPerPixelX, Me.Top / Screen.TwipsPerPixelY, Me.Width / Screen.TwipsPerPixelX, Me.Height / Screen.TwipsPerPixelY, SWP_SHOWWINDOW

    'Increase window count
    WindowCount = WindowCount + 1

End Sub

Private Sub Form_Unload(Cancel As Integer)

    'Set focus to main form
    frmCalcSolver.SetFocus
    WindowCount = WindowCount - 1

    'Enable modally displayed form menu items
    If WindowCount = 0 Then
        frmCalcSolver.mnuEditOptions.Enabled = True
        frmCalcSolver.mnuMathConstants.Enabled = True
        frmCalcSolver.mnuHelpAbout.Enabled = True
    End If

End Sub

Private Sub mnuFileAnalyse_Click()
Dim i As Long

    'Show status bar text
    stbStatus.SimpleText = "Working..."

    'Set basic array dimensions
    ReDim MainArray(0)

    'Set basic variables for ExtractToken
    CurrentEntryIndex = 1
    InputString = txtList.Text

    'Get the first token and check to make
    'sure it is a number
    ExtractToken
    If OutputString = "Number" Then
        MainArray(0) = OutputValue
    Else
        ErrorHandler
        Exit Sub
    End If

    'Loop until end of string, checking for
    'correct placement of commas and numbers
    Do While CurrentEntryIndex < Len(InputString)

        'Check for comma
        If Mid(InputString, CurrentEntryIndex, 1) <> "," Then
            ErrorHandler
        End If

        'Check for number
        CurrentEntryIndex = CurrentEntryIndex + 1
        ExtractToken
        If OutputString = "Number" Then
            ReDim Preserve MainArray(UBound(MainArray) + 1)
            MainArray(UBound(MainArray)) = OutputValue
        Else
            ErrorHandler
            Exit Sub
        End If
    Loop

    stbStatus.SimpleText = ""

    'Call each statistic function
    txtStat(0).Text = Mean
    txtStat(1).Text = Mode
    txtStat(2).Text = SumX
    txtStat(3).Text = SumX2
    txtStat(4).Text = SS
    txtStat(5).Text = Range
    txtStat(6).Text = Variance
    txtStat(7).Text = SD
    txtStat(8).Text = "±" + CStr(SE)
    txtStat(9).Text = minX
    txtStat(11).Text = Median
    txtStat(13).Text = maxX
    txtStat(15).Text = Deviations

    'Display Box-and-Whisker plot
    If (UBound(MainArray) + 1) > 4 Then
        lblNotFive.Visible = False
        txtStat(10).Text = Q1
        txtStat(12).Text = Q3
        txtStat(14).Text = IR
        BoxWhisker
    Else
        For i = linLine.LBound To linLine.UBound
            linLine(i).Visible = False
        Next i
        lblOutlier(0).Visible = False
        lblOutlier(1).Visible = False
        For i = lblBW.LBound To lblBW.UBound
            lblBW(i).Visible = False
        Next i
        lblNotFive.Visible = True
        txtStat(10).Text = "N/A"
        txtStat(12).Text = "N/A"
        txtStat(14).Text = "N/A"
    End If

    'Show status bar text
    stbStatus.SimpleText = "Done"

End Sub

Private Sub mnuFileClear_Click()
Dim i As Integer

    'Clear list box first, and then the answers
    If txtList.Text <> "" Then
        txtList.Text = ""
    Else
        For i = txtStat.LBound To txtStat.UBound
            txtStat(i) = ""
        Next i
        For i = linLine.LBound To linLine.UBound
            linLine(i).Visible = False
        Next i
        lblOutlier(0).Visible = False
        lblOutlier(1).Visible = False
        For i = lblBW.LBound To lblBW.UBound
            lblBW(i).Visible = False
        Next i
        lblNotFive.Visible = False
    End If

End Sub

Private Sub mnuFileClose_Click()

    'Close Statistics form
    Unload Me

End Sub

Private Sub mnuFileOpen_Click()
On Error GoTo ErrorHandler
Dim FileNumber As Long
Dim ListString As String

    'Display Open dialog box
    cdgList.ShowOpen

    'Get data from file into text box
    ListString = ""
    FileNumber = FreeFile
    Open cdgList.FileName For Input As #FileNumber
        Do While Not EOF(FileNumber)
            Input #FileNumber, InputString
            ListString = ListString + InputString
        Loop
    Close #FileNumber
    txtList.Text = ListString
    txtList.SetFocus
    txtList.SelStart = Len(txtList.Text)

    'Display status of program
    stbStatus.SimpleText = "List data received from file: " + cdgList.FileName

    'Exit before error handler
    Exit Sub

ErrorHandler:

    'File not found
    If Err.Number = 53 Then

        'Display error message
        MsgBox "Error: File not found", vbInformation, "File not found"
        stbStatus.SimpleText = "File not found"
        Exit Sub
    End If

End Sub

Private Sub mnuFileSave_Click()
On Error GoTo ErrorHandler
Dim FileNumber As Long

    'Display Save Dialog Box
    cdgList.ShowSave

    'Write test box contents to file
    FileNumber = FreeFile
    Open cdgList.FileName For Output As #FileNumber
        Write #FileNumber, txtList.Text
    Close #FileNumber

    'Display status of program
    stbStatus.SimpleText = "List data written to file: " + cdgList.FileName

    'Exit before error handler
    Exit Sub

ErrorHandler:

    'Cancel was pressed
    If Err.Number = 32755 Then

        'Display status of program
        stbStatus.SimpleText = "List data not written to file"
        Exit Sub
    End If

End Sub

Private Sub txtList_Change()
Dim i As Long
Dim Count As Long

    'Disable Analyse button if no entered text
    If txtList.Text = "" Then
        cmdAnalyse.Enabled = False
        mnuFileAnalyse.Enabled = False
        mnuFileSave.Enabled = False

    'Enable Analyse button if text box contains something
    Else
        cmdAnalyse.Enabled = True
        mnuFileAnalyse.Enabled = True
        mnuFileSave.Enabled = True
    End If

End Sub

Private Sub ErrorHandler()

    'Display error message
    stbStatus.SimpleText = "Syntax Error"

End Sub

Private Sub BoxWhisker()
On Error GoTo ErrorHandler
Dim i As Integer
Dim NewLocation As Double
Dim Temp As Double
Dim Unit As Double

    'Hide plot temporarily
    For i = linLine.LBound To linLine.UBound
        linLine(i).Visible = False
    Next i
    lblOutlier(0).Visible = False
    lblOutlier(1).Visible = False
    For i = lblBW.LBound To lblBW.UBound
        lblBW(i).Visible = False
    Next i

    'Set basic unit for range (stretches out plot to fit)
    Unit = (linLine(6).Y2 - linLine(0).Y1) / Range

    'Q1 location
    NewLocation = linLine(0).Y1 + (Unit * (Q1 - InOrder(1)))
    linLine(0).Y2 = NewLocation
    linLine(3).Y1 = NewLocation
    linLine(3).Y2 = NewLocation
    linLine(1).Y1 = NewLocation
    linLine(2).Y1 = NewLocation
    lblBW(1).Top = NewLocation - (lblBW(1).Height / 2)

    'Median location
    NewLocation = linLine(0).Y1 + (Unit * (Median - InOrder(1)))
    linLine(4).Y1 = NewLocation
    linLine(4).Y2 = NewLocation
    lblBW(2).Top = NewLocation - (lblBW(2).Height / 2)

    'Q3 location
    NewLocation = linLine(0).Y1 + (Unit * (Q3 - InOrder(1)))
    linLine(1).Y2 = NewLocation
    linLine(2).Y2 = NewLocation
    linLine(5).Y1 = NewLocation
    linLine(5).Y2 = NewLocation
    linLine(6).Y1 = NewLocation
    lblBW(3).Top = NewLocation - (lblBW(3).Height / 2)

    'Check for minimum outlier
    NewLocation = 1.5 * (linLine(1).Y2 - linLine(1).Y1)
    If (linLine(0).Y2 - linLine(0).Y1) > NewLocation Then
        linLine(0).Y1 = linLine(1).Y1 - NewLocation
        lblBW(5).Top = linLine(1).Y1 - NewLocation - (lblBW(5).Height / 2)
        lblBW(5).Caption = CStr(1.5 * IR)
        lblBW(5).Visible = True
        lblOutlier(0).Visible = True
    End If

    'Check for maximum outlier
    If (linLine(6).Y2 - linLine(6).Y1) > NewLocation Then
        linLine(6).Y2 = linLine(1).Y2 + NewLocation
        lblBW(6).Top = linLine(1).Y2 + NewLocation - (lblBW(6).Height / 2)
        lblBW(6).Caption = CStr(1.5 * IR)
        lblBW(6).Visible = True
        lblOutlier(1).Visible = True
    End If

    'Display plot
    For i = linLine.LBound To linLine.UBound
        linLine(i).Visible = True
    Next i

    'Display labels
    For i = lblBW.LBound To 4
        lblBW(i).Visible = True
    Next i

    Exit Sub

ErrorHandler:

    'On error, clear the plot and exit the routine
    For i = linLine.LBound To linLine.UBound
        linLine(i).Visible = False
    Next i
    lblOutlier(0).Visible = False
    lblOutlier(1).Visible = False
    For i = lblBW.LBound To lblBW.UBound
        lblBW(i).Visible = False
    Next i

End Sub
