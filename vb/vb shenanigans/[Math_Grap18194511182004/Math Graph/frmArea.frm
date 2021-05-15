VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmArea 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Area under curve"
   ClientHeight    =   2850
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5265
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2850
   ScaleWidth      =   5265
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame3 
      Caption         =   "Steps"
      Height          =   615
      Left            =   120
      TabIndex        =   19
      Top             =   1320
      Width           =   2775
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   720
         TabIndex        =   21
         Text            =   "10000"
         Top             =   240
         Width           =   1935
      End
      Begin VB.Label Label12 
         Caption         =   "Steps="
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Result"
      Height          =   2655
      Left            =   3000
      TabIndex        =   10
      Top             =   120
      Width           =   2175
      Begin VB.Label Label11 
         BackStyle       =   0  'Transparent
         Caption         =   "Integration result:"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   1440
         Width           =   1215
      End
      Begin VB.Label Label10 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1680
         Width           =   1935
      End
      Begin VB.Label Label9 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   2280
         Width           =   1935
      End
      Begin VB.Label Label8 
         BackStyle       =   0  'Transparent
         Caption         =   "Total (absolute area):"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   2040
         Width           =   1575
      End
      Begin VB.Label Label7 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   1080
         Width           =   1935
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "Area below axis:"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label Label5 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   480
         Width           =   1935
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Area over axis:"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   1095
      End
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   270
      Left            =   120
      TabIndex        =   9
      Top             =   2505
      Width           =   2775
      _ExtentX        =   4895
      _ExtentY        =   476
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Close"
      Height          =   375
      Left            =   1560
      TabIndex        =   8
      Top             =   2040
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Calculate area"
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   2040
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Interval"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   2775
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1920
         TabIndex        =   6
         Top             =   240
         Width           =   735
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   600
         TabIndex        =   4
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label3 
         Caption         =   "To:"
         Height          =   255
         Left            =   1560
         TabIndex        =   5
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label2 
         Caption         =   "From:"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   840
      TabIndex        =   0
      Top             =   240
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "Function:"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmArea"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
On Error GoTo errh
Dim expression As String
Dim x0 As Double, xN_1 As Double, xN As Double
Dim x2j_1 As Double, x2j As Double
Dim j As Long, N1 As Long
expression = EditedEqu(Combo1.Text)
Call frmMain.Init(expression)
x0 = Stringval(Text1.Text) 'Start x0
xN = Stringval(Text2.Text) 'End xN
N1 = Val(Text3.Text)
h = (xN - x0) / N1 'Distance between two points

    xN_1 = x0 + (N1 - 1) * h 'Calculate x[N-1]
    Int1 = GetVal(x0, 0) + 4 * GetVal(xN_1, 0) + GetVal(xN, 0)    'Calculate f(x0)+4*f(x[N-1])+f(xN)
    Int2 = Abs(GetVal(x0, 0)) + 4 * Abs(GetVal(xN_1, 0)) + Abs(GetVal(xN, 0))    'Calculate f(x0)+4*f(x[N-1])+f(xN)
   
    sum1 = 0 'Set the Sum[j=1 -> (N/2)-1](2*f(x[2j-1]+f(x[2j]) to zero
    Sum2 = 0
    For j = 1 To (N1 / 2 - 1)
        x2j_1 = x0 + (2 * j - 1) * h 'Calculate x[2j-1]
        x2j = x0 + (2 * j) * h  'Calculate x[2j]
        x2j_1aa = GetVal(x2j_1, 0)
        x2jaa = GetVal(x2j, 0)

        sum1 = sum1 + 2 * x2j_1aa + x2jaa
        Sum2 = Sum2 + 2 * Abs(x2j_1aa) + Abs(x2jaa)
    prog = (j - 1) / ((N1 / 2 - 1) - 1) * 100
    ProgressBar1.Value = prog
    
    Next j
    sum1 = h / 3 * (Int1 + 2 * sum1)
    Sum2 = h / 3 * (Int2 + 2 * Sum2)
over = (sum1 + Sum2) / 2
under = Sum2 - over
Label5.Caption = Format(Str(Round(over, 6)), cstrcoordformat)
Label7.Caption = Format(Str(Round(under, 6)), cstrcoordformat)
Label10.Caption = Format(Str(Round(sum1, 6)), cstrcoordformat)
Label9.Caption = Format(Str(Round(Sum2, 6)), cstrcoordformat)
errh:
x2j_1aa = 0
x2jaa = 0
Resume Next
End Sub

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
