VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form frmMira 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "minionic chaos Mapping"
   ClientHeight    =   10935
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   15270
   ControlBox      =   0   'False
   Icon            =   "frmMira.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   10935
   ScaleWidth      =   15270
   WindowState     =   2  'Maximized
   Begin ComctlLib.Slider SliderX 
      Height          =   390
      Left            =   2640
      TabIndex        =   4
      Top             =   10125
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   688
      _Version        =   327682
      Max             =   100
      SelStart        =   16
      TickStyle       =   1
      TickFrequency   =   10
      Value           =   16
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      Height          =   375
      Left            =   13200
      TabIndex        =   3
      Top             =   10140
      Width           =   1875
   End
   Begin VB.CommandButton CmdGo 
      Caption         =   "Draw"
      Height          =   375
      Left            =   11280
      TabIndex        =   1
      Top             =   10140
      Width           =   1875
   End
   Begin VB.PictureBox PicMira 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      Height          =   10035
      Left            =   0
      ScaleHeight     =   665
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   1009
      TabIndex        =   0
      Top             =   0
      Width           =   15195
      Begin MSComDlg.CommonDialog CommonDialog 
         Left            =   1020
         Top             =   5460
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
         DefaultExt      =   "mir"
         DialogTitle     =   "Save Mira Parameters"
      End
   End
   Begin ComctlLib.Slider SliderY 
      Height          =   390
      Left            =   7500
      TabIndex        =   5
      Top             =   10125
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   688
      _Version        =   327682
      Max             =   100
      SelStart        =   16
      TickStyle       =   1
      TickFrequency   =   10
      Value           =   16
   End
   Begin VB.Label lblScaleY 
      Caption         =   "Scale Y by"
      Height          =   195
      Left            =   6540
      TabIndex        =   7
      Top             =   10320
      Width           =   795
   End
   Begin VB.Label lblScalsex 
      Caption         =   "Scale X by"
      Height          =   195
      Left            =   1680
      TabIndex        =   6
      Top             =   10320
      Width           =   795
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   195
      Left            =   0
      TabIndex        =   2
      Top             =   10140
      Width           =   1155
   End
   Begin VB.Menu mnufile 
      Caption         =   "&File"
      Begin VB.Menu mnuView 
         Caption         =   "View Parameters"
         Shortcut        =   ^V
      End
      Begin VB.Menu mnuLoad 
         Caption         =   "&Load Parameters"
         Shortcut        =   ^L
      End
      Begin VB.Menu mnuSave 
         Caption         =   "SaveParameters"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuQuit 
         Caption         =   "&Quit"
         Shortcut        =   ^Q
      End
   End
End
Attribute VB_Name = "frmMira"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'The Mira mapping
' C Vincent May 2000
Option Explicit
Dim StopIt As Boolean

Private Sub CmdGo_Click()
Dim a As Single
Dim b As Single
Dim i As Integer
Dim c As Single
Dim newOrbit As Single
Dim x As Single
Dim y As Single
Dim w As Single
Dim u As Single
Dim z As Single
Dim xmax As Single
Dim ymax As Single
Dim xmin As Single
Dim ymin As Single
Dim XPixels As Integer
Dim YPixels As Integer

