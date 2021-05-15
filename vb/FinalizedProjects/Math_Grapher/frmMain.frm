VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "MSSCRIPT.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Math Graph"
   ClientHeight    =   6000
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7080
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MouseIcon       =   "frmMain.frx":0442
   ScaleHeight     =   6000
   ScaleWidth      =   7080
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   35
      Top             =   0
      Width           =   7080
      _ExtentX        =   12488
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   6
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "new"
            Object.ToolTipText     =   "New"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "open"
            Object.ToolTipText     =   "Open"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "saveas"
            Object.ToolTipText     =   "Save As"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "copy"
            Object.ToolTipText     =   "Copy"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "print"
            Object.ToolTipText     =   "Print"
            ImageIndex      =   5
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   1515
      Left            =   4920
      TabIndex        =   33
      ToolTipText     =   "left click to select, right click to display popup menu"
      Top             =   4080
      Width           =   2775
      _ExtentX        =   4895
      _ExtentY        =   2672
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
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
      TabIndex        =   9
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
      TabIndex        =   2
      Top             =   480
      Width           =   6255
      Begin VB.VScrollBar VScroll1 
         Height          =   2775
         LargeChange     =   5
         Left            =   5880
         Max             =   100
         TabIndex        =   17
         Top             =   0
         Width           =   255
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         LargeChange     =   5
         Left            =   0
         Max             =   100
         TabIndex        =   16
         Top             =   3120
         Width           =   5655
      End
      Begin VB.Frame Fragraph 
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Caption         =   "Frame5"
         Height          =   2295
         Left            =   600
         TabIndex        =   13
         Top             =   720
         Width           =   5175
         Begin VB.PictureBox Picgraph 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H80000005&
            ForeColor       =   &H80000008&
            Height          =   8000
            Left            =   0
            MousePointer    =   2  'Cross
            ScaleHeight     =   7965
            ScaleWidth      =   7965
            TabIndex        =   14
            Top             =   0
            Width           =   8000
            Begin VB.Line LineVtrace2 
               BorderStyle     =   3  'Dot
               Visible         =   0   'False
               X1              =   2280
               X2              =   2280
               Y1              =   120
               Y2              =   1560
            End
            Begin VB.Line LineHtrace2 
               BorderStyle     =   3  'Dot
               Visible         =   0   'False
               X1              =   480
               X2              =   1680
               Y1              =   840
               Y2              =   840
            End
            Begin VB.Shape Shape1 
               Height          =   615
               Left            =   2640
               Top             =   960
               Visible         =   0   'False
               Width           =   975
            End
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
         TabIndex        =   12
         Top             =   720
         Width           =   375
         Begin VB.PictureBox PicVruler 
            AutoRedraw      =   -1  'True
            BackColor       =   &H00FFFFFF&
            Height          =   8000
            Left            =   0
            ScaleHeight     =   7935
            ScaleWidth      =   315
            TabIndex        =   15
            Top             =   0
            Width           =   375
         End
      End
      Begin VB.Frame fraHruler 
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   600
         TabIndex        =   10
         Top             =   240
         Width           =   5175
         Begin VB.PictureBox PicHruler 
            AutoRedraw      =   -1  'True
            BackColor       =   &H00FFFFFF&
            Height          =   375
            Left            =   0
            ScaleHeight     =   315
            ScaleWidth      =   7935
            TabIndex        =   11
            Top             =   0
            Width           =   8000
         End
      End
      Begin VB.PictureBox Picture4 
         Height          =   375
         Left            =   120
         ScaleHeight     =   315
         ScaleWidth      =   315
         TabIndex        =   8
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame Frame2 
      ClipControls    =   0   'False
      Height          =   1600
      Left            =   1320
      TabIndex        =   1
      Top             =   3960
      Width           =   3495
      Begin MSComctlLib.ImageList ImageList1 
         Left            =   0
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   5
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":0884
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":0998
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":0AAC
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":0BC0
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":0CD4
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl2 
         Left            =   2040
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Delete"
         Height          =   375
         Left            =   2400
         TabIndex        =   26
         ToolTipText     =   "Deletes the selected equation"
         Top             =   840
         Width           =   975
      End
      Begin MSComctlLib.ImageList ImageList2 
         Left            =   0
         Top             =   720
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
         TabIndex        =   18
         Top             =   1320
         Visible         =   0   'False
         Width           =   585
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl1 
         Index           =   0
         Left            =   1440
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Edit"
         Height          =   375
         Left            =   1440
         TabIndex        =   7
         ToolTipText     =   "Edit the selected equation"
         Top             =   840
         Width           =   975
      End
      Begin VB.CommandButton CmdPlot 
         Caption         =   "Plot"
         Enabled         =   0   'False
         Height          =   375
         Left            =   480
         TabIndex        =   6
         ToolTipText     =   "Plots the entered expression"
         Top             =   840
         Width           =   975
      End
      Begin VB.PictureBox PicColor 
         BackColor       =   &H00FF0000&
         Height          =   315
         Left            =   2640
         MouseIcon       =   "frmMain.frx":0DE8
         MousePointer    =   99  'Custom
         ScaleHeight     =   255
         ScaleWidth      =   435
         TabIndex        =   5
         Top             =   360
         Width           =   495
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   480
         TabIndex        =   4
         ToolTipText     =   "Here you can type only y(x) functions, to graph other types of functions select from the menu : Graphs>-AddGraph"
         Top             =   360
         Width           =   2055
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl1 
         Index           =   1
         Left            =   1200
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl1 
         Index           =   2
         Left            =   960
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl1 
         Index           =   3
         Left            =   720
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin MSScriptControlCtl.ScriptControl ScriptControl1 
         Index           =   4
         Left            =   480
         Top             =   1080
         _ExtentX        =   1005
         _ExtentY        =   1005
      End
      Begin VB.Label Label1 
         Caption         =   "f(x)="
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      ClipControls    =   0   'False
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   480
      Width           =   1215
      Begin VB.Timer Timer1 
         Interval        =   1
         Left            =   360
         Top             =   4800
      End
      Begin VB.CheckBox Check1 
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":122A
         Style           =   1  'Graphical
         TabIndex        =   32
         ToolTipText     =   "Zoom Box"
         Top             =   1440
         Width           =   975
      End
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   3
         Left            =   600
         Picture         =   "frmMain.frx":1AF4
         Style           =   1  'Graphical
         TabIndex        =   31
         ToolTipText     =   "Zoom out vertically"
         Top             =   2520
         Width           =   495
      End
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   2
         Left            =   120
         Picture         =   "frmMain.frx":23BE
         Style           =   1  'Graphical
         TabIndex        =   30
         ToolTipText     =   "Zoom in vertically"
         Top             =   2520
         Width           =   495
      End
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   1
         Left            =   600
         Picture         =   "frmMain.frx":2C88
         Style           =   1  'Graphical
         TabIndex        =   29
         ToolTipText     =   "Zoom out horizontally"
         Top             =   2040
         Width           =   495
      End
      Begin VB.CommandButton Command9 
         Height          =   495
         Index           =   0
         Left            =   120
         Picture         =   "frmMain.frx":3552
         Style           =   1  'Graphical
         TabIndex        =   28
         ToolTipText     =   "Zoom in horizontally"
         Top             =   2040
         Width           =   495
      End
      Begin VB.CommandButton Command8 
         Caption         =   "Clear All"
         Height          =   495
         Left            =   120
         TabIndex        =   27
         ToolTipText     =   "Clears all equations"
         Top             =   4200
         Width           =   975
      End
      Begin VB.CommandButton Command7 
         Height          =   495
         Left            =   600
         Picture         =   "frmMain.frx":3E1C
         Style           =   1  'Graphical
         TabIndex        =   25
         ToolTipText     =   "Scroll Up"
         Top             =   3600
         Width           =   495
      End
      Begin VB.CommandButton Command6 
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":425E
         Style           =   1  'Graphical
         TabIndex        =   24
         ToolTipText     =   "Scroll Down"
         Top             =   3600
         Width           =   495
      End
      Begin VB.CommandButton Command5 
         Height          =   495
         Left            =   600
         Picture         =   "frmMain.frx":46A0
         Style           =   1  'Graphical
         TabIndex        =   23
         ToolTipText     =   "Scroll Right"
         Top             =   3120
         Width           =   495
      End
      Begin VB.CommandButton Command4 
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":4AE2
         Style           =   1  'Graphical
         TabIndex        =   22
         ToolTipText     =   "Scroll Left"
         Top             =   3120
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
         Picture         =   "frmMain.frx":4F24
         Style           =   1  'Graphical
         TabIndex        =   21
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
         Picture         =   "frmMain.frx":5BC6
         Style           =   1  'Graphical
         TabIndex        =   20
         ToolTipText     =   "Zoom In"
         Top             =   840
         Width           =   495
      End
      Begin VB.CommandButton Command1 
         Height          =   495
         Left            =   120
         Picture         =   "frmMain.frx":6868
         Style           =   1  'Graphical
         TabIndex        =   19
         ToolTipText     =   "Change View Range"
         Top             =   240
         Width           =   975
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   34
      Top             =   5730
      Width           =   7080
      _ExtentX        =   12488
      _ExtentY        =   476
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   5821
            MinWidth        =   5292
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Object.Width           =   1764
            MinWidth        =   1764
            TextSave        =   "09:06 PM"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Object.Width           =   1764
            MinWidth        =   1764
            TextSave        =   "31/08/03"
         EndProperty
      EndProperty
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
         Caption         =   "Change View Range..."
      End
      Begin VB.Menu mnudefault 
         Caption         =   "Default Range"
      End
      Begin VB.Menu seperate3 
         Caption         =   "-"
      End
      Begin VB.Menu mnusize 
         Caption         =   "Graph Area Size..."
      End
      Begin VB.Menu mnugrid 
         Caption         =   "Show Grid"
         Checked         =   -1  'True
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
   Begin VB.Menu mnugraph 
      Caption         =   "Graphs"
      Begin VB.Menu addequ 
         Caption         =   "Add Graph..."
         Shortcut        =   ^E
      End
      Begin VB.Menu seperate5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuhide 
         Caption         =   "Hide"
      End
      Begin VB.Menu mnushow 
         Caption         =   "Show"
      End
      Begin VB.Menu mnudelete 
         Caption         =   "Delete"
      End
      Begin VB.Menu seperate7 
         Caption         =   "-"
      End
      Begin VB.Menu mnugraphedit 
         Caption         =   "Edit..."
      End
      Begin VB.Menu seperate8 
         Caption         =   "-"
      End
      Begin VB.Menu mnutrace 
         Caption         =   "Trace..."
      End
      Begin VB.Menu mnutable 
         Caption         =   "Table..."
      End
   End
   Begin VB.Menu analyze 
      Caption         =   "Analyze"
      Begin VB.Menu eval 
         Caption         =   "Evaluate..."
      End
      Begin VB.Menu mnuDerive 
         Caption         =   "Derive Function..."
      End
      Begin VB.Menu mnuarea 
         Caption         =   "Area under curve..."
      End
      Begin VB.Menu mnuturningpoints 
         Caption         =   "Extrema and inflexion points..."
      End
      Begin VB.Menu mnutangent 
         Caption         =   "Draw Tangent/Normal..."
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
Option Explicit
Dim Filename As String, TempName As String
Dim xpos As Double, ypos As Double
Dim eqution As String, ImpTbl(0 To 640, 0 To 640) As Double
'Dim ImplicitError As Boolean
Dim RectX1, RectY1, RectX2, RectY2
Dim LastZoomed As Long
Dim LastScriptError As Boolean

