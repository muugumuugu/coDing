VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSolve 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Equation Solver"
   ClientHeight    =   3795
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4710
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3795
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Caption         =   "Accuracy level"
      Height          =   615
      Left            =   120
      TabIndex        =   12
      Top             =   3120
      Width           =   4455
      Begin VB.OptionButton Option1 
         Caption         =   "Very High"
         Height          =   255
         Index           =   3
         Left            =   2880
         TabIndex        =   16
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton Option1 
         Caption         =   "High"
         Height          =   255
         Index           =   2
         Left            =   1920
         TabIndex        =   15
         Top             =   240
         Width           =   975
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Normal"
         Height          =   255
         Index           =   1
         Left            =   960
         TabIndex        =   14
         Top             =   240
         Value           =   -1  'True
         Width           =   975
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Low"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   13
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1695
      Left            =   120
      TabIndex        =   6
      Top             =   600
      Width           =   3015
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   480
         TabIndex        =   20
         Text            =   "0"
         Top             =   1320
         Width           =   2295
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Start with inital guess"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   1080
         Width           =   1935
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Search within interval"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   240
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   2040
         TabIndex        =   10
         Text            =   "10"
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   600
         TabIndex        =   8
         Text            =   "-10"
         Top             =   600
         Width           =   735
      End
      Begin VB.Label Label5 
         Caption         =   "x0="
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   1320
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "To:"
         Height          =   255
         Left            =   1680
         TabIndex        =   9
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Label2 
         Caption         =   "From:"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   600
         Width           =   735
      End
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   2880
      Width           =   3015
      _ExtentX        =   5318
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
      Max             =   101
   End
   Begin VB.ListBox List1 
      Height          =   2010
      Left            =   3360
      TabIndex        =   4
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   375
      Left            =   1680
      TabIndex        =   3
      Top             =   2400
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Find roots"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   2400
      Width           =   1335
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label Label4 
      Height          =   615
      Left            =   3360
      TabIndex        =   11
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Equation:"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "frmSolve"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim expression As String, Error As Boolean
Private Sub Command1_Click()
On Error Resume Next
Dim rootsnum As Integer, Root As Double, slope As Double
Dim Deriv As String, num As Integer, thestep As Single
Dim cstrcoordformat
rootsnum = 0
List1.Clear
If Combo1.Text = "" Or Mid(Combo1.Text, 1, 1) = "=" Then Exit Sub
expression = Combo1.Text
num = InStr(1, Combo1.Text, "=")
If num > 0 Then
expression = Mid(Combo1.Text, 1, num - 1) + "-(" + Mid(Combo1.Text, num + 1, Len(Combo1.Text) - num) + ")"
End If
expression = EditedEqu(expression)
If IsValid(expression, True, False, False) = False Then MsgBox ("Invalid equation"): Exit Sub
Deriv = EditedEqu(GetDerivative(expression))
Call frmMain.Init(expression, 0)
Call frmMain.Init(Deriv, 1)
If Option2.Value = True Then
If Option1(0).Value = True Then
thestep = 1
ElseIf Option1(1).Value = True Then
thestep = 0.1
ElseIf Option1(2).Value = True Then
thestep = 0.02
ElseIf Option1(3).Value = True Then
thestep = 0.004
End If
'Randomize
Const random = 0.012354   'Rnd * 0.02
Dim lastx As Double, lasty As Double, x As Double, y As Double, lastslope As Double, slope1 As Double, slope2 As Double
Dim SearchStart As Double, SearchEnd As Double
SearchStart = Stringval(Text1.Text)
SearchEnd = Stringval(Text2.Text)

x = SearchStart - random
slope = 200
Do
Error = False
math.Error = False
y = GetVal(x, 0, 0, 0)

'If y = 0 Then
'List1.AddItem Format(Str(Round(x, 6)), cstrcordformat)
'rootsnum = rootsnum + 1
'End If

