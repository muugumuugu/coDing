VERSION 5.00
Begin VB.Form Form4 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "About"
   ClientHeight    =   2955
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5115
   Icon            =   "Form4.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2955
   ScaleWidth      =   5115
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame Frame1 
      Caption         =   "Diary:-"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   90
      TabIndex        =   1
      Top             =   0
      Width           =   4935
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "mitali120501@gmail.com"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   1680
         MouseIcon       =   "Form4.frx":0442
         MousePointer    =   99  'Custom
         TabIndex        =   6
         ToolTipText     =   "Send e-mail to"
         Top             =   600
         Width           =   1755
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "E-mail:-"
         Height          =   195
         Left            =   1080
         TabIndex        =   5
         Top             =   600
         Width           =   510
      End
      Begin VB.Label Label4 
         Caption         =   "This software is provided ""As Is"", and without warraanty"
         Height          =   255
         Left            =   450
         TabIndex        =   4
         Top             =   1560
         Width           =   4215
      End
      Begin VB.Label Label3 
         Caption         =   "You may not distribute this software without the express written of the copyright holder."
         Height          =   495
         Left            =   270
         TabIndex        =   3
         Top             =   1080
         Width           =   4575
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Warning:-All rights reserved to Muku"
         Height          =   195
         Left            =   645
         TabIndex        =   2
         Top             =   240
         Width           =   2565
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1762
      TabIndex        =   0
      Top             =   2520
      Width           =   1455
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Label6_Click()
On Error GoTo ErrorHandler
RetVal = Shell("Start.exe mailto:maged_said@hotmail.com", vbHide)
ErrorHandler:
End Sub
