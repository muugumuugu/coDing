VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.UserControl WndMusic 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00C0C0C0&
   ClientHeight    =   2715
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2280
   ScaleHeight     =   181
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   152
   Begin VB.PictureBox picWMP 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      HasDC           =   0   'False
      Height          =   2325
      Left            =   15
      ScaleHeight     =   2325
      ScaleWidth      =   2235
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   360
      Width           =   2235
      Begin VB.FileListBox FileList 
         Height          =   870
         Left            =   810
         TabIndex        =   13
         Top             =   360
         Visible         =   0   'False
         Width           =   1275
      End
      Begin VB.PictureBox picVol 
         AutoRedraw      =   -1  'True
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   195
         Left            =   360
         ScaleHeight     =   13
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   103
         TabIndex        =   10
         ToolTipText     =   "Volume"
         Top             =   1710
         Width           =   1545
      End
      Begin CityBuilder.LineButton btnVolIncrease 
         Height          =   195
         Left            =   1980
         TabIndex        =   12
         ToolTipText     =   "Increase Volume"
         Top             =   1710
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   344
         Caption         =   "+"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CityBuilder.LineButton btnVolDecrease 
         Height          =   195
         Left            =   90
         TabIndex        =   11
         ToolTipText     =   "Decrease Volume"
         Top             =   1710
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   344
         Caption         =   "-"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CityBuilder.LineButton btnPrev 
         Height          =   285
         Left            =   90
         TabIndex        =   9
         ToolTipText     =   "Previous Track"
         Top             =   1980
         Width           =   465
         _ExtentX        =   820
         _ExtentY        =   503
         Caption         =   "9"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Webdings"
            Size            =   9.75
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CityBuilder.LineButton btnNext 
         Height          =   285
         Left            =   1710
         TabIndex        =   8
         ToolTipText     =   "Next Track"
         Top             =   1980
         Width           =   465
         _ExtentX        =   820
         _ExtentY        =   503
         Caption         =   ":"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Webdings"
            Size            =   9.75
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CityBuilder.LineButton btnStop 
         Height          =   285
         Left            =   1170
         TabIndex        =   7
         ToolTipText     =   "Stop"
         Top             =   1980
         Width           =   465
         _ExtentX        =   820
         _ExtentY        =   503
         Caption         =   "<"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Webdings"
            Size            =   9.75
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CityBuilder.LineButton btnPlay 
         Height          =   285
         Left            =   630
         TabIndex        =   6
         ToolTipText     =   "Play"
         Top             =   1980
         Width           =   465
         _ExtentX        =   820
         _ExtentY        =   503
         Caption         =   "4"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Webdings"
            Size            =   9.75
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin CityBuilder.NewsTicker ntFileName 
         Height          =   195
         Left            =   90
         TabIndex        =   5
         Top             =   1440
         Width           =   2085
         _ExtentX        =   3678
         _ExtentY        =   344
      End
      Begin WMPLibCtl.WindowsMediaPlayer WMP 
         Height          =   1365
         Left            =   90
         TabIndex        =   4
         Top             =   0
         Width           =   2085
         URL             =   ""
         rate            =   1
         balance         =   0
         currentPosition =   0
         defaultFrame    =   ""
         playCount       =   1
         autoStart       =   -1  'True
         currentMarker   =   0
         invokeURLs      =   0   'False
         baseURL         =   ""
         volume          =   50
         mute            =   0   'False
         uiMode          =   "none"
         stretchToFit    =   0   'False
         windowlessVideo =   0   'False
         enabled         =   -1  'True
         enableContextMenu=   0   'False
         fullScreen      =   0   'False
         SAMIStyle       =   ""
         SAMILang        =   ""
         SAMIFilename    =   ""
         captioningID    =   ""
         enableErrorDialogs=   0   'False
         _cx             =   3678
         _cy             =   2408
      End
   End
   Begin CityBuilder.LineButton cmdClose 
      Height          =   210
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   165
      _ExtentX        =   291
      _ExtentY        =   370
      ColorNormal     =   255
      ColorLight      =   12632319
   End
   Begin VB.Shape shpBox 
      BorderColor     =   &H00FFFFFF&
      Height          =   1185
      Left            =   0
      Top             =   0
      Width           =   1635
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackStyle       =   0  'Transparent
      Caption         =   "Music"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2265
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Music"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Top             =   15
      Width           =   2265
   End
End
Attribute VB_Name = "WndMusic"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'
Const CLR_LIGHT = &HA8A8A8  ' RGB(168, 168, 168)
Const CLR_NORMAL = &H848484 ' RGB(132, 132, 132)
Const CLR_DARK = &H646464   ' RGB(100, 100, 100)

