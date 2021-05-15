VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   1065
   ClientLeft      =   120
   ClientTop       =   120
   ClientWidth     =   2745
   ControlBox      =   0   'False
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1065
   ScaleWidth      =   2745
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   45
      TabIndex        =   7
      Top             =   795
      Width           =   210
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   1245
      Locked          =   -1  'True
      TabIndex        =   5
      Text            =   "0"
      ToolTipText     =   "Tone Duration"
      Top             =   465
      Width           =   795
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   270
      Left            =   2040
      Max             =   0
      Min             =   10000
      TabIndex        =   4
      Top             =   465
      Width           =   225
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   840
      Max             =   0
      Min             =   10000
      TabIndex        =   3
      Top             =   465
      Width           =   225
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   45
      Locked          =   -1  'True
      TabIndex        =   2
      Text            =   "0"
      ToolTipText     =   "Cursor Movement Detection"
      Top             =   465
      Width           =   795
   End
   Begin VB.Timer Timer1 
      Left            =   3090
      Top             =   705
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Only Play Sound On Mouse Move"
      Height          =   195
      Left            =   270
      TabIndex        =   8
      Top             =   795
      Width           =   2400
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Interval"
      Height          =   180
      Left            =   1260
      TabIndex        =   6
      ToolTipText     =   "Tone Duration"
      Top             =   270
      Width           =   645
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Interval"
      Height          =   180
      Left            =   60
      TabIndex        =   1
      ToolTipText     =   "Cursor Movement Detection"
      Top             =   270
      Width           =   645
   End
   Begin VB.Label Label1 
      BackColor       =   &H00000000&
      Caption         =   " Musical Screen"
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1365
   End
   Begin VB.Menu main 
      Caption         =   "main"
      Visible         =   0   'False
      Begin VB.Menu SendToCorner 
         Caption         =   "Send To Corner"
         Shortcut        =   ^C
      End
      Begin VB.Menu KeepOnTop 
         Caption         =   "Keep On Top"
         Shortcut        =   ^T
      End
      Begin VB.Menu nutin 
         Caption         =   "-"
      End
      Begin VB.Menu Exit 
         Caption         =   "Exit"
         Shortcut        =   ^E
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SendMessage Lib "User32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Sub ReleaseCapture Lib "User32" ()
Private Declare Function GetCursorPos Lib "User32" (lpPoint As POINTAPI) As Long
Private Declare Function Beep Lib "kernel32" (ByVal dwFreq As Long, ByVal dwDuration As Long) As Long
Private Declare Sub SetWindowPos Lib "User32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Const WM_NCLBUTTONDOWN = &HA1
Const HTCAPTION = 2
Const HWND_TOPMOST = -1
Const HWND_NOTOPMOST = -2
Const SWP_NOSIZE = &H1
Const SWP_NOMOVE = &H2
Const SWP_NOACTIVATE = &H10
Const SWP_SHOWWINDOW = &H40

Dim Pt As POINTAPI
Dim OldX As Long
Dim OldY As Long




Private Sub Exit_Click()
Unload Me
End
End Sub

Private Sub Form_Load()
SendBottomRight Form1
End Sub

Private Sub KeepOnTop_Click()
KeepOnTop.Checked = Not KeepOnTop.Checked

If KeepOnTop.Checked = True Then
SetWindowPos Me.hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE
Else
SetWindowPos Me.hWnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE
End If

End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)


Call ReleaseCapture
SendMessage Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub



Private Sub Label1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbRightButton Then PopupMenu main
End Sub

Private Sub SendToCorner_Click()
SendBottomRight Form1
End Sub

Private Sub Timer1_Timer()
GetCursorPos Pt


If Check1.Value = 1 Then
If Pt.X <> OldX Then
If Pt.Y <> OldY Then
Beep Pt.X + Pt.Y, Text2.Text
End If
End If
End If

If Check1.Value = 0 Then
Beep Pt.X + Pt.Y, Text2.Text
End If



OldX = Pt.X
OldY = Pt.Y

End Sub

Private Sub VScroll1_Change()
Text1.Text = VScroll1.Value
Timer1.Interval = VScroll1.Value
End Sub

Private Sub VScroll2_Change()
Text2.Text = VScroll2.Value
End Sub
