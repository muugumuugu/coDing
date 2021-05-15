VERSION 5.00
Begin VB.Form frmHelp 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Help"
   ClientHeight    =   7665
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   11670
   Icon            =   "frmHelp.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7665
   ScaleWidth      =   11670
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture11 
      Height          =   735
      Left            =   7800
      ScaleHeight     =   675
      ScaleWidth      =   675
      TabIndex        =   27
      Top             =   1320
      Width           =   735
      Begin VB.Line Line3 
         BorderColor     =   &H80000009&
         BorderWidth     =   10
         X1              =   360
         X2              =   360
         Y1              =   240
         Y2              =   360
      End
      Begin VB.Line Line2 
         BorderWidth     =   10
         X1              =   360
         X2              =   360
         Y1              =   0
         Y2              =   700
      End
   End
   Begin VB.PictureBox Picture10 
      Height          =   735
      Left            =   3720
      ScaleHeight     =   675
      ScaleWidth      =   675
      TabIndex        =   18
      Top             =   3720
      Width           =   735
      Begin VB.Line Line1 
         BorderWidth     =   10
         X1              =   360
         X2              =   360
         Y1              =   0
         Y2              =   700
      End
   End
   Begin VB.PictureBox Picture9 
      Height          =   735
      Left            =   3720
      Picture         =   "frmHelp.frx":0742
      ScaleHeight     =   675
      ScaleWidth      =   675
      TabIndex        =   16
      Top             =   2880
      Width           =   735
   End
   Begin VB.PictureBox Picture8 
      Height          =   735
      Left            =   3720
      Picture         =   "frmHelp.frx":2E2A
      ScaleHeight     =   675
      ScaleWidth      =   675
      TabIndex        =   14
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox Picture7 
      Height          =   735
      Left            =   3720
      Picture         =   "frmHelp.frx":46FA
      ScaleHeight     =   675
      ScaleWidth      =   795
      TabIndex        =   12
      Top             =   1200
      Width           =   855
   End
   Begin VB.PictureBox Picture5 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   120
      Picture         =   "frmHelp.frx":4912
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   10
      Top             =   4320
      Width           =   735
   End
   Begin VB.PictureBox Picture4 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   120
      Picture         =   "frmHelp.frx":7602
      ScaleHeight     =   585
      ScaleWidth      =   705
      TabIndex        =   7
      Top             =   3600
      Width           =   735
   End
   Begin VB.PictureBox Picture3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   120
      Picture         =   "frmHelp.frx":8782
      ScaleHeight     =   585
      ScaleWidth      =   705
      TabIndex        =   6
      Top             =   2880
      Width           =   735
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   855
      Left            =   120
      Picture         =   "frmHelp.frx":9902
      ScaleHeight     =   825
      ScaleWidth      =   705
      TabIndex        =   4
      Top             =   1920
      Width           =   735
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   120
      Picture         =   "frmHelp.frx":AA4C
      ScaleHeight     =   585
      ScaleWidth      =   705
      TabIndex        =   2
      Top             =   1200
      Width           =   735
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   6120
      TabIndex        =   0
      Top             =   6360
      Width           =   1215
   End
   Begin VB.Label Label12 
      Caption         =   $"frmHelp.frx":B5DA
      Height          =   855
      Left            =   8640
      TabIndex        =   28
      Top             =   1320
      Width           =   3015
   End
   Begin VB.Label Label19 
      Caption         =   $"frmHelp.frx":B67B
      Height          =   855
      Left            =   1680
      TabIndex        =   26
      Top             =   6720
      Width           =   4095
   End
   Begin VB.Label Label18 
      Caption         =   "SPACEBAR KEY:"
      Height          =   255
      Left            =   360
      TabIndex        =   25
      Top             =   6720
      Width           =   1335
   End
   Begin VB.Label Label17 
      Caption         =   "Use this key to shoot (if you have a gun). Notice: Q-Bert will automaticly pick the closest baddie to shoot."
      Height          =   375
      Left            =   1320
      TabIndex        =   24
      Top             =   6120
      Width           =   4335
   End
   Begin VB.Label Label16 
      Caption         =   "CTRL KEY:"
      Height          =   255
      Left            =   360
      TabIndex        =   23
      Top             =   6120
      Width           =   855
   End
   Begin VB.Label Label15 
      Caption         =   "Use these to move left, right, up or down."
      Height          =   375
      Left            =   3240
      TabIndex        =   22
      Top             =   5520
      Width           =   2295
   End
   Begin VB.Label Label14 
      Caption         =   "LEFT, RIGHT, UP, DOWN ARROWS:"
      Height          =   255
      Left            =   360
      TabIndex        =   21
      Top             =   5520
      Width           =   2895
   End
   Begin VB.Label Label13 
      Caption         =   "How to play: these are the keys used:"
      Height          =   255
      Left            =   240
      TabIndex        =   20
      Top             =   5160
      Width           =   2775
   End
   Begin VB.Label Label11 
      Caption         =   $"frmHelp.frx":B748
      Height          =   975
      Left            =   4560
      TabIndex        =   19
      Top             =   3720
      Width           =   3015
   End
   Begin VB.Label Label10 
      Caption         =   $"frmHelp.frx":B803
      Height          =   855
      Left            =   4560
      TabIndex        =   17
      Top             =   2760
      Width           =   3015
   End
   Begin VB.Label Label9 
      Caption         =   "Take the Blue, Green, Red or Yellow Keys to open either the Blue, Green, Red or Yellow doors!"
      Height          =   855
      Left            =   4560
      TabIndex        =   15
      Top             =   1920
      Width           =   3015
   End
   Begin VB.Label Label8 
      Caption         =   "Take this to use to kill the baddies! Watch out, only 8 bullets!!"
      Height          =   495
      Left            =   4560
      TabIndex        =   13
      Top             =   1320
      Width           =   3015
   End
   Begin VB.Label Label6 
      Caption         =   $"frmHelp.frx":B895
      Height          =   975
      Left            =   840
      TabIndex        =   11
      Top             =   120
      Width           =   6015
   End
   Begin VB.Label Label5 
      Caption         =   "Q-Bert is now dead!"
      Height          =   255
      Left            =   960
      TabIndex        =   9
      Top             =   4560
      Width           =   1575
   End
   Begin VB.Label Label4 
      Caption         =   "This is a cube that Q-Bert did jump on"
      Height          =   255
      Left            =   960
      TabIndex        =   8
      Top             =   3840
      Width           =   2655
   End
   Begin VB.Label Label3 
      Caption         =   "This is a cube that Q-Bert didn't jump on yet"
      Height          =   375
      Left            =   960
      TabIndex        =   5
      Top             =   3000
      Width           =   2655
   End
   Begin VB.Label Label2 
      Caption         =   "This is the baddie that won't rest until he catches Q-Bert"
      Height          =   375
      Left            =   960
      TabIndex        =   3
      Top             =   2160
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "This is the hero: Q-Bert"
      Height          =   255
      Left            =   960
      TabIndex        =   1
      Top             =   1320
      Width           =   1815
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'This is the Help Form for Q-Bert II

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub cmdOK_Click()       '
'           Unload the help form            '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub cmdOK_Click()
Unload Me 'show the game form again
End Sub

