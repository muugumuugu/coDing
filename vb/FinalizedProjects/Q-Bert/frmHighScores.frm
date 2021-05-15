VERSION 5.00
Begin VB.Form frmHighScores 
   Caption         =   "High Scores"
   ClientHeight    =   6000
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5280
   Icon            =   "frmHighScores.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6000
   ScaleWidth      =   5280
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   495
      Left            =   1800
      TabIndex        =   33
      Top             =   5400
      Width           =   1455
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   9
      Left            =   3240
      TabIndex        =   32
      Top             =   4440
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   8
      Left            =   3240
      TabIndex        =   31
      Top             =   3960
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   7
      Left            =   3240
      TabIndex        =   30
      Top             =   3480
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   6
      Left            =   3240
      TabIndex        =   29
      Top             =   3000
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   5
      Left            =   3240
      TabIndex        =   28
      Top             =   2520
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   4
      Left            =   3240
      TabIndex        =   27
      Top             =   2040
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   3
      Left            =   3240
      TabIndex        =   26
      Top             =   1560
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   2
      Left            =   3240
      TabIndex        =   25
      Top             =   1080
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   1
      Left            =   3240
      TabIndex        =   24
      Top             =   600
      Width           =   1695
   End
   Begin VB.Label lblScore 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   10
      Left            =   3240
      TabIndex        =   23
      Top             =   4920
      Width           =   1695
   End
   Begin VB.Label Label13 
      Alignment       =   2  'Center
      Caption         =   "Score     "
      Height          =   255
      Left            =   3240
      TabIndex        =   22
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label Label12 
      Alignment       =   2  'Center
      Caption         =   "Name           "
      Height          =   255
      Left            =   720
      TabIndex        =   21
      Top             =   240
      Width           =   2295
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      Caption         =   "Rank"
      Height          =   255
      Left            =   0
      TabIndex        =   20
      Top             =   240
      Width           =   615
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   9
      Left            =   720
      TabIndex        =   19
      Top             =   4440
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   10
      Left            =   720
      TabIndex        =   18
      Top             =   4920
      Width           =   2295
   End
   Begin VB.Label Label10 
      Caption         =   "7."
      Height          =   255
      Left            =   240
      TabIndex        =   17
      Top             =   3480
      Width           =   255
   End
   Begin VB.Label Label9 
      Caption         =   "8."
      Height          =   255
      Left            =   240
      TabIndex        =   16
      Top             =   3960
      Width           =   255
   End
   Begin VB.Label Label8 
      Caption         =   "9."
      Height          =   255
      Left            =   240
      TabIndex        =   15
      Top             =   4440
      Width           =   255
   End
   Begin VB.Label Label7 
      Caption         =   "10."
      Height          =   255
      Left            =   240
      TabIndex        =   14
      Top             =   4920
      Width           =   255
   End
   Begin VB.Label Label6 
      Caption         =   "3."
      Height          =   255
      Left            =   240
      TabIndex        =   13
      Top             =   1560
      Width           =   255
   End
   Begin VB.Label Label5 
      Caption         =   "4."
      Height          =   255
      Left            =   240
      TabIndex        =   12
      Top             =   2040
      Width           =   255
   End
   Begin VB.Label Label4 
      Caption         =   "5."
      Height          =   255
      Left            =   240
      TabIndex        =   11
      Top             =   2520
      Width           =   255
   End
   Begin VB.Label Label3 
      Caption         =   "6."
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   3000
      Width           =   255
   End
   Begin VB.Label Label2 
      Caption         =   "2."
      Height          =   255
      Left            =   240
      TabIndex        =   9
      Top             =   1080
      Width           =   255
   End
   Begin VB.Label Label1 
      Caption         =   "1."
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   600
      Width           =   255
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   7
      Left            =   720
      TabIndex        =   7
      Top             =   3480
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   6
      Left            =   720
      TabIndex        =   6
      Top             =   3000
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   5
      Left            =   720
      TabIndex        =   5
      Top             =   2520
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   4
      Left            =   720
      TabIndex        =   4
      Top             =   2040
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   3
      Left            =   720
      TabIndex        =   3
      Top             =   1560
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   2
      Left            =   720
      TabIndex        =   2
      Top             =   1080
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   8
      Left            =   720
      TabIndex        =   1
      Top             =   3960
      Width           =   2295
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Height          =   255
      Index           =   1
      Left            =   720
      TabIndex        =   0
      Top             =   600
      Width           =   2295
   End
End
Attribute VB_Name = "frmHighScores"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'This is the High Scores Form for Q-Bert II
'I implemented High Scores after
'TiST & (oh_fame@hotmail.com) commented on it.

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub cmdOK_Click()       '
'           Unload the form                 '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub cmdOK_Click()
Unload Me 'show the game form again
End Sub