Public Sub resizecontrols()
On Error Resume Next
Dim a As Double
Frame1.Height = frmMain.Height - 1450
Frame3.Width = frmMain.Width - 1600
Frame2.Top = frmMain.Height - 2600
'Frame3.Width = Frame2.Width
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
ListView1.Top = Frame2.Top + 100
ListView1.Width = frmMain.Width - 5180
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
Private Sub printText(TheText As String, x As Double, y As Double)
Dim SaveColor As Long
Picgraph.CurrentX = x
Picgraph.CurrentY = y
SaveColor = Picgraph.ForeColor
Picgraph.ForeColor = MarksColor
Picgraph.Print (TheText)
Picgraph.ForeColor = SaveColor
End Sub
Private Sub DrawCircle(xcenter, ycenter, color, HorRadius, Aspect)
Dim Radius As Double
If Aspect > 1 Then Radius = HorRadius * Aspect Else Radius = HorRadius
Picgraph.Circle (xcenter, ycenter), Radius, color, , , Aspect
End Sub
Public Sub createcoordinates()
On Error Resume Next
Dim i As Double, raised As Double, raised2 As Double, cstrcoordformat
Dim TheStart As Double, TheEnd As Double
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

Picgraph.FontBold = MarksFont.FontBold
Picgraph.FontItalic = MarksFont.FontItalic
Picgraph.FontUnderline = MarksFont.FontUnderline
Picgraph.FontStrikeThru = MarksFont.FontStrikeThru
Picgraph.FontName = MarksFont.FontName
Picgraph.FontSize = MarksFont.FontSize

Dim temp As Long, temp1 As Long
temp = Picgraph.ForeColor
temp1 = Picgraph.DrawWidth
Picgraph.DrawWidth = 1
Dim a As Double, b As Double, TheStep As Double
a = pRight - pLeft
If TrigX = True Then a = a / Pi
b = a / 10 ^ Int(Log(a) / Log(10))
If b >= 1 And b <= 2 Then
TheStep = 2 / 50 * 10 ^ Int(Log(a) / Log(10))
ElseIf b > 2 And b <= 5 Then
TheStep = 5 / 50 * 10 ^ Int(Log(a) / Log(10))
ElseIf b > 5 And b <= 10 Then
TheStep = 10 / 50 * 10 ^ Int(Log(a) / Log(10))
End If
If TrigX = True Then TheStep = TheStep * Pi

Dim NumStepsX As Double
NumStepsX = (pRight - pLeft) / TheStep

Dim SaveStyle As Byte, SaveWidth As Byte
SaveStyle = Picgraph.DrawStyle
Picgraph.DrawStyle = GridLineStyle
If mnugrid.Checked = True And GridType = 1 Then
Dim linelength As Double
linelength = Larger(Larger(pTop, Abs(pBottom)), Larger(pRight, Abs(pLeft))) * 1.5
Dim counter As Byte
counter = 0
For i = 0 To 8 Step 1 / 3
If counter Mod 2 = 0 Then
Picgraph.Line (OnPicture(0, 0).x, OnPicture(0, 0).y)-(OnPicture(linelength * Cos(i * Atn(1)), 0).x, OnPicture(0, linelength * Sin(i * Atn(1))).y), MajorGridColor
Else
If ShowMinorGrid = True Then Picgraph.Line (OnPicture(0, 0).x, OnPicture(0, 0).y)-(OnPicture(linelength * Cos(i * Atn(1)), 0).x, OnPicture(0, linelength * Sin(i * Atn(1))).y), MinorGridColor
End If
counter = counter + 1
Next
End If
Picgraph.DrawStyle = SaveStyle

