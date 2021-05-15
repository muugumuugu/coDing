VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "Msscript.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Math Graph"
   ClientHeight    =   6000
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7455
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MouseIcon       =   "frmMain.frx":0442
   ScaleHeight     =   6000
   ScaleWidth      =   7455
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin ComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7455
      _ExtentX        =   13150
      _ExtentY        =   741
      ButtonWidth     =   635
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   6
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "new"
            Object.ToolTipText     =   "New"
            Object.Tag             =   ""
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "open"
            Object.ToolTipText     =   "Open"
            Object.Tag             =   ""
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "save"
            Object.ToolTipText     =   "Save"
            Object.Tag             =   ""
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "copy"
            Object.ToolTipText     =   "Copy"
            Object.Tag             =   ""
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "print"
            Object.ToolTipText     =   "Print"
            Object.Tag             =   ""
            ImageIndex      =   5
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CmnDlg 
      Left            =   3960
      Top             =   5160
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   240
      Left            =   0
      TabIndex        =   11
      Top             =   5760
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   423
      _Version        =   393216
      Appearance      =   1
      Scrolling       =   1
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Height          =   3495
      Left            =   1320
      TabIndex        =   4
      Top             =   480
      Width           =   6255
      Begin VB.VScrollBar VScroll1 
         Height          =   2775
         LargeChange     =   5
         Left            =   5880
         Max             =   100
         TabIndex        =   19
         Top             =   0
         Width           =   255
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         LargeChange     =   5
         Left            =   0
         Max             =   100
         TabIndex        =   18
         Top             =   3120
         Width           =   5655
      End
      Begin VB.Frame Fragraph 
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Caption         =   "Frame5"
         Height          =   2295
         Left            =   600
         TabIndex        =   15
         Top             =   720
         Width           =   5175
         Begin VB.PictureBox Picgraph 
            AutoRedraw      =   -1  'True
            BackColor       =   &H00FFFFFF&
            Height          =   8000
            Left            =   0
            MousePointer    =   2  'Cross
            ScaleHeight     =   7935
            ScaleWidth      =   7935
            TabIndex        =   16
            Top             =   0
            Width           =   8000
            Begin VB.Line LineHtrace 
               BorderStyle     =   3  'Dot
               Visible         =   0   'False
               X1              =   480
               X2              =   1680
               Y1              =   960
               Y2              =   960
            End
            Begin VB.Line LineVtrace 
               BorderStyle     =   3  'Dot
               Visible         =   0   'False
               X1              =   2160
               X2              =   2160
               Y1              =   120
               Y2              =   1560
            End
         End
      End
      Begin VB.Frame fraVruler 
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Height          =   2295
         Left            =   120
         TabIndex        =   14
         Top             =   720
         Width           =   375
         Begin VB.PictureBox PicVruler 
            AutoRedraw      =   -1  'True
            BackColor       =   &H00FFFFFF&
            Height          =   8000
            Left            =   0
            ScaleHeight     =   7935
            ScaleWidth      =   315
            TabIndex        =   17
            Top             =   0
            Width           =   375
         End
      End
      Begin VB.Frame fraHruler 
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   600
         TabIndex        =   12
         Top             =   240
         Width           =   5175
         Begin VB.PictureBox PicHruler 
            AutoRedraw      =   -1  'True
            BackColor       =   &H00FFFFFF&
            Height          =   375
            Left            =   0
            ScaleHeight     =   315
            ScaleWidth      =   7935
            TabIndex        =   13
            Top             =   0
            Width           =   8000
         End
      End
      Begin VB.PictureBox Picture4 
         Height          =   375
         Left            =   120
         ScaleHeight     =   315
         ScaleWidth      =   315
         TabIndex        =   10
         Top             =   240
         Width           =   375
      End
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   5745
      Width           =   7455
      _ExtentX        =   13150
      _ExtentY        =   450
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   4
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel2 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Object.Width           =   5292
            MinWidth        =   5292
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel3 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Style           =   5
            TextSave        =   "07:35 PM"
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel4 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Style           =   6
            TextSave        =   "08/10/03"
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame2 
      Height          =   1600
      Left            =   1320
      TabIndex        =   2
      Top             =   3960
      Width           =   6255
      Begin MSScriptControlCtl.ScriptControl ScriptControl3 
         Left            =   2280
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl2 
         Left            =   1920
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Delete"
         Height          =   375
         Left            =   2400
         TabIndex        =   29
         ToolTipText     =   "Deletes the selected function in the list"
         Top             =   840
         Width           =   975
      End
      Begin MSComctlLib.ImageList ImageList2 
         Left            =   840
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   49
         ImageHeight     =   12
         MaskColor       =   12632256
         _Version        =   393216
      End
      Begin VB.PictureBox PicTemp 
         BackColor       =   &H00FF0000&
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   2160
         ScaleHeight     =   120
         ScaleWidth      =   525
         TabIndex        =   21
         Top             =   1320
         Visible         =   0   'False
         Width           =   585
      End
      Begin MSComctlLib.ListView ListView1 
         Height          =   1215
         Left            =   3480
         TabIndex        =   20
         Top             =   240
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   2143
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl1 
         Left            =   1440
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Edit"
         Height          =   375
         Left            =   1440
         TabIndex        =   9
         ToolTipText     =   "Edit the selected equation"
         Top             =   840
         Width           =   975
      End
      Begin VB.CommandButton CmdPlot 
         Caption         =   "Plot"
         Enabled         =   0   'False
         Height          =   375
         Left            =   480
         TabIndex        =   8
         ToolTipText     =   "Plots the entered expression"
         Top             =   840
         Width           =   975
      End
      Begin VB.PictureBox PicColor 
         BackColor       =   &H00FF0000&
         Height          =   315
         Left            =   2640
         MouseIcon       =   "frmMain.frx":0884
         MousePointer    =   99  'Custom
         ScaleHeight     =   255
         ScaleWidth      =   435
         TabIndex        =   7
         Top             =   360
         Width           =   495
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   480
         TabIndex        =   6
         Top             =   360
         Width           =   2055
      End
      Begin ComctlLib.ImageList ImageList1 
         Left            =   120
         Top             =   960
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   15
         MaskColor       =   12632256
         _Version        =   327682
         BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
            NumListImages   =   5
            BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "frmMain.frx":0CC6
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "frmMain.frx":1208
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "frmMain.frx":174A
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "frmMain.frx":1C8C
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "frmMain.frx":21CE
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.Label Label1 
         Caption         =   "f(x)="
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      ClipControls    =   0   'False
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   480
      Width           =   1215
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   3
         Left            =   600
         Picture         =   "frmMain.frx":2710
         Style           =   1  'Graphical
         TabIndex        =   34
         ToolTipText     =   "Zoom out vertically"
         Top             =   1920
         Width           =   495
      End
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   2
         Left            =   120
         Picture         =   "frmMain.frx":2FDA
         Style           =   1  'Graphical
         TabIndex        =   33
         ToolTipText     =   "Zoom in vertically"
         Top             =   1920
         Width           =   495
      End
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   1
         Left            =   600
         Picture         =   "frmMain.frx":38A4
         Style           =   1  'Graphical
         TabIndex        =   32
         ToolTipText     =   "Zoom out horizontally"
         Top             =   1440
         Width           =   495
      End
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   0
         Left            =   120
         Picture         =   "frmMain.frx":416E
         Style           =   1  'Graphical
         TabIndex        =   31
         ToolTipText     =   "Zoom in horizontally"
         Top             =   1440
         Width           =   495
      End
      Begin VB.CommandButton Command8 
         Caption         =   "Clear All"
         Height          =   495
         Left            =   120
         TabIndex        =   30
         ToolTipText     =   "Clears all equations"
         Top             =   3720
         Width           =   975
      End
      Begin VB.CommandButton Command7 
         Height          =   495
         Left            =   600
         Picture         =   "frmMain.frx":4A38
         Style           =   1  'Graphical
         TabIndex        =   28
         ToolTipText     =   "Move Up"
         Top             =   3000
         Width           =   495
      End
      Begin VB.CommandButton Command6 
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":4E7A
         Style           =   1  'Graphical
         TabIndex        =   27
         ToolTipText     =   "Move Down"
         Top             =   3000
         Width           =   495
      End
      Begin VB.CommandButton Command5 
         Height          =   495
         Left            =   600
         Picture         =   "frmMain.frx":52BC
         Style           =   1  'Graphical
         TabIndex        =   26
         ToolTipText     =   "Move Right"
         Top             =   2520
         Width           =   495
      End
      Begin VB.CommandButton Command4 
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":56FE
         Style           =   1  'Graphical
         TabIndex        =   25
         ToolTipText     =   "Move Left"
         Top             =   2520
         Width           =   495
      End
      Begin VB.CommandButton CmdZoomOut 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   600
         Picture         =   "frmMain.frx":5B40
         Style           =   1  'Graphical
         TabIndex        =   24
         ToolTipText     =   "Zoom Out"
         Top             =   840
         Width           =   495
      End
      Begin VB.CommandButton CmdZoomIn 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":67E2
         Style           =   1  'Graphical
         TabIndex        =   23
         ToolTipText     =   "Zoom In"
         Top             =   840
         Width           =   495
      End
      Begin VB.CommandButton Command1 
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":7484
         Style           =   1  'Graphical
         TabIndex        =   22
         ToolTipText     =   "Change Interval"
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Menu file 
      Caption         =   "File"
      Begin VB.Menu new 
         Caption         =   "New"
         Shortcut        =   ^N
      End
      Begin VB.Menu open 
         Caption         =   "Open"
         Shortcut        =   ^O
      End
      Begin VB.Menu save 
         Caption         =   "Save File"
         Shortcut        =   ^S
      End
      Begin VB.Menu saveas 
         Caption         =   "Save File As"
      End
      Begin VB.Menu mnusavepic 
         Caption         =   "Save Picture As"
      End
      Begin VB.Menu seperate1 
         Caption         =   "-"
      End
      Begin VB.Menu print 
         Caption         =   "Print"
         Shortcut        =   ^P
      End
      Begin VB.Menu seperate2 
         Caption         =   "-"
      End
      Begin VB.Menu exit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu edit 
      Caption         =   "Edit"
      Begin VB.Menu copy 
         Caption         =   "Copy"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuclearall 
         Caption         =   "Clear All"
      End
   End
   Begin VB.Menu view 
      Caption         =   "View"
      Begin VB.Menu changeinterval 
         Caption         =   "Change Interval..."
      End
      Begin VB.Menu mnudefault 
         Caption         =   "Default Interval"
      End
      Begin VB.Menu seperate3 
         Caption         =   "-"
      End
      Begin VB.Menu mnusize 
         Caption         =   "Graph Area Size..."
      End
      Begin VB.Menu mnugrid 
         Caption         =   "Show Grid"
         Shortcut        =   ^G
      End
      Begin VB.Menu mnucross 
         Caption         =   "Cross"
      End
      Begin VB.Menu seperate4 
         Caption         =   "-"
      End
      Begin VB.Menu mnurefresh 
         Caption         =   "Refresh"
         Shortcut        =   ^R
      End
   End
   Begin VB.Menu equation 
      Caption         =   "Equation"
      Begin VB.Menu addequ 
         Caption         =   "Add Equation..."
         Shortcut        =   ^E
      End
      Begin VB.Menu seperate5 
         Caption         =   "-"
      End
      Begin VB.Menu eval 
         Caption         =   "Evaluate Function and derivative..."
      End
      Begin VB.Menu mnuarea 
         Caption         =   "Area under curve..."
      End
      Begin VB.Menu mnuturningpoints 
         Caption         =   "Extrema and inflexion points..."
      End
      Begin VB.Menu mnutangent 
         Caption         =   "Draw Tangent..."
      End
   End
   Begin VB.Menu tools 
      Caption         =   "Tools"
      Begin VB.Menu mnucal 
         Caption         =   "Scientific Calculator..."
      End
      Begin VB.Menu mnusolve 
         Caption         =   "Equation Solver..."
      End
      Begin VB.Menu seperate6 
         Caption         =   "-"
      End
      Begin VB.Menu mnuoptions 
         Caption         =   "Options..."
      End
   End
   Begin VB.Menu help 
      Caption         =   "Help"
      Begin VB.Menu mnuabout 
         Caption         =   "About Math Graph..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Dim Filename As String, TempName As String
