VERSION 5.00
Begin VB.Form frmWait 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Please wait..."
   ClientHeight    =   855
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3270
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   855
   ScaleWidth      =   3270
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   2880
      Top             =   240
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Loading... Please wait"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   0
      TabIndex        =   1
      Top             =   120
      Width           =   3255
   End
   Begin VB.Label Label1 
      Caption         =   "lllllllllllllll"
      BeginProperty Font 
         Name            =   "Wingdings"
         Size            =   9.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   480
      TabIndex        =   0
      Top             =   480
      Width           =   2355
   End
End
Attribute VB_Name = "frmWait"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
On Error Resume Next

    Me.left = (frmMain.ScaleWidth - Me.Width) \ 2
    Me.top = (frmMain.ScaleHeight - Me.Height) \ 2

    Me.Visible = True
    Me.SetFocus
    
    DoEvents
    
    Timer1.Tag = 15
    Timer1.Interval = 50
    Timer1.Enabled = True
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
Timer1.Enabled = False
End Sub

Private Sub Timer1_Timer()
With Timer1

If Val(.Tag) < 15 Then
.Tag = Val(.Tag) + 1
Label1.Caption = Label1.Caption & "l"
Else
Label1.Caption = "l"
.Tag = 1
End If

End With

DoEvents
End Sub
