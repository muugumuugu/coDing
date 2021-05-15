VERSION 5.00
Begin VB.Form frmReminder 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Reminders"
   ClientHeight    =   2895
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8175
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2895
   ScaleWidth      =   8175
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Caption         =   "&Exit"
      Height          =   375
      Left            =   6600
      TabIndex        =   4
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   375
      Left            =   6600
      TabIndex        =   3
      Top             =   240
      Width           =   1455
   End
   Begin VB.Frame fraAppt 
      Caption         =   "Today's reminder(s)"
      Height          =   2655
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6375
      Begin VB.TextBox txtDesc 
         BackColor       =   &H8000000F&
         Height          =   2055
         Left            =   3240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   2
         Top             =   360
         Width           =   2895
      End
      Begin VB.ListBox lstAppt 
         Height          =   2010
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   2895
      End
   End
End
Attribute VB_Name = "frmReminder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub lstAppt_Click()
  With lstAppt
    txtDesc.Text = Appt(.ItemData(.ListIndex)).Description
  End With
End Sub
