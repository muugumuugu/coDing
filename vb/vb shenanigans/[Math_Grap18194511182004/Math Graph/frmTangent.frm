VERSION 5.00
Begin VB.Form frmTangent 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Draw Tangent"
   ClientHeight    =   1935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3315
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1935
   ScaleWidth      =   3315
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Close"
      Height          =   375
      Left            =   1680
      TabIndex        =   5
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Draw"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   1440
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Text            =   "0"
      Top             =   960
      Width           =   2175
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   960
      Locked          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   360
      Width           =   2175
   End
   Begin VB.Label Label2 
      Caption         =   "At x ="
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Equation"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   975
   End
End
Attribute VB_Name = "frmTangent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Dim xpoint As Double, ypoint As Double, slope As Double, yIntercept As Double, equation As String
frmMain.Init (Combo1.Text)
xpoint = Stringval(Text1.Text)
ypoint = GetVal(xpoint, 0)
slope = DerivativeCalc(Val(Text1.Text), 1)
yIntercept = ypoint - slope * xpoint
equation = ""
slope = Round(slope, 4)
yIntercept = Round(yIntercept, 4)
If slope <> 0 Then
    If slope <> 1 Then equation = Format(Str(slope), cstrcoordformat) + "*x" Else: equation = "x"
    Select Case Sgn(yIntercept)
    Case 1
    equation = equation + "+" + Format(Str(yIntercept), cstrcoordformat)
    Case -1
    equation = equation + "-" + Format(Str(-yIntercept), cstrcoordformat)
    End Select

Else
    equation = Format(Str(yIntercept), cstrcoordformat)
End If

Dim func As FUNCTION_INFO
Call frmMain.DrawNormal(equation, frmMain.PicColor.BackColor, pLeft, pRight, "normal", 0, 100)
func.Type = "normal"
func.HasPeriod = False
func.expression1 = equation
func.color = frmMain.PicColor.BackColor
func.DrawWhat = "normal"
Call AddFunction(func)
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim IsEmpty As Boolean
IsEmpty = True
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
Combo1.AddItem AllFunctions(i).expression1
If IsEmpty = True Then Combo1.Text = AllFunctions(i).expression1: IsEmpty = False
End If
Next

End Sub
