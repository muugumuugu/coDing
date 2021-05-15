VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About Q-Bert II"
   ClientHeight    =   2865
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   5730
   ClipControls    =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1977.474
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
      Top             =   2400
      Width           =   1260
   End
   Begin VB.Label lblDescription 
      Height          =   1215
      Left            =   960
      TabIndex        =   4
      Top             =   1080
      Width           =   3975
   End
   Begin VB.Label lblTitle 
      Caption         =   "Q-Bert II"
      ForeColor       =   &H00000000&
      Height          =   480
      Left            =   960
      TabIndex        =   2
      Top             =   240
      Width           =   3885
   End
   Begin VB.Label lblVersion 
      Height          =   225
      Left            =   960
      TabIndex        =   3
      Top             =   780
      Width           =   3885
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'This is the Q-Bert II About Dialog

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub cmdOK_Click()       '
'           Unload the form                 '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub cmdOK_Click()
  Unload Me 'unload the form to reveal the game
            'form again.
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub Form_Load()         '
'           Set all labels on the form      '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub Form_Load()
    'set the form's caption
    Me.Caption = "About Qbert II"
    'set all labels
    lblVersion = "Version " & gProgramVersion
    lblTitle = "Q-Bert II"
    lblDescription = "A game based on Q-Bert. The hero goes hopping around on cubes, and a baddie tries to catch him. Q-Bert must jump on the transporter to clear the level." & vbNewLine & "Made by Muku ;) "
End Sub

