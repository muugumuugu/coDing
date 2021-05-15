VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Calendar"
   ClientHeight    =   6630
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   5655
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   442
   ScaleMode       =   3  'Píxel
   ScaleWidth      =   377
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrClock 
      Interval        =   100
      Left            =   4680
      Top             =   4920
   End
   Begin VB.Frame fraReminders 
      Caption         =   "Reminders"
      Height          =   2895
      Left            =   120
      TabIndex        =   52
      Top             =   3600
      Width           =   5415
      Begin VB.CommandButton cmdOp 
         Caption         =   "Remove"
         Enabled         =   0   'False
         Height          =   375
         Index           =   1
         Left            =   1680
         TabIndex        =   63
         Top             =   2400
         Width           =   855
      End
      Begin VB.CommandButton cmdOp 
         Caption         =   "Rename"
         Enabled         =   0   'False
         Height          =   375
         Index           =   0
         Left            =   840
         TabIndex        =   62
         Top             =   2400
         Width           =   855
      End
      Begin VB.CommandButton cmdMove 
         DisabledPicture =   "frmMain.frx":030A
         Enabled         =   0   'False
         Height          =   375
         Index           =   1
         Left            =   480
         MaskColor       =   &H00000000&
         Picture         =   "frmMain.frx":0398
         Style           =   1  'Graphical
         TabIndex        =   61
         Top             =   2400
         UseMaskColor    =   -1  'True
         Width           =   375
      End
      Begin VB.CommandButton cmdMove 
         DisabledPicture =   "frmMain.frx":0426
         Enabled         =   0   'False
         Height          =   375
         Index           =   0
         Left            =   120
         MaskColor       =   &H00000000&
         Picture         =   "frmMain.frx":04B4
         Style           =   1  'Graphical
         TabIndex        =   60
         Top             =   2400
         UseMaskColor    =   -1  'True
         Width           =   375
      End
      Begin VB.CommandButton cmdProperties 
         Caption         =   "&Properties..."
         Enabled         =   0   'False
         Height          =   375
         Left            =   2640
         TabIndex        =   55
         Top             =   2400
         Width           =   1215
      End
      Begin VB.TextBox txtAppt 
         BackColor       =   &H8000000F&
         Height          =   1935
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   54
         Top             =   360
         Width           =   2655
      End
      Begin VB.ListBox lstAppt 
         Height          =   1905
         IntegralHeight  =   0   'False
         Left            =   120
         TabIndex        =   53
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label lblAlarm 
         Alignment       =   2  'Center
         Caption         =   "Alarm not set"
         Height          =   255
         Left            =   3960
         TabIndex        =   56
         Top             =   2520
         Width           =   1335
      End
   End
   Begin VB.Frame fraCalendar 
      Caption         =   "Calendar"
      Height          =   3375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5415
      Begin VB.PictureBox picClock 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         DrawWidth       =   2
         ForeColor       =   &H80000008&
         Height          =   1455
         Left            =   3840
         ScaleHeight     =   1425
         ScaleWidth      =   1425
         TabIndex        =   58
         Top             =   1440
         Width           =   1455
         Begin VB.Label lblPm 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "PM"
            ForeColor       =   &H00C00000&
            Height          =   195
            Left            =   0
            TabIndex        =   59
            Top             =   0
            Width           =   240
         End
         Begin VB.Line Clock 
            BorderColor     =   &H000000FF&
            Index           =   0
            X1              =   600
            X2              =   600
            Y1              =   600
            Y2              =   1320
         End
         Begin VB.Line Clock 
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Index           =   1
            X1              =   720
            X2              =   720
            Y1              =   600
            Y2              =   1320
         End
         Begin VB.Line Clock 
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Index           =   2
            X1              =   840
            X2              =   840
            Y1              =   600
            Y2              =   1320
         End
      End
      Begin VB.ComboBox cmbMonth 
         Height          =   315
         ItemData        =   "frmMain.frx":0542
         Left            =   3840
         List            =   "frmMain.frx":056A
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   360
         Width           =   1335
      End
      Begin VB.TextBox txtYear 
         Height          =   285
         Left            =   3840
         TabIndex        =   2
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label lblCompleteDay 
         Height          =   255
         Left            =   240
         TabIndex        =   57
         Top             =   3000
         Width           =   4935
      End
      Begin VB.Label lblWeekDay 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Sun"
         Height          =   195
         Index           =   0
         Left            =   360
         TabIndex        =   51
         Top             =   360
         Width           =   405
      End
      Begin VB.Label lblWeekDay 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Mon"
         Height          =   195
         Index           =   1
         Left            =   840
         TabIndex        =   50
         Top             =   360
         Width           =   375
      End
      Begin VB.Label lblWeekDay 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Tue"
         Height          =   195
         Index           =   2
         Left            =   1320
         TabIndex        =   49
         Top             =   360
         Width           =   405
      End
      Begin VB.Label lblWeekDay 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Wed"
         Height          =   195
         Index           =   3
         Left            =   1800
         TabIndex        =   48
         Top             =   360
         Width           =   405
      End
      Begin VB.Label lblWeekDay 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Thu"
         Height          =   195
         Index           =   4
         Left            =   2280
         TabIndex        =   47
         Top             =   360
         Width           =   405
      End
      Begin VB.Label lblWeekDay 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Fri"
         Height          =   195
         Index           =   5
         Left            =   2760
         TabIndex        =   46
         Top             =   360
         Width           =   405
      End
      Begin VB.Label lblWeekDay 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Sat"
         Height          =   195
         Index           =   6
         Left            =   3240
         TabIndex        =   45
         Top             =   360
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   7
         Left            =   3240
         TabIndex        =   44
         Top             =   720
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   6
         Left            =   2760
         TabIndex        =   43
         Top             =   720
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   5
         Left            =   2280
         TabIndex        =   42
         Top             =   720
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   4
         Left            =   1800
         TabIndex        =   41
         Top             =   720
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   3
         Left            =   1320
         TabIndex        =   40
         Top             =   720
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   2
         Left            =   840
         TabIndex        =   39
         Top             =   720
         Width           =   375
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   1
         Left            =   360
         TabIndex        =   38
         Top             =   720
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   14
         Left            =   3240
         TabIndex        =   37
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   13
         Left            =   2760
         TabIndex        =   36
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   12
         Left            =   2280
         TabIndex        =   35
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   11
         Left            =   1800
         TabIndex        =   34
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   10
         Left            =   1320
         TabIndex        =   33
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   9
         Left            =   840
         TabIndex        =   32
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   8
         Left            =   360
         TabIndex        =   31
         Top             =   1080
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   21
         Left            =   3240
         TabIndex        =   30
         Top             =   1440
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   20
         Left            =   2760
         TabIndex        =   29
         Top             =   1440
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   19
         Left            =   2280
         TabIndex        =   28
         Top             =   1440
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   18
         Left            =   1800
         TabIndex        =   27
         Top             =   1440
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   17
         Left            =   1320
         TabIndex        =   26
         Top             =   1440
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   16
         Left            =   840
         TabIndex        =   25
         Top             =   1440
         Width           =   375
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   15
         Left            =   360
         TabIndex        =   24
         Top             =   1440
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   28
         Left            =   3240
         TabIndex        =   23
         Top             =   1800
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   27
         Left            =   2760
         TabIndex        =   22
         Top             =   1800
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   26
         Left            =   2280
         TabIndex        =   21
         Top             =   1800
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   25
         Left            =   1800
         TabIndex        =   20
         Top             =   1800
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   24
         Left            =   1320
         TabIndex        =   19
         Top             =   1800
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   23
         Left            =   840
         TabIndex        =   18
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   22
         Left            =   360
         TabIndex        =   17
         Top             =   1800
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   35
         Left            =   3240
         TabIndex        =   16
         Top             =   2160
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   34
         Left            =   2760
         TabIndex        =   15
         Top             =   2160
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   33
         Left            =   2280
         TabIndex        =   14
         Top             =   2160
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   32
         Left            =   1800
         TabIndex        =   13
         Top             =   2160
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   31
         Left            =   1320
         TabIndex        =   12
         Top             =   2160
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   30
         Left            =   840
         TabIndex        =   11
         Top             =   2160
         Width           =   375
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   29
         Left            =   360
         TabIndex        =   10
         Top             =   2160
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   36
         Left            =   360
         TabIndex        =   9
         Top             =   2520
         Width           =   375
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   37
         Left            =   840
         TabIndex        =   8
         Top             =   2520
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   38
         Left            =   1320
         TabIndex        =   7
         Top             =   2520
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   39
         Left            =   1800
         TabIndex        =   6
         Top             =   2520
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   40
         Left            =   2280
         TabIndex        =   5
         Top             =   2520
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   41
         Left            =   2760
         TabIndex        =   4
         Top             =   2520
         Width           =   405
      End
      Begin VB.Label lblDay 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "X"
         Height          =   195
         Index           =   42
         Left            =   3240
         TabIndex        =   3
         Top             =   2520
         Width           =   405
      End
      Begin VB.Shape shaRectangle 
         BackColor       =   &H00FFFFFF&
         BackStyle       =   1  'Opaque
         Height          =   2295
         Left            =   240
         Top             =   600
         Width           =   3495
      End
      Begin VB.Shape shaWeekDays 
         BackColor       =   &H00808080&
         BackStyle       =   1  'Opaque
         Height          =   255
         Left            =   240
         Top             =   360
         Width           =   3495
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuAppt 
         Caption         =   "&Reminder"
         Begin VB.Menu mnuAdd 
            Caption         =   "&Add..."
         End
         Begin VB.Menu mnuRemove 
            Caption         =   "&Remove"
         End
         Begin VB.Menu mnuRemoveAll 
            Caption         =   "Remove a&ll"
         End
      End
      Begin VB.Menu mnuStandBy 
         Caption         =   "&StandBy mode"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuAbout 
         Caption         =   "&About..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim LockDown As Boolean
