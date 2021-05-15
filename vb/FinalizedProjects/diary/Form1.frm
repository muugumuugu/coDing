VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Diary"
   ClientHeight    =   5970
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8550
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5970
   ScaleWidth      =   8550
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command6 
      Enabled         =   0   'False
      Height          =   375
      Left            =   3000
      TabIndex        =   5
      Top             =   4200
      Width           =   855
   End
   Begin VB.CommandButton Command5 
      Enabled         =   0   'False
      Height          =   375
      Left            =   3000
      TabIndex        =   6
      Top             =   4680
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Enabled         =   0   'False
      Height          =   375
      Left            =   3000
      TabIndex        =   4
      Top             =   3720
      Width           =   855
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   6360
      Top             =   2640
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   6960
      Top             =   2640
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   27.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   2880
      ScaleHeight     =   1215
      ScaleWidth      =   5055
      TabIndex        =   10
      Top             =   720
      Width           =   5055
   End
   Begin VB.CommandButton Command3 
      Enabled         =   0   'False
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   3240
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Enabled         =   0   'False
      Height          =   375
      Left            =   3000
      TabIndex        =   2
      Top             =   2760
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Enabled         =   0   'False
      Height          =   375
      Left            =   3000
      TabIndex        =   1
      Top             =   2280
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C00000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   6015
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2775
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "Minimize"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4200
      TabIndex        =   15
      Top             =   4320
      Width           =   915
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4200
      TabIndex        =   14
      Top             =   4800
      Width           =   390
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Calculator"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4200
      TabIndex        =   13
      Top             =   3360
      Width           =   1065
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Muku"
      Height          =   195
      Left            =   3600
      TabIndex        =   12
      Top             =   5400
      Width           =   405
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Warning:-All rights reserved to "
      Height          =   195
      Left            =   2880
      TabIndex        =   11
      Top             =   5160
      Width           =   2160
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "About"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4200
      TabIndex        =   9
      Top             =   3840
      Width           =   615
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Memo"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4200
      TabIndex        =   8
      Top             =   2880
      Width           =   645
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "PhoneBook"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4200
      TabIndex        =   7
      Top             =   2400
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Sub TextEffect(obj As Object, ByVal sText As String, ByVal lX As Long, _
ByVal lY As Long, Optional ByVal bLoop As Boolean = False, Optional ByVal _
lStartSpacing As Long = 128, Optional ByVal lEndSpacing As Long = -1, Optional _
ByVal oColor As OLE_COLOR = vbWindowText)
Dim lhDC As Long
Dim i As Long
Dim x As Long
Dim lLen As Long
Dim hBrush As Long
Static tR As RECT
Dim iDir As Long
Dim bNotFirstTime As Boolean
Dim lTime As Long
Dim lIter As Long
Dim bSlowDown As Boolean
Dim lCOlor As Long
Dim bDoIt As Boolean
lhDC = obj.hdc
iDir = -1
i = lStartSpacing
tR.Left = lX: tR.Top = lY: tR.Right = lX: tR.Bottom = lY
OleTranslateColor oColor, 0, lCOlor
hBrush = CreateSolidBrush(GetSysColor(COLOR_BTNFACE))
lLen = Len(sText)
SetTextColor lhDC, lCOlor
bDoIt = True
Do While bDoIt
lTime = timeGetTime
If (i < -3) And Not (bLoop) And Not (bSlowDown) Then
bSlowDown = True
iDir = 1
lIter = (i + 4)
End If
If (i > 128) Then iDir = -1
If Not (bLoop) And iDir = 1 Then
If (i = lEndSpacing) Then
bDoIt = False
Else
lIter = lIter - 1
If (lIter <= 0) Then
i = i + iDir
lIter = (i + 4)
End If
End If
Else
i = i + iDir
End If
FillRect lhDC, tR, hBrush
x = 32 - (i * lLen)
SetTextCharacterExtra lhDC, i
DrawText lhDC, sText, lLen, tR, DT_CALCRECT
tR.Right = tR.Right + 4
If (tR.Right > obj.ScaleWidth \ Screen.TwipsPerPixelX) Then tR.Right = _
obj.ScaleWidth \ Screen.TwipsPerPixelX
DrawText lhDC, sText, lLen, tR, DT_LEFT
obj.Refresh
Do
DoEvents
If obj.Visible = False Then Exit Sub
Loop While (timeGetTime - lTime) < 20
Loop
DeleteObject hBrush
End Sub
Private Sub Command1_Click()
frmPhone.Show
Unload Me
End Sub
Private Sub Command2_Click()
Form2.Show
End Sub

Private Sub Command3_Click()
Form3.Show
End Sub

Private Sub Command4_Click()
Form4.Show
End Sub

Private Sub Command5_Click()
End
End Sub

Private Sub Command6_Click()
Form1.WindowState = 1
End Sub

Private Sub Form_Load()
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
Call TextEffect(Picture1, "Diary.", 20, 20, False, 128, -1, vbBlue)
Timer2.Enabled = True
Command1.Enabled = True
Command2.Enabled = True
Command3.Enabled = True
Command4.Enabled = True
Command5.Enabled = True
Command6.Enabled = True
End Sub

Private Sub Timer2_Timer()
Timer1.Enabled = False
End Sub