Dim xpos As Double, ypos As Double
Dim eqution As String, ImpTbl(0 To 640, 0 To 640) As Double
Dim ImplictError As Boolean

Public Sub resizecontrols()
On Error Resume Next
Frame1.Height = frmMain.Height - 1450
Frame2.Width = frmMain.Width - 1600
Frame2.Top = frmMain.Height - 2600
Frame3.Width = Frame2.Width
Frame3.Height = Frame1.Height - Frame2.Height
fraHruler.Width = Frame3.Width - 915
fraVruler.Height = Frame3.Height - 1020
Fragraph.Height = fraVruler.Height
Fragraph.Width = fraHruler.Width
HScroll1.Width = Fragraph.Width + 660
VScroll1.Height = Fragraph.Height + 750
VScroll1.Left = Fragraph.Left + Fragraph.Width + 50
HScroll1.Top = Fragraph.Top + Fragraph.Height + 50

ProgressBar1.Top = StatusBar1.Top + 30
ListView1.Width = Frame2.Width - 3600
a = ListView1.Width - 3250
If a < 3200 Then a = 3200
ListView1.ColumnHeaders(3).Width = a
HScroll1.Enabled = True
VScroll1.Enabled = True
HScroll1.Max = (Picgraph.Width - Fragraph.Width) / 100
VScroll1.Max = (Picgraph.Height - Fragraph.Height) / 100
If HScroll1.Max <= 0 Then HScroll1.Enabled = False
If VScroll1.Max <= 0 Then VScroll1.Enabled = False