SaveWidth = Picgraph.DrawWidth
SaveStyle = Picgraph.DrawStyle
Picgraph.DrawWidth = AxisLineWidth
Picgraph.DrawStyle = AxisLineStyle
Picgraph.Line (OnPicture(0, pTop).x, OnPicture(0, pTop).y)-(OnPicture(0, pBottom).x, OnPicture(0, pBottom).y), AxisColor
Picgraph.Line (OnPicture(pRight, 0).x, OnPicture(pRight, 0).y)-(OnPicture(pLeft, 0).x, OnPicture(pLeft, 0).y), AxisColor
Picgraph.DrawWidth = SaveWidth
Picgraph.DrawStyle = SaveStyle

raised = Picgraph.ScaleHeight / 200
raised2 = Picgraph.ScaleWidth / 200
Dim stepsbefore As Integer, ii As Double
If mnugrid.Checked = True And GridType = 1 Then
stepsbefore = Int(((0 - Smaller(pLeft, pBottom)) / (pRight - pLeft)) * NumStepsX) + 15
Else
stepsbefore = Int(((0 - pLeft) / (pRight - pLeft)) * NumStepsX) + 5
End If

If mnugrid.Checked = True And GridType = 1 Then
TheStart = Round(Smaller(pBottom, pLeft) / TheStep, 0) * TheStep
TheEnd = Larger(pTop, pRight)
Else
TheStart = Round(pLeft / TheStep, 0) * TheStep
TheEnd = pRight
End If

For i = TheStart - 10 * TheStep To TheEnd + 10 * TheStep Step TheStep
If (i < (pLeft - Picgraph.ScaleWidth / 2) Or i > (pRight + Picgraph.ScaleWidth / 2)) And (i < (pBottom - Picgraph.ScaleHeight / 2) Or i > (pTop + Picgraph.ScaleHeight / 2)) Then GoTo skip
If ((i - pLeft) / (pRight - pLeft)) > (1 / 100) Then

SaveStyle = Picgraph.DrawStyle
Picgraph.DrawStyle = GridLineStyle

If mnugrid.Checked = True And Round(i, 6) <> 0 And ShowMinorGrid = True Then
    If GridType = 0 Then Picgraph.Line (OnPicture(i, pTop).x, OnPicture(i, pTop).y)-(OnPicture(i, pBottom).x, OnPicture(i, pBottom).y), MinorGridColor
    If GridType = 1 Then Call DrawCircle(OnPicture(0, 0).x, OnPicture(0, 0).y, MinorGridColor, Abs(i), (pRight - pLeft) / (pTop - pBottom))
End If

Picgraph.DrawStyle = SaveStyle
Picgraph.Line (OnPicture(i, raised).x, OnPicture(i, raised).y)-(OnPicture(i, -raised).x, OnPicture(i, -raised).y), TicksColor
PicHruler.Line (i - pLeft, 8)-(i - pLeft, 10)
End If

If Round(i / (TheStep * 5), 6) = Round(i / (TheStep * 5), 0) Then
ii = i
If TrigX = True Then ii = ii / Pi
If Abs(ii) > 1 Then
ii = Round(ii, 3)
Else
ii = Round(ii, 5)
End If
If ((i - pLeft) / (pRight - pLeft)) > (1 / 100) Then
If ii <> "0" Then Call printText(IIf(TrigX = True And ii <> 0, Format(Str(ii), cstrcoordformat) + "*pi", Format(Str(ii), cstrcoordformat)), OnPicture(i - 0 * raised2, 6.5 * raised).x, OnPicture(i - 0 * raised2, 6.5 * raised).y)

SaveStyle = Picgraph.DrawStyle
Picgraph.DrawStyle = GridLineStyle
If mnugrid.Checked = True And Round(i, 6) <> 0 Then
    If GridType = 0 Then Picgraph.Line (OnPicture(i, pTop).x, OnPicture(i, pTop).y)-(OnPicture(i, pBottom).x, OnPicture(i, pBottom).y), MajorGridColor
    If GridType = 1 Then Call DrawCircle(OnPicture(0, 0).x, OnPicture(0, 0).y, MajorGridColor, Abs(i), (pRight - pLeft) / (pTop - pBottom))
End If
Picgraph.DrawStyle = SaveStyle

Picgraph.Line (OnPicture(i, 2 * raised).x, OnPicture(i, 2 * raised).y)-(OnPicture(i, -2 * raised).x, OnPicture(i, -2 * raised).y), TicksColor
PicHruler.Line (i - pLeft, 7)-(i - pLeft, 10)
PicHruler.CurrentX = i - raised2 / 2 - pLeft
PicHruler.CurrentY = 1
PicHruler.Print Format(IIf(TrigX = True And ii <> 0, Format(Str(ii), cstrcoordformat) + "*pi", Format(Str(ii), cstrcoordformat)), cstrcoordformat)
End If
End If
skip:
Next

a = pTop - pBottom
If TrigY = True Then a = a / Pi
b = a / 10 ^ Int(Log(a) / Log(10))
If b >= 1 And b <= 2 Then
TheStep = 2 / 50 * 10 ^ Int(Log(a) / Log(10))
ElseIf b > 2 And b <= 5 Then
TheStep = 5 / 50 * 10 ^ Int(Log(a) / Log(10))
ElseIf b > 5 And b <= 10 Then
TheStep = 10 / 50 * 10 ^ Int(Log(a) / Log(10))
End If
If TrigY = True Then TheStep = TheStep * Pi

Dim NumStepsY As Double
NumStepsY = (pTop - pBottom) / TheStep

stepsbefore = Int(((0 - pBottom) / (pTop - pBottom)) * NumStepsY)


For i = 0 - stepsbefore * Picgraph.ScaleHeight / NumStepsY To pTop Step (Picgraph.ScaleHeight) / NumStepsY
If i > 0 - stepsbefore * Picgraph.ScaleHeight / NumStepsY And i < pTop Then

SaveStyle = Picgraph.DrawStyle
Picgraph.DrawStyle = GridLineStyle
If mnugrid.Checked = True And Round(i, 6) <> 0 And ShowMinorGrid = True Then
    If GridType = 0 Then Picgraph.Line (OnPicture(pLeft, i).x, OnPicture(pLeft, i).y)-(OnPicture(pRight, i).x, OnPicture(pRight, i).y), MinorGridColor
    'If GridType = 1 Then Call DrawCircle(OnPicture(0, 0).x, OnPicture(0, 0).y, MinorGridColor, Abs(i), (pRight - pLeft) / (pTop - pBottom))
End If
Picgraph.DrawStyle = SaveStyle

Picgraph.Line (OnPicture(raised2, i).x, OnPicture(raised2, i).y)-(OnPicture(-raised2, i).x, OnPicture(-raised2, i).y), TicksColor
PicVruler.Line (8, OnPicture(0, i).y)-(10, OnPicture(0, i).y)
End If
If Round(i / (TheStep * 5), 6) = Round(i / (TheStep * 5), 0) Then
ii = i
If TrigY = True Then ii = ii / Pi
If Abs(ii) > 1 Then
ii = Round(ii, 3)
Else
ii = Round(ii, 5)
End If
If i > 0 - stepsbefore * Picgraph.ScaleHeight / NumStepsY And i < pTop Then
If ii <> "0" Then Call printText(IIf(TrigY = True And ii <> 0, Format(Str(ii), cstrcoordformat) + "*pi", Format(Str(ii), cstrcoordformat)), OnPicture(3 * raised2, i + raised * 2).x, OnPicture(3 * raised2, i + raised * 2).y)
SaveStyle = Picgraph.DrawStyle
Picgraph.DrawStyle = GridLineStyle
If mnugrid.Checked = True And Round(i, 6) <> 0 Then
    If GridType = 0 Then Picgraph.Line (OnPicture(pLeft, i).x, OnPicture(pLeft, i).y)-(OnPicture(pRight, i).x, OnPicture(pRight, i).y), MajorGridColor
