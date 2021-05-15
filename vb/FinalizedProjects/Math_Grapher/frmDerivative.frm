VERSION 5.00
Begin VB.Form frmDerivative 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Derive function"
   ClientHeight    =   2865
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5475
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2865
   ScaleWidth      =   5475
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Cancel          =   -1  'True
      Caption         =   "Close"
      Height          =   375
      Left            =   3720
      TabIndex        =   12
      Top             =   720
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Calculate"
      Height          =   375
      Left            =   3720
      TabIndex        =   11
      Top             =   120
      Width           =   1695
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   720
      TabIndex        =   10
      Top             =   1920
      Width           =   2775
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   360
      TabIndex        =   9
      Text            =   "3"
      Top             =   2280
      Width           =   375
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   720
      TabIndex        =   5
      Top             =   1320
      Width           =   2775
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   720
      TabIndex        =   3
      Top             =   720
      Width           =   2775
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   720
      TabIndex        =   1
      Top             =   120
      Width           =   2775
   End
   Begin VB.Label Label6 
      Caption         =   "n="
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   2280
      Width           =   375
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "(n)"
      Height          =   225
      Left            =   165
      TabIndex        =   7
      Top             =   1800
      Width           =   255
   End
   Begin VB.Label Label4 
      Caption         =   "f    (x)="
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   1920
      Width           =   495
   End
   Begin VB.Label Label3 
      Caption         =   "f''(x)="
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "f'(x)="
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "f(x)="
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   495
   End
End
Attribute VB_Name = "frmDerivative"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Command1_Click()
If IsValid(EditedEqu(Combo1.Text), True, False, False) = False Then MsgBox ("Invalid expression"): Exit Sub
Text1.Text = GetDerivative(Combo1.Text)
Text2.Text = GetDerivative(Text1.Text)
Text3.Text = nDerivative(Combo1.Text, Val(Text4.Text))
End Sub

Private Sub Command2_Click()
Unload frmDerivative
End Sub

Private Sub Form_Load()
Dim i As Integer
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
Combo1.AddItem AllFunctions(i).expression1
End If
Next
End Sub

Private Sub Text4_LostFocus()
If Val(Text4.Text) < 1 Or Val(Text4.Text) > 10 Then
MsgBox ("The value of n must be between 1 and 10")
Text4.Text = "1"
End If
End Sub