End Sub

Private Sub defaultsize()
pLeft = -10
pRight = 10
pTop = 10
pBottom = -10
End Sub
Private Function OnPicture(x As Double, y As Double) As XY
xx = ((x - pLeft) / (pRight - pLeft)) * Picgraph.ScaleWidth
yy = (1 - ((y - pBottom) / (pTop - pBottom))) * Picgraph.ScaleHeight
OnPicture.x = xx
OnPicture.y = yy
End Function
Private Sub printText(TheText As String, x As Double, y As Double)
Picgraph.CurrentX = x
Picgraph.CurrentY = y
Picgraph.Print (TheText)

End Sub
Public Sub createcoordinates()
Dim i As Double, raised As Double, raised2 As Double
Picgraph.ScaleWidth = pRight - pLeft
Picgraph.ScaleHeight = pTop - pBottom
PicHruler.ScaleWidth = Picgraph.ScaleWidth
PicHruler.ScaleHeight = 10
PicVruler.ScaleHeight = Picgraph.ScaleHeight
PicVruler.ScaleWidth = 10
PicHruler.Cls
PicVruler.Cls
PicHruler.FontSize = 8
PicVruler.FontSize = 8

temp = Picgraph.ForeColor
temp1 = Picgraph.DrawWidth
Picgraph.DrawWidth = 1
Picgraph.ForeColor = vbBlue
Picgraph.Line (OnPicture(0, pTop).x, OnPicture(0, pTop).y)-(OnPicture(0, pBottom).x, OnPicture(0, pBottom).y), vbRed
Picgraph.Line (OnPicture(pRight, 0).x, OnPicture(pRight, 0).y)-(OnPicture(pLeft, 0).x, OnPicture(pLeft, 0).y), vbRed

raised = Picgraph.ScaleHeight / 200
raised2 = Picgraph.ScaleWidth / 200

stepsbefore = Int(((0 - pLeft) / (pRight - pLeft)) * 40)
Counter = 5 - (stepsbefore Mod 5) - 1
Do While Counter > 4 Or Counter < 0
If Counter > 4 Then Counter = Counter - 5
If Counter < 0 Then Counter = Counter + 5
Loop
For i = 0 - stepsbefore * Picgraph.ScaleWidth / 40 To pRight Step (Picgraph.ScaleWidth) / 40
If i <> -stepsbefore * Picgraph.ScaleWidth / 40 Then
If mnugrid.Checked = True And i <> 0 Then Picgraph.Line (OnPicture(i, pTop).x, OnPicture(i, pTop).y)-(OnPicture(i, pBottom).x, OnPicture(i, pBottom).y), &HC0C0C0
Picgraph.Line (OnPicture(i, raised).x, OnPicture(i, raised).y)-(OnPicture(i, -raised).x, OnPicture(i, -raised).y), vbBlue
PicHruler.Line (i - pLeft, 8)-(i - pLeft, 10)
End If
Counter = Counter + 1
If Counter = 5 Then
If Abs(i) > 1 Then
ii = Round(i, 2)
Else
ii = Round(i, 3)
End If
If i <> -stepsbefore * Picgraph.ScaleWidth / 40 Then
Call printText(Format(Str(ii), cstrcoordformat), OnPicture(i - 0 * raised2, 6.5 * raised).x, OnPicture(i - 0 * raised2, 6.5 * raised).y)
If mnugrid.Checked = True And i <> 0 Then Picgraph.Line (OnPicture(i, pTop).x, OnPicture(i, pTop).y)-(OnPicture(i, pBottom).x, OnPicture(i, pBottom).y), vbBlack
Picgraph.Line (OnPicture(i, 2 * raised).x, OnPicture(i, 2 * raised).y)-(OnPicture(i, -2 * raised).x, OnPicture(i, -2 * raised).y), vbBlue
PicHruler.Line (i - pLeft, 7)-(i - pLeft, 10)
PicHruler.CurrentX = i - raised2 / 2 - pLeft
PicHruler.CurrentY = 1
PicHruler.Print Format(Str(ii), cstrcoordformat)
End If
Counter = 0
End If
Next

stepsbefore = Int(((0 - pBottom) / (pTop - pBottom)) * 40)
Counter = 5 - (stepsbefore Mod 5) - 1
Do While Counter > 4 Or Counter < 0
If Counter > 4 Then Counter = Counter - 5
If Counter < 0 Then Counter = Counter + 5
Loop

For i = 0 - stepsbefore * Picgraph.ScaleHeight / 40 To pTop Step (Picgraph.ScaleHeight) / 40
If i > 0 - stepsbefore * Picgraph.ScaleHeight / 40 And i < pTop Then
If mnugrid.Checked = True And i <> 0 Then Picgraph.Line (OnPicture(pLeft, i).x, OnPicture(pLeft, i).y)-(OnPicture(pRight, i).x, OnPicture(pRight, i).y), &HC0C0C0
Picgraph.Line (OnPicture(raised2, i).x, OnPicture(raised2, i).y)-(OnPicture(-raised2, i).x, OnPicture(-raised2, i).y), vbBlue
PicVruler.Line (8, OnPicture(0, i).y)-(10, OnPicture(0, i).y)
End If
Counter = Counter + 1
If Counter = 5 Then
If Abs(i) > 1 Then
ii = Round(i, 2)
Else
ii = Round(i, 3)
End If
If i > 0 - stepsbefore * Picgraph.ScaleHeight / 40 And i < pTop Then
Call printText(Format(Str(ii), cstrcoordformat), OnPicture(3 * raised2, i + raised * 2).x, OnPicture(3 * raised2, i + raised * 2).y)
If mnugrid.Checked = True And i <> 0 Then Picgraph.Line (OnPicture(pLeft, i).x, OnPicture(pLeft, i).y)-(OnPicture(pRight, i).x, OnPicture(pRight, i).y), vbBlack
Picgraph.Line (OnPicture(2 * raised2, i).x, OnPicture(2 * raised2, i).y)-(OnPicture(-2 * raised2, i).x, OnPicture(-2 * raised2, i).y), vbBlue
PicVruler.Line (7, OnPicture(0, i).y)-(10, OnPicture(0, i).y)
PicVruler.CurrentX = 0
PicVruler.CurrentY = OnPicture(0, i + 2 * raised).y
PicVruler.Print Format(Str(ii), cstrcoordformat)
End If
Counter = 0
End If
Next
Picgraph.ForeColor = temp
Picgraph.DrawWidth = temp1
End Sub
Private Sub showlines()
LineHtrace.Visible = True
LineVtrace.Visible = True
End Sub
Private Sub hidelines()
LineHtrace.Visible = False
LineVtrace.Visible = False
End Sub

