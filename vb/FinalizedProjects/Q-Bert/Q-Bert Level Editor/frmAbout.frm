VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About Q-Bert  Level Editor"
   ClientHeight    =   3045
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   5730
   ClipControls    =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2101.713
   ScaleMode       =   0  'User
   ScaleWidth      =   5380.766
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      ClipControls    =   0   'False
      Height          =   540
      Left            =   240
      Picture         =   "frmAbout.frx":030A
      ScaleHeight     =   337.12
      ScaleMode       =   0  'User
      ScaleWidth      =   337.12
      TabIndex        =   1
      Top             =   240
      Width           =   540
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   2160
      TabIndex        =   0
      Top             =   2640
      Width           =   1260
   End
   Begin VB.Label Label3 
      Caption         =   "Graphics:Muku"
      Height          =   255
      Left            =   1080
      TabIndex        =   5
      Top             =   1680
      Width           =   3975
   End
   Begin VB.Label Label1 
      Caption         =   "Programming: Muku"
      Height          =   255
      Left            =   1080
      TabIndex        =   4
      Top             =   1440
      Width           =   3975
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   84.515
      X2              =   5309.398
      Y1              =   1687.582
      Y2              =   1687.582
   End
   Begin VB.Label lblDescription 
      Caption         =   "Level Editor For Q-Bert "
      ForeColor       =   &H00000000&
      Height          =   210
      Left            =   1080
      TabIndex        =   2
      Top             =   1200
      Width           =   3885
   End
   Begin VB.Label lblTitle 
      Caption         =   "Q-Bert  Level Editor"
      ForeColor       =   &H00000000&
      Height          =   480
      Left            =   1080
      TabIndex        =   3
      Top             =   240
      Width           =   3885
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   98.6
      X2              =   5309.398
      Y1              =   1697.936
      Y2              =   1697.936
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()
'unload the form
Unload Me
End Sub

