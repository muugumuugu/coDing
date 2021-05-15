Attribute VB_Name = "modMain"
Option Explicit
Declare Sub SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long
Declare Function Ticks Lib "kernel32" Alias "GetTickCount" () As Long
Type NOTIFYICONDATA
  cbSize As Long
  hWnd As Long
  uID As Long
  uFlags As Long
  uCallbackMessage As Long
  hIcon As Long
  szTip As String * 64
End Type
Type REMINDER
  Año As Long
  Mes As Byte
  Dia As Byte
  ApptName As String
  Description As String
  Alarm As Boolean
  AlarmHr As Byte
  AlarmMin As Byte
  AlarmType As Byte
  DontRemind As Boolean
  Act As Boolean
End Type
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const WM_LBUTTONDBLCLK = &H203
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_RBUTTONUP = &H205
Public Const NIM_ADD = &H0
Public Const NIM_DELETE = &H2
Public Const NIF_ICON = &H2
Public Const NIF_MESSAGE = &H1
Public Const NIF_TIP = &H4
Public Const MainFile As String = "Info.dat"
Public Const OnlyOnce As Byte = 0
Public Const Delete As Byte = 1
Public Const EveryYear As Byte = 2
Public Const EveryMonth As Byte = 3
Public Const EveryWeek As Byte = 4
Public Const EveryDay As Byte = 5
Public Here As String
Public Appt() As REMINDER
Private TrayIcon As NOTIFYICONDATA

Sub SaveAppt()
  Dim i As Long

  Open Here + MainFile For Output As #1
  Close
  Open Here + MainFile For Binary Access Write As #1
  Put #1, , CLng(UBound(Appt))
  For i = 1 To UBound(Appt)
    Put #1, , Appt(i)
  Next i
  Close
  RemoveFromTray
End Sub

Sub RemoveAppt(ByVal ApptToRemove As Long)
  Dim i As Long, MaxBound As Long

  MaxBound = UBound(Appt) - 1
  For i = ApptToRemove To MaxBound
    Appt(i) = Appt(i + 1)
  Next i
  ReDim Preserve Appt(MaxBound)
End Sub

Sub Main()
  Dim NumAppt As Long, i As Long
  Dim Resp() As Long
  Dim Current As Date
  Dim List As ListBox

  If App.PrevInstance Then If MsgBox("It's not recommended to have more than one instance of the program in memory." + vbCrLf + "Continue anyway?", vbQuestion + vbYesNo) = vbNo Then End
  Here = App.Path
  If Right(Here, 1) <> "\" Then Here = Here + "\"
  Open Here + MainFile For Binary Access Read As #1
  Get 1, , NumAppt
  ReDim Appt(NumAppt)
  For i = 1 To NumAppt
    Get #1, , Appt(i)
  Next i
  Close
  Current = Now()
  TheresAppt Resp, Day(Current), Month(Current), Year(Current), True, False
  If UBound(Resp) Then
    Load frmReminder
    With frmReminder
      Set List = .lstAppt
      For i = 1 To UBound(Resp)
        With Appt(Resp(i))
          List.AddItem .ApptName
          List.ItemData(List.NewIndex) = Resp(i)
        End With
      Next i
      .Show vbModal
    End With
  End If
  Load frmAlarm
End Sub

Function LoadCompleteDay(ByVal Dia As Long, ByVal Mes As Long, ByVal Año As Long) As String
  Select Case WeekDay(Año, Mes, Dia)
    Case 0
      LoadCompleteDay = "Monday, "
    Case 1
      LoadCompleteDay = "Tuesday, "
    Case 2
      LoadCompleteDay = "Wednesday, "
    Case 3
      LoadCompleteDay = "Thursday, "
    Case 4
      LoadCompleteDay = "Friday, "
    Case 5
      LoadCompleteDay = "Saturday, "
    Case 6
      LoadCompleteDay = "Sunday, "
  End Select
  Select Case Mes
    Case 1
      LoadCompleteDay = LoadCompleteDay + "January "
    Case 2
      LoadCompleteDay = LoadCompleteDay + "February "
    Case 3
      LoadCompleteDay = LoadCompleteDay + "March "
    Case 4
      LoadCompleteDay = LoadCompleteDay + "April "
    Case 5
      LoadCompleteDay = LoadCompleteDay + "May "
    Case 6
      LoadCompleteDay = LoadCompleteDay + "June "
    Case 7
      LoadCompleteDay = LoadCompleteDay + "July "
    Case 8
      LoadCompleteDay = LoadCompleteDay + "August "
    Case 9
      LoadCompleteDay = LoadCompleteDay + "September "
    Case 10
      LoadCompleteDay = LoadCompleteDay + "October "
    Case 11
      LoadCompleteDay = LoadCompleteDay + "November "
    Case 12
      LoadCompleteDay = LoadCompleteDay + "December "
  End Select
  LoadCompleteDay = LoadCompleteDay & Dia
  Select Case Right$(Dia, 1)
    Case "1"
      If Dia = 11 Then GoTo IsTh
      LoadCompleteDay = LoadCompleteDay + "st"
    Case "2"
      If Dia = 12 Then GoTo IsTh
      LoadCompleteDay = LoadCompleteDay + "nd"
    Case "3"
      If Dia = 13 Then GoTo IsTh
      LoadCompleteDay = LoadCompleteDay + "rd"
    Case Else
IsTh:
      LoadCompleteDay = LoadCompleteDay + "th"
  End Select
  LoadCompleteDay = LoadCompleteDay + " " & Año
