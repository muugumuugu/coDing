VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmNewEqu 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "New Graph"
   ClientHeight    =   2985
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6000
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2985
   ScaleWidth      =   6000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox Check1 
      Caption         =   "Visible"
      Height          =   255
      Left            =   1320
      TabIndex        =   35
      Top             =   2520
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   495
      Index           =   4
      Left            =   1320
      TabIndex        =   26
      Top             =   480
      Width           =   4455
      Begin VB.ComboBox Combo4 
         Height          =   315
         ItemData        =   "frmNewEqu.frx":0000
         Left            =   1800
         List            =   "frmNewEqu.frx":000D
         Style           =   2  'Dropdown List
         TabIndex        =   32
         Top             =   120
         Width           =   855
      End
      Begin VB.TextBox txtImplicit2 
         Height          =   285
         Left            =   2640
         TabIndex        =   28
         Top             =   120
         Width           =   1815
      End
      Begin VB.TextBox txtImplicit1 
         Height          =   285
         Left            =   0
         TabIndex        =   27
         Top             =   120
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   495
      Index           =   3
      Left            =   840
      TabIndex        =   23
      Top             =   480
      Width           =   3975
      Begin VB.CommandButton Command5 
         Caption         =   "Derive"
         Height          =   285
         Left            =   2900
         TabIndex        =   36
         Top             =   120
         Width           =   735
      End
      Begin VB.TextBox txtPolar 
         Height          =   285
         Left            =   480
         TabIndex        =   24
         Top             =   120
         Width           =   2415
      End
      Begin VB.Label Label10 
         Caption         =   "R(t)="
         Height          =   255
         Left            =   0
         TabIndex        =   25
         Top             =   120
         Width           =   495
      End
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   495
      Index           =   2
      Left            =   1080
      TabIndex        =   18
      Top             =   480
      Width           =   4575
      Begin VB.TextBox txtParametric2 
         Height          =   285
         Left            =   2640
         TabIndex        =   22
         Top             =   120
         Width           =   1935
      End
      Begin VB.TextBox txtParametric1 
         Height          =   285
         Left            =   240
         TabIndex        =   19
         Top             =   120
         Width           =   1935
      End
      Begin VB.Label Label9 
         Caption         =   "Y="
         Height          =   255
         Left            =   2400
         TabIndex        =   21
         Top             =   120
         Width           =   375
      End
      Begin VB.Label Label8 
         Caption         =   "X="
         Height          =   255
         Left            =   0
         TabIndex        =   20
         Top             =   120
         Width           =   495
      End
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   495
      Index           =   1
      Left            =   1080
      TabIndex        =   14
      Top             =   480
      Width           =   4335
      Begin VB.CommandButton Command4 
         Caption         =   "Derive"
         Height          =   295
         Left            =   3480
         TabIndex        =   34
         Top             =   120
         Width           =   735
      End
      Begin VB.ComboBox Combo3 
         Height          =   315
         ItemData        =   "frmNewEqu.frx":001C
         Left            =   240
         List            =   "frmNewEqu.frx":0029
         Style           =   2  'Dropdown List
         TabIndex        =   16
         Top             =   120
         Width           =   855
      End
      Begin VB.TextBox txtX 
         Height          =   285
         Left            =   1080
         TabIndex        =   15
         Top             =   120
         Width           =   2415
      End
      Begin VB.Label Label4 
         Caption         =   "X"
         Height          =   255
         Left            =   0
         TabIndex        =   17
         Top             =   160
         Width           =   495
      End
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   5040
      TabIndex        =   9
      Top             =   2040
      Width           =   735
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   3600
      TabIndex        =   8
      Top             =   2040
      Width           =   735
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Specify period:"
      Height          =   255
      Left            =   1440
      TabIndex        =   7
      Top             =   2040
      Width           =   1455
   End
   Begin VB.OptionButton Option1 
      Caption         =   "From start to end"
      Height          =   255
      Left            =   1440
      TabIndex        =   6
      Top             =   1680
      Value           =   -1  'True
      Width           =   1695
   End
   Begin VB.PictureBox PicColor 
      Height          =   375
      Left            =   1320
      ScaleHeight     =   315
      ScaleWidth      =   1395
      TabIndex        =   5
      Top             =   1080
      Width           =   1455
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "frmNewEqu.frx":0038
      Left            =   1320
      List            =   "frmNewEqu.frx":004B
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   120
      Width           =   1935
   End
   Begin MSComDlg.CommonDialog CmnDlg 
      Left            =   0
      Top             =   1080
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   0
      Top             =   1560
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4560
      TabIndex        =   1
      Top             =   2520
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   3120
      TabIndex        =   0
      Top             =   2520
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   495
      Index           =   0
      Left            =   1080
      TabIndex        =   10
      Top             =   480
      Width           =   4335
      Begin VB.CommandButton Command3 
         Caption         =   "Derive"
         Height          =   295
         Left            =   3480
         TabIndex        =   33
         Top             =   120
         Width           =   735
      End
      Begin VB.TextBox txtY 
         Height          =   285
         Left            =   1080
         TabIndex        =   13
         Top             =   120
         Width           =   2415
      End
      Begin VB.ComboBox Combo2 
         Height          =   315
         ItemData        =   "frmNewEqu.frx":00A5
         Left            =   240
         List            =   "frmNewEqu.frx":00B2
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   120
         Width           =   855
      End
      Begin VB.Label Label3 
         Caption         =   "Y"
         Height          =   255
         Left            =   0
         TabIndex        =   11
         Top             =   160
         Width           =   495
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Period"
      ClipControls    =   0   'False
      Height          =   975
      Left            =   1320
      TabIndex        =   29
      Top             =   1440
      Width           =   4575
      Begin VB.Label Label6 
         Caption         =   "To:"
         Height          =   255
         Left            =   3360
         TabIndex        =   31
         Top             =   600
         Width           =   495
      End
      Begin VB.Label Label5 
         Caption         =   "From:"
         Height          =   255
         Left            =   1800
         TabIndex        =   30
         Top             =   600
         Width           =   495
      End
   End
   Begin VB.Label Label2 
      Caption         =   "Color:"
      Height          =   255
      Left            =   720
      TabIndex        =   4
      Top             =   1080
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Equation type:"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmNewEqu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Combo1_Click()
Dim FrameIndex As Byte, i As Byte
Select Case Combo1.Text
Case "y(x) function"
FrameIndex = 0
Text1.Text = Str(pLeft)
Text2.Text = Str(pRight)
Option1.Value = True
Case "x(y) function"
FrameIndex = 1
Text1.Text = Str(pBottom)
Text2.Text = Str(pTop)
Option1.Value = True
Case "Parametric function"
FrameIndex = 2
Text1.Text = "0"
Text2.Text = "10"
Option2.Value = True
Case "Polar function"
FrameIndex = 3
Text1.Text = "0"
Text2.Text = "2pi"
Option2.Value = True
Case "Implicit relation"
FrameIndex = 4
Text1.Text = Str(pLeft)
Text2.Text = Str(pRight)
Option1.Value = True
End Select
For i = 0 To 4
If i = FrameIndex Then Frame1(i).Visible = True Else Frame1(i).Visible = False
Next