Dim DiaSel As Long
Const Pi As Double = 3.14159265358979

Private Sub cmbMonth_Click()
  LockDown = False
  LoadCalendar Val(txtYear.Text), cmbMonth.ListIndex + 1, 1
  LoadAppt
End Sub

Private Sub cmbMonth_DropDown()
  LockDown = True
End Sub

Private Sub cmdMove_Click(Index As Integer)
  Dim i As Long, Sel As Long, Sel1 As Long, Sel2 As Long
  Dim Temp As REMINDER

  With lstAppt
    Sel = .ListIndex
    If Sel = -1 Then Exit Sub
    Sel2 = .ItemData(Sel)
    Temp = Appt(Sel2)
    If Index = 0 Then
      If Sel = 0 Then Exit Sub
      Sel = Sel - 1
      Sel1 = .ItemData(Sel)
      For i = Sel2 To Sel1 + 1 Step -1
        Appt(i) = Appt(i - 1)
      Next i
      Appt(Sel1) = Temp
    Else
      If Sel = .ListCount - 1 Then Exit Sub
      Sel = Sel + 1
      Sel1 = .ItemData(Sel)
      For i = Sel2 To Sel1 - 1
        Appt(i) = Appt(i + 1)
      Next i
      Appt(Sel1) = Temp
    End If
    LoadAppt
    .ListIndex = Sel
  End With