End Function

Sub TheresAppt(Resp() As Long, ByVal Dia As Long, ByVal Mes As Long, ByVal Año As Long, ByVal CheckRemind As Boolean, ByVal CheckTime As Boolean)
  Dim i As Long, MaxBound As Long
  Dim Current As Date

  Current = Now()
  ReDim Resp(0)
  For i = 1 To UBound(Appt)
    With Appt(i)
      Select Case .AlarmType
        Case OnlyOnce, Delete
          If Not (.Año = Año And .Mes = Mes And .Dia = Dia) Then GoTo Seguir
        Case EveryYear
          If Not (.Mes = Mes And .Dia = Dia) Then GoTo Seguir
        Case EveryMonth
          If Not .Dia = Dia Then GoTo Seguir
        Case EveryWeek
          If Not WeekDay(.Año, .Mes, .Dia) = WeekDay(Año, Mes, Dia) Then GoTo Seguir
      End Select
      If CheckRemind Then If .DontRemind Then GoTo Seguir
      If CheckTime Then If Not .Alarm Or .AlarmHr <> Hour(Current) Or .AlarmMin <> Minute(Current) Then GoTo Seguir
      'If .AlarmHr <> Hour(Current) Or .AlarmMin <> Minute(Current) Then GoTo Seguir
      MaxBound = UBound(Resp) + 1
      ReDim Preserve Resp(MaxBound)
      Resp(MaxBound) = i
Seguir:
    End With
  Next i
End Sub

Private Function Restringir(ByVal Number As Long) As Long
  While Number >= 7
    Number = Number - 7
  Wend
  While Number < 0
    Number = Number + 7
  Wend
  Restringir = Number
End Function

Function WeekDay(ByVal Año As Long, ByVal Mes As Long, ByVal Dia As Long) As Byte
  Dim TmpDbl As Double
  Dim TmpLng As Long
  Dim TmpInt As Long, Fecha As Long, Counter As Long

  TmpLng = Int(Año / 4) + Año
  TmpDbl = TmpLng / 7
  TmpDbl = (TmpDbl - Int(TmpDbl)) * 7
  TmpInt = TmpDbl - 1
  Select Case TmpInt
    Case -1
      TmpInt = 3
    Case 0
      TmpInt = 2
    Case 1
      TmpInt = 1
    Case 2
      TmpInt = 0
    Case 3
      TmpInt = 6
    Case 4
      TmpInt = 5
    Case 5
      TmpInt = 4
  End Select
  Select Case Mes - 1
    Case 0, 9
      Mes = 1
    Case 1, 2, 10
      Mes = 4
    Case 3, 6
      Mes = 0
    Case 4
      Mes = 2
    Case 5
      Mes = 5
    Case 8, 11
      Mes = 6
    Case 7
      Mes = 3
  End Select
  Fecha = Restringir(Dia)
  Fecha = Restringir(Mes + Fecha)
  While TmpInt <> Fecha
    TmpInt = Restringir(TmpInt - 1)
    Counter = Counter + 1
  Wend
  WeekDay = 6 - Counter
End Function

Function Transform(ByVal DiaRel As Long, ByVal DiaAbs As Long) As Long
  While DiaAbs <> 1
    DiaAbs = DiaAbs - 1
    DiaRel = Restringir(DiaRel - 1)
  Wend
  Transform = DiaRel
End Function

Function IsDivisible(ByVal Number As Double, ByVal Divisor As Double) As Boolean
  Dim TmpDbl As Double

  TmpDbl = Number / Divisor
  IsDivisible = TmpDbl = Int(Number / Divisor)
End Function

Function HowManyDays(ByVal Month As Long, ByVal Year As Long) As Long
  Select Case Month
    Case 1, 3, 5, 7, 8, 10, 12
      HowManyDays = 31
    Case 4, 6, 9, 11
      HowManyDays = 30
    Case 2
      If IsDivisible(Year, 1000) Then
        HowManyDays = IIf(IsDivisible(Year, 400), 29, 28)
      Else
        HowManyDays = IIf(IsDivisible(Year, 4), 29, 28)
      End If
  End Select
End Function

Sub AddToTray()
  With TrayIcon
    .cbSize = Len(TrayIcon)
    .hWnd = frmAlarm.picHook.hWnd
    .szTip = "SuperCalendar" + Chr$(0)
    .uID = 1
    .hIcon = frmMain.Icon
    .uFlags = NIF_ICON Or NIF_MESSAGE Or NIF_TIP
    .uCallbackMessage = WM_LBUTTONDOWN ' WM_MOUSEMOVE
  End With
  Shell_NotifyIcon NIM_ADD, TrayIcon
End Sub

Sub RemoveFromTray()
  Shell_NotifyIcon NIM_DELETE, TrayIcon
End Sub

Function FormatAlarm(ByVal Hour As Long, ByVal Mins As Long) As String
  Dim Temp As String

  Temp = Hour
  If Len(Temp) = 1 Then FormatAlarm = "0" + Temp Else FormatAlarm = Temp
  Temp = Mins
  If Len(Temp) = 1 Then FormatAlarm = FormatAlarm + ":0" + Temp Else FormatAlarm = FormatAlarm + ":" + Temp
End Function

Function FormatSimple(ByVal Num As Long) As String
  FormatSimple = Num
  If Len(FormatSimple) = 1 Then FormatSimple = "0" + FormatSimple
End Function