Private Function IsPeriodic(expression As String) As Boolean
IsPeriodic = False
For i = 1 To Len(expression) - 2
If Mid(LCase(expression), i, 3) = "sin" Or Mid(LCase(expression), i, 3) = "cos" Or Mid(LCase(expression), i, 3) = "tan" Or Mid(LCase(expression), i, 3) = "cot" Or Mid(LCase(expression), i, 3) = "sec" Then
IsPeriodic = True
Exit Function
End If
Next

End Function
Public Sub DrawFunction(num As Integer, startprog As Double, endprog As Double)
Dim m As Double, z As Double, planestart As Double, planeend As Double
If AllFunctions(num).Type = "normal" And AllFunctions(num).DrawWhat = "inverse" Then
planestart = pBottom
planeend = pTop
Else
planestart = pLeft
planeend = pRight
End If
If AllFunctions(num).HasPeriod = True Then
m = AllFunctions(num).start
z = AllFunctions(num).end
Else
m = planestart
z = planeend
End If
If m < planestart And (AllFunctions(num).Type = "normal" Or AllFunctions(num).Type = "implict") Then m = planestart
If z > planeend And (AllFunctions(num).Type = "normal" Or AllFunctions(num).Type = "implict") Then z = planeend
Select Case AllFunctions(num).Type
Case "normal"
Call DrawNormal(AllFunctions(num).expression1, AllFunctions(num).color, m, z, AllFunctions(num).DrawWhat, startprog, endprog)
Case "parametric"
Call DrawParametric(AllFunctions(num).expression1, AllFunctions(num).expression2, AllFunctions(num).color, m, z, startprog, endprog, AllFunctions(num).DrawWhat)
Case "polar"
Call DrawPolar(AllFunctions(num).expression1, AllFunctions(num).color, m, z, startprog, endprog, AllFunctions(num).DrawWhat)
Case "implict"
Call DrawImplict(AllFunctions(num).expression1, AllFunctions(num).expression2, AllFunctions(num).color, m, z, startprog, endprog)
End Select


End Sub
Public Sub DrawNormal(expression As String, color As Long, pStart As Double, pEnd As Double, DrawWhat As String, startprog As Double, endprog As Double)
Dim lastx As Double, lasty As Double, lastslope As Double, point1 As XY, point2 As XY, Error As Boolean, lasterror As Boolean, x As Double, y As Double
Dim madeline As Boolean, periodic As Boolean, expression1 As String
Dim Xa As Double, Xb As Double, Ya As Double, Yb As Double
Dim TestY As Double, TestSlope As Double
On Error GoTo errh
steps = 0
'ScriptControl1.UseSafeSubset = False
expression1 = EditedEqu(expression)
Init expression1
periodic = IsPeriodic(expression1)

'error = False
'lasterror = False
'ScriptControl1.Reset
x = pStart
Do While x <= pEnd
math.Error = False
Error = False
'ScriptControl1.ExecuteStatement "X=" & replace(X, ",", ".")
'ScriptControl1.ExecuteStatement "On Error resume next: Y=" & expression
If DrawWhat = "firstder" Then
Xa = x - 0.000001
Xb = x + 0.000001
Ya = GetVal(Xa, 0)
Yb = GetVal(Xb, 0)
y = (Yb - Ya) / (Xb - Xa)
Else
'ScriptControl1.Reset
'ScriptControl1.ExecuteStatement ("x=" & x)
'y = ScriptControl1.eval(expression1)
y = GetVal(x, 0)  'StringVal(expression1, x)
End If
If math.Error = True Then Error = True
'If evaluate.Error = True Then Error = True
'If y = 0 Then Error = True
'Y = ScriptControl1.Eval("Y")
If Error = False And lasterror = False Then
    If x = pStart Then
    Picgraph.PSet (OnPicture(x, y).x, OnPicture(x, y).y), color
    Else
    If DrawWhat <> "inverse" Then
    point1 = OnPicture(lastx, lasty)
    point2 = OnPicture(x, y)
    Else
    point1 = OnPicture(lasty, lastx)
    point2 = OnPicture(y, x)
    End If
    x1 = point1.x
    x2 = point2.x
    y1 = point1.y
    y2 = point2.y
    
        If DrawWhat <> "inverse" Then
        slope = -(y2 - y1) / (x2 - x1)
        Else
        slope = -(x2 - x1) / (y2 - y1)
        End If
        
        If slope = 0 Then slope = 0.000000000001
        If Abs(slope) > 10 And Abs(slope / lastslope) > 10 Then
        TestY = GetVal(x + 0.0000001, 0)
        TestSlope = Abs(TestY - y) / (0.0000001)
        If Abs(slope / TestSlope) > 10 Then madeline = False: GoTo skip
        End If
        
        If (slope * lastslope) < 0 And Abs(slope) > 10 Then
        TestY = GetVal(x + 0.0000001, 0)
        TestSlope = (TestY - y) / (0.0000001)
        If (TestSlope * slope) < 0 Then madeline = False: GoTo skip
        End If

        If (((y1 <= Picgraph.ScaleHeight And y1 >= 0) Or (y2 <= Picgraph.ScaleHeight And y2 >= 0)) And DrawWhat <> "inverse") Or (((x1 <= Picgraph.ScaleWidth And x1 >= 0) Or (x2 <= Picgraph.ScaleWidth And x2 >= 0)) And DrawWhat = "inverse") Then
        Picgraph.Line (x1, y1)-(x2, y2), color
        madeline = True
        Else
        madeline = False
        End If

skip:
    End If
End If
lastx = x
lasty = y
lasterror = Error
lastslope = slope