Private Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long

Dim mX As Single, mY As Single
Dim m_DefaultX As Single, m_DefaultY As Single
Dim m_Music As Boolean, m_PlaylistFile As String

Private Sub btnNext_Click()
    If m_Music Then WMP.Controls.Next
End Sub

Private Sub btnPlay_Click()
    If m_PlaylistFile <> "" Then WMP.Controls.play Else PlayMusic
End Sub

Private Sub btnPrev_Click()
    If m_Music Then WMP.Controls.previous
End Sub

Private Sub btnStop_Click()
    m_Music = False
    WMP.Controls.stop
End Sub

Private Sub btnVolDecrease_Click()
    WMP.Settings.Volume = WMP.Settings.Volume - 5
    ShowVolume
End Sub

Private Sub btnVolIncrease_Click()
    WMP.Settings.Volume = WMP.Settings.Volume + 5
    ShowVolume
End Sub

Private Sub cmdClose_Click()
    UserControl.Extender.Visible = False
End Sub

Private Sub lblCaption_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
    If Index = 0 Then
        If Button = vbLeftButton Then
            mX = X / Screen.TwipsPerPixelX
            mY = Y / Screen.TwipsPerPixelY
        End If
    End If
End Sub

Private Sub lblCaption_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lLeft As Single, lTop As Single
    If Index = 0 Then
        If Button = vbLeftButton Then
            '
            lLeft = UserControl.Extender.Left - (mX - (X / Screen.TwipsPerPixelX))
            lTop = UserControl.Extender.Top - (mY - (Y / Screen.TwipsPerPixelY))
            ' validate
            If (lLeft >= 0) And ((lLeft + ScaleWidth) <= Board.Width) Then
                UserControl.Extender.Left = lLeft
            End If
            If (lTop >= Board.Top) And ((lTop + 4) <= Board.ScaleHeight) Then
                UserControl.Extender.Top = lTop
            End If
        End If
    End If
End Sub

Private Sub UserControl_GotFocus()
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_Initialize()
    Width = 2280
    Height = 2715
    '
    picWMP.BackColor = CLR_NORMAL
    picVol.BackColor = CLR_DARK
    '
    ntFileName.Caption = "Music Jukebox"
    ShowVolume
    FileList.Path = App.Path & "\music"
    WMP.Settings.autoStart = True
    WMP.Settings.setMode "loop", True
    '
    With cmdClose
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    '
    With btnPrev
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    '
    With btnPlay
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    '
    With btnStop
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    '
    With btnNext
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    '
    With btnVolIncrease
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    '
    With btnVolDecrease
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    '
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        DefaultX = .ReadProperty("DefaultX", 20)
        DefaultY = .ReadProperty("DefaultY", 20)
    End With
    '
    If (UserControl.Ambient.UserMode) Then
        UserControl.Extender.Left = DefaultX
        UserControl.Extender.Top = DefaultY
    End If
    '
End Sub

Private Sub UserControl_Resize()
    Width = 2280
    Height = 2715
    lblCaption(0).Width = ScaleWidth
    lblCaption(1).Width = ScaleWidth
    '
    shpBox.Move 0, 0, ScaleWidth, ScaleHeight
    '
    DrawWindow
End Sub

Private Sub UserControl_Show()
    DrawWindow
    MyTimer 100
    '
    cmdClose.Spark = True
    shpBox.ZOrder 0
    shpBox.Visible = True
    MyTimer 100
    '
    shpBox.Visible = False
    cmdClose.Spark = False
End Sub

Private Sub DrawWindow()
    '
    Cls
    '
    UserControl.BackColor = CLR_NORMAL
    '
    ' NOTE: The following coordinates are for vbPixel scalemode only.
    SetLine 0, 0, ScaleWidth, 0, CLR_LIGHT
    SetLine 0, 13, ScaleWidth, 13, CLR_DARK
    SetLine 0, 14, ScaleWidth, 14, CLR_LIGHT
    SetLine 0, ScaleHeight - 1, ScaleWidth, ScaleHeight - 1, CLR_DARK
    SetLine 0, 14, 0, ScaleHeight - 1, CLR_LIGHT
    '
    SetLine 10, 0, 10, 13, CLR_DARK
    SetLine 11, 0, 11, 13, CLR_LIGHT
    SetLine 12, 1, 12, 13, CLR_DARK
    SetLine 12, 1, ScaleWidth, 1, CLR_DARK
    SetLine 13, 12, ScaleWidth - 1, 12, CLR_LIGHT
    SetLine ScaleWidth - 2, 2, ScaleWidth - 2, 12, CLR_LIGHT
    '
    SetLine ScaleWidth - 1, 0, ScaleWidth - 1, ScaleHeight, CLR_DARK
    '
    lblCaption(0).ZOrder 0
    cmdClose.ZOrder 0
    shpBox.ZOrder 0
    '