If x > SearchStart Then
    slope = (y - lasty) / (x - lastx)
    If y * lasty < 0 Then
    Root = cutroot(lastx, x, lasty, y)
        If Round(GetVal(Round(Root, 6), 0, 0, 0), 3) <> 0 Then Error = True
        If math.Error = True Then Error = True
        If Error = False Then
            List1.AddItem Format(Str(Round(Root, 6)), cstrcoordformat)
            rootsnum = rootsnum + 1
        End If
        math.Error = False
    End If
    If slope * lastslope < 0 And lastslope * lasty <= 0 And Abs(lasty) < 1 Then
    slope1 = GetVal((lastx - thestep), 0, 0, 1)
    slope2 = GetVal(x, 0, 0, 1)
   
    Root = Round(touchroot(lastx - thestep, x, slope1, slope2), 4)
 
        If Round(GetVal(Round(Root, 6), 0, 0, 0), 5) <> 0 Then Error = True
        If math.Error = True Then Error = True
        If Error = False Then
        List1.AddItem Format(Str(Round(Root, 6)), cstrcoordformat)
        rootsnum = rootsnum + 1
        End If
        math.Error = False
    End If
End If
lastx = x
lasty = y
lastslope = slope

ProgressBar1.Value = Abs((x - SearchStart) / (SearchEnd - SearchStart) * 100)
x = x + thestep
Loop Until x > SearchEnd

If rootsnum = 0 Then
Label4.Caption = "no roots found"
Else
Label4.Caption = Str(rootsnum) + " root(s) found"
End If


Else
Dim guess As Double, oldguess As Double, ypoint As Double, tries As Integer
tries = 0
guess = Stringval(Text3.Text)
Do
oldguess = guess
ypoint = GetVal(guess, 0, 0, 0)
If Abs(ypoint) = 0 Then Exit Do
slope = GetVal(guess, 0, 0, 1)
If slope = 0 Then slope = 1
guess = (0 - ypoint) / slope + guess
If Abs(ypoint) < 0.0000000001 And Abs(oldguess - guess) < 0.0000001 Then Exit Do
tries = tries + 1
If tries >= 200 Then
Label4.Caption = "failed to find the root"
Exit Do
End If
Loop
math.Error = False
Dim test As Double
test = Round(GetVal(guess, 0, 0, 0), 8)
If tries < 200 And math.Error = False And test = 0 Then
List1.AddItem Trim(Format(Str(Round(guess, 6)), cstrcoordformat))
Label4.Caption = "root found"
Else
Label4.Caption = "failed to find the root"
End If
End If

End Sub
Private Function cutroot(pStart As Double, pEnd As Double, y1 As Double, y2 As Double) As Double
Dim slope As Double, x0 As Double, y0 As Double
'slope = (y2 - y1) / (pEnd - pStart)
'slope2 = 1 / slope
x0 = (pStart + pEnd) / 2 '(0 - y1) * slope2 + pStart
y0 = GetVal(x0, 0, 0, 0)
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

y0 = GetVal(x0, 0, 0, 1)
If Abs(y0) > Abs(y1) And Abs(y0) > Abs(y2) Then Error = True: Exit Function
If (pEnd - pStart) < 0.0000001 Then
touchroot = x0: Exit Function
Else
    If y1 * y0 < 0 Then
    touchroot = touchroot(pStart, x0, y1, y0)
    Else
    touchroot = touchroot(x0, pEnd, y0, y2)
    End If
End If
End Function

'Private Function EnhanceRoot(root As Double) As Double
'Dim guess As Double, ypoint As Double, slope As Double, tries As Byte
'tries = 0
'guess = root
'Do
'ypoint = GetVal(guess, 0)
'If Abs(ypoint) = 0 Then Exit Do
'slope = GetVal(guess, 0, 1)
'If slope = 0 Then Exit Do
'guess = (0 - ypoint) / slope + guess
'tries = tries + 1
'If tries >= 10 Then Exit Do
'Loop
'EnhanceRoot = GetVal(Round(guess, 6), 0)

'End Function

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim i As Integer
For i = 1 To numfunctions
If AllFunctions(i).Type = "normal" Then
Combo1.AddItem AllFunctions(i).expression1
End If
Next
Text1.Text = Str(pLeft)
Text2.Text = Str(pRight)
End Sub
