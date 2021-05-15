VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About Calendar"
   ClientHeight    =   2745
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   5160
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2745
   ScaleWidth      =   5160
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOk 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   3840
      TabIndex        =   0
      Top             =   2160
      Width           =   1245
   End
   Begin VB.Label lblVersion 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   345
      Left            =   1665
      TabIndex        =   4
      Top             =   480
      Width           =   1830
   End
   Begin VB.Line Linea 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      X1              =   90
      X2              =   5040
      Y1              =   1845
      Y2              =   1845
   End
   Begin VB.Label lblDescription 
      Alignment       =   2  'Center
      ForeColor       =   &H00000000&
      Height          =   690
      Left            =   533
      TabIndex        =   1
      Top             =   960
      Width           =   4095
   End
   Begin VB.Label lblName 
      Alignment       =   2  'Center
      Caption         =   "Calendar"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   480
      Left            =   1665
      TabIndex        =   3
      Top             =   240
      Width           =   1830
   End
   Begin VB.Line Linea2 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      X1              =   105
      X2              =   5040
      Y1              =   1860
      Y2              =   1860
   End
   Begin VB.Label lblWarning 
      Caption         =   "Warning: This program is copyrighted. Its unauthorized reproduction may result in criminal charges."
      ForeColor       =   &H00000000&
      Height          =   705
      Left            =   255
      TabIndex        =   2
      Top             =   2040
      Width           =   3390
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  lblVersion.Caption = App.Major & "." & App.Minor & "." & App.Revision
  lblDescription.Caption = "Calendar and reminders administrator." + vbCrLf + "Copyright © Muku. All rights reserved"
End Sub