End Sub

Private Sub cmdOp_Click(Index As Integer)
  Dim Sel As Long
  Dim Temp As String

  With lstAppt
    Sel = .ListIndex
    If Sel = -1 Then Exit Sub
    If Index = 0 Then
      Temp = InputBox$("Rename reminder", , .List(Sel))
      If Len(Temp) = 0 Then Exit Sub
      .List(Sel) = Temp
      Appt(.ItemData(Sel)).ApptName = Temp
    Else
      mnuRemove_Click
    End If
  End With
End Sub

Private Sub cmdProperties_Click()
  Dim Sel As Long

  With lstAppt
    Sel = .ListIndex
    If Sel = -1 Then Exit Sub
    frmProperties.Show vbModal
    LoadAppt
    If .ListCount > Sel Then .ListIndex = Sel
  End With
End Sub

Private Sub Form_Load()
  Dim Current As Date

  Current = Now()
  DiaSel = Day(Current)
  txtYear.Text = Year(Current)
  cmbMonth.ListIndex = Month(Current) - 1
  LoadCalendar 1, 1, 1, Current
  LoadClock
  Select Case UCase$(Command)
    Case "RESIDENT"
      mnuStandBy_Click
      Exit Sub
    Case ""
    Case Else
      MsgBox "Invalid command line argument", vbCritical, "Error"
      End
  End Select
  Me.Show
End Sub

