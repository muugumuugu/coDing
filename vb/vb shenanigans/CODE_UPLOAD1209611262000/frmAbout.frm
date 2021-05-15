VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "About Advanced Calculation Solver 1.2"
   ClientHeight    =   3255
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3855
   ControlBox      =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3255
   ScaleWidth      =   3855
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame fraMain 
      Height          =   1335
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   3855
      Begin VB.Label lblemail 
         Alignment       =   2  'Center
         Caption         =   "(avenema@nc.rr.com)"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   120
         TabIndex        =   5
         Top             =   840
         Width           =   3615
      End
      Begin VB.Label lblCopyright 
         Alignment       =   2  'Center
         Caption         =   "Copyright © 2000 Anton Venema"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   600
         Width           =   3660
      End
      Begin VB.Label lblTitle 
         Alignment       =   2  'Center
         Caption         =   "Advanced Calculation Solver (1.2)"
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   3645
      End
   End
   Begin VB.CommandButton cmdSysInfo 
      Caption         =   "System Info..."
      Height          =   350
      Left            =   2280
      TabIndex        =   1
      Top             =   1440
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   350
      Left            =   480
      TabIndex        =   0
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Label lblLaw 
      Caption         =   $"frmAbout.frx":000C
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1332
      Left            =   120
      TabIndex        =   6
      Top             =   1920
      Width           =   3612
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()

    'Close form
    Unload Me
    frmCalcSolver.SetFocus

End Sub

Private Sub cmdSysInfo_Click()
On Error GoTo ErrorHandler

    'Unload about form
    Unload Me

    'Minimize form and load system information application
    frmCalcSolver.WindowState = vbMinimized
    Shell "C:\Program Files\Common Files\Microsoft Shared\MSINFO\MSINFO32.EXE"

    Exit Sub

ErrorHandler:

    If Err.Number = 53 Then

        'File not found
        MsgBox "System information unavailable.", vbCritical, "File Not Found"
    End If

End Sub