factor = 1
If madeline = False And periodic = False And Abs(slope) > 5 Then factor = 5
factor = factor / quality
If Abs(slope) > 150 Then
x = x + (pRight - pLeft) / 6000 * factor
ElseIf Abs(slope) > 20 Then
x = x + (pRight - pLeft) / 1600 * factor
ElseIf Abs(slope) > 5 Then
x = x + (pRight - pLeft) / 900 * factor
ElseIf Abs(slope) > 1.5 Then
x = x + (pRight - pLeft) / 700 * factor
Else
x = x + (pRight - pLeft) / 400 * factor
End If
ProgressBar1.Value = ((x - pStart) / (pEnd - pStart)) * (endprog - startprog) + startprog
Loop
errh:
Error = True
Resume Next
End Sub
Private Sub DrawPolar(expression As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double, DrawWhat As String)
Dim lastx As Double, lasty As Double, point1 As XY, point2 As XY, x As Double, y As Double
Dim expression1 As String, i As Double, steps As Integer
Dim ia As Double, ib As Double, la As Double, lb As Double, l As Double
Dim Error As Boolean, lasterror As Boolean
On Error GoTo errh
expression1 = ReplaceVar(expression, "t", "x")
expression1 = EditedEqu(expression1)
Init expression1
steps = ((pEnd - pStart) / (pRight - pLeft)) * 800
If steps > 800 Then steps = 800
steps = steps * quality
i = pStart
lasterror = False
Do While i <= pEnd
Error = False
math.Error = False
If DrawWhat = "inverse" Then
l = GetVal(i, 0)  'Stringval(expression1, I)
y = l * Cos(i)
x = l * Sin(i)
Else
    If DrawWhat = "firstder" Then
    ia = i - 0.000001
    ib = i + 0.000001
    la = GetVal(ia, 0)
    lb = GetVal(ib, 0)
    l = (lb - la) / (ib - ia)

    Else
    l = GetVal(i, 0)
    End If

    x = l * Cos(i)
    y = l * Sin(i)
End If
If math.Error = True Then Error = True
If Error = False And lasterror = False Then
    If i = pStart Then
    Picgraph.PSet (OnPicture(x, y).x, OnPicture(x, y).y), color
    Else
    point1 = OnPicture(lastx, lasty)
    point2 = OnPicture(x, y)
    x1 = point1.x
    x2 = point2.x
    y1 = point1.y
    y2 = point2.y
        If (y1 <= Picgraph.ScaleHeight And y1 >= 0) Or (y2 <= Picgraph.ScaleHeight And y2 >= 0) Then
        Picgraph.Line (x1, y1)-(x2, y2), color
        End If
    End If
End If
lastx = x
lasty = y
lasterror = Error

i = i + (pEnd - pStart) / steps

ProgressBar1.Value = ((i - pStart) / (pEnd - pStart)) * (endprog - startprog) + startprog
Loop
'Next
errh:
Error = True
Resume Next

End Sub
Private Sub DrawParametric(Xexp As String, Yexp As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double, DrawWhat As String)
Dim lastx As Double, lasty As Double, point1 As XY, point2 As XY, x As Double, y As Double
Dim Xexp1 As String, Yexp1 As String, i As Double
Dim Error As Boolean, lasterror As Boolean
On Error GoTo errh
If DrawWhat = "inverse" Then
Yexp1 = ReplaceVar(Xexp, "t", "x")
Xexp1 = ReplaceVar(Yexp, "t", "x")
Else
Xexp1 = ReplaceVar(Xexp, "t", "x")
Yexp1 = ReplaceVar(Yexp, "t", "x")
End If


Xexp1 = EditedEqu(Xexp1)
Yexp1 = EditedEqu(Yexp1)
Init Xexp1
curscript = 2
Init Yexp1
steps = ((pEnd - pStart) / (pRight - pLeft)) * 800
If steps > 800 Then steps = 800
steps = steps * quality
i = pStart
Do While i <= pEnd
Error = False
math.Error = False
If DrawWhat = "firstder" Then
curscript = 1
x = SlopeCalc(i)
curscript = 2
y = SlopeCalc(i)
Else
curscript = 1
x = GetVal(i, 0)
curscript = 2
y = GetVal(i, 0)
End If
If math.Error = True Then Error = True
If Error = False And lasterror = False Then
    If i = pStart Then
    Picgraph.PSet (OnPicture(x, y).x, OnPicture(x, y).y), color
    Else
    point1 = OnPicture(lastx, lasty)
    point2 = OnPicture(x, y)
    x1 = point1.x
    x2 = point2.x
    y1 = point1.y
    y2 = point2.y
        If (y1 <= Picgraph.ScaleHeight And y1 >= 0) Or (y2 <= Picgraph.ScaleHeight And y2 >= 0) Then
        Picgraph.Line (x1, y1)-(x2, y2), color
        madeline = True
        Else
        madeline = False
        End If
    End If
lastx = x
lasty = y
lasterror = Error
End If

i = i + (pEnd - pStart) / steps

ProgressBar1.Value = ((i - pStart) / (pEnd - pStart)) * (endprog - startprog) + startprog
Loop
curscript = 1
'Next
errh:
Error = True
Resume Next

End Sub
Private Sub DrawImplict(expression1 As String, expression2 As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double)
Dim x As Double, y As Double, expr As String, expr1 As String
Dim todraw As Boolean
Dim i As Integer, j As Integer
Dim steps As Integer
ImplictError = False
On Error GoTo errh
steps = Picgraph.Width / 15
steps = steps * quality
expr = "(" + expression1 + ")-(" + expression2 + ")"
expr = EditedEqu(expr)
Init expr
math.Error = False
'For i = 0 To 320
'For j = 0 To 320
'x = i * (pRight - pLeft) / 320 + pLeft
'y = j * (pBottom - pTop) / 320 + pBottom
'ImpTbl(i, j) = GetVal(expr, x, y)   'ScriptControl1.Run("RunThis", x, y)
'Next
'ProgressBar1.Value = (x - pLeft) / (pRight - pLeft) * 100
'Next
midprog = (endprog - startprog) * 0.8 + startprog
For x = pStart To pEnd Step (pRight - pLeft) / steps
For y = pBottom To pTop Step (pTop - pBottom) / steps
'If math.Error = True Then GoTo errh: Exit Sub
i = Round((x - pLeft) / (pRight - pLeft) * steps, 0)
j = Round((y - pBottom) / (pTop - pBottom) * steps, 0)
ImpTbl(i, j) = GetVal(x, y)    'ScriptControl1.Run("RunThis", x, y)
Next
ProgressBar1.Value = ((x - pStart) / (pEnd - pStart)) * (midprog - startprog) + startprog
Next