Private Sub LoadCalendar(ByVal Año As Long, ByVal Mes As Long, ByVal Dia As Long, Optional ByVal DateVal As Variant)
  Dim DiaRel As Long, Init As Long, i As Long, HowMany As Long

  If Not IsMissing(DateVal) Then
    Dia = Day(DateVal)
    Mes = Month(DateVal)
    Año = Year(DateVal)
  End If
  ClearCalendar
  DecolorCalendar
  DiaRel = WeekDay(Año, Mes, Dia)
  Init = Transform(DiaRel, Dia)
  If Init = 6 Then Init = -1
  HowMany = HowManyDays(Mes, Año)
  If DiaSel > HowMany Then DiaSel = HowMany
  For i = 1 To HowMany
    With lblDay(Init + i + 1)
      .Caption = Format(i)
      If DiaSel = i Then .BackColor = vbRed
    End With
  Next i
  MarkToday
End Sub

Private Sub ClearCalendar()
  Dim i As Long

  For i = 1 To lblDay.UBound
    With lblDay(i)
      If Len(.Caption) Then .Caption = ""
    End With
  Next i
End Sub

Private Sub DecolorCalendar()
  Dim i As Long

  For i = 1 To lblDay.UBound
    With lblDay(i)
      If .BackColor <> vbWhite Then .BackColor = vbWhite
    End With
  Next i
End Sub

Private Sub MarkToday()
  Dim Current As Date
  Dim i As Long, HoyDay As Long
  Const Col = &H9090FF

  Current = Now()
  If LockDown Or Year(Current) <> Val(txtYear.Text) Or Month(Current) <> cmbMonth.ListIndex + 1 Then Exit Sub
  HoyDay = Day(Current)
  For i = 1 To lblDay.UBound
    With lblDay(i)
      If .Caption = CStr(HoyDay) And .BackColor <> vbRed Then If .BackColor <> Col Then .BackColor = Col
    End With
  Next i
End Sub

Private Sub LoadClock()
  Dim i As Byte
  Dim Mark As Boolean
  Dim Rad As Long, Center As Long
  Dim Ang As Double

  Center = picClock.Height / 2
  Rad = Center - 100
  For i = 0 To 2
    Clock(i).X1 = Center
    Clock(i).Y1 = Center
  Next i
  For i = 1 To 60
    Ang = i * 6 * Pi / 180
    Mark = i / 5 = Int(i / 5)
    picClock.DrawWidth = IIf(Mark, 2, 1)
    picClock.PSet (Center + Sin(Ang) * Rad, Center + Cos(Ang) * Rad), IIf(Mark, vbRed, vbBlack)
  Next i
  tmrClock_Timer
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  SetView False
  Cancel = 1
End Sub

Private Sub lblDay_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  With lblDay(Index)
    If Len(.Caption) Then
      lstAppt.Clear
      DiaSel = Val(.Caption)
      DecolorCalendar
      .BackColor = vbRed
      MarkToday
      LoadAppt
    End If
  End With
End Sub

Sub LoadAppt()
  Dim Resp() As Long
  Dim i As Long

  txtAppt.Text = ""
  lblAlarm.Caption = ""
  cmdProperties.Enabled = False
  cmdMove(0).Enabled = False
  cmdMove(1).Enabled = False
  cmdOp(0).Enabled = False
  cmdOp(1).Enabled = False
  TheresAppt Resp, DiaSel, cmbMonth.ListIndex + 1, Val(txtYear.Text), False, False
  With lstAppt
    .Clear
    For i = 1 To UBound(Resp)
      .AddItem Appt(Resp(i)).ApptName
      .ItemData(.ListCount - 1) = Resp(i)
    Next i
  End With
  lblCompleteDay.Caption = LoadCompleteDay(DiaSel, cmbMonth.ListIndex + 1, Val(txtYear.Text))
End Sub

Private Sub lstAppt_Click()
  Dim Sel As Long

  With lstAppt
    Sel = .ListIndex
    If Sel = -1 Then Exit Sub
    cmdProperties.Enabled = True
    cmdMove(0).Enabled = True
    cmdMove(1).Enabled = True
    cmdOp(0).Enabled = True
    cmdOp(1).Enabled = True
    With Appt(.ItemData(Sel))
      txtAppt.Text = .Description
      If .Alarm Then
        lblAlarm.Caption = "Alarm set at " + FormatAlarm(.AlarmHr, .AlarmMin)
      Else
        lblAlarm.Caption = "Alarm not set"
      End If
    End With
  End With
End Sub

