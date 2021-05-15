VERSION 5.00
Begin VB.Form frmEval 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Evaluate function"
   ClientHeight    =   2610
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4320
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2610
   ScaleWidth      =   4320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Calculate"
      Height          =   375
      Left            =   2880
      TabIndex        =   9
      Top             =   240
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   375
      Left            =   2880
      TabIndex        =   8
      Top             =   840
      Width           =   1335
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   840
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   2040
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   840
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   1440
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   840
      TabIndex        =   3
      Top             =   840
      Width           =   1575
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   840
      TabIndex        =   1
      Top             =   240
      Width           =   1575
   End
   Begin VB.Label Label4 
      Caption         =   "f' (x)"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   2040
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "f(x)="
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   1440
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "X="
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Function:"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "frmEval"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Command2_Click()
On Error GoTo errr
Dim expression As String
expression = EditedEqu(Combo1.Text)
Call frmMain.Init(expression)
math.Error = False
Dim x As Double, y As Double, x1 As Double, x2 As Double, y1 As Double, y2 As Double
x = Stringval(Text1.Text)
Text2.Text = Trim(Str(Round(GetVal(x, 0), 8)))
x1 = x - 0.000001
x2 = x + 0.000001
y1 = GetVal(x1, 0)
y2 = GetVal(x2, 0)
'y = Stringval(expression, x)
'slope1 = (y2 - y) / (x2 - x)
'slope2 = (y - y1) / (x - x1)
slope = (y2 - y1) / (x2 - x1) '(slope1 + slope2) / 2
If Abs(slope) < 1 Then
slope = Round(slope, 8)
ElseIf Abs(slope) < 10 Then
slope = Round(slope, 6)
ElseIf Abs(slope) < 100 Then
slope = Round(slope, 3)
ElseIf Abs(slope) < 1000 Then
slope = Round(slope, 1)
Else
slope = Round(slope, 0)
End If
Text3.Text = Trim(Str(slope))
If math.Error = True Then GoTo errr
Exit Sub
errr:
Text2.Text = "Error"
Text3.Text = "Error"
Exit Sub
End Sub

Private Sub Form_Load()
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
Combo1.AddItem AllFunctions(i).expression1
End If
Next
End Sub
