VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmASCII 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ASCII Pictures"
   ClientHeight    =   5400
   ClientLeft      =   36
   ClientTop       =   420
   ClientWidth     =   5856
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   7.2
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5400
   ScaleWidth      =   5856
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Light To Dark Creator"
      Height          =   252
      Left            =   120
      TabIndex        =   19
      Top             =   3120
      Width           =   5652
   End
   Begin VB.TextBox txtSize 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   1200
      MaxLength       =   3
      TabIndex        =   16
      Text            =   "1"
      Top             =   3600
      Width           =   372
   End
   Begin VB.CommandButton cmdMake 
      Caption         =   "Make ASCII Picture"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   120
      TabIndex        =   15
      Top             =   4440
      Width           =   5652
   End
   Begin VB.ComboBox cmbDetail 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      ItemData        =   "frmASCII.frx":0000
      Left            =   720
      List            =   "frmASCII.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   11
      Top             =   3960
      Width           =   732
   End
   Begin VB.TextBox txtL2D 
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   840
      TabIndex        =   9
      Top             =   2760
      Width           =   4932
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   120
      TabIndex        =   8
      Top             =   2760
      Width           =   612
   End
   Begin VB.ListBox lstL2D 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   816
      ItemData        =   "frmASCII.frx":0004
      Left            =   120
      List            =   "frmASCII.frx":0006
      TabIndex        =   7
      Top             =   1920
      Width           =   5652
   End
   Begin MSComDlg.CommonDialog cdBrowse 
      Left            =   0
      Top             =   720
      _ExtentX        =   677
      _ExtentY        =   677
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.CommandButton cmdASCIIBrowse 
      Caption         =   "Browse"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   5040
      TabIndex        =   5
      Top             =   1080
      Width           =   732
   End
   Begin VB.TextBox txtResult 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   1320
      TabIndex        =   4
      Top             =   1080
      Width           =   3612
   End
   Begin VB.CommandButton cmdPicBrowse 
      Caption         =   "Browse"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   5040
      TabIndex        =   2
      Top             =   600
      Width           =   732
   End
   Begin VB.TextBox txtSource 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   1320
      TabIndex        =   1
      Top             =   600
      Width           =   3612
   End
   Begin MSComctlLib.ProgressBar Progress 
      Height          =   372
      Left            =   120
      TabIndex        =   18
      Top             =   4440
      Width           =   5652
      _ExtentX        =   9970
      _ExtentY        =   656
      _Version        =   393216
      Appearance      =   1
      Scrolling       =   1
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "(1 Is Normal Size; Supports Decimals And #'s Under Zero)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   1680
      TabIndex        =   17
      Top             =   3600
      Width           =   4116
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   5880
      Y1              =   4320
      Y2              =   4320
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Picture Size × "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   120
      TabIndex        =   14
      Top             =   3600
      Width           =   996
   End
   Begin VB.Line Line3 
      X1              =   0
      X2              =   5880
      Y1              =   3480
      Y2              =   3480
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "(The Larger The Number, The Less The Detail)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   1560
      TabIndex        =   13
      Top             =   3960
      Width           =   3348
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Detail:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   120
      TabIndex        =   12
      Top             =   3720
      Width           =   456
   End
   Begin VB.Line Line2 
      X1              =   0
      X2              =   5880
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   $"frmASCII.frx":0008
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   432
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   5892
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Light To Dark Scale:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   120
      TabIndex        =   6
      Top             =   1680
      Width           =   1452
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "ASCII Result:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   924
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   5880
      Y1              =   480
      Y2              =   480
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Source Picture:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   1080
   End
End
Attribute VB_Name = "frmASCII"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAdd_Click()
    If txtL2D = "" Or txtL2D = vbNullString Then Exit Sub
    lstL2D.AddItem txtL2D
    
    Open AddSlash(App.Path) & "L2D" For Output As #3
        For i = 0 To lstL2D.ListCount - 1
            Print #3, lstL2D.List(i)
        Next i
    Close #3
End Sub

Private Sub cmdASCIIBrowse_Click()
On Error GoTo EndIt
    cdBrowse.DialogTitle = "Please Select Resulting ASCII Picture..."
    cdBrowse.Filter = "Text File (*.txt)|*.txt|Rich Text File (*.rtf)|*.rtf"
    cdBrowse.ShowSave
    txtResult = cdBrowse.FileName
EndIt:
End Sub

Private Sub cmdMake_Click()
    Dim bRem As Boolean
    Dim bColour As Boolean
    
    If UCase(GetExt(txtResult)) <> "RTF" Then
        If MsgBox("Add a reminder into the file so viewers will know what font to set notepad to?", vbYesNo + vbDefaultButton2, "Reminder?") = vbYes Then bRem = True Else bRem = False
    End If
    
    Make txtSource, txtResult, lstL2D.List(lstL2D.ListIndex), txtSize, cmbDetail.Text, bRem
    
End Sub

Private Sub cmdPicBrowse_Click()
On Error GoTo EndIt
    cdBrowse.DialogTitle = "Select A Picture..."
    cdBrowse.Filter = "All Picture Files|*.bmp;*.jpg;*.jpeg;*.gif;*.ico;*.cur|All Files (*.*)|*.*"
    cdBrowse.ShowOpen
    txtSource = cdBrowse.FileName
EndIt:
End Sub

Private Sub Command1_Click()
    Load frmL2D
End Sub

Private Sub Form_Load()
On Error Resume Next
    Dim i As Byte
    Dim strTemp As String
    
    'Detail Combo
    For i = 1 To 200
        cmbDetail.AddItem i
    Next i
    
    'Light To Dark List
    Open AddSlash(App.Path) & "L2D" For Input As #2
        Do
            Line Input #2, strTemp
            lstL2D.AddItem strTemp
        Loop Until EOF(2)
    Close #2
    
    
    'Set Combo/List Defaults
    cmbDetail.ListIndex = 9
    txtSize = 1
    lstL2D.ListIndex = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub txtSource_Change()
On Error Resume Next
    txtResult = Mid(txtSource, 1, Len(txtSource) - Len(GetExt(txtSource)) - 1) & ".txt"
End Sub
