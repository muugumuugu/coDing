VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmTangent 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Draw Tangent"
   ClientHeight    =   2610
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5145
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2610
   ScaleWidth      =   5145
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   1080
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   600
      Width           =   2175
   End
   Begin MSComDlg.CommonDialog cmndlg 
      Left            =   0
      Top             =   1560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox Picture1 
      Height          =   375
      Left            =   3360
      MouseIcon       =   "frmTangent.frx":0000
      MousePointer    =   99  'Custom
      ScaleHeight     =   315
      ScaleWidth      =   1515
      TabIndex        =   6
      Top             =   2040
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Caption         =   "Tangent/Normal"
      Height          =   1335
      Left            =   3360
      TabIndex        =   3
      Top             =   600
      Width           =   1575
      Begin VB.OptionButton Option2 
         Caption         =   "Draw normal"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   840
         Width           =   1335
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Draw tangent"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Value           =   -1  'True
         Width           =   1335
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Close"
      Height          =   375
      Left            =   1800
      TabIndex        =   2
      Top             =   2040
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Draw"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   2040
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1080
      TabIndex        =   0
      Text            =   "0"
      Top             =   1560
      Width           =   2175
   End
   Begin VB.Frame Frame2 
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   1815
      Left            =   240
      TabIndex        =   9
      Top             =   480
      Width           =   4695
      Begin VB.ComboBox Combo2 
         Height          =   315
         Left            =   840
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   600
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.Label Label3 
         Caption         =   "Y="
         Height          =   255
         Left            =   0
         TabIndex        =   12
         Top             =   600
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.Label Label2 
         Caption         =   "At x="
         Height          =   255
         Left            =   0
         TabIndex        =   11
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "Y="
         Height          =   255
         Left            =   0
         TabIndex        =   10
         Top             =   120
         Width           =   855
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   2415
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   4260
      HotTracking     =   -1  'True
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   4
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Y(x) function"
            Key             =   "normal"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "X(y) function"
            Key             =   "inverse"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Parametric function"
            Key             =   "parametric"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Polar function"
            Key             =   "polar"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmTangent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Command1_Click()
Dim xpoint As Double, ypoint As Double, slope As Double, yIntercept As Double, equation As String
Dim xpoint1 As Double, xpoint2 As Double, ypoint1 As Double, ypoint2 As Double
Dim Deriv As String, cstrcoordformat
Dim t As Double, t1 As Double, t2 As Double

If Combo1.Text = "" Or (Combo2.Visible = True And Combo2.Text = "") Then Exit Sub

Dim IsTangentVertical As Boolean
IsTangentVertical = False

Select Case TabStrip1.SelectedItem.Key

Case "normal"
frmMain.Init (EditedEqu(Combo1.Text))
xpoint = Stringval(Text1.Text)
ypoint = GetVal(xpoint, 0, 0, 0)
Deriv = EditedEqu(GetDerivative(Combo1.Text))
Call frmMain.Init(Deriv, 1)
slope = GetVal(xpoint, 0, 0, 1)
If StrGetVal(xpoint, 0, 0, 1) = "Error" Then MsgBox ("Can't draw tangent or normal at this point."): Exit Sub
If GetLimit(GetDerivative(Combo1.Text), xpoint) = "Does not exist" Then MsgBox ("Can't draw tangent or normal at this point."): Exit Sub

Case "inverse"
frmMain.Init (EditedEqu(Combo1.Text))
ypoint = Stringval(Text1.Text)
xpoint = GetVal(0, ypoint, 0, 0)
Deriv = EditedEqu(ReplaceVar(GetDerivative(ReplaceVar(Combo1.Text, "y", "x")), "x", "y"))
Call frmMain.Init(Deriv, 1)
If StrGetVal(0, ypoint, 0, 1) = "Error" Then MsgBox ("Can't draw tangent or normal at this point."): Exit Sub
If GetLimit(GetDerivative(ReplaceVar(Combo1.Text, "y", "x")), ypoint) = "Does not exist" Then MsgBox ("Can't draw tangent or normal at this point."): Exit Sub
'slope = 1 / GetVal(0, ypoint, 0, 1)
slope = GetVal(0, ypoint, 0, 1)
If slope = 0 Then
IsTangentVertical = True
Else
slope = 1 / slope
End If

Case "polar"
frmMain.Init (EditedEqu(Combo1.Text))
t = Stringval(Text1.Text)
t1 = Stringval(Text1.Text) - 0.000001
t2 = Stringval(Text1.Text) + 0.000001
If StrGetVal(0, 0, t, 0) = "Error" Or StrGetVal(0, 0, t1, 0) = "Error" Or StrGetVal(0, 0, t2, 0) = "Error" Then MsgBox ("Can't draw tangent or normal at this point."): Exit Sub
xpoint = GetVal(0, 0, t, 0) * Cos(t)
xpoint1 = GetVal(0, 0, t1, 0) * Cos(t1)
xpoint2 = GetVal(0, 0, t2, 0) * Cos(t2)
ypoint = GetVal(0, 0, t, 0) * Sin(t)
ypoint1 = GetVal(0, 0, t1, 0) * Sin(t1)
ypoint2 = GetVal(0, 0, t2, 0) * Sin(t2)
If (xpoint2 - xpoint1) = 0 Then IsTangentVertical = True Else slope = (ypoint2 - ypoint1) / (xpoint2 - xpoint1)

