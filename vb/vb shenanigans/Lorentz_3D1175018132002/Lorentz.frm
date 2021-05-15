VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00C0FFC0&
   Caption         =   "chaos timeeeeeeeeee"
   ClientHeight    =   6885
   ClientLeft      =   165
   ClientTop       =   1155
   ClientWidth     =   9780
   LinkTopic       =   "Form1"
   ScaleHeight     =   6885
   ScaleWidth      =   9780
   Begin VB.HScrollBar HscrSRB 
      Height          =   375
      Index           =   2
      Left            =   7080
      Max             =   100
      TabIndex        =   13
      Top             =   5640
      Width           =   2535
   End
   Begin VB.HScrollBar HscrSRB 
      Height          =   375
      Index           =   1
      Left            =   7080
      Max             =   100
      TabIndex        =   12
      Top             =   4800
      Width           =   2535
   End
   Begin VB.HScrollBar HscrSRB 
      Height          =   375
      Index           =   0
      Left            =   7080
      Max             =   100
      TabIndex        =   10
      Top             =   3840
      Width           =   2535
   End
   Begin VB.HScrollBar HScrXYZ 
      Height          =   375
      Index           =   2
      LargeChange     =   10
      Left            =   7080
      Max             =   1000
      TabIndex        =   5
      Top             =   2160
      Width           =   2535
   End
   Begin VB.HScrollBar HScrXYZ 
      Height          =   375
      Index           =   1
      LargeChange     =   10
      Left            =   7080
      Max             =   1000
      TabIndex        =   4
      Top             =   1320
      Width           =   2535
   End
   Begin VB.HScrollBar HScrXYZ 
      Height          =   375
      Index           =   0
      LargeChange     =   10
      Left            =   7080
      Max             =   1000
      TabIndex        =   2
      Top             =   480
      Width           =   2535
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   375
      LargeChange     =   10
      Left            =   120
      Max             =   360
      SmallChange     =   2
      TabIndex        =   1
      Top             =   6120
      Width           =   6735
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000007&
      Height          =   5895
      Left            =   120
      ScaleHeight     =   5835
      ScaleWidth      =   6675
      TabIndex        =   0
      Top             =   120
      Width           =   6735
   End
   Begin VB.Timer Timer1 
      Left            =   3720
      Top             =   2280
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Parameters"
      Height          =   255
      Left            =   7440
      TabIndex        =   17
      Top             =   3480
      Width           =   2055
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Start Values"
      Height          =   255
      Left            =   7320
      TabIndex        =   16
      Top             =   120
      Width           =   2055
   End
   Begin VB.Label lblRSB 
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   7440
      TabIndex        =   15
      Top             =   6120
      Width           =   1815
   End
   Begin VB.Label lblRSB 
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   7440
      TabIndex        =   14
      Top             =   5280
      Width           =   1815
   End
   Begin VB.Label lblRSB 
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   7440
      TabIndex        =   11
      Top             =   4320
      Width           =   1815
   End
   Begin VB.Label lblAngle 
      Alignment       =   2  'Center
      Caption         =   "Label2"
      Height          =   255
      Left            =   3000
      TabIndex        =   9
      Top             =   6600
      Width           =   735
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000009&
      Caption         =   "Rotate"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   6600
      Width           =   855
   End
   Begin VB.Label lblXYZ 
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   7440
      TabIndex        =   7
      Top             =   2640
      Width           =   1815
   End
   Begin VB.Label lblXYZ 
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   7440
      TabIndex        =   6
      Top             =   1800
      Width           =   1815
   End
   Begin VB.Label lblXYZ 
      BackColor       =   &H80000009&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   7440
      TabIndex        =   3
      Top             =   960
      Width           =   1815
   End
   Begin VB.Menu mnuChaos 
      Caption         =   "Lorentz Chaos"
      Begin VB.Menu mnuExplanation 
         Caption         =   "Explanation"
      End
      Begin VB.Menu mnuDefault 
         Caption         =   "Default values"
      End
      Begin VB.Menu mnuLine 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim XScale As Integer, YScale As Integer
Dim S As Double, R As Double, B As Double
Dim x As Double, y As Double, z As Double
Dim xDot As Double, yDot As Double, zDot As Double
Dim Dt As Double
Dim EndValue As Integer
Dim Theta As Double
Const PI = 3.14159
Dim Startx As Double, Starty As Double, Startz As Double
Dim startS As Double, StartR As Double, StartB As Double

Private Sub Form_Load()


Startx = 0: Starty = 1: Startz = 0
x = Startx: y = Starty: z = Startz
HScrXYZ(0).Value = x * 1000000
HScrXYZ(1).Value = (y - 1) * 1000000
HScrXYZ(2).Value = z * 1000000

Let Dt = 0.005
EndValue = 50
XScale = 100: YScale = 100
Theta = 0

lblAngle.Caption = Str(HScroll1.Value)
lblXYZ(0).Caption = "Start X = " & Str(Startx)
lblXYZ(1).Caption = "Start Y = " & Str(Starty)
lblXYZ(2).Caption = "Start Z = " & Str(Startz)
startS = 10
HscrSRB(0).Value = startS * 5
StartR = 28
HscrSRB(1).Value = StartR * 2
StartB = 8 / 3
HscrSRB(2).Value = StartB * 5
HScroll1.Value = 0
Theta = HScroll1.Value * PI / 180
DrawPicture
End Sub


Private Sub HScroll1_Change()
    lblAngle.Caption = Str(HScroll1.Value)
    Theta = HScroll1.Value * PI / 180
    DrawPicture
End Sub

Private Sub DrawPicture()
Dim t As Double, xx As Double, yy As Double, zz As Double
t = 0
x = Startx
z = Startz
y = Starty
Picture1.Cls

Do While t <= EndValue

    Let xDot = S * (y - x)
    Let yDot = R * x - y - x * z
    Let zDot = x * y - B * z
    Let x = x + xDot * Dt
    Let y = y + yDot * Dt
    Let z = z + zDot * Dt
    Let t = t + Dt
 
    xx = x * Cos(Theta) - y * Sin(Theta)
    Picture1.Line -(XScale * xx + 3500, YScale * z), Picture1.ForeColor
Loop
End Sub



Private Sub HscrSRB_Change(Index As Integer)
Select Case Index
Case 0:
    S = HscrSRB(0).Value / 5
    lblRSB(0).Caption = "S = " & Str(S)
Case 1:
    R = HscrSRB(1).Value / 2
    lblRSB(1).Caption = "R = " & Str(R)
Case 2:
    B = HscrSRB(2).Value / 5
    lblRSB(2).Caption = "B = " & Str(B)
End Select

DrawPicture
End Sub

Private Sub HScrXYZ_Change(Index As Integer)
Select Case Index
    Case 0:
    Startx = HScrXYZ(0).Value / 1000000
    lblXYZ(0).Caption = "Start X = " & Str(Startx)
 Case 1:
    Starty = 1 + HScrXYZ(1).Value / 1000000
    lblXYZ(1).Caption = "Start Y = " & Str(Starty)
 Case 2:
    Startz = HScrXYZ(2).Value / 1000000
    lblXYZ(2).Caption = "Start Z = " & Str(Startz)
End Select
    
DrawPicture
End Sub



Private Sub mnuDefault_Click()
    Form_Load
End Sub

Private Sub mnuExit_Click()
Unload Form1
Unload Form2
End
End Sub

Private Sub mnuExplanation_Click()
Form2.Show
End Sub


Private Sub Picture1_Click()
Dim col
col = InputBox("color")
Picture1.ForeColor = Int(col)



End Sub