'    If GridType = 1 Then Call DrawCircle(OnPicture(0, 0).x, OnPicture(0, 0).y, MajorGridColor, Abs(i) / (pTop - pBottom) * (pRight - pLeft), (pRight - pLeft) / (pTop - pBottom))
End If
Picgraph.DrawStyle = SaveStyle

Picgraph.Line (OnPicture(2 * raised2, i).x, OnPicture(2 * raised2, i).y)-(OnPicture(-2 * raised2, i).x, OnPicture(-2 * raised2, i).y), TicksColor
PicVruler.Line (7, OnPicture(0, i).y)-(10, OnPicture(0, i).y)
PicVruler.CurrentX = 0
PicVruler.CurrentY = OnPicture(0, i + 2 * raised).y
PicVruler.Print Format(IIf(TrigY = True And ii <> 0, Format(Str(ii), cstrcoordformat) + "*pi", Format(Str(ii), cstrcoordformat)), cstrcoordformat)
End If
End If
Next
Picgraph.ForeColor = temp
Picgraph.DrawWidth = temp1

temp = Picgraph.DrawWidth
Picgraph.DrawWidth = 1
Dim EndPoints(1 To 4) As XY
EndPoints(1).x = pLeft
EndPoints(1).y = pBottom + (15 / Picgraph.Height) * Picgraph.ScaleHeight
EndPoints(2).x = pRight - (15 / Picgraph.Width) * Picgraph.ScaleWidth
EndPoints(2).y = pBottom + (15 / Picgraph.Height) * Picgraph.ScaleHeight
EndPoints(3).x = pLeft
EndPoints(3).y = pTop
EndPoints(4).x = pRight - (15 / Picgraph.Width) * Picgraph.ScaleWidth
EndPoints(4).y = pTop

Picgraph.Line (OnPictureXYXY(EndPoints(1)).x, OnPictureXYXY(EndPoints(1)).y)-(OnPictureXYXY(EndPoints(2)).x, OnPictureXYXY(EndPoints(2)).y), vbBlack
Picgraph.Line (OnPictureXYXY(EndPoints(1)).x, OnPictureXYXY(EndPoints(1)).y)-(OnPictureXYXY(EndPoints(3)).x, OnPictureXYXY(EndPoints(3)).y), vbBlack
Picgraph.Line (OnPictureXYXY(EndPoints(3)).x, OnPictureXYXY(EndPoints(3)).y)-(OnPictureXYXY(EndPoints(4)).x, OnPictureXYXY(EndPoints(4)).y), vbBlack
Picgraph.Line (OnPictureXYXY(EndPoints(4)).x, OnPictureXYXY(EndPoints(4)).y)-(OnPictureXYXY(EndPoints(2)).x, OnPictureXYXY(EndPoints(2)).y), vbBlack
Picgraph.DrawWidth = temp

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
Dim i As Long
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
If AllFunctions(num).Type = "inverse" Then
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
If m < planestart And (AllFunctions(num).Type = "normal" Or AllFunctions(num).Type = "implicit") Then m = planestart
If z > planeend And (AllFunctions(num).Type = "normal" Or AllFunctions(num).Type = "implicit") Then z = planeend
Select Case AllFunctions(num).Type
Case "normal"
Call DrawNormal(AllFunctions(num).expression1, AllFunctions(num).color, m, z, startprog, endprog, AllFunctions(num).CenterSign)
Case "inverse"
Call DrawInverse(AllFunctions(num).expression1, AllFunctions(num).color, m, z, startprog, endprog, AllFunctions(num).CenterSign)
Case "parametric"
Call DrawParametric(AllFunctions(num).expression1, AllFunctions(num).expression2, AllFunctions(num).color, m, z, startprog, endprog)
Case "polar"
Call DrawPolar(AllFunctions(num).expression1, AllFunctions(num).color, m, z, startprog, endprog)
Case "implicit"
Call DrawImplicit(AllFunctions(num).expression1, AllFunctions(num).expression2, AllFunctions(num).color, m, z, startprog, endprog, AllFunctions(num).CenterSign)
End Select
End Sub

Public Sub DrawNormal(expression As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double, CenterSign As String)
Dim lastx As Double, lasty As Double, slope As Double, lastslope As Double, point1 As XY, point2 As XY, Error As Boolean, lasterror As Boolean, x As Double, y As Double
Dim x1 As Double, x2 As Double, y1 As Double, y2 As Double
Dim madeline As Boolean, periodic As Boolean, expression1 As String
Dim TestY As Double, TestSlope As Double, factor As Double
Dim LastLine As Double 'for inequalities
On Error GoTo errh
expression1 = EditedEqu(expression)
Init expression1
periodic = IsPeriodic(expression1)
If CenterSign <> "=" Then NumInequalities = NumInequalities + 1
LastLine = pStart - 0.18 + 0.18 * (NumInequalities Mod 5)
lasterror = False
x = pStart - (pEnd - pStart) / 100000
Do While x <= pEnd + (pEnd - pStart) / 100000
math.Error = False
Error = False
y = GetVal(x, 0, 0, 0)
If math.Error = True Then Error = True
If Error = False And lasterror = False Then
    If CenterSign = ">=" And (x - LastLine) > 0.18 * (pRight - pLeft) / 20 Then Picgraph.Line (x2, y2)-(x2, OnPicture(0, pTop).y), color: LastLine = x
    If CenterSign = "<=" And (x - LastLine) > 0.18 * (pRight - pLeft) / 20 Then Picgraph.Line (x2, y2)-(x2, OnPicture(0, pBottom).y), color: LastLine = x
    If x <= pStart Then
    Picgraph.PSet (OnPicture(x, y).x, OnPicture(x, y).y), color
    Else
    point1 = OnPicture(lastx, lasty)
    point2 = OnPicture(x, y)
    
    x1 = point1.x
    x2 = point2.x
    y1 = point1.y
    y2 = point2.y
    
        slope = -(y2 - y1) / (x2 - x1)
        
        If slope = 0 Then slope = 0.000000000001
        If lastslope = 0 Then lastslope = 0.000000000001
        If Abs(slope) > 10 And Abs(slope / lastslope) > 10 Then
        TestY = GetVal(x + 0.0000001, 0, 0, 0)
        TestSlope = Abs(TestY - y) / (0.0000001)
        If Abs(slope / TestSlope) > 10 Then madeline = False: GoTo skip
        End If
        
        If (slope * lastslope) < 0 And Abs(slope) > 10 Then
        TestY = GetVal(x + 0.0000001, 0, 0, 0)
        TestSlope = (TestY - y) / (0.0000001)
        If (TestSlope * slope) < 0 Then madeline = False: GoTo skip
        End If

        If ((y1 <= Picgraph.ScaleHeight And y1 >= 0) Or (y2 <= Picgraph.ScaleHeight And y2 >= 0)) Then
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