Case "parametric"
Call frmMain.Init(EditedEqu(Combo1.Text), 0)
Call frmMain.Init(EditedEqu(Combo2.Text), 1)
t = Stringval(Text1.Text)
t1 = Stringval(Text1.Text) - 0.000001
t2 = Stringval(Text1.Text) + 0.000001
If StrGetVal(0, 0, t, 0) = "Error" Or StrGetVal(0, 0, t1, 0) = "Error" Or StrGetVal(0, 0, t2, 0) = "Error" Or StrGetVal(0, 0, t, 1) = "Error" Or StrGetVal(0, 0, t1, 1) = "Error" Or StrGetVal(0, 0, t2, 1) = "Error" Then MsgBox ("Can't draw tangent or normal at this point."): Exit Sub
xpoint = GetVal(0, 0, t, 0)
xpoint1 = GetVal(0, 0, t1, 0)
xpoint2 = GetVal(0, 0, t2, 0)
ypoint = GetVal(0, 0, t, 1)
ypoint1 = GetVal(0, 0, t1, 1)
ypoint2 = GetVal(0, 0, t2, 1)
If (xpoint2 - xpoint1) = 0 Then IsTangentVertical = True Else slope = (ypoint2 - ypoint1) / (xpoint2 - xpoint1)

End Select

If Option2.Value = True Then
    If IsTangentVertical = True Then
        IsTangentVertical = False: slope = 0
    Else
        If slope <> 0 Then
        slope = -1 / slope
        Else
        IsTangentVertical = True
        End If
    End If
End If

If IsTangentVertical = False Then
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
Else
    equation = Format(Str(xpoint), cstrcoordformat)
End If

Dim func As FUNCTION_INFO
If IsTangentVertical = False Then
    Call frmMain.DrawNormal(equation, frmMain.PicColor.BackColor, pLeft, pRight, 0, 100, "=")
Else
    Call frmMain.DrawInverse(equation, frmMain.PicColor.BackColor, pLeft, pRight, 0, 100, "=")
End If
If IsTangentVertical = False Then func.Type = "normal" Else func.Type = "inverse"
func.HasPeriod = False
func.expression1 = equation
func.color = Picture1.BackColor
func.Shown = True
func.CenterSign = "="
Call AddFunction(func)
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim IsEmpty As Boolean, i As Integer
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
Combo1.AddItem AllFunctions(i).expression1
If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
End If
Next
Picture1.BackColor = frmMain.PicColor.BackColor
End Sub

Private Sub Picture1_Click()
cmndlg.color = Picture1.BackColor
cmndlg.ShowColor
Picture1.BackColor = cmndlg.color
End Sub

Private Sub TabStrip1_Click()
Dim i As Integer
Combo1.Clear
Combo2.Clear
Select Case TabStrip1.SelectedItem.Key

Case "normal"
Label3.Visible = False
Combo2.Visible = False
Label1.Caption = "Y="
Label2.Caption = "At x="
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
Combo1.AddItem AllFunctions(i).expression1
If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
End If
Next

Case "inverse"
Label3.Visible = False
Combo2.Visible = False
Label1.Caption = "X="
Label2.Caption = "At y="
For i = 1 To numfunctions
If AllFunctions(i).Type = "inverse" Then
Combo1.AddItem AllFunctions(i).expression1
If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
End If
Next

Case "parametric"
Label3.Visible = True
Combo2.Visible = True
Label1.Caption = "X="
Label3.Caption = "Y="
Label2.Caption = "At t="
For i = 1 To numfunctions
If AllFunctions(i).Type = "parametric" Then
Combo1.AddItem AllFunctions(i).expression1
Combo2.AddItem AllFunctions(i).expression2
If Combo1.Text = "" Then
Combo1.Text = AllFunctions(i).expression1
Combo2.Text = AllFunctions(i).expression2
End If
End If
Next

Case "polar"
Label3.Visible = False
Combo2.Visible = False
Label1.Caption = "R="
Label2.Caption = "At t="
For i = 1 To numfunctions
If AllFunctions(i).Type = "polar" Then
Combo1.AddItem AllFunctions(i).expression1
If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
End If
Next

End Select

End Sub
Private Sub Combo1_Click()
Dim IsCorrect As Boolean, i As Integer
If TabStrip1.SelectedItem.Key = "parametric" Then
    IsCorrect = False
    For i = 1 To numfunctions
        If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression1 = Combo1.Text And AllFunctions(i).expression2 = Combo2.Text Then IsCorrect = True: Exit For
    Next
    
    If IsCorrect = False Then
        For i = 1 To numfunctions
            If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression1 = Combo1.Text Then Combo2.Text = AllFunctions(i).expression2: Exit For
        Next
    End If
End If
End Sub

Private Sub Combo2_Click()
Dim IsCorrect As Boolean, i As Integer
If TabStrip1.SelectedItem.Key = "parametric" Then
    IsCorrect = False
    For i = 1 To numfunctions
        If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression1 = Combo1.Text And AllFunctions(i).expression2 = Combo2.Text Then IsCorrect = True: Exit For
    Next
    
    If IsCorrect = False Then
        For i = 1 To numfunctions
            If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression2 = Combo2.Text Then Combo1.Text = AllFunctions(i).expression1: Exit For
        Next
    End If
End If
End Sub

