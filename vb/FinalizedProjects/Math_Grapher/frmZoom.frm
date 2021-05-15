VERSION 5.00
Begin VB.Form frmZoom 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Zoom"
   ClientHeight    =   2430
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4290
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2430
   ScaleWidth      =   4290
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.OptionButton Option4 
      Caption         =   "Normal"
      Height          =   495
      Left            =   1440
      TabIndex        =   8
      Top             =   50
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2640
      TabIndex        =   6
      Top             =   2040
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1320
      TabIndex        =   5
      Top             =   2040
      Width           =   1215
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "frmZoom.frx":0000
      Left            =   2520
      List            =   "frmZoom.frx":0016
      TabIndex        =   4
      Top             =   1605
      Width           =   1335
   End
   Begin VB.OptionButton Option3 
      Caption         =   "Custom"
      Height          =   375
      Left            =   1440
      TabIndex        =   3
      Top             =   1560
      Value           =   -1  'True
      Width           =   1575
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Whole graph"
      Height          =   375
      Left            =   1440
      TabIndex        =   2
      Top             =   1080
      Width           =   1335
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Graph width"
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   600
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "%"
      Height          =   255
      Left            =   3960
      TabIndex        =   7
      Top             =   1635
      Width           =   375
   End
   Begin VB.Label Label1 
      Caption         =   "Zoom to :"
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "frmZoom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Combo1_KeyPress(KeyAscii As Integer)
Option3.Value = True
End Sub

Private Sub Command1_Click()
Dim d As String
If Stringval(Combo1.Text) < 20 Or Stringval(Combo1.Text) > 250 Then
d = MsgBox("Please set the zoom between 20 and 250.", vbCritical)
Exit Sub
End If
zoom = Stringval(Combo1.Text) / 100
frmMain.PicHruler.Width = 8000 * zoom
frmMain.PicVruler.Height = 8000 * zoom
frmMain.Picgraph.Width = frmMain.PicHruler.Width
frmMain.Picgraph.Height = frmMain.PicVruler.Height
Call frmMain.resizecontrols
ReDraw
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Combo1.Text = Trim(Str(zoom * 100))
End Sub

Private Sub Option1_Click()
Combo1.Text = Str(Int(frmMain.Fragraph.Width / 8000 * 100))
End Sub

Private Sub Option2_Click()
Dim a As Double, b As Double, c As Double
a = (frmMain.Fragraph.Height / 8000) * 100
b = (frmMain.Fragraph.Width / 8000) * 100
If a < b Then c = a Else: c = b
Combo1.Text = Str(Int(c))

End Sub

Private Sub Option4_Click()
Combo1.Text = "100"
End Sub
