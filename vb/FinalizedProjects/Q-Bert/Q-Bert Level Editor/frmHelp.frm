VERSION 5.00
Begin VB.Form frmHelp 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Help"
   ClientHeight    =   6945
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   8160
   Icon            =   "frmHelp.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6945
   ScaleWidth      =   8160
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   28
      Left            =   5280
      Picture         =   "frmHelp.frx":0742
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   31
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox Picture15 
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   5040
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   28
      Top             =   3480
      Width           =   255
   End
   Begin VB.PictureBox Picture11 
      Appearance      =   0  'Flat
      BackColor       =   &H000000FF&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   5760
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   27
      Top             =   3480
      Width           =   255
   End
   Begin VB.PictureBox Picture6 
      Appearance      =   0  'Flat
      BackColor       =   &H0000FFFF&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5280
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   26
      Top             =   3960
      Width           =   495
   End
   Begin VB.PictureBox Picture5 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5280
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   25
      Top             =   3240
      Width           =   495
   End
   Begin VB.PictureBox Picture4 
      Height          =   495
      Left            =   5280
      Picture         =   "frmHelp.frx":56E0
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   24
      Top             =   3480
      Width           =   495
   End
   Begin VB.PictureBox picLeftDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   5040
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   23
      Top             =   2160
      Width           =   255
   End
   Begin VB.PictureBox picRightDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   5760
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   22
      Top             =   2160
      Width           =   255
   End
   Begin VB.PictureBox picDownDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5280
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   21
      Top             =   2640
      Width           =   495
   End
   Begin VB.PictureBox picUpDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5280
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   20
      Top             =   1920
      Width           =   495
   End
   Begin VB.PictureBox picBoxedIn2 
      Height          =   495
      Left            =   5280
      Picture         =   "frmHelp.frx":6860
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   19
      Top             =   2160
      Width           =   495
   End
   Begin VB.PictureBox Picture14 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   2760
      Picture         =   "frmHelp.frx":79E0
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   13
      Top             =   5280
      Width           =   735
   End
   Begin VB.PictureBox Picture13 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   2760
      Picture         =   "frmHelp.frx":A2FC
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   12
      Top             =   3600
      Width           =   735
   End
   Begin VB.PictureBox Picture12 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   2760
      Picture         =   "frmHelp.frx":CC62
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   11
      Top             =   4440
      Width           =   735
   End
   Begin VB.PictureBox Picture9 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   2760
      Picture         =   "frmHelp.frx":F5C8
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   10
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox Picture10 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   1560
      Picture         =   "frmHelp.frx":11F2E
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   9
      Top             =   5280
      Width           =   735
   End
   Begin VB.PictureBox Picture8 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   1560
      Picture         =   "frmHelp.frx":137FE
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   8
      Top             =   3600
      Width           =   735
   End
   Begin VB.PictureBox Picture7 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   1560
      Picture         =   "frmHelp.frx":150CE
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   7
      Top             =   4440
      Width           =   735
   End
   Begin VB.PictureBox Picture3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   1560
      Picture         =   "frmHelp.frx":1699E
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   6
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   2760
      Picture         =   "frmHelp.frx":1826E
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   4
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   1560
      Picture         =   "frmHelp.frx":1A956
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   2
      Top             =   1320
      Width           =   735
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   5880
      TabIndex        =   0
      Top             =   6360
      Width           =   1215
   End
   Begin VB.Label Label12 
      Caption         =   "Also, you have to have the key to the corresponding door on the board!"
      Height          =   615
      Left            =   5040
      TabIndex        =   33
      Top             =   1200
      Width           =   3015
   End
   Begin VB.Label Label11 
      Caption         =   $"frmHelp.frx":1C5B0
      Height          =   1815
      Left            =   6120
      TabIndex        =   32
      Top             =   4320
      Width           =   1815
   End
   Begin VB.Label Label10 
      Caption         =   "To change the color of a door, double click on it. It will rotate betwen white, blue, green and yellow."
      Height          =   855
      Left            =   6120
      TabIndex        =   30
      Top             =   3240
      Width           =   1815
   End
   Begin VB.Label Label7 
      Caption         =   "To use a wall or door tool, just click on the colored wall or door."
      Height          =   735
      Left            =   6120
      TabIndex        =   29
      Top             =   2040
      Width           =   1815
   End
   Begin VB.Label Label9 
      Caption         =   $"frmHelp.frx":1C67F
      Height          =   615
      Left            =   0
      TabIndex        =   18
      Top             =   6240
      Width           =   4695
   End
   Begin VB.Label Label8 
      Caption         =   "OR"
      Height          =   255
      Left            =   2400
      TabIndex        =   17
      Top             =   4680
      Width           =   255
   End
   Begin VB.Label Label5 
      Caption         =   "OR"
      Height          =   255
      Left            =   2400
      TabIndex        =   16
      Top             =   5520
      Width           =   255
   End
   Begin VB.Label Label4 
      Caption         =   "OR"
      Height          =   255
      Left            =   2400
      TabIndex        =   15
      Top             =   3840
      Width           =   255
   End
   Begin VB.Label Label3 
      Caption         =   "OR"
      Height          =   255
      Left            =   2400
      TabIndex        =   14
      Top             =   3000
      Width           =   255
   End
   Begin VB.Label Label2 
      Caption         =   "These cubes are the keys: You can (but don't need to) only have one blue key, one green key, etc."
      Height          =   495
      Left            =   120
      TabIndex        =   5
      Top             =   2160
      Width           =   4695
   End
   Begin VB.Label Label6 
      Caption         =   $"frmHelp.frx":1C708
      Height          =   735
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   7095
   End
   Begin VB.Label Label1 
      Caption         =   "Here are a couple of cubes that you NEED one and ONLY one of:"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   960
      Width           =   4695
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub OKButton_Click()
Unload Me
End Sub


