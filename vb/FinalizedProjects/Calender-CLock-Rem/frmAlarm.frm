VERSION 5.00
Begin VB.Form frmAlarm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Alarm"
   ClientHeight    =   5520
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4215
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5520
   ScaleWidth      =   4215
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtDesc 
      BackColor       =   &H8000000F&
      Height          =   1575
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   4
      Top             =   3360
      Width           =   3975
   End
   Begin VB.PictureBox picHook 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   3000
      ScaleHeight     =   31
      ScaleMode       =   3  'Píxel
      ScaleWidth      =   31
      TabIndex        =   8
      Top             =   2040
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2880
      TabIndex        =   7
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton cmdCalendar 
      Caption         =   "&Show calendar"
      Height          =   375
      Left            =   1560
      TabIndex        =   6
      Top             =   5040
      Width           =   1335
   End
   Begin VB.CommandButton cmdTerminate 
      Caption         =   "&Terminate"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Timer tmrBlink 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   1080
      Top             =   600
   End
   Begin VB.ListBox lstAppt 
      Height          =   1230
      Left            =   120
      TabIndex        =   2
      Top             =   1800
      Width           =   3975
   End
   Begin VB.Timer tmrAlarmCheck 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   600
      Top             =   600
   End
   Begin VB.Label lblDesc 
      Caption         =   "Description:"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   3120
      Width           =   975
   End
   Begin VB.Label lblActivated 
      Caption         =   "Alarm activated due to the following reminder(s):"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   3495
   End
   Begin VB.Label lblAlarm 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "ALARM"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1095
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   3975
   End
   Begin VB.Menu mnuPop 
      Caption         =   ""
      Visible         =   0   'False
      Begin VB.Menu mnuOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
End
Attribute VB_Name = "frmAlarm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Descs() As String

Private Sub cmdCalendar_Click()
  tmrBlink.Enabled = False
  Me.Hide
  frmMain.SetView True
End Sub

Private Sub cmdOK_Click()
  tmrBlink.Enabled = False
  Me.Hide
  AddToTray
End Sub

Private Sub cmdTerminate_Click()
  If MsgBox("If you terminate this program, the alarm system will not work." + vbCrLf + "Continue?", vbQuestion + vbYesNo) = vbNo Then Exit Sub
  SaveAppt
  End
End Sub

Private Sub Form_Load()
  On Error Resume Next
  Load frmMain
  On Error GoTo 0
  With tmrAlarmCheck
    .Interval = (60 - Second(Now)) * 1000
    .Enabled = True
  End With
End Sub

Private Sub lstAppt_Click()
  txtDesc.Text = Descs(lstAppt.ListIndex)
End Sub

Private Sub mnuExit_Click()
  cmdTerminate_Click
End Sub

Private Sub mnuOpen_Click()
  cmdCalendar_Click
End Sub

Private Sub picHook_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Select Case X
    Case WM_LBUTTONDBLCLK
      cmdCalendar_Click
    Case WM_RBUTTONUP
      PopupMenu mnuPop
  End Select
End Sub

Private Sub tmrAlarmCheck_Timer()
  Dim i As Long, MaxBound As Long, LimBound As Long, DelEd As Long
  Dim Current As Date
  Dim Resp() As Long

  Current = Now()
  TheresAppt Resp, Day(Current), Month(Current), Year(Current), False, True  ' True, True
  MaxBound = UBound(Resp)
  If MaxBound Then
    ReDim Descs(MaxBound - 1)
    lstAppt.Clear
    For i = 1 To MaxBound
      With Appt(Resp(i))
        If .AlarmType = Delete Then
          LimBound = LimBound + 1
          lstAppt.AddItem .ApptName + " (deleted)"
        Else
          lstAppt.AddItem .ApptName
        End If
        Descs(i - 1) = .Description
        .Act = True
      End With
    Next i
    MaxBound = UBound(Appt)
    i = 1
    Do Until i > MaxBound
      If Appt(i).Act Then
        If Appt(i).AlarmType = Delete Then
          RemoveAppt i
          MaxBound = MaxBound - 1
          DelEd = DelEd + 1
          If DelEd = LimBound Then Exit Do
        Else
          Appt(i).Act = False
          i = i + 1
        End If
      Else
        i = i + 1
      End If
    Loop
    txtDesc.Text = ""
    Me.Show
    Beep
    tmrBlink.Enabled = True
    RemoveFromTray
    SetWindowPos hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE
    SetWindowPos hWnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE
    If LimBound Then frmMain.LoadAppt
  End If
  tmrAlarmCheck.Interval = (60 - Second(Now)) * 1000 '60000 - (Ticks() - IniTicks)
End Sub

Private Sub tmrBlink_Timer()
  If lblAlarm.ForeColor = vbRed Then lblAlarm.ForeColor = vbBlue Else lblAlarm.ForeColor = vbRed
End Sub