'Dim ii As Integer, jj As Integer
For x = pStart To pEnd Step (pRight - pLeft) / steps
For y = pBottom To pTop Step (pTop - pBottom) / steps
i = Round((x - pLeft) / (pRight - pLeft) * steps, 0)
j = Round((y - pBottom) / (pTop - pBottom) * steps, 0)
todraw = Determine(i, j)
If todraw = True Then Picgraph.PSet (OnPicture(x, y).x, OnPicture(x, y).y), color
Next
ProgressBar1.Value = ((x - pStart) / (pEnd - pStart)) * (endprog - midprog) + midprog
Next

'Picgraph.Refresh

'Exit Sub

'For x = pLeft To pRight Step (pRight - pLeft) / 320
'For y = pBottom To pTop Step (pTop - pBottom) / 320
'todraw = False
'todraw = Determine(expr1, x, x + (pRight - pLeft) / 320, y, y + (pTop - pBottom) / 320)
'If todraw = True Then Picgraph.PSet (OnPicture(x, y).x, OnPicture(x, y).y) ': y = y + (pTop - pBottom) / 160
'Next
'ProgressBar1.Value = (x - pLeft) / (pRight - pLeft) * 100
'Next
Exit Sub
errh:
ImplictError = True
MsgBox ("error")
Exit Sub
End Sub
Private Function Determine(i As Integer, j As Integer) As Boolean
    Dim b1 As Double, b2 As Double, b3 As Double
    
    Determine = False

    On Error GoTo 1
    'b1 = ScriptControl1.Run("RunThis", Xplace, y1)
    'b2 = ScriptControl1.Run("RunThis", Xplace, y2)
    'b3 = ScriptControl1.Run("RunThis", Xplace2, y1)
   b1 = ImpTbl(i, j)
   b2 = ImpTbl(i - 1, j)
   b3 = ImpTbl(i, j - 1)

    Dim S1 As Integer, S2 As Integer, S3 As Integer
    S1 = Sgn(b1)
    S2 = Sgn(b2)
    S3 = Sgn(b3)
    If (((S1 = -1 And S2 = 1) Or (S1 = 1 And S2 = -1)) And Abs(b1 - b2) < Picgraph.ScaleHeight / 2) Or S1 = 0 Then 'And Abs(b2 - b1) <= GScale * 2 Then
        Determine = True
        Exit Function
    End If
    If (((S1 = -1 And S3 = 1) Or (S1 = 1 And S3 = -1)) And Abs(b1 - b3) < Picgraph.ScaleWidth / 2) Or S1 = 0 Then 'And Abs(b2 - b1) <= GScale * 2 Then
        Determine = True
        Exit Function
    End If

Exit Function
1
Determine = False
End Function
Public Sub Init(Eq As String)
On Error Resume Next
If curscript = 1 Then
    ScriptControl1.Reset
    ScriptControl1.AddObject "Math", math, True
    ScriptControl1.AddCode "Function RunThis(X,Y)" & vbCrLf & "on error resume next" & vbCrLf & "RunThis=" & Eq & vbCrLf & "End Function"
    ScriptControl1.Tag = Eq
Else
    ScriptControl2.Reset
    ScriptControl2.AddCode "Function RunThis(X,Y)" & vbCrLf & "on error resume next" & vbCrLf & "RunThis=" & Eq & vbCrLf & "End Function"
    ScriptControl2.AddObject "Math", math, True
    ScriptControl2.Tag = Eq
End If
End Sub
Private Function derCalc(dernum As Integer, equ As String, xpoint As Double)
If dernum = 0 Then
derCalc = GetVal(xpoint, 0)
End If
End Function
Public Sub AddToList(num As Integer)
If AllFunctions(num).Type = "implict" And ImplictError = True Then
numfunctions = numfunctions - 1
Exit Sub
End If

PicTemp.BackColor = AllFunctions(num).color
ImageList2.ListImages.Add , , PicTemp.Image
Set ListView1.SmallIcons = ImageList2
ListView1.ListItems.Add , , , , ImageList2.ListImages.Count
If AllFunctions(num).HasPeriod = True Then
m = Str(AllFunctions(num).start)
z = Str(AllFunctions(num).end)
Else
m = "(start)"
z = "(end)"
End If
Select Case AllFunctions(num).Type
Case "normal"
ss = AllFunctions(num).expression1
Case "parametric"
ss = "X= " + AllFunctions(num).expression1 + " ,Y= " + AllFunctions(num).expression2 + " (parametric)"
Case "polar"
ss = AllFunctions(num).expression1 + " (parametric polar)"
Case "implict"
ss = AllFunctions(num).expression1 + " = " + AllFunctions(num).expression2 + " (implict)"
End Select
    
If AllFunctions(num).DrawWhat = "inverse" Then
ss = ss + " (Inverse)"
ElseIf AllFunctions(num).DrawWhat = "firstder" Then
ss = ss + " (First derivative)"
End If

ListView1.ListItems(ListView1.ListItems.Count).SubItems(1) = Str(num)
ListView1.ListItems(ListView1.ListItems.Count).SubItems(2) = ss
ListView1.ListItems(ListView1.ListItems.Count).SubItems(3) = m
ListView1.ListItems(ListView1.ListItems.Count).SubItems(4) = z

ListView1.Refresh

End Sub
Public Sub ClearAll()
ListView1.ListItems.Clear
Picgraph.Cls
createcoordinates
numfunctions = 0
ReDraw
End Sub

Private Sub addequ_Click()
Load frmNewEqu
frmNewEqu.Show vbModal
End Sub

Private Sub changeinterval_Click()
Load frmOptions
Set frmOptions.tbsOptions.SelectedItem = frmOptions.tbsOptions.Tabs(2)
frmOptions.Show , Me

End Sub

Private Sub CmdPlot_Click()
Dim func As FUNCTION_INFO
Call DrawNormal(Combo1.Text, PicColor.BackColor, pLeft, pRight, "normal", 0, 100)
func.Type = "normal"
func.HasPeriod = False
func.expression1 = Combo1.Text
func.color = PicColor.BackColor
func.DrawWhat = "normal"
Call AddFunction(func)
End Sub

Private Sub CmdZoomIn_Click()
xcenter = (pRight + pLeft) / 2
ycenter = (pTop + pBottom) / 2
pRight = (pRight - xcenter) / (zoomfactor / 100) + xcenter
pLeft = (pLeft - xcenter) / (zoomfactor / 100) + xcenter
pTop = (pTop - ycenter) / (zoomfactor / 100) + ycenter
pBottom = (pBottom - ycenter) / (zoomfactor / 100) + ycenter
Call ReDraw
End Sub