Public Sub DrawInverse(expression As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double, CenterSign As String)
Dim lastx As Double, lasty As Double, slope As Double, lastslope As Double, point1 As XY, point2 As XY, Error As Boolean, lasterror As Boolean, x As Double, y As Double
Dim x1 As Double, x2 As Double, y1 As Double, y2 As Double
Dim madeline As Boolean, periodic As Boolean, expression1 As String
Dim TestX As Double, TestSlope As Double, factor As Double
Dim LastLine As Double 'for inequalities
On Error GoTo errh
expression1 = EditedEqu(expression)
Init expression1
periodic = IsPeriodic(expression1)
If CenterSign <> "=" Then NumInequalities = NumInequalities + 1
LastLine = pStart - 0.18 + 0.18 * (NumInequalities Mod 5)
lasterror = False
y = pStart - (pEnd - pStart) / 100000
Do While y <= pEnd + (pEnd - pStart) / 100000
math.Error = False
Error = False
x = GetVal(0, y, 0, 0)
If math.Error = True Then Error = True
If Error = False And lasterror = False Then
    If CenterSign = ">=" And (y - LastLine) > 0.18 * (pTop - pBottom) / 20 Then Picgraph.Line (x2, y2)-(OnPicture(pRight, 0).x, y2), color: LastLine = y
    If CenterSign = "<=" And (y - LastLine) > 0.18 * (pTop - pBottom) / 20 Then Picgraph.Line (x2, y2)-(OnPicture(pLeft, 0).x, y2), color: LastLine = y
    If y <= pStart Then
    Picgraph.PSet (OnPicture(x, y).x, OnPicture(x, y).y), color
    Else
    point1 = OnPicture(lastx, lasty)
    point2 = OnPicture(x, y)
    
    x1 = point1.x
    x2 = point2.x
    y1 = point1.y
    y2 = point2.y
    
        slope = -(x2 - x1) / (y2 - y1)
        
        If slope = 0 Then slope = 0.000000000001
        If lastslope = 0 Then lastslope = 0.000000000001
        If Abs(slope) > 10 And Abs(slope / lastslope) > 10 Then
        TestX = GetVal(0, y + 0.0000001, 0, 0)
        TestSlope = Abs(TestX - x) / (0.0000001)
        If Abs(slope / TestSlope) > 10 Then madeline = False: GoTo skip
        End If
        
        If (slope * lastslope) < 0 And Abs(slope) > 10 Then
        TestX = GetVal(0, y + 0.0000001, 0, 0)
        TestSlope = (TestX - x) / (0.0000001)
        If (TestSlope * slope) < 0 Then madeline = False: GoTo skip
        End If

        If ((x1 <= Picgraph.ScaleWidth And x1 >= 0) Or (x2 <= Picgraph.ScaleWidth And x2 >= 0)) Then
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
y = y + (pRight - pLeft) / 6000 * factor
ElseIf Abs(slope) > 20 Then
y = y + (pRight - pLeft) / 1600 * factor
ElseIf Abs(slope) > 5 Then
y = y + (pRight - pLeft) / 900 * factor
ElseIf Abs(slope) > 1.5 Then
y = y + (pRight - pLeft) / 700 * factor
Else
y = y + (pRight - pLeft) / 400 * factor
End If
ProgressBar1.Value = ((y - pStart) / (pEnd - pStart)) * (endprog - startprog) + startprog
Loop
errh:
Error = True
Resume Next
End Sub

Private Sub DrawPolar(expression As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double)
Dim lastx As Double, lasty As Double, point1 As XY, point2 As XY, x As Double, y As Double
Dim x1 As Double, x2 As Double, y1 As Double, y2 As Double
Dim expression1 As String, i As Double, steps As Integer
Dim ia As Double, ib As Double, la As Double, lb As Double, l As Double
Dim Error As Boolean, lasterror As Boolean
On Error GoTo errh
expression1 = EditedEqu(expression)
Init expression1
steps = 800
steps = steps * quality
i = pStart
lasterror = False
Do While i <= pEnd
Error = False
math.Error = False
l = GetVal(0, 0, i, 0)
x = l * Cos(i)
y = l * Sin(i)
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
        If (y1 <= Picgraph.ScaleHeight And y1 >= 0 And x1 <= Picgraph.ScaleWidth And x1 >= 0) Or (y2 <= Picgraph.ScaleHeight And y2 >= 0 And x2 <= Picgraph.ScaleWidth And x2 >= 0) Then
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
errh:
Error = True
Resume Next
End Sub
Private Sub DrawParametric(Xexp As String, Yexp As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double)
Dim lastx As Double, lasty As Double, point1 As XY, point2 As XY, x As Double, y As Double
Dim x1 As Double, x2 As Double, y1 As Double, y2 As Double
Dim Xexp1 As String, Yexp1 As String, i As Double
Dim Error As Boolean, lasterror As Boolean, steps As Long
On Error GoTo errh



Xexp1 = EditedEqu(Xexp)
Yexp1 = EditedEqu(Yexp)
Call Init(Xexp1, 0)
Call Init(Yexp1, 1)
steps = 800
steps = steps * quality
lasterror = False
i = pStart
Do While i <= pEnd
Error = False
math.Error = False
x = GetVal(0, 0, i, 0)
y = GetVal(0, 0, i, 1)
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
        If (y1 <= Picgraph.ScaleHeight And y1 >= 0 And x1 <= Picgraph.ScaleWidth And x1 >= 0) Or (y2 <= Picgraph.ScaleHeight And y2 >= 0 And x2 <= Picgraph.ScaleWidth And x2 >= 0) Then
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
errh:
Error = True
Resume Next

End Sub
Private Sub DrawImplicit(expression1 As String, expression2 As String, color As Long, pStart As Double, pEnd As Double, startprog As Double, endprog As Double, CenterSign As String)
Dim x As Double, y As Double, expr As String, expr1 As String
Dim todraw As Boolean
Dim i As Integer, j As Integer
Dim steps As Integer
Dim midprog As Double
'ImplicitError = False
'On Error GoTo errh
steps = Picgraph.Width / 15
steps = steps * quality
If steps > 640 Then steps = 640
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
'math.Error = False
i = Round((x - pLeft) / (pRight - pLeft) * steps, 0)
j = Round((y - pBottom) / (pTop - pBottom) * steps, 0)
ImpTbl(i, j) = GetVal(x, y, 0, 0, True)  'ScriptControl1.Run("RunThis", x, y)
'If math.Error = True Then ImpTbl(i, j) = 987654321.023
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



If CenterSign <> "=" Then
    NumInequalities = NumInequalities + 1
    Dim FirstTrue As Double
    For x = pStart + (NumInequalities Mod 5) * (pRight - pLeft) / steps To pEnd Step (pRight - pLeft) / steps * 5 * quality
    FirstTrue = 987654321.023
    For y = pBottom To pTop Step (pTop - pBottom) / steps
    i = Round((x - pLeft) / (pRight - pLeft) * steps, 0)
    j = Round((y - pBottom) / (pTop - pBottom) * steps, 0)
    If (ImpTbl(i, j) >= 0 And CenterSign = ">=") Or (ImpTbl(i, j) <= 0 And CenterSign = "<=") Then
        If FirstTrue = 987654321.023 Then FirstTrue = y
    Else
        If FirstTrue <> 987654321.023 Then
        Picgraph.Line (OnPicture(x, FirstTrue).x, OnPicture(x, FirstTrue).y)-(OnPicture(x, y - (pTop - pBottom) / steps).x, OnPicture(x, y - (pTop - pBottom) / steps).y), color
        FirstTrue = 987654321.023
        End If
    End If
    If (pTop - y) < (pTop - pBottom) / steps And FirstTrue <> 987654321.023 Then
        Picgraph.Line (OnPicture(x, FirstTrue).x, OnPicture(x, FirstTrue).y)-(OnPicture(x, y).x, OnPicture(x, y).y), color
    End If
    Next
    'ProgressBar1.Value = ((x - pStart) / (pEnd - pStart)) * (endprog - midprog) + midprog
    Next