End Sub

Private Sub SetLine(X1, Y1, X2, Y2, Clr)
    Line (X1, Y1)-(X2, Y2), Clr
End Sub

Public Sub ShowWindow()
    UserControl.Extender.ZOrder 0
    If UserControl.Extender.Visible Then
        Call UserControl_Show
    Else
        UserControl.Extender.Visible = True
    End If
End Sub

Public Property Get Music() As Boolean
    Music = m_Music
End Property

Public Property Let Music(ByVal vNewValue As Boolean)
    m_Music = vNewValue
    If m_Music Then
        PlayMusic
    Else
        WMP.Controls.stop
    End If
End Property

Private Sub PlayMusic()
    m_Music = True
    '
    If FileList.ListCount = 0 Then
        ntFileName.Caption = "No music files found in Music folder"
        Exit Sub
    End If
    '
    Dim lIndex As Long, lStart As Long, Fr As Integer

    ' Generate playlist filename ( to be created in windows' Temp folder)
    m_PlaylistFile = Space(260)
    m_PlaylistFile = Left$(m_PlaylistFile, GetTempPath(Len(m_PlaylistFile), m_PlaylistFile))
    If Right(m_PlaylistFile, 1) <> "\" Then m_PlaylistFile = m_PlaylistFile & "\"
    m_PlaylistFile = m_PlaylistFile & "~CityBuilder.m3u"

    ' Start playlist sequence from a randomly selected file
    Randomize Timer
    lStart = Int(Rnd * FileList.ListCount)   ' random select file.
    If lStart > (FileList.ListCount - 1) Then lStart = FileList.ListCount - 1
    If lStart < 0 Then lStart = 0

    ' Create playlist file from the media available in Music folder
    Fr = FreeFile
    Open m_PlaylistFile For Output As #Fr
        For lIndex = 0 To FileList.ListCount - 1
            Print #Fr, App.Path & "\music\" & FileList.List(lStart)
            lStart = lStart + 1
            If lStart = FileList.ListCount Then lStart = 0
        Next
    Close #Fr

    ' Request media player to play the playlist
    WMP.URL = m_PlaylistFile
End Sub

Private Sub UserControl_Terminate()
    StopAll
    If m_PlaylistFile <> "" Then Kill m_PlaylistFile
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "DefaultX", DefaultX, 20
        .WriteProperty "DefaultY", DefaultY, 20
    End With
End Sub

Private Sub WMP_Error()
    If WMP.currentMedia Is Nothing Then
        ntFileName.Caption = "ERROR: " & WMP.Error.Item(WMP.Error.errorCount - 1).errorDescription
    Else
        ntFileName.Caption = "ERROR for " & WMP.currentMedia.Name & ": " & WMP.Error.Item(WMP.Error.errorCount - 1).errorDescription
    End If
End Sub

Private Sub WMP_PlayStateChange(ByVal NewState As Long)
    Select Case NewState
        Case wmppsPlaying
            m_Music = True
            ntFileName.Enabled = True
            ntFileName.Caption = WMP.currentMedia.Name
    End Select
End Sub

Private Sub ShowVolume()
    picVol.Cls
    picVol.Line (1, 1)-((picVol.ScaleWidth - 1) * (WMP.Settings.Volume / 100), ScaleHeight - 1), CLR_LIGHT, BF
End Sub

Public Property Get Volume() As Long
    Volume = WMP.Settings.Volume
End Property

Public Property Let Volume(ByVal vNewValue As Long)
    WMP.Settings.Volume = vNewValue
    ShowVolume
End Property

Public Property Get DefaultX() As Single
    DefaultX = m_DefaultX
End Property

Public Property Let DefaultX(ByVal vNewValue As Single)
    m_DefaultX = vNewValue
    PropertyChanged "DefaultX"
End Property

Public Property Get DefaultY() As Single
    DefaultY = m_DefaultY
End Property

Public Property Let DefaultY(ByVal vNewValue As Single)
    m_DefaultY = vNewValue
    PropertyChanged "DefaultY"
End Property

Public Sub StopAll()
    On Error Resume Next
    WMP.Controls.stop
    WMP.Close
End Sub