Private Sub CmdZoomOut_Click()
xcenter = (pRight + pLeft) / 2
ycenter = (pTop + pBottom) / 2
pRight = (pRight - xcenter) * (zoomfactor / 100) + xcenter
pLeft = (pLeft - xcenter) * (zoomfactor / 100) + xcenter
pTop = (pTop - ycenter) * (zoomfactor / 100) + ycenter
pBottom = (pBottom - ycenter) * (zoomfactor / 100) + ycenter
Call ReDraw
End Sub

Private Sub Command9_Click(Index As Integer)
Select Case Index
Case 0
xcenter = (pRight + pLeft) / 2
pRight = (pRight - xcenter) / (zoomfactor / 100) + xcenter
pLeft = (pLeft - xcenter) / (zoomfactor / 100) + xcenter
Case 1
xcenter = (pRight + pLeft) / 2
pRight = (pRight - xcenter) * (zoomfactor / 100) + xcenter
pLeft = (pLeft - xcenter) * (zoomfactor / 100) + xcenter
Case 2
ycenter = (pTop + pBottom) / 2
pTop = (pTop - ycenter) / (zoomfactor / 100) + ycenter
pBottom = (pBottom - ycenter) / (zoomfactor / 100) + ycenter
Case 3
ycenter = (pTop + pBottom) / 2
pTop = (pTop - ycenter) * (zoomfactor / 100) + ycenter
pBottom = (pBottom - ycenter) * (zoomfactor / 100) + ycenter
End Select
Call ReDraw
End Sub


Private Sub Combo1_Change()
If Combo1.Text = "" Then
CmdPlot.Enabled = False
Else
CmdPlot.Enabled = True
End If
End Sub

Private Sub Combo1_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then CmdPlot_Click

End Sub

Private Sub Command1_Click()
Load frmOptions
Set frmOptions.tbsOptions.SelectedItem = frmOptions.tbsOptions.Tabs(2)
frmOptions.Show , Me
End Sub

Private Sub Command2_Click()
If numfunctions < 1 Then Exit Sub
For curpos = 1 To ListView1.ListItems.Count
If ListView1.ListItems(curpos).Selected = True Then selection = curpos
Next
For i = selection To numfunctions
AllFunctions(i) = AllFunctions(i + 1)
Next
numfunctions = numfunctions - 1
RefreshAll

End Sub


Private Sub Command3_Click()
Dim func As FUNCTION_INFO
If numfunctions < 1 Then Exit Sub
For curpos = 1 To ListView1.ListItems.Count
If ListView1.ListItems(curpos).Selected = True Then selfunc = curpos
Next
Load frmNewEqu
frmNewEqu.Caption = "Edit Equation"
func = AllFunctions(selfunc)
With frmNewEqu
If func.Type = "normal" Then
    .Option1.Value = True
    .Text1.Text = func.expression1
ElseIf func.Type = "implict" Then
    .Option4.Value = True
    .Text5.Text = func.expression1
    .Text6.Text = func.expression2
Else
    .Option2.Value = True
    If func.Type = "parametric" Then
    .Text2.Text = func.expression1
    .Text3.Text = func.expression2
    Else
    .Check1.Value = 1
    .Text4.Text = func.expression1
    End If
End If

Select Case func.DrawWhat
Case "normal"
.Option3(0).Value = True
Case "inverse"
.Option3(1).Value = True
Case "firstder"
.Option3(2).Value = True
End Select

.PicColor.BackColor = func.color
If func.HasPeriod = True Then
.Check2.Value = 1
.Text7.Text = func.start
.Text8.Text = func.end
End If
End With
frmNewEqu.Show vbModal
End Sub

Private Sub Command4_Click()
pRight = pRight + Picgraph.ScaleWidth / 4
pLeft = pLeft + Picgraph.ScaleWidth / 4
Call ReDraw
End Sub

Private Sub Command5_Click()
pRight = pRight - Picgraph.ScaleWidth / 4
pLeft = pLeft - Picgraph.ScaleWidth / 4
Call ReDraw
End Sub

Private Sub Command6_Click()
pTop = pTop + Picgraph.ScaleHeight / 4
pBottom = pBottom + Picgraph.ScaleHeight / 4
Call ReDraw
End Sub

Private Sub Command7_Click()
pTop = pTop - Picgraph.ScaleHeight / 4
pBottom = pBottom - Picgraph.ScaleHeight / 4
Call ReDraw
End Sub

Private Sub Command8_Click()
ClearAll
End Sub




Private Sub copy_Click()
Clipboard.Clear
Clipboard.SetData Picgraph.Image
End Sub

Private Sub eval_Click()
Load frmEval
frmEval.Show , Me
End Sub

Private Sub exit_Click()
End
End Sub

Private Sub Form_Load()

resizecontrols
defaultsize
createcoordinates
Filename = ""
TempName = ""
CmnDlg.Flags = (cdlOFNHideReadOnly Or cdlOFNPathMustExist Or cdlOFNOverwritePrompt)
Call ListView1.ColumnHeaders.Add(, , "Color", 800)
Call ListView1.ColumnHeaders.Add(, , "Number", 800)
Call ListView1.ColumnHeaders.Add(, , "Function", 3700)
Call ListView1.ColumnHeaders.Add(, , "From", 800)
Call ListView1.ColumnHeaders.Add(, , "To", 800)
ListView1.ListItems.Clear
zoom = 1
curscript = 1
zoomfactor = 200
quality = 1
qualitylevel = 5
backstyle = "color"
backcolour = vbWhite
Combo1.AddItem "x"
Combo1.AddItem "x^2"
Combo1.AddItem "x^3"
Combo1.AddItem "sin(x)"
Combo1.AddItem "cos(x)"
Combo1.AddItem "tan(x)"
Combo1.AddItem "sin(x^2)"
Combo1.AddItem "3Cos(3x)Sin(5x)Sin(x)"
Combo1.AddItem "25-(x-5)^2+4cos(2pi(x-5))"
Combo1.AddItem "-2x+10-8pi(sin(2pi(x-5)))"
Combo1.AddItem "cos(x^2)-2x"
Combo1.AddItem "x*sin(x)"
Combo1.AddItem "0.5*x^2+0.5*sin(10*x)"
Combo1.AddItem "sin(x)-cos(2*x)"
Combo1.AddItem "log(abs(sin(x)))+log(abs(cos(x)))-log(abs(0.4*x))"
Combo1.AddItem "x-2*sin(x)"