End If
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
'Exit Sub
'errh:
'ImplicitError = True
'MsgBox ("error")
'Exit Sub
End Sub
Private Function Determine(i As Integer, j As Integer) As Boolean
    Dim b1 As Double, b2 As Double, b3 As Double
    On Error Resume Next
    Determine = False
    If ImpTbl(i, j) = 987654321.020507 Or (ImpTbl(i - 1, j) = 987654321.020507 And i > 1) Or (ImpTbl(i, j - 1) = 987654321.020507 And j > 1) Then Exit Function
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
Public Sub Init(Eq As String, Optional Index As Byte = 0)
On Error Resume Next
    Const EmptyValue = ""
    ScriptControl1(Index).Reset
    ScriptControl1(Index).AddObject "Math", math, True
    ScriptControl1(Index).AddCode "Function RunThis1(X,Y,T)" & vbCrLf & "on error resume next" & vbCrLf & "RunThis1=" & Eq & vbCrLf & "End Function"
    ScriptControl1(Index).AddCode "Function RunThis(X,Y,T)" & vbCrLf & "on error resume next" & vbCrLf & "if lastscripterror=true then err.clear" & vbCrLf & "RunThis=" & Eq & vbCrLf & "if runthis<>0 then lastscripterror=false:exit function" & vbCrLf & "if RunThis=0 then" & vbCrLf & "if err.description<>emptyvalue then runthis=987654321.020507: lastscripterror=true : else :lastscripterror=false" & vbCrLf & "End If" & vbCrLf & "End Function"
    ScriptControl1(Index).Tag = Eq
End Sub

'Private Function derCalc(dernum As Integer, equ As String, xpoint As Double)
'If dernum = 0 Then
'derCalc = GetVal(xpoint, 0)
'End If
'End Function

Public Sub AddToList(num As Integer)
'If AllFunctions(num).Type = "implicit" And ImplicitError = True Then
'numfunctions = numfunctions - 1
'Exit Sub
'End If
Dim m As String, z As String, ss As String
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
ss = "y " + AllFunctions(num).CenterSign + " " + AllFunctions(num).expression1
Case "inverse"
ss = "x " + AllFunctions(num).CenterSign + " " + AllFunctions(num).expression1
Case "parametric"
ss = "x= " + AllFunctions(num).expression1 + " ,y= " + AllFunctions(num).expression2 + " (parametric)"
Case "polar"
ss = "r= " + AllFunctions(num).expression1 + " (polar)"
Case "implicit"
ss = AllFunctions(num).expression1 + " " + AllFunctions(num).CenterSign + " " + AllFunctions(num).expression2 + " (Implicit)"
End Select
    
If AllFunctions(num).Shown = False Then ss = ss + " (hidden)"
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
NumInequalities = 0
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

Private Sub Check1_Click()
RectX1 = 987654321.023 'a random number
RectY1 = 987654321.023
End Sub

Private Sub CmdPlot_Click()
If IsValid(EditedEqu(Combo1.Text), True, False, False) = False Then MsgBox ("Invalid expression"): Exit Sub
Dim func As FUNCTION_INFO
Call DrawNormal(Combo1.Text, PicColor.BackColor, pLeft, pRight, 0, 100, "=")
func.Type = "normal"
func.HasPeriod = False
func.expression1 = Combo1.Text
func.color = PicColor.BackColor
func.Shown = True
func.CenterSign = "="
Call AddFunction(func)
End Sub

Private Sub CmdZoomIn_Click()
Dim xcenter As Double, ycenter As Double
xcenter = (pRight + pLeft) / 2
ycenter = (pTop + pBottom) / 2
pRight = (pRight - xcenter) / (zoomfactor / 100) + xcenter
pLeft = (pLeft - xcenter) / (zoomfactor / 100) + xcenter
pTop = (pTop - ycenter) / (zoomfactor / 100) + ycenter
pBottom = (pBottom - ycenter) / (zoomfactor / 100) + ycenter
Dim ZoomedNow As Long
LastZoomed = GetTickCount
ZoomedNow = LastZoomed
If numfunctions > 0 Then
    Do Until GetTickCount - ZoomedNow > 250
    DoEvents
    Loop
End If
If LastZoomed = ZoomedNow Then Call ReDraw
End Sub

Private Sub CmdZoomOut_Click()
Dim xcenter As Double, ycenter As Double
xcenter = (pRight + pLeft) / 2
ycenter = (pTop + pBottom) / 2
pRight = (pRight - xcenter) * (zoomfactor / 100) + xcenter
pLeft = (pLeft - xcenter) * (zoomfactor / 100) + xcenter
pTop = (pTop - ycenter) * (zoomfactor / 100) + ycenter
pBottom = (pBottom - ycenter) * (zoomfactor / 100) + ycenter
Dim ZoomedNow As Long
LastZoomed = GetTickCount
ZoomedNow = LastZoomed
If numfunctions > 0 Then
    Do Until GetTickCount - ZoomedNow > 250
    DoEvents
    Loop
End If
If LastZoomed = ZoomedNow Then Call ReDraw
End Sub



Private Sub Command9_Click(Index As Integer)
Dim xcenter As Double, ycenter As Double
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
Dim ZoomedNow As Long
LastZoomed = GetTickCount
ZoomedNow = LastZoomed
If numfunctions > 0 Then
    Do Until GetTickCount - ZoomedNow > 250
    DoEvents
    Loop
End If
If LastZoomed = ZoomedNow Then Call ReDraw
End Sub


Private Sub Combo1_Change()
If Combo1.Text = "" Then
CmdPlot.Enabled = False
Else
CmdPlot.Enabled = True
End If
End Sub

Private Sub Combo1_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 And Combo1.Text <> "" Then CmdPlot_Click
End Sub

Private Sub Command1_Click()
Load frmOptions
Set frmOptions.tbsOptions.SelectedItem = frmOptions.tbsOptions.Tabs(2)
frmOptions.Show , Me
End Sub

Private Sub Command2_Click()
Dim curpos As Integer, Selection As Integer, i As Integer
If numfunctions < 1 Then Exit Sub
For curpos = 1 To ListView1.ListItems.Count
If ListView1.ListItems(curpos).Selected = True Then Selection = curpos
Next
For i = Selection To numfunctions
AllFunctions(i) = AllFunctions(i + 1)
Next
numfunctions = numfunctions - 1
RefreshAll

End Sub


Private Sub Command3_Click()
Dim func As FUNCTION_INFO
Dim curpos As Integer, i As Integer
If numfunctions < 1 Then Exit Sub
For curpos = 1 To ListView1.ListItems.Count
If ListView1.ListItems(curpos).Selected = True Then selfunc = curpos
Next
Load frmNewEqu
frmNewEqu.Caption = "Edit Graph"
func = AllFunctions(selfunc)
With frmNewEqu
Dim FrameIndex As Byte
Select Case func.Type
Case "normal"
.Combo1.Text = "y(x) function"
.txtY.Text = func.expression1
.Combo2.Text = func.CenterSign
FrameIndex = 0
Case "inverse"
.Combo1.Text = "x(y) function"
.txtX.Text = func.expression1
.Combo3.Text = func.CenterSign
FrameIndex = 1
Case "parametric"
.Combo1.Text = "Parametric function"
.txtParametric1.Text = func.expression1
.txtParametric2.Text = func.expression2
If .Option1.Value = True Then
.Text1.Text = "0"
.Text2.Text = "10"
End If
FrameIndex = 2
Case "polar"
.Combo1.Text = "Polar function"
.txtPolar.Text = func.expression1
If .Option1.Value = True Then
.Text1.Text = "0"
.Text2.Text = "2pi"
End If
FrameIndex = 3
Case "implicit"
.Combo1.Text = "Implicit relation"
FrameIndex = 4
.txtImplicit1.Text = func.expression1
.txtImplicit2.Text = func.expression2
.Combo4.Text = func.CenterSign
.Option1.Value = True
.Text1.Text = Str(pLeft)
.Text2.Text = Str(pRight)
End Select
For i = 0 To 4
If i = FrameIndex Then .Frame1(i).Visible = True Else .Frame1(i).Visible = False
Next

