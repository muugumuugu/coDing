VERSION 5.00
Begin VB.Form frmEval 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Evaluate"
   ClientHeight    =   3150
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4320
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3150
   ScaleWidth      =   4320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   1080
      Locked          =   -1  'True
      TabIndex        =   12
      Top             =   2640
      Width           =   1575
   End
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
      Left            =   1080
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   2040
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1080
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   1440
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1080
      TabIndex        =   3
      Top             =   840
      Width           =   1575
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   1080
      TabIndex        =   1
      Top             =   240
      Width           =   1575
   End
   Begin VB.Line Line3 
      X1              =   480
      X2              =   420
      Y1              =   2880
      Y2              =   2940
   End
   Begin VB.Line Line2 
      X1              =   480
      X2              =   420
      Y1              =   2880
      Y2              =   2820
   End
   Begin VB.Line Line1 
      X1              =   360
      X2              =   480
      Y1              =   2880
      Y2              =   2880
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "x    x1"
      Height          =   255
      Left            =   240
      TabIndex        =   11
      Top             =   2760
      Width           =   615
   End
   Begin VB.Label Label5 
      Caption         =   "Lim      f(x)="
      Height          =   495
      Left            =   120
      TabIndex        =   10
      Top             =   2640
      Width           =   855
   End
   Begin VB.Label Label4 
      Caption         =   "f' (x1)="
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   2040
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "f(x1)="
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   1440
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "x1="
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
Option Explicit
Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Command2_Click()
If IsValid(EditedEqu(Combo1.Text), True, False, False) = False Then MsgBox ("Invalid expression"): Exit Sub
Dim expression As String
expression = EditedEqu(Combo1.Text)
Call frmMain.Init(expression)
Call frmMain.Init(EditedEqu(GetDerivative(Combo1.Text)), 1)
math.Error = False
Dim x As Double, y As Double
x = Stringval(Text1.Text)
Text2.Text = (StrGetVal(x, 0, 0, 0))
Text3.Text = GetLimit(GetDerivative(Combo1.Text), x)
If StrGetVal(x, 0, 0, 1) = "Error" Then Text3.Text = "Does not exist"
Text4.Text = GetLimit(expression, x)
If Text4.Text = "Does not exist" Or Text2.Text = "Error" Then Text3.Text = "Error"
Exit Sub
Exit Sub
End Sub

Private Sub Form_Load()
Dim i As Integer
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
Combo1.AddItem AllFunctions(i).expression1
End If
Next
End Sub

