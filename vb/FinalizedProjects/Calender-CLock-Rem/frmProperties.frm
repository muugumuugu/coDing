VERSION 5.00
Begin VB.Form frmProperties 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Reminder properties"
   ClientHeight    =   4815
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4815
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4815
   ScaleWidth      =   4815
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtTime 
      Enabled         =   0   'False
      Height          =   285
      Index           =   0
      Left            =   3720
      TabIndex        =   4
      Top             =   2400
      Width           =   375
   End
   Begin VB.TextBox txtDescription 
      Height          =   1815
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   480
      Width           =   4575
   End
   Begin VB.TextBox txtApptName 
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4575
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Close"
      Height          =   375
      Left            =   3360
      TabIndex        =   16
      Top             =   3960
      Width           =   1335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3360
      TabIndex        =   15
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Frame fraRemind 
      Caption         =   "Remind type"
      Height          =   1575
      Left            =   120
      TabIndex        =   8
      Top             =   3120
      Width           =   3135
      Begin VB.OptionButton optDay 
         Caption         =   "Every &day"
         Height          =   255
         Left            =   1320
         TabIndex        =   14
         Top             =   1080
         Width           =   1095
      End
      Begin VB.OptionButton optMonth 
         Caption         =   "Every &month"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   1080
         Width           =   1215
      End
      Begin VB.CheckBox chkDelete 
         Caption         =   "Delete a&fter remind"
         Height          =   255
         Left            =   1320
         TabIndex        =   10
         Top             =   360
         Width           =   1695
      End
      Begin VB.OptionButton optWeek 
         Caption         =   "Every &week"
         Height          =   255
         Left            =   1320
         TabIndex        =   12
         Top             =   720
         Width           =   1215
      End
      Begin VB.OptionButton optYear 
         Caption         =   "Every &year"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   720
         Width           =   1095
      End
      Begin VB.OptionButton optOnlyOnce 
         Caption         =   "Only o&nce"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   360
         Value           =   -1  'True
         Width           =   1095
      End
   End
   Begin VB.CheckBox chkAlarm 
      Caption         =   "&Alarm set at"
      Height          =   255
      Left            =   2520
      TabIndex        =   3
      Top             =   2400
      Width           =   1215
   End
   Begin VB.CheckBox chkDontRemind 
      Caption         =   "Don't &remind me on startup"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   2400
      Width           =   2295
   End
   Begin VB.TextBox txtTime 
      Enabled         =   0   'False
      Height          =   285
      Index           =   1
      Left            =   4320
      TabIndex        =   6
      Top             =   2400
      Width           =   375
   End
   Begin VB.Label lblOriginal 
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   2760
      Width           =   4575
   End
   Begin VB.Label lblColon 
      Alignment       =   2  'Center
      Caption         =   ":"
      Height          =   255
      Left            =   4080
      TabIndex        =   5
      Top             =   2400
      Width           =   255
   End
End
Attribute VB_Name = "frmProperties"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkAlarm_Click()
  Dim Temp As Integer

  Temp = chkAlarm.Value
  txtTime(0).Enabled = Temp
  txtTime(1).Enabled = Temp
End Sub

Private Sub chkDelete_Click()
  If chkDelete.Value Then optOnlyOnce.Value = True
End Sub

Private Sub cmdOK_Click()
  With Appt(frmMain.lstAppt.ItemData(frmMain.lstAppt.ListIndex))
    .AlarmHr = Val(txtTime(0).Text)
    .AlarmMin = Val(txtTime(1).Text)
    .DontRemind = CBool(chkDontRemind.Value)
    .Alarm = CBool(chkAlarm.Value)
    .Description = txtDescription.Text
    .ApptName = txtApptName.Text
    If optOnlyOnce.Value Then .AlarmType = OnlyOnce
    If optYear.Value Then .AlarmType = EveryYear
    If optMonth.Value Then .AlarmType = EveryMonth
    If optWeek.Value Then .AlarmType = EveryWeek
    If optDay.Value Then .AlarmType = EveryDay
    If chkDelete.Value Then .AlarmType = Delete
  End With
  Unload Me
End Sub

Private Sub cmdClose_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Dim Current As Date

  With Appt(frmMain.lstAppt.ItemData(frmMain.lstAppt.ListIndex))
    lblOriginal.Caption = "Original date: " + LoadCompleteDay(.Dia, .Mes, .Año)
    txtApptName.Text = .ApptName
    txtDescription.Text = .Description
    Select Case .AlarmType
      Case OnlyOnce
        optOnlyOnce.Value = True
      Case Delete
        optOnlyOnce.Value = True
        chkDelete.Value = 1
      Case EveryYear
        optYear.Value = True
      Case EveryMonth
        optMonth.Value = True
      Case EveryWeek
        optWeek.Value = True
      Case EveryDay
        optDay.Value = True
    End Select
    chkAlarm.Value = Abs(.Alarm)
    chkDontRemind.Value = Abs(.DontRemind)
    Current = Now()
    If .Alarm Then
      txtTime(0).Text = FormatSimple(.AlarmHr)
      txtTime(1).Text = FormatSimple(.AlarmMin)
    Else
      txtTime(0).Text = FormatSimple(Hour(Current))
      txtTime(1).Text = FormatSimple(Minute(Current))
    End If
  End With
End Sub

Private Sub optDay_Click()
  chkDelete.Value = 0
End Sub

Private Sub optMonth_Click()
  chkDelete.Value = 0
End Sub

Private Sub optWeek_Click()
  chkDelete.Value = 0
End Sub

Private Sub optYear_Click()
  chkDelete.Value = 0
End Sub

Private Sub txtTime_LostFocus(Index As Integer)
  Dim TmpInt As Long

  With txtTime(Index)
    TmpInt = Val(Left(.Text, 2))
    If TmpInt < 0 Then
      TmpInt = 0
    Else
      If Index = 0 Then
        If TmpInt > 23 Then TmpInt = 23
      Else
        If TmpInt > 59 Then TmpInt = 59
      End If
    End If
    .Text = FormatSimple(TmpInt)
  End With
End Sub