.PicColor.BackColor = func.color

.Option2.Value = func.HasPeriod
If .Option2.Value = True Then
.Text1.Text = Str(func.start)
.Text2.Text = Str(func.end)
Else
.Text1.Text = Str(pLeft)
.Text2.Text = Str(pRight)
.Option1.Value = True
End If

If func.Shown Then .Check1.Value = 1 Else .Check1.Value = 0
End With
frmNewEqu.Show vbModal
End Sub

Private Sub Command4_Click()
pRight = pRight - Picgraph.ScaleWidth / 4
pLeft = pLeft - Picgraph.ScaleWidth / 4
Dim ZoomedNow As Long
LastZoomed = GetTickCount
ZoomedNow = LastZoomed
If numfunctions > 0 Then
    Do Until GetTickCount - ZoomedNow > 250
    DoEvents
    Loop
End If
If LastZoomed = ZoomedNow Then Call ReDraw
End Sub

Private Sub Command5_Click()
pRight = pRight + Picgraph.ScaleWidth / 4
pLeft = pLeft + Picgraph.ScaleWidth / 4
Dim ZoomedNow As Long
LastZoomed = GetTickCount
ZoomedNow = LastZoomed
If numfunctions > 0 Then
    Do Until GetTickCount - ZoomedNow > 250
    DoEvents
    Loop
End If
If LastZoomed = ZoomedNow Then Call ReDraw
End Sub

Private Sub Command6_Click()
pTop = pTop - Picgraph.ScaleHeight / 4
pBottom = pBottom - Picgraph.ScaleHeight / 4
Dim ZoomedNow As Long
LastZoomed = GetTickCount
ZoomedNow = LastZoomed
If numfunctions > 0 Then
    Do Until GetTickCount - ZoomedNow > 250
    DoEvents
    Loop
End If
If LastZoomed = ZoomedNow Then Call ReDraw
End Sub

Private Sub Command7_Click()
pTop = pTop + Picgraph.ScaleHeight / 4
pBottom = pBottom + Picgraph.ScaleHeight / 4
Dim ZoomedNow As Long
LastZoomed = GetTickCount
ZoomedNow = LastZoomed
If numfunctions > 0 Then
    Do Until GetTickCount - ZoomedNow > 250
    DoEvents
    Loop
End If
If LastZoomed = ZoomedNow Then Call ReDraw
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
Filename = ""
TempName = ""
cmndlg.Flags = (cdlOFNHideReadOnly Or cdlOFNPathMustExist Or cdlOFNOverwritePrompt)
Call ListView1.ColumnHeaders.Add(, , "Color", 800)
Call ListView1.ColumnHeaders.Add(, , "Number", 800)
Call ListView1.ColumnHeaders.Add(, , "Equation", 3700)
Call ListView1.ColumnHeaders.Add(, , "From", 800)
Call ListView1.ColumnHeaders.Add(, , "To", 800)
ListView1.ListItems.Clear
zoom = 1
zoomfactor = 200
quality = 1
qualitylevel = 5

AxisColor = vbRed
TicksColor = vbBlue
MarksColor = vbBlue
MajorGridColor = &H808080
MinorGridColor = &HC0C0C0
AxisLineStyle = 0
AxisLineWidth = 1
MarksFont.FontBold = False
MarksFont.FontItalic = False
MarksFont.FontUnderline = False
MarksFont.FontStrikeThru = False
MarksFont.FontName = "Ms Sans Serif"
MarksFont.FontSize = 8
GridType = 0
GridLineStyle = 2
ShowMajorGrid = True
ShowMinorGrid = False
AutoRandomize = True
TrigX = False
TrigY = False

NumInequalities = 0
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

createcoordinates

End Sub

Private Sub Form_Paint()
resizecontrols
End Sub

Private Sub Form_Resize()
If Me.Width < 9560 And Me.WindowState = 0 Then Me.Width = 9560
If Me.Height < 6300 And Me.WindowState = 0 Then Me.Height = 6300
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

Private Sub ListView1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
mnugraph_Click
If Button = 2 Then Me.PopupMenu mnugraph
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

Private Sub mnudelete_Click()
Command2_Click
End Sub

Private Sub mnuDerive_Click()
Load frmDerivative
frmDerivative.Show , Me
End Sub

Private Sub mnugraph_Click()
Dim i As Integer
For i = 1 To numfunctions
If ListView1.ListItems(i).Selected = True Then
    If AllFunctions(i).Shown = True Then
        mnuhide.Enabled = True
        mnushow.Enabled = False
    Else
        mnuhide.Enabled = False
        mnushow.Enabled = True
    End If
    Exit For
End If
Next
End Sub

Private Sub mnugraphedit_Click()
Command3_Click
End Sub

Private Sub mnugrid_Click()
mnugrid.Checked = Not (mnugrid.Checked)
ShowMajorGrid = mnugrid.Checked
ReDraw
End Sub

Private Sub mnuhide_Click()
Dim i As Integer
For i = 1 To numfunctions
If ListView1.ListItems(i).Selected = True Then AllFunctions(i).Shown = False: Exit For
Next
RefreshAll
End Sub

Private Sub mnuoptions_Click()
Load frmOptions
frmOptions.Show vbModal, Me
End Sub

Private Sub mnurefresh_Click()
resizecontrols
RefreshAll
End Sub

Private Sub mnusavepic_Click()
On Error GoTo cancelling
cmndlg.Filename = ""
cmndlg.Filter = "Bitamp files (*.bmp)|*.bmp|"
cmndlg.ShowSave
If cmndlg.Filename = "" Then Exit Sub
Call SavePicture(Picgraph.Image, cmndlg.Filename)
cancelling:
Exit Sub
End Sub

Private Sub mnushow_Click()
Dim i As Integer
For i = 1 To numfunctions
If ListView1.ListItems(i).Selected = True Then AllFunctions(i).Shown = True: Exit For
Next
RefreshAll
End Sub

Private Sub mnusize_Click()
Load frmZoom
frmZoom.Show , Me
End Sub

Private Sub mnusolve_Click()
Load frmSolve
frmSolve.Show , Me
End Sub


Private Sub mnutable_Click()
Dim i As Integer, ii As Integer, ftype As String
Dim m As Double, z As Double
For ii = 1 To ListView1.ListItems.Count
    If ListView1.ListItems(ii).Selected = True Then
        ftype = AllFunctions(ii).Type: i = ii
    End If
Next
        
If ftype <> "implicit" And numfunctions > 0 Then Load frmTable Else Exit Sub

Select Case ftype
Case "normal"
frmTable.TabStrip1.SelectedItem = frmTable.TabStrip1.Tabs(1)
Case "inverse"
frmTable.TabStrip1.SelectedItem = frmTable.TabStrip1.Tabs(2)
Case "parametric"
frmTable.TabStrip1.SelectedItem = frmTable.TabStrip1.Tabs(3)
Case "polar"
frmTable.TabStrip1.SelectedItem = frmTable.TabStrip1.Tabs(4)
End Select

Call frmTable.InitTable

Select Case ftype
Case "normal"
frmTable.Combo1.Text = AllFunctions(i).expression1
Case "inverse"
frmTable.Combo1.Text = AllFunctions(i).expression1
Case "polar"
frmTable.Combo1.Text = AllFunctions(i).expression1
Case "parametric"
frmTable.Combo1.Text = AllFunctions(i).expression1
frmTable.Combo2.Text = AllFunctions(i).expression2
End Select
        
