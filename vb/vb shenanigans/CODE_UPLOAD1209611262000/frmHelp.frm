VERSION 5.00
Begin VB.Form frmHelp 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Advanced Calculation Solver Syntax"
   ClientHeight    =   4455
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6615
   Icon            =   "frmHelp.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   6615
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   350
      Left            =   5400
      TabIndex        =   75
      Top             =   3960
      Width           =   1095
   End
   Begin VB.Frame fraSyntax 
      Caption         =   "Miscellaneous"
      Height          =   852
      Index           =   6
      Left            =   2280
      TabIndex        =   70
      Top             =   3000
      Width           =   2052
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "!"
         Height          =   192
         Index           =   0
         Left            =   120
         TabIndex        =   74
         Top             =   240
         Width           =   36
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "^"
         Height          =   192
         Index           =   1
         Left            =   120
         TabIndex        =   73
         Top             =   480
         Width           =   84
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "factorial"
         Height          =   192
         Index           =   27
         Left            =   600
         TabIndex        =   72
         Top             =   240
         Width           =   564
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "exponent"
         Height          =   192
         Index           =   28
         Left            =   600
         TabIndex        =   71
         Top             =   480
         Width           =   660
      End
   End
   Begin VB.Frame fraSyntax 
      Caption         =   "Trig"
      Height          =   1815
      Index           =   1
      Left            =   120
      TabIndex        =   57
      Top             =   120
      Width           =   2052
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "tan"
         Height          =   192
         Index           =   32
         Left            =   120
         TabIndex        =   69
         Top             =   1440
         Width           =   216
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "sin"
         Height          =   192
         Index           =   30
         Left            =   120
         TabIndex        =   68
         Top             =   1200
         Width           =   204
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "sec"
         Height          =   192
         Index           =   29
         Left            =   120
         TabIndex        =   67
         Top             =   960
         Width           =   264
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "csc"
         Height          =   192
         Index           =   4
         Left            =   120
         TabIndex        =   66
         Top             =   720
         Width           =   252
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "cot"
         Height          =   192
         Index           =   3
         Left            =   120
         TabIndex        =   65
         Top             =   480
         Width           =   216
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "cos"
         Height          =   192
         Index           =   2
         Left            =   120
         TabIndex        =   64
         Top             =   240
         Width           =   264
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosine"
         Height          =   192
         Index           =   0
         Left            =   600
         TabIndex        =   63
         Top             =   240
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cotangent"
         Height          =   192
         Index           =   1
         Left            =   600
         TabIndex        =   62
         Top             =   480
         Width           =   708
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosecant"
         Height          =   192
         Index           =   2
         Left            =   600
         TabIndex        =   61
         Top             =   720
         Width           =   660
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "secant"
         Height          =   192
         Index           =   3
         Left            =   600
         TabIndex        =   60
         Top             =   960
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "sine"
         Height          =   192
         Index           =   4
         Left            =   600
         TabIndex        =   59
         Top             =   1200
         Width           =   300
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "tangent"
         Height          =   192
         Index           =   5
         Left            =   600
         TabIndex        =   58
         Top             =   1440
         Width           =   528
      End
   End
   Begin VB.Frame fraSyntax 
      Caption         =   "Hyberbolic Trig"
      Height          =   1815
      Index           =   2
      Left            =   2280
      TabIndex        =   44
      Top             =   120
      Width           =   2052
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "hcos"
         Height          =   192
         Index           =   7
         Left            =   120
         TabIndex        =   56
         Top             =   240
         Width           =   348
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "hcot"
         Height          =   192
         Index           =   8
         Left            =   120
         TabIndex        =   55
         Top             =   480
         Width           =   300
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "hcsc"
         Height          =   192
         Index           =   9
         Left            =   120
         TabIndex        =   54
         Top             =   720
         Width           =   336
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "hsec"
         Height          =   192
         Index           =   10
         Left            =   120
         TabIndex        =   53
         Top             =   960
         Width           =   348
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "hsin"
         Height          =   192
         Index           =   11
         Left            =   120
         TabIndex        =   52
         Top             =   1200
         Width           =   288
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "htan"
         Height          =   192
         Index           =   12
         Left            =   120
         TabIndex        =   51
         Top             =   1440
         Width           =   300
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosine"
         Height          =   192
         Index           =   6
         Left            =   600
         TabIndex        =   50
         Top             =   240
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cotangent"
         Height          =   192
         Index           =   7
         Left            =   600
         TabIndex        =   49
         Top             =   480
         Width           =   708
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosecant"
         Height          =   192
         Index           =   8
         Left            =   600
         TabIndex        =   48
         Top             =   720
         Width           =   660
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "secant"
         Height          =   192
         Index           =   9
         Left            =   600
         TabIndex        =   47
         Top             =   960
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "sine"
         Height          =   192
         Index           =   10
         Left            =   600
         TabIndex        =   46
         Top             =   1200
         Width           =   300
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "tangent"
         Height          =   192
         Index           =   11
         Left            =   600
         TabIndex        =   45
         Top             =   1440
         Width           =   528
      End
   End
   Begin VB.Frame fraSyntax 
      Caption         =   "Inverse (Arc) Trig"
      Height          =   1815
      Index           =   3
      Left            =   4440
      TabIndex        =   31
      Top             =   120
      Width           =   2052
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "icos"
         Height          =   192
         Index           =   19
         Left            =   120
         TabIndex        =   43
         Top             =   240
         Width           =   300
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "icot"
         Height          =   192
         Index           =   20
         Left            =   120
         TabIndex        =   42
         Top             =   480
         Width           =   252
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "icsc"
         Height          =   192
         Index           =   21
         Left            =   120
         TabIndex        =   41
         Top             =   720
         Width           =   288
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "isec"
         Height          =   192
         Index           =   22
         Left            =   120
         TabIndex        =   40
         Top             =   960
         Width           =   300
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "isin"
         Height          =   192
         Index           =   23
         Left            =   120
         TabIndex        =   39
         Top             =   1200
         Width           =   240
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "itan"
         Height          =   192
         Index           =   24
         Left            =   120
         TabIndex        =   38
         Top             =   1440
         Width           =   252
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosine"
         Height          =   192
         Index           =   12
         Left            =   600
         TabIndex        =   37
         Top             =   240
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cotangent"
         Height          =   192
         Index           =   13
         Left            =   600
         TabIndex        =   36
         Top             =   480
         Width           =   708
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosecant"
         Height          =   192
         Index           =   14
         Left            =   600
         TabIndex        =   35
         Top             =   720
         Width           =   660
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "secant"
         Height          =   192
         Index           =   15
         Left            =   600
         TabIndex        =   34
         Top             =   960
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "sine"
         Height          =   192
         Index           =   16
         Left            =   600
         TabIndex        =   33
         Top             =   1200
         Width           =   300
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "tangent"
         Height          =   192
         Index           =   17
         Left            =   600
         TabIndex        =   32
         Top             =   1440
         Width           =   528
      End
   End
   Begin VB.Frame fraSyntax 
      Caption         =   "Inverse Hyberbolic Trig"
      Height          =   1815
      Index           =   4
      Left            =   120
      TabIndex        =   18
      Top             =   2040
      Width           =   2052
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ihcos"
         Height          =   192
         Index           =   13
         Left            =   120
         TabIndex        =   30
         Top             =   240
         Width           =   384
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ihcot"
         Height          =   192
         Index           =   14
         Left            =   120
         TabIndex        =   29
         Top             =   480
         Width           =   336
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ihcsc"
         Height          =   192
         Index           =   15
         Left            =   120
         TabIndex        =   28
         Top             =   720
         Width           =   372
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ihsec"
         Height          =   192
         Index           =   16
         Left            =   120
         TabIndex        =   27
         Top             =   960
         Width           =   384
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ihsin"
         Height          =   192
         Index           =   17
         Left            =   120
         TabIndex        =   26
         Top             =   1200
         Width           =   324
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ihtan"
         Height          =   192
         Index           =   18
         Left            =   120
         TabIndex        =   25
         Top             =   1440
         Width           =   336
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosine"
         Height          =   192
         Index           =   18
         Left            =   600
         TabIndex        =   24
         Top             =   240
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cotangent"
         Height          =   192
         Index           =   19
         Left            =   600
         TabIndex        =   23
         Top             =   480
         Width           =   708
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "cosecant"
         Height          =   192
         Index           =   20
         Left            =   600
         TabIndex        =   22
         Top             =   720
         Width           =   660
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "secant"
         Height          =   192
         Index           =   21
         Left            =   600
         TabIndex        =   21
         Top             =   960
         Width           =   480
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "sine"
         Height          =   192
         Index           =   22
         Left            =   600
         TabIndex        =   20
         Top             =   1200
         Width           =   300
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "tangent"
         Height          =   192
         Index           =   23
         Left            =   600
         TabIndex        =   19
         Top             =   1440
         Width           =   528
      End
   End
   Begin VB.Frame fraSyntax 
      Caption         =   "Logarithms"
      Height          =   852
      Index           =   5
      Left            =   2280
      TabIndex        =   13
      Top             =   2040
      Width           =   2052
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ln"
         Height          =   192
         Index           =   25
         Left            =   120
         TabIndex        =   17
         Top             =   240
         Width           =   120
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "log"
         Height          =   192
         Index           =   26
         Left            =   120
         TabIndex        =   16
         Top             =   480
         Width           =   228
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "natural logarithm"
         Height          =   192
         Index           =   24
         Left            =   600
         TabIndex        =   15
         Top             =   240
         Width           =   1176
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "log to a base"
         Height          =   192
         Index           =   25
         Left            =   600
         TabIndex        =   14
         Top             =   480
         Width           =   936
      End
   End
   Begin VB.Frame fraTrig 
      Caption         =   "Miscellaneous (cont.)"
      Height          =   1815
      Left            =   4440
      TabIndex        =   0
      Top             =   2040
      Width           =   2052
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "abs"
         Height          =   192
         Index           =   5
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   276
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "ans"
         Height          =   192
         Index           =   6
         Left            =   120
         TabIndex        =   11
         Top             =   480
         Width           =   264
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "e"
         Height          =   192
         Index           =   28
         Left            =   120
         TabIndex        =   10
         Top             =   720
         Width           =   96
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "pi"
         Height          =   192
         Index           =   31
         Left            =   120
         TabIndex        =   9
         Top             =   960
         Width           =   132
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "previous answer"
         Height          =   192
         Index           =   30
         Left            =   600
         TabIndex        =   8
         Top             =   480
         Width           =   1176
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "e (2.7182...)"
         Height          =   192
         Index           =   31
         Left            =   600
         TabIndex        =   7
         Top             =   720
         Width           =   792
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "pi (3.1415...)"
         Height          =   192
         Index           =   32
         Left            =   600
         TabIndex        =   6
         Top             =   960
         Width           =   828
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "absolute value"
         Height          =   192
         Index           =   29
         Left            =   600
         TabIndex        =   5
         Top             =   240
         Width           =   1056
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "rnd"
         Height          =   192
         Index           =   27
         Left            =   120
         TabIndex        =   4
         Top             =   1200
         Width           =   228
      End
      Begin VB.Label lblSyntax 
         AutoSize        =   -1  'True
         Caption         =   "sr"
         Height          =   192
         Index           =   33
         Left            =   120
         TabIndex        =   3
         Top             =   1440
         Width           =   132
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "random number"
         Height          =   192
         Index           =   26
         Left            =   600
         TabIndex        =   2
         Top             =   1200
         Width           =   1128
      End
      Begin VB.Label lblSyntaxDescrip 
         AutoSize        =   -1  'True
         Caption         =   "square root"
         Height          =   192
         Index           =   33
         Left            =   600
         TabIndex        =   1
         Top             =   1440
         Width           =   816
      End
   End
   Begin VB.Label lblMoreInfo 
      Caption         =   "For further explanation of the syntax, use, and functionality of this program, refer to ""Documentation.doc""."
      Height          =   375
      Left            =   120
      TabIndex        =   76
      Top             =   3960
      Width           =   5055
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdClose_Click()

    'Close the help dialog box
    Unload Me

End Sub

Private Sub Form_Load()

    'Set form as always on top
    SetWindowPos Me.hwnd, HWND_TOPMOST, Me.Left / Screen.TwipsPerPixelX, Me.Top / Screen.TwipsPerPixelY, Me.Width / Screen.TwipsPerPixelX, Me.Height / Screen.TwipsPerPixelY, SWP_SHOWWINDOW

    'Increase window count
    WindowCount = WindowCount + 1

End Sub

Private Sub Form_Unload(Cancel As Integer)

    'Set focus to main form
    frmCalcSolver.SetFocus
    WindowCount = WindowCount - 1

    'Enable modally displayed form menu items
    If WindowCount = 0 Then
        frmCalcSolver.mnuEditOptions.Enabled = True
        frmCalcSolver.mnuMathConstants.Enabled = True
        frmCalcSolver.mnuHelpAbout.Enabled = True
    End If

End Sub