End Sub

Private Sub Command1_Click()
Dim Starting As Double, Ending As Double, period As Boolean, expression1 As String, expression2 As String
Dim thetype As String
Dim func As FUNCTION_INFO

If Option2.Value = True Then
period = True
Starting = Stringval(Text1.Text)
Ending = Stringval(Text2.Text)
Else
period = False
End If

Dim IsvalidX As Boolean, IsValidY As Boolean, IsValidT As Boolean
IsvalidX = False: IsValidY = False: IsValidT = False
If Combo1.Text = "y(x) function" Then
thetype = "normal"
expression1 = txtY.Text
IsvalidX = True
ElseIf Combo1.Text = "x(y) function" Then
thetype = "inverse"
expression1 = txtX.Text
IsValidY = True
ElseIf Combo1.Text = "Implicit relation" Then
thetype = "implicit"
expression1 = txtImplicit1.Text
expression2 = txtImplicit2.Text
IsvalidX = True: IsValidY = True
ElseIf Combo1.Text = "Parametric function" Then
thetype = "parametric"
expression1 = txtParametric1.Text
expression2 = txtParametric2.Text
IsValidT = True
ElseIf Combo1.Text = "Polar function" Then
thetype = "polar"
expression1 = txtPolar.Text
IsValidT = True
End If

If IsValid(EditedEqu(expression1), IsvalidX, IsValidY, IsValidT) = False Or ((thetype = "parametric" Or thetype = "implicit") And IsValid(EditedEqu(expression2), IsvalidX, IsValidY, IsValidT) = False) Then MsgBox ("Invalid expression"): Exit Sub


func.color = PicColor.BackColor
func.HasPeriod = period
func.start = Starting
func.end = Ending
func.Type = thetype
func.expression1 = expression1
func.expression2 = expression2
If Check1.Value = 1 Then func.Shown = True Else func.Shown = False
If thetype = "normal" Then func.CenterSign = Combo2.Text
If thetype = "inverse" Then func.CenterSign = Combo3.Text
If thetype = "implicit" Then func.CenterSign = Combo4.Text

If Me.Caption = "New Graph" Then
numfunctions = numfunctions + 1
AllFunctions(numfunctions) = func

If AutoRandomize = True Then
    Randomize
    frmMain.PicColor.BackColor = RGB(Rnd * 200, Rnd * 200, Rnd * 200)
End If

If func.Shown = True Then Call frmMain.DrawFunction(numfunctions, 0, 100)
Call frmMain.AddToList(numfunctions)
Else
AllFunctions(SelFunc) = func
RefreshAll
End If

Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Command3_Click()
If IsValid(EditedEqu(txtY.Text), True, False, False) = False Then MsgBox ("Invalid expression"): Exit Sub
txtY.Text = GetDerivative(txtY.Text)
End Sub

Private Sub Command4_Click()
If IsValid(EditedEqu(txtX.Text), False, True, False) = False Then MsgBox ("Invalid expression"): Exit Sub
txtX.Text = ReplaceVar(GetDerivative(ReplaceVar(txtX.Text, "y", "x")), "x", "y")
End Sub

Private Sub Command5_Click()
If IsValid(EditedEqu(txtPolar.Text), False, False, True) = False Then MsgBox ("Invalid expression"): Exit Sub
txtPolar.Text = ReplaceVar(GetDerivative(ReplaceVar(txtPolar.Text, "t", "x")), "x", "t")
End Sub

Private Sub Form_Load()
PicColor.BackColor = frmMain.PicColor.BackColor
Combo1.Text = "y(x) function"
Combo2.Text = "="
Combo3.Text = "="
Combo4.Text = "="
End Sub

Private Sub PicColor_Click()
cmndlg.color = PicColor.BackColor
cmndlg.ShowColor
PicColor.BackColor = cmndlg.color
End Sub

Private Sub Text1_Change()
Option2.Value = True
End Sub

Private Sub Text2_Change()
Option2.Value = True
End Sub