If AllFunctions(i).HasPeriod = True Then
    m = AllFunctions(i).start
    z = AllFunctions(i).end
Else
    m = pLeft
    z = pRight
End If
frmTable.Text1.Text = Str(m)
frmTable.Text2.Text = Str(z)
frmTable.Text3.Text = "0.1"
        
Call frmTable.MakeTable

frmTable.Show , Me

End Sub

Private Sub mnutangent_Click()
If numfunctions = 0 Then Exit Sub
Load frmTangent
frmTangent.Show , frmMain
End Sub

Private Sub mnutrace_Click()
Dim i As Integer, ii As Integer, ftype As String
Dim m As Integer, z As Integer
'frmTrace.Show , Me
For ii = 1 To ListView1.ListItems.Count
    If ListView1.ListItems(ii).Selected = True Then
        ftype = AllFunctions(ii).Type: i = ii
    End If
Next

If ftype <> "implicit" And numfunctions > 0 Then Load frmTrace Else Exit Sub

Select Case ftype
Case "normal"
frmTrace.TabStrip1.SelectedItem = frmTrace.TabStrip1.Tabs(1)
Case "inverse"
frmTrace.TabStrip1.SelectedItem = frmTrace.TabStrip1.Tabs(2)
Case "parametric"
frmTrace.TabStrip1.SelectedItem = frmTrace.TabStrip1.Tabs(3)
Case "polar"
frmTrace.TabStrip1.SelectedItem = frmTrace.TabStrip1.Tabs(4)
End Select

Call frmTrace.InitTrace

Select Case ftype
Case "normal"
frmTrace.Combo1.Text = AllFunctions(i).expression1
Case "inverse"
frmTrace.Combo1.Text = AllFunctions(i).expression1
Case "polar"
frmTrace.Combo1.Text = AllFunctions(i).expression1
Case "parametric"
frmTrace.Combo1.Text = AllFunctions(i).expression1
frmTrace.Combo2.Text = AllFunctions(i).expression2
End Select
m = pLeft
z = pRight
frmTrace.Text5.Text = Str(m)
frmTrace.Text6.Text = Str(z)
Call frmTrace.FindScrollX

frmTrace.Show , Me
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
Dim i As Integer
cmndlg.Filename = ""
cmndlg.Filter = "Math graph files (*.mgr)|*.mgr|"
cmndlg.ShowOpen
If cmndlg.Filename = "" Then Exit Sub
Filename = cmndlg.Filename
ClearAll
Open Filename For Input As #1
Input #1, numfunctions
For i = 1 To numfunctions
Input #1, AllFunctions(i).CenterSign, AllFunctions(i).color, AllFunctions(i).end, AllFunctions(i).expression1, AllFunctions(i).expression2, AllFunctions(i).HasPeriod, AllFunctions(i).Shown, AllFunctions(i).start, AllFunctions(i).Type
Next
Close #1
RefreshAll
canceling:
Exit Sub
End Sub

Private Sub PicColor_Click()
On Error GoTo calcelling
cmndlg.color = PicColor.BackColor
cmndlg.ShowColor
PicColor.BackColor = cmndlg.color
calcelling:
Exit Sub
End Sub

Private Sub Picgraph_DblClick()
Dim xcenter As Double, ycenter As Double
xcenter = (pRight + pLeft) / 2
ycenter = (pTop + pBottom) / 2

pLeft = pLeft + xpos - xcenter
pRight = pRight + xpos - xcenter
pTop = pTop + ypos - ycenter
pBottom = pBottom + ypos - ycenter
ReDraw
End Sub

Private Sub Picgraph_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 1 Then
    If Check1.Value = 1 Then
    RectX1 = x
    RectY1 = y
    Shape1.Visible = True
    Shape1.Height = 0
    Shape1.Width = 0
    End If
Else
    Check1.Value = 0
    Shape1.Visible = False
End If
End Sub

Private Sub Picgraph_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Dim xx As Double, yy As Double, xpos As Double, ypos As Double
Dim Radius As Double, Angle As Double, AngleRad As Double
Dim cstrcoordformat
On Error Resume Next
xx = Round(x + pLeft, 3)
yy = Round((Picgraph.ScaleHeight - y) + pBottom, 3)
xpos = xx
ypos = yy
Radius = Round(Sqr(((Picgraph.ScaleHeight - y) + pBottom) ^ 2 + (x + pLeft) ^ 2), 3)
Angle = Round(Atn(yy / xx) / Pi * 180, 3)
AngleRad = Round(Atn(yy / xx), 3)
StatusBar1.Panels(2).Text = "X= " & Format(xx, cstrcoordformat) & " , Y= " & Format(yy, cstrcoordformat) & " , Radius= " & Format(Radius, cstrcoordformat) & " , Angle= " & Format(Angle, cstrcoordformat) + " degrees/" & Format(AngleRad, cstrcoordformat) + " radians"
LineHtrace.x1 = 0
LineHtrace.x2 = Picgraph.ScaleWidth
LineHtrace.y1 = y
LineHtrace.y2 = y

LineVtrace.x1 = x
LineVtrace.x2 = x
LineVtrace.y1 = 0
LineVtrace.y2 = Picgraph.ScaleHeight
If mnucross.Checked = True Then showlines

If Check1.Value = 1 And RectX1 <> 987654321.023 Then
    RectX2 = x
    RectY2 = y
    Shape1.Top = Smaller(RectY1, RectY2)
    Shape1.Left = Smaller(RectX1, RectX2)
    Shape1.Height = Abs(RectY1 - RectY2)
    Shape1.Width = Abs(RectX1 - RectX2)
End If
End Sub

Private Sub Picgraph_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Dim x1 As Double, x2 As Double, y1 As Double, y2 As Double
If Check1.Value = 1 And RectX1 <> 987654321.023 Then
If RectX2 = RectX1 Then RectX2 = RectX2 + 0.01
If RectY2 = RectY1 Then RectY2 = RectY2 + 0.01

x1 = Round(RectX1 + pLeft, 3)
x2 = Round(RectX2 + pLeft, 3)
y1 = Round((Picgraph.ScaleHeight - RectY1) + pBottom, 3)
y2 = Round((Picgraph.ScaleHeight - RectY2) + pBottom, 3)
pLeft = Smaller(x1, x2)
pRight = Larger(x1, x2)
pTop = Larger(y1, y2)
pBottom = Smaller(y1, y2)
Shape1.Visible = False
Check1.Value = 0
Call ReDraw
End If
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
Dim i As Integer
On Error GoTo canceling
cmndlg.Filename = ""
If Filename = "" Then
cmndlg.Filter = "Math graph files (*.mgr)|*.mgr|"
cmndlg.ShowSave
Filename = cmndlg.Filename
End If
If Filename = "" Then Exit Sub
Open Filename For Output As #1
Write #1, numfunctions
For i = 1 To numfunctions
Write #1, AllFunctions(i).CenterSign, AllFunctions(i).color, AllFunctions(i).end, AllFunctions(i).expression1, AllFunctions(i).expression2, AllFunctions(i).HasPeriod, AllFunctions(i).Shown, AllFunctions(i).start, AllFunctions(i).Type
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

Private Sub Timer1_Timer()
'If numfunctions = 0 Then mnugraph.Enabled = False Else mnugraph.Enabled = True
If Combo1.Text = "" Then CmdPlot.Enabled = False Else CmdPlot.Enabled = True
End Sub


Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
Select Case Button.Key
Case "new"
new_Click
Case "open"
open_Click
Case "saveas"
saveas_Click
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