End Sub

Private Sub Form_Paint()
resizecontrols
End Sub

Private Sub Form_Resize()
If Me.Width < 7000 And Me.WindowState = 0 Then Me.Width = 7000
If Me.Height < 5800 And Me.WindowState = 0 Then Me.Height = 5800
resizecontrols
End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub

Private Sub Fragraph_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
hidelines
End Sub
Private Sub Frame3_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
hidelines
End Sub

Private Sub HScroll1_Change()
Picgraph.Left = -100 * HScroll1.Value
PicHruler.Left = Picgraph.Left
End Sub

Private Sub HScroll1_Scroll()
HScroll1_Change
End Sub

Private Sub mnuabout_Click()
Load frmAbout
frmAbout.Show vbModal
End Sub

Private Sub mnuarea_Click()
Load frmArea
frmArea.Show , Me
End Sub

Private Sub mnucal_Click()
Load frmCalculator
frmCalculator.Show , Me
End Sub

Private Sub mnuclearall_Click()
ClearAll
End Sub

Private Sub mnucross_Click()
mnucross.Checked = Not (mnucross.Checked)
hidelines
End Sub

Private Sub mnudefault_Click()
defaultsize
ReDraw
End Sub

Private Sub mnugrid_Click()
mnugrid.Checked = Not (mnugrid.Checked)
ReDraw
End Sub

Private Sub mnuoptions_Click()
Load frmOptions
frmOptions.Show , Me
End Sub

Private Sub mnurefresh_Click()
resizecontrols
RefreshAll
End Sub

Private Sub mnusavepic_Click()
On Error GoTo cancelling
CmnDlg.Filename = ""
CmnDlg.Filter = "Bitamp files (*.bmp)|*.bmp|"
CmnDlg.ShowSave
If CmnDlg.Filename = "" Then Exit Sub
Call SavePicture(Picgraph.Image, CmnDlg.Filename)
cancelling:
Exit Sub
End Sub

Private Sub mnusize_Click()
Load frmZoom
frmZoom.Show , Me
End Sub

Private Sub mnusolve_Click()
Load frmSolve
frmSolve.Show , Me
End Sub


Private Sub mnutangent_Click()
Load frmTangent
frmTangent.Show , frmMain
End Sub

Private Sub mnuturningpoints_Click()
Load frmTurningPoints
frmTurningPoints.Show , Me
End Sub

Private Sub new_Click()
Filename = ""
ClearAll
End Sub


Private Sub open_Click()
On Error GoTo canceling
CmnDlg.Filename = ""
CmnDlg.Filter = "Math graph files (*.mgf)|*.mgf|"
CmnDlg.ShowOpen
If CmnDlg.Filename = "" Then Exit Sub
Filename = CmnDlg.Filename
ClearAll
Open Filename For Input As #1
Input #1, numfunctions
For i = 1 To numfunctions
Input #1, AllFunctions(i).color, AllFunctions(i).DrawWhat, AllFunctions(i).end, AllFunctions(i).expression1, AllFunctions(i).expression2, AllFunctions(i).HasPeriod, AllFunctions(i).start, AllFunctions(i).Type
Next
Close #1
RefreshAll
canceling:
Exit Sub
End Sub

Private Sub PicColor_Click()
On Error GoTo calcelling
CmnDlg.color = PicColor.BackColor
CmnDlg.ShowColor
PicColor.BackColor = CmnDlg.color
calcelling:
Exit Sub
End Sub

Private Sub Picgraph_DblClick()

xcenter = (pRight + pLeft) / 2
ycenter = (pTop + pBottom) / 2

pLeft = pLeft + xpos - xcenter
pRight = pRight + xpos - xcenter
pTop = pTop + ypos - ycenter
pBottom = pBottom + ypos - ycenter
ReDraw
End Sub

Private Sub Picgraph_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
xx = Round(x + pLeft, 3)
yy = Round((Picgraph.ScaleHeight - y) + pBottom, 3)
xpos = xx
ypos = yy
radius = Round(Sqr(((Picgraph.ScaleHeight - y) + pBottom) ^ 2 + (x + pLeft) ^ 2), 3)
StatusBar1.Panels(2).Text = "X= " & Format(xx, cstrcoordformat) & ", Y= " & Format(yy, cstrcoordformat) & ", Radius= " & Format(radius, cstrcoordformat)
LineHtrace.x1 = 0
LineHtrace.x2 = Picgraph.ScaleWidth
LineHtrace.y1 = y
LineHtrace.y2 = y

LineVtrace.x1 = x
LineVtrace.x2 = x
LineVtrace.y1 = 0
LineVtrace.y2 = Picgraph.ScaleHeight
If mnucross.Checked = True Then showlines
End Sub

Private Sub PicHruler_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
hidelines
End Sub

Private Sub PicVruler_Click()
hidelines
End Sub

Private Sub print_Click()
If MsgBox("Are you sure you want to print the graph?", vbYesNo) = vbNo Then Exit Sub
Printer.PaintPicture Picgraph.Image, 0, 0
Printer.EndDoc
End Sub

Private Sub save_Click()
On Error GoTo canceling
CmnDlg.Filename = ""
If Filename = "" Then
CmnDlg.Filter = "Math graph files (*.mgf)|*.mgf|"
CmnDlg.ShowSave
Filename = CmnDlg.Filename
End If
If Filename = "" Then Exit Sub
Open Filename For Output As #1
Write #1, numfunctions
For i = 1 To numfunctions
Write #1, AllFunctions(i).color, AllFunctions(i).DrawWhat, AllFunctions(i).end, AllFunctions(i).expression1, AllFunctions(i).expression2, AllFunctions(i).HasPeriod, AllFunctions(i).start, AllFunctions(i).Type
Next
Close #1
canceling:
If TempName <> "" Then Filename = TempName
Exit Sub
End Sub

Private Sub saveas_Click()
TempName = Filename
Filename = ""
save_Click
TempName = ""
End Sub

Private Sub ScriptControl1_Error()
math.Error = True
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As ComctlLib.Button)
Select Case Button.Key
Case "new"
new_Click
Case "open"
open_Click
Case "save"
save_Click
Case "copy"
copy_Click
Case "print"
print_Click
End Select
End Sub

Private Sub VScroll1_Change()
Picgraph.Top = -100 * VScroll1.Value
PicVruler.Top = Picgraph.Top
End Sub

Private Sub VScroll1_Scroll()
VScroll1_Change
End Sub
