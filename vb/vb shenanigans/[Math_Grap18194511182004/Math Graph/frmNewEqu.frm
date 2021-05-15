VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmNewEqu 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "New Equation"
   ClientHeight    =   3945
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7245
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3945
   ScaleWidth      =   7245
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text6 
      Height          =   285
      Left            =   4200
      TabIndex        =   27
      Top             =   600
      Width           =   2175
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   1680
      TabIndex        =   25
      Top             =   600
      Width           =   2175
   End
   Begin VB.OptionButton Option4 
      Caption         =   "Implict:"
      Height          =   375
      Left            =   120
      TabIndex        =   24
      Top             =   600
      Width           =   975
   End
   Begin MSComDlg.CommonDialog CmnDlg 
      Left            =   480
      Top             =   3480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame3 
      Caption         =   "Draw what"
      ClipControls    =   0   'False
      Height          =   1575
      Left            =   5160
      TabIndex        =   20
      Top             =   1200
      Width           =   1815
      Begin VB.OptionButton Option3 
         Caption         =   "First Derivative"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   23
         Top             =   1200
         Width           =   1455
      End
      Begin VB.OptionButton Option3 
         Caption         =   "The Function"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   22
         Top             =   240
         Value           =   -1  'True
         Width           =   1455
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Function Inverse"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   21
         Top             =   720
         Width           =   1575
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   360
      Top             =   2040
   End
   Begin VB.PictureBox PicColor 
      Height          =   375
      Left            =   5280
      MouseIcon       =   "frmNewEqu.frx":0000
      MousePointer    =   99  'Custom
      ScaleHeight     =   315
      ScaleWidth      =   1515
      TabIndex        =   19
      Top             =   3000
      Width           =   1575
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Period"
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   3000
      Width           =   975
   End
   Begin VB.Frame Frame2 
      Height          =   615
      Left            =   1320
      TabIndex        =   13
      Top             =   2760
      Width           =   3615
      Begin VB.TextBox Text8 
         Height          =   285
         Left            =   2520
         TabIndex        =   18
         Top             =   240
         Width           =   855
      End
      Begin VB.TextBox Text7 
         Height          =   285
         Left            =   960
         TabIndex        =   17
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label6 
         Caption         =   "To:"
         Height          =   255
         Left            =   2160
         TabIndex        =   16
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label5 
         Caption         =   "From:"
         Height          =   255
         Left            =   480
         TabIndex        =   15
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5520
      TabIndex        =   12
      Top             =   3480
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   4080
      TabIndex        =   11
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Parametric Equation"
      Height          =   1575
      Left            =   1320
      TabIndex        =   4
      Top             =   1200
      Width           =   3615
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   1560
         TabIndex        =   10
         Top             =   1080
         Width           =   1815
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Polar           f(t)="
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   1080
         Width           =   1455
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   480
         TabIndex        =   8
         Top             =   600
         Width           =   2895
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   480
         TabIndex        =   7
         Top             =   240
         Width           =   2895
      End
      Begin VB.Label Label3 
         Caption         =   "Y ="
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   600
         Width           =   495
      End
      Begin VB.Label Label2 
         Caption         =   "X ="
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Parametric:"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1680
      TabIndex        =   2
      Top             =   160
      Width           =   2175
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Normal:"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label Label4 
      Caption         =   "="
      Height          =   135
      Left            =   3960
      TabIndex        =   26
      Top             =   600
      Width           =   375
   End
   Begin VB.Label Label1 
      Caption         =   "Y="
      Height          =   375
      Left            =   1320
      TabIndex        =   1
      Top             =   200
      Width           =   615
   End
End
Attribute VB_Name = "frmNewEqu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Dim Starting As Double, Ending As Double, period As Boolean
Dim func As FUNCTION_INFO
If Option3(0).Value = True Then
DrawWhat = "normal"
ElseIf Option3(1).Value = True Then
DrawWhat = "inverse"
ElseIf Option3(2).Value = True Then
DrawWhat = "firstder"
End If

If Check2.Value = 1 Then
period = True
Starting = Stringval(Text7.Text)
Ending = Stringval(Text8.Text)
Else
period = False
End If

If Option1.Value = True Then
thetype = "normal"
expression1 = Text1.Text
ElseIf Option4.Value = True Then
thetype = "implict"
expression1 = Text5.Text
expression2 = Text6.Text
ElseIf Check1.Value = 0 Then
thetype = "parametric"
expression1 = Text2.Text
expression2 = Text3.Text
Else
thetype = "polar"
expression1 = Text4.Text
End If

func.color = PicColor.BackColor
func.DrawWhat = DrawWhat
func.HasPeriod = period
func.start = Starting
func.end = Ending
func.Type = thetype
func.expression1 = expression1
func.expression2 = expression2

If Me.Caption = "New Equation" Then
numfunctions = numfunctions + 1
AllFunctions(numfunctions) = func
Call frmMain.DrawFunction(numfunctions, 0, 100)
Call frmMain.AddToList(numfunctions)
Else
AllFunctions(selfunc) = func
RefreshAll
End If

Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
PicColor.BackColor = frmMain.PicColor.BackColor
End Sub

Private Sub PicColor_Click()
CmnDlg.color = PicColor.BackColor
CmnDlg.ShowColor
PicColor.BackColor = CmnDlg.color
End Sub

Private Sub Text4_Change()
Text2.Text = "(" + Text4.Text + ")*cos(t)"
Text3.Text = "(" + Text4.Text + ")*sin(t)"

End Sub

Private Sub Timer1_Timer()
If Option2.Value = True Then Frame1.Enabled = True Else: Frame1.Enabled = False
If Check2.Value = 1 Then Frame2.Enabled = True Else: Frame2.Enabled = False
If Check1.Value = 1 Then Text4.Enabled = True: Text2.Enabled = False: Text3.Enabled = False Else: Text2.Enabled = True: Text3.Enabled = True: Text4.Enabled = False
If Option4.Value = False Then Frame3.Enabled = True Else Frame3.Enabled = False
If Option4.Value = True Then Text5.Enabled = True: Text6.Enabled = True: Label4.Enabled = True Else: Text5.Enabled = False: Text6.Enabled = False: Label4.Enabled = False
End Sub
