VERSION 5.00
Begin VB.Form frmInterval 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Interval Settings"
   ClientHeight    =   1875
   ClientLeft      =   2490
   ClientTop       =   3255
   ClientWidth     =   4590
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1875
   ScaleWidth      =   4590
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2760
      TabIndex        =   9
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1200
      TabIndex        =   8
      Top             =   1320
      Width           =   1335
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   3000
      TabIndex        =   7
      Text            =   "Text4"
      Top             =   720
      Width           =   1095
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   3000
      TabIndex        =   5
      Text            =   "Text3"
      Top             =   240
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   720
      TabIndex        =   3
      Text            =   "Text2"
      Top             =   720
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   720
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label Label4 
      Caption         =   "Y max:"
      Height          =   255
      Left            =   2400
      TabIndex        =   6
      Top             =   720
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Y min:"
      Height          =   255
      Left            =   2400
      TabIndex        =   4
      Top             =   240
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "X max:"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "X min:"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   735
   End
End
Attribute VB_Name = "frmInterval"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
pLeft = Text1.Text
pRight = Text2.Text
pBottom = Text3.Text
pTop = Text4.Text
ReDraw
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Text1.Text = Trim(Str(pLeft))
Text2.Text = Trim(Str(pRight))
Text3.Text = Trim(Str(pBottom))
Text4.Text = Trim(Str(pTop))

End Sub