Dim XDraw As Integer
Dim YDraw As Integer
Dim XScale As Single
Dim YScale As Single
Dim XOffset As Single
Dim YOffset As Single
Dim colorBool As Boolean
On Error Resume Next
    ' for test purposes
   ' a = -0.4
    mnuQuit.Enabled = False
   ' b = 0.758475845748575
    c = 2 - (2 * a)
    x = 4
    y = 0 '12.1

    w = a * x + (c * x * x) / (1 + x * x)
    colorBool = False
    a = CSng(frmParameters.txtA.Text)
    b = CSng(frmParameters.txtB.Text)
    x = CSng(frmParameters.txtStartX.Text)
    y = CSng(frmParameters.txtStartY.Text)
    c = 2 - (2 * a)
    PicMira.Cls
    Me.Caption = "The Minionic Mapping - A=" & CStr(a) & ", B=" & CStr(b) & ", Initial X=" & CStr(x) & ", Inital Y=" & CStr(y)
    XPixels = PicMira.ScaleHeight
    YPixels = PicMira.ScaleWidth
    xmax = 20
    ymax = 20
    xmin = -20
    ymin = -20
    XScale = XPixels / (xmax - xmin)
    YScale = YPixels / (ymax - ymin)
    XOffset = 0 - (xmin * XScale)
    YOffset = 0 - (ymin * YScale)
    XOffset = 300
    YOffset = 300
    StopIt = False
    'MsgBox XScale
    XScale = SliderX.Value
    YScale = SliderY.Value
    Do While StopIt = False
        i = i + 1
        If i > 800 Then
            'Draw a point

           ' XScale = 100
            'YScale = 100
            XDraw = Int((x * XScale) + XOffset)
            YDraw = Int((YScale * y) + YOffset)
            If colorBool Then
                PicMira.PSet (XDraw, YDraw), vbBlue
            Else
                PicMira.PSet (XDraw, YDraw), vbYellow
            End If
            z = x
            x = b * y + w
            u = x * x
            w = a * x + (c * u) / (1 + u)
            y = w - z
           
            If y > ymax Then ymax = y
            If x > xmax Then xmax = x
        End If
        If i Mod 1000 = 0 Then DoEvents
        Label1 = xmax & " " & ymax
        If i > 30000 Then
            If colorBool = False Then
                colorBool = True
            Else
                colorBool = False
            End If
            i = 0
        End If
    Loop
    'MsgBox xmax * " " * ymax
End Sub

Private Sub cmdQuit_Click()
    Unload Me
End Sub

Private Sub cmdSave_Click()


End Sub

Private Sub cmdStop_Click()
    StopIt = True
    mnuQuit.Enabled = True
End Sub

Private Sub mnuLoad_Click()
Dim fnum As Integer
Dim a As String
Dim b As String
Dim x As String
Dim y As String
Dim sx As String
Dim sy As String
    CommonDialog.InitDir = App.Path
    CommonDialog.CancelError = True
    On Error GoTo ErrHandler
  ' Set flags
    CommonDialog.Flags = cdlOFNHideReadOnly
  ' Set filters
    CommonDialog.Filter = "Mira Parameters (*.mir)|*.mir"
  ' Specify default filter
    CommonDialog.FilterIndex = 1
  ' Display the Open dialog box
    CommonDialog.ShowOpen
  ' Display name of selected file
  
    fnum = FreeFile
    
    Open CommonDialog.FileName For Input As #fnum
        Input #fnum, a, b, x, y, sx, sy
    Close #fnum
    frmParameters.txtA.Text = a
    frmParameters.txtB = b
    frmParameters.txtStartX = x
    frmParameters.txtStartY = y
    SliderX.Value = CInt(sx)
    SliderY.Value = CInt(sy)
    CmdGo_Click
  Exit Sub
ErrHandler:
    'Hello
End Sub

Private Sub mnuQuit_Click()
    Unload Me
End Sub

Private Sub mnuSave_Click()
Dim fnum As Integer
    ' Set CancelError is True
    CommonDialog.InitDir = App.Path
    CommonDialog.CancelError = True
    On Error GoTo ErrHandler
  ' Set flags
    CommonDialog.Flags = cdlOFNHideReadOnly
  ' Set filters
    CommonDialog.Filter = "Mira Parameters (*.mir)|*.mir"
  ' Specify default filter
    CommonDialog.FilterIndex = 1
  ' Display the Open dialog box
    CommonDialog.ShowSave
  ' Display name of selected file
  
    fnum = FreeFile
    
    Open CommonDialog.FileName For Output As #fnum
        Write #fnum, Trim(frmParameters.txtA.Text), Trim(frmParameters.txtB.Text), Trim(frmParameters.txtStartX.Text), Trim(frmParameters.txtStartY.Text), _
                    CStr(SliderX.Value), CStr(SliderY.Value)
    Close #fnum
    MsgBox CommonDialog.FileName & " saved successfully."
  Exit Sub
  
ErrHandler:
  'User pressed the Cancel button
End Sub

Private Sub txtStartX_Change()

End Sub

Private Sub mnuView_Click()
    frmParameters.Show vbModal
End Sub

Private Sub PicMira_Click()
    PicMira.Cls
End Sub

