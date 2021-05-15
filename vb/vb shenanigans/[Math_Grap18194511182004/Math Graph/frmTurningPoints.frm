VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmTurningPoints 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Extrema and inflexion points"
   ClientHeight    =   2805
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7785
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2805
   ScaleWidth      =   7785
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   375
      Left            =   3000
      TabIndex        =   14
      Top             =   1920
      Visible         =   0   'False
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Close"
      Height          =   375
      Left            =   3000
      TabIndex        =   13
      Top             =   2400
      Width           =   4695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Find turning points"
      Height          =   375
      Left            =   3000
      TabIndex        =   12
      Top             =   1920
      Width           =   4695
   End
   Begin VB.ListBox List1 
      Height          =   1620
      Left            =   3000
      TabIndex        =   11
      Top             =   120
      Width           =   4695
   End
   Begin VB.Frame Frame2 
      Caption         =   "Search for"
      Height          =   1335
      Left            =   120
      TabIndex        =   7
      Top             =   1440
      Width           =   2775
      Begin VB.CheckBox Check3 
         Caption         =   "Inflextion turning points"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   960
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Maximum turning points"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   600
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Minimum turning points"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Value           =   1  'Checked
         Width           =   1935
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Search Interval"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   2775
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   600
         TabIndex        =   4
         Top             =   240
         Width           =   735
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1920
         TabIndex        =   3
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label2 
         Caption         =   "From:"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "To:"
         Height          =   255
         Left            =   1560
         TabIndex        =   5
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   960
      TabIndex        =   1
      Top             =   120
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Function:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
End
Attribute VB_Name = "frmTurningPoints"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim expression As String, Error As Boolean

Private Sub Command1_Click()
On Error Resume Next
Dim rootsnum As Integer, Root As Double, slope As Double
random = 0.012354   'Rnd * 0.02
Dim lastx As Double, lasty As Double, x As Double, y As Double, lastslope As Double, slope1 As Double, slope2 As Double
'rootsnum = 0
List1.Clear
expression = Combo1.Text
expression = EditedEqu(expression)
Call frmMain.Init(expression)

searchstart = Stringval(Text1.Text)
searchend = Stringval(Text2.Text)
thestep = 0.1

ProgressBar1.Visible = True
x = searchstart - random
slope = 200
Do
Error = False
y = SlopeCalc(x)
If x > searchstart Then
    slope = (y - lasty) / (x - lastx)
    If y * lasty < 0 Then
    Root = cutroot(lastx, x, lasty, y)
        If Error = False Then
        ypoint = GetVal(Root, 0)
        Root = Round(Root, 6)
        ypoint = Round(ypoint, 6)
        If Sgn(y) = 1 Then pointtype = "Minimum" Else: pointtype = "Maximum"
        ss = pointtype + " point at (" + Format(Str(Root), cstrcoordformat) + "," + Format(Str(ypoint), cstrcoordformat) + " )"
        If (Check1.Value = 1 And pointtype = "Minimum") Or (Check2.Value = 1 And pointtype = "Maximum") Then List1.AddItem ss
'        rootsnum = rootsnum + 1
        End If
    End If
    If slope * lastslope < 0 And Check3.Value = 1 Then
    slope1 = DerivativeCalc(lastx - thestep, 2)
    slope2 = DerivativeCalc(x, 2)
   
    Root = Round(touchroot(lastx - thestep, x, slope1, slope2), 6)
        If Error = False Then
        ypoint = GetVal(Root, 0)
        'Root = Round(Root, 6)
        ypoint = Round(ypoint, 6)
        angle = Round(Atn(SlopeCalc(Root)) * 180 / Pi, 4)
        ss = "Inflextion point at (" + Format(Str(Root), cstrcoordformat) + "," + Format(Str(ypoint), cstrcoordformat) + ")" + ", angle:" + Format(Str(angle), cstrcoordformat) + " degrees"
        List1.AddItem ss
'        rootsnum = rootsnum + 1
        End If
    End If
End If
lastx = x
lasty = y
lastslope = slope

ProgressBar1.Value = Abs((x - searchstart) / (searchend - searchstart) * 100)
x = x + thestep
Loop Until x > searchend

ProgressBar1.Visible = False
End Sub

Private Function cutroot(pStart As Double, pEnd As Double, y1 As Double, y2 As Double) As Double
Dim slope As Double, x0 As Double, y0 As Double
x0 = (pStart + pEnd) / 2 '(0 - y1) * slope2 + pStart
y0 = SlopeCalc(x0)
If Abs(y0) > Abs(y1) And Abs(y0) > Abs(y2) Then Error = True: Exit Function
If (x0 - pStart) < 0.0000001 Then
cutroot = x0
Else
    If y1 * y0 < 0 Then
    cutroot = cutroot(pStart, x0, y1, y0)
    Else
    cutroot = cutroot(x0, pEnd, y0, y2)
    End If
End If
End Function
Private Function touchroot(pStart As Double, pEnd As Double, y1 As Double, y2 As Double) As Double
Dim x0 As Double, y0 As Double
x0 = (pStart + pEnd) / 2

y0 = DerivativeCalc(x0, 2)
If Abs(y0) > Abs(y1) And Abs(y0) > Abs(y2) Then Error = True: Exit Function
If (pEnd - pStart) < 0.0001 Then
touchroot = x0: Exit Function
Else
    If y1 * y0 < 0 Then
    touchroot = touchroot(pStart, x0, y1, y0)
    Else
    touchroot = touchroot(x0, pEnd, y0, y2)
    End If
End If
End Function


Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
Combo1.AddItem AllFunctions(i).expression1
End If
Next
Text1.Text = Str(pLeft)
Text2.Text = Str(pRight)

End Sub
