VERSION 5.00
Begin VB.Form frmParameters 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Mira Parametrs"
   ClientHeight    =   2940
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4605
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2940
   ScaleWidth      =   4605
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   3420
      TabIndex        =   9
      Top             =   2520
      Width           =   1035
   End
   Begin VB.TextBox txtB 
      Height          =   285
      Left            =   1860
      TabIndex        =   1
      Text            =   ".9998"
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox txtStartX 
      Height          =   285
      Left            =   1860
      TabIndex        =   2
      Text            =   "4"
      Top             =   1500
      Width           =   1215
   End
   Begin VB.TextBox txtA 
      Height          =   285
      Left            =   1860
      TabIndex        =   0
      Text            =   ".7"
      Top             =   660
      Width           =   1215
   End
   Begin VB.TextBox txtStartY 
      Height          =   285
      Left            =   1860
      TabIndex        =   4
      Text            =   "0"
      Top             =   1860
      Width           =   1215
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000009&
      BorderWidth     =   2
      X1              =   180
      X2              =   4320
      Y1              =   2400
      Y2              =   2400
   End
   Begin VB.Label lblHeading 
      Caption         =   "Mira Parameters"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   1200
      TabIndex        =   8
      Top             =   60
      Width           =   1935
   End
   Begin VB.Label lblB 
      AutoSize        =   -1  'True
      Caption         =   "Value of B"
      Height          =   195
      Left            =   1050
      TabIndex        =   7
      Top             =   1020
      Width           =   735
   End
   Begin VB.Label lblStartX 
      AutoSize        =   -1  'True
      Caption         =   "Value of initial X"
      Height          =   195
      Left            =   660
      TabIndex        =   6
      Top             =   1620
      Width           =   1125
   End
   Begin VB.Label lblA 
      AutoSize        =   -1  'True
      Caption         =   "Value of A"
      Height          =   195
      Left            =   1050
      TabIndex        =   5
      Top             =   720
      Width           =   735
   End
   Begin VB.Label lblStartY 
      AutoSize        =   -1  'True
      Caption         =   "Value of initial Y"
      Height          =   195
      Left            =   660
      TabIndex        =   3
      Top             =   1920
      Width           =   1125
   End
End
Attribute VB_Name = "frmParameters"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOK_Click()
    Me.Hide
End Sub

