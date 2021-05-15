VERSION 5.00
Begin VB.Form pgb 
   BackColor       =   &H00C0C0C0&
   ClientHeight    =   930
   ClientLeft      =   2325
   ClientTop       =   5565
   ClientWidth     =   5790
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   930
   ScaleWidth      =   5790
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      Height          =   250
      Left            =   120
      ScaleHeight     =   195
      ScaleMode       =   0  'User
      ScaleWidth      =   100
      TabIndex        =   18
      Top             =   480
      Width           =   5580
      Begin VB.CheckBox chkPrg 
         BackColor       =   &H00800000&
         Height          =   200
         Left            =   0
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   0
         Width           =   5535
      End
   End
   Begin VB.PictureBox Picture3 
      Height          =   400
      Left            =   120
      ScaleHeight     =   345
      ScaleWidth      =   5520
      TabIndex        =   2
      Top             =   2160
      Visible         =   0   'False
      Width           =   5580
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   14
         Left            =   5160
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   13
         Left            =   4800
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   12
         Left            =   4440
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   11
         Left            =   4080
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   10
         Left            =   3720
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   9
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   8
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   7
         Left            =   2640
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   6
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   5
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   4
         Left            =   1560
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   3
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   2
         Left            =   840
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   1
         Left            =   480
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   50
         Width           =   255
      End
      Begin VB.CheckBox chk 
         Height          =   255
         Index           =   0
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   50
         Width           =   255
      End
   End
   Begin VB.Label lblTime 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      Caption         =   "..."
      ForeColor       =   &H00000000&
      Height          =   225
      Left            =   120
      TabIndex        =   20
      Top             =   240
      Width           =   5580
   End
   Begin VB.Label lblPerc 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "0% Completed"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   5535
   End
   Begin VB.Label lblHeader 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Loading ..."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   5535
   End
End
Attribute VB_Name = "pgb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Author : Renier Barnard (renier_barnard@santam.co.za)
'
' Date    : July 1999
'
' Description :
' This code will demonstrate how to make a simple but nice
' looking progress bar. It could be more simple (Using the line command)
' but this looks better. The form_click event will start the progress bar of.
' Try resizing the progress bar form. There is some code to demonstrate
' how to make something like this generic in size !
'
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Private Declare Function timeGetTime Lib "winmm.dll" () As Long
'Private Declare Function SetWindowPos Lib "USER32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Const FLAGS = 1
Const HWND_TOPMOST = -1
Dim Aindex As Integer
Dim LastPos As Long
Dim lLastTime As Double
Dim tLastTime


Public Function Progress(Value, MaxValue, Optional HeaderX As String, Optional color As ColorConstants)
'' This is the actual progress bar function.

DoEvents
Dim Perc
Dim bb As Integer
Dim lTime As Double
Dim lTimeDiff As Double
Dim lTimeLeft As Double
Dim lTotalTime As Double
'Me.Show

'Get a color to do it in
'If color = 0 Then color = &H8000&
color = RGB(0, 0, 140)


'Display the header , if any was returned
If HeaderX <> "" Then
    lblHeader = HeaderX
Else
    lblHeader = "Busy Processing...Please wait"
End If

'Now work out the percentage (0-100) of where we currently are
Perc = (Value / MaxValue) * 100
If Perc < 0 Then Perc = 0
If Perc > 100 Then Perc = 100
Perc = Int(Perc)

'Do the time remaining calculation
If (Perc Mod 10) = 0 Or Perc = 0 Then ' Every 10 percent
        lTimeDiff = lTime - lLastTime
        lTime = Time - tLastTime
        If Perc = 0 Or Perc < 0 Then
            lTotalTime = ((100 / 1) * 2) * lTime
            lTimeLeft = (((100 / 1) * 2) * lTime) - (((100 / 100) * 2) * lTime)
        Else
            lTotalTime = ((100 / Perc) * 2) * lTime
            lTimeLeft = (((100 / Perc) * 2) * lTime) - (((100 / 100) * 2) * lTime)
        End If
        lblTime = "Time Remaining : " & Format((lTimeLeft), "hh:mm:ss")
        'lblTime.ForeColor = color
End If
DoEvents


'lblPerc.ForeColor = color
'lblHeader.ForeColor = color
'chkPrg.BackColor = color
DoEvents
lblPerc.Caption = Int(Perc) & "% Completed" 'Just the Label Display


'chkPrg.BackColor = RGB(0, Perc * 2.5, 255 - Perc * 2.5)

chkPrg.Width = Int(Perc)

DoEvents

End Function

Private Sub Form_Click()
'Dim ii As Integer
'
'For ii = 1 To 5000 ' ii = val , 5000 = maxval
'    Call Progress(ii, 5000, "Testing", vbMagenta) ' Call the progressbar function
'Next ii

End Sub

Private Sub Form_Load()

tLastTime = Time

Const FLAGS = 1
Const HWND_TOPMOST = -1
Aindex = 0
LastPos = 720

'Me.Width = 5910
'Me.Height = 1545

Me.Top = Screen.Height / 2 - Me.Height / 2
Me.Left = Screen.Width / 2 - Me.Width / 2

'Sets form on always on top.
Dim Success As Integer
'Success% = SetWindowPos(Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
                                                ' Change the "0's" above to position the window.

Me.Top = Screen.Height / 2 - Me.Height / 2
Me.Left = Screen.Width / 2 - Me.Width / 2
DoEvents

End Sub

Private Sub Form_Resize()
'Look at the following code to see how the progress bar will resize to
'fit itself , no matter what the size of the form.

'Dim bb As Integer
'
'
'Picture1.Width = Me.Width - 350
''Picture1.Height = Me.Height - 500
'
'For bb = 0 To 19
'    Picture2(bb).Width = (Picture1.Width) / 15 - 2
'    'Picture2(bb).Height = (Picture1.Height) - 50
'    If bb > 0 Then
'        Picture2(bb).Left = Picture2(bb - 1).Left + Picture2(bb - 1).Width
'    End If
'    DoEvents
'Next bb
'
'lblPerc.Width = Picture1.Width
''lblPerc.Top = Me.Height - 350
'Picture1.Refresh

End Sub

Private Sub Form_Unload(Cancel As Integer)
DoEvents
End Sub

'Private Sub tmrAnimate_Timer()
''This funtion will animate a couple of icons , just to show that something is busy hapening
'
'DoEvents
'LastPos = LastPos + 1
'
''If LastPos > 2880 And LastPos < 3350 Then
''    LastPos = 3360
''    Aindex = 1
''Else
''    If LastPos > 5760 Then
''        LastPos = 720
''        Aindex = 0
''    Else
''
''    End If
''End If
'If LastPos > 2680 And LastPos < 3250 Then
'    LastPos = 3160
'    Aindex = 1
'Else
'    If LastPos > 5360 Then
'        LastPos = 720
'        Aindex = 0
'    Else
'
'    End If
'End If
'
'If Aindex = 1 Then
'    imgGo(1).Visible = True
'    imgGo(0).Visible = False
'Else
'    imgGo(1).Visible = False
'    imgGo(0).Visible = True
'End If
'
'LastPos = LastPos + 200
'imgGo(Aindex).Left = LastPos
'DoEvents
'
'End Sub
'