Private Sub lstAppt_DblClick()
  cmdProperties_Click
End Sub

Private Sub mnuAbout_Click()
  frmAbout.Show vbModal
End Sub

Private Sub mnuAdd_Click()
  Dim TmpStr As String

  TmpStr = InputBox("Add a new reminder")
  If Len(TmpStr) = 0 Then Exit Sub
  ReDim Preserve Appt(UBound(Appt) + 1)
  With lstAppt
    .AddItem TmpStr
    .ListIndex = .ListCount - 1
    .ItemData(.ListIndex) = UBound(Appt)
  End With
  Appt(UBound(Appt)).ApptName = TmpStr
  With Appt(UBound(Appt))
    .Mes = cmbMonth.ListIndex + 1
    .Dia = DiaSel
    .Año = Val(txtYear.Text)
  End With
  frmProperties.Show vbModal
  LoadAppt
End Sub

Private Sub mnuOptions_Click()
  mnuAdd.Enabled = DiaSel
  mnuRemove.Enabled = lstAppt.ListIndex + 1
End Sub

Private Sub mnuExit_Click()
  SaveAppt
  End
End Sub

Private Sub mnuRemove_Click()
  If MsgBox("Are you sure you want to remove the selected reminder?", vbQuestion + vbYesNo) = vbNo Then Exit Sub
  RemoveAppt lstAppt.ItemData(lstAppt.ListIndex)
  LoadAppt
End Sub

Private Sub mnuRemoveAll_Click()
  If MsgBox("Are you sure you want to remove all reminders?", vbQuestion + vbYesNo) = vbNo Then Exit Sub
  ReDim Appt(0)
  LoadAppt
End Sub

Private Sub mnuStandBy_Click()
  SetView False
End Sub

Private Function LimitAng(ByVal Ang As Double) As Double
  LimitAng = Ang - 90
  If LimitAng < 0 Then LimitAng = 360 + LimitAng
End Function

Private Sub tmrClock_Timer()
  Dim Ang As Double
  Dim PM As String
  Dim Center As Long, Rad As Long, Hr As Long, Min As Long, Sec As Long
  Dim Current As Date
  Static LastNow As Date

  Current = Now()
  If LastNow = Current Then Exit Sub
  LastNow = Current
  Hr = Hour(Current)
  Min = Minute(Current)
  Sec = Second(Current)
  Center = picClock.Height / 2
  Rad = Center - 250
  Ang = LimitAng(Sec * 6) * Pi / 180
  With Clock(0)
    .Y2 = Center + Sin(Ang) * Rad
    .X2 = Center + Cos(Ang) * Rad
  End With
  Ang = LimitAng(Min * 6 + Sec / 60) * Pi / 180
  With Clock(1)
    .Y2 = Center + Sin(Ang) * Rad
    .X2 = Center + Cos(Ang) * Rad
  End With
  Ang = LimitAng((Hr Mod 12 + Min / 60) * 30) * Pi / 180
  Rad = Rad - 150
  With Clock(2)
    .Y2 = Center + Sin(Ang) * Rad
    .X2 = Center + Cos(Ang) * Rad
  End With
  If Hr > 11 Then
    PM = "PM"
  Else
    PM = "AM"
  End If
  If lblPm.Caption <> PM Then lblPm.Caption = PM
  MarkToday
End Sub

Private Sub txtYear_KeyPress(KeyAscii As Integer)
  LockDown = True
  Select Case KeyAscii
    Case vbKeyBack
    Case 13
      YearProcess
      GoTo NoBeep
    Case Is < vbKey0
      GoTo Error
    Case Is > vbKey9
      GoTo Error
  End Select
  Exit Sub
Error:
  Beep
NoBeep:
  KeyAscii = 0
End Sub

Private Sub txtYear_LostFocus()
  YearProcess
End Sub

Private Sub YearProcess()
  Dim Temp As Long

  LockDown = False
  Temp = Abs(Val(txtYear.Text))
  If Temp = 0 Then Temp = 1
  txtYear.Text = Temp
  LoadCalendar Temp, cmbMonth.ListIndex + 1, 1
  LoadAppt
End Sub

Sub SetView(ByVal Active As Boolean)
  tmrClock.Enabled = Active
  If Active Then
    RemoveFromTray
    Me.Show
  Else
    AddToTray
    Me.Hide
  End If
End Sub

