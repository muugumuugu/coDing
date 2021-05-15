VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options"
   ClientHeight    =   4920
   ClientLeft      =   2565
   ClientTop       =   1500
   ClientWidth     =   6150
   Icon            =   "frmOptions.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4920
   ScaleWidth      =   6150
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command3 
      Caption         =   "Default"
      Height          =   375
      Left            =   120
      TabIndex        =   35
      Top             =   4440
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog cmndlg 
      Left            =   1800
      Top             =   4440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.PictureBox picOptions 
      BorderStyle     =   0  'None
      Height          =   3780
      Index           =   2
      Left            =   -20000
      ScaleHeight     =   3780
      ScaleWidth      =   5685
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   480
      Width           =   5685
      Begin VB.Frame fraSample3 
         Height          =   3705
         Left            =   0
         TabIndex        =   9
         Top             =   0
         Width           =   5535
         Begin VB.CommandButton Command2 
            Caption         =   "Back Picture"
            Height          =   375
            Left            =   3480
            TabIndex        =   24
            Top             =   840
            Width           =   1815
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Back Color"
            Height          =   375
            Left            =   3480
            TabIndex        =   23
            Top             =   360
            Width           =   1815
         End
         Begin VB.PictureBox Picture1 
            AutoRedraw      =   -1  'True
            Height          =   3135
            Left            =   240
            ScaleHeight     =   3075
            ScaleWidth      =   3075
            TabIndex        =   22
            Top             =   360
            Width           =   3135
         End
      End
   End
   Begin VB.PictureBox picOptions 
      BorderStyle     =   0  'None
      Height          =   3780
      Index           =   1
      Left            =   -20000
      ScaleHeight     =   3780
      ScaleWidth      =   5685
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   480
      Width           =   5685
      Begin VB.Frame fraSample2 
         Height          =   3705
         Left            =   0
         TabIndex        =   8
         Top             =   0
         Width           =   5535
         Begin VB.TextBox txtycenter 
            Height          =   285
            Left            =   840
            TabIndex        =   21
            Top             =   2760
            Width           =   2295
         End
         Begin VB.TextBox txtxcenter 
            Height          =   285
            Left            =   840
            TabIndex        =   20
            Top             =   2280
            Width           =   2295
         End
         Begin VB.TextBox txtymax 
            Height          =   285
            Left            =   840
            TabIndex        =   17
            Top             =   1680
            Width           =   2295
         End
         Begin VB.TextBox txtymin 
            Height          =   285
            Left            =   840
            TabIndex        =   16
            Top             =   1200
            Width           =   2295
         End
         Begin VB.TextBox txtxmax 
            Height          =   285
            Left            =   840
            TabIndex        =   13
            Top             =   720
            Width           =   2295
         End
         Begin VB.TextBox txtxmin 
            Height          =   285
            Left            =   840
            TabIndex        =   11
            Top             =   240
            Width           =   2295
         End
         Begin VB.Label Label6 
            Caption         =   "Y center:"
            Height          =   255
            Left            =   120
            TabIndex        =   19
            Top             =   2760
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "X center:"
            Height          =   255
            Left            =   120
            TabIndex        =   18
            Top             =   2280
            Width           =   855
         End
         Begin VB.Line Line1 
            X1              =   120
            X2              =   5400
            Y1              =   2160
            Y2              =   2160
         End
         Begin VB.Label Label4 
            Caption         =   "Y max:"
            Height          =   255
            Left            =   120
            TabIndex        =   15
            Top             =   1680
            Width           =   615
         End
         Begin VB.Label Label3 
            Caption         =   "Y min:"
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   1200
            Width           =   615
         End
         Begin VB.Label Label2 
            Caption         =   "X max:"
            Height          =   255
            Left            =   120
            TabIndex        =   12
            Top             =   720
            Width           =   495
         End
         Begin VB.Label Label1 
            Caption         =   "X min:"
            Height          =   375
            Left            =   120
            TabIndex        =   10
            Top             =   240
            Width           =   1215
         End
      End
   End
   Begin VB.PictureBox picOptions 
      BorderStyle     =   0  'None
      Height          =   3780
      Index           =   0
      Left            =   210
      ScaleHeight     =   3780
      ScaleWidth      =   5685
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   480
      Width           =   5685
      Begin VB.Frame fraSample1 
         Height          =   3705
         Left            =   0
         TabIndex        =   5
         Top             =   0
         Width           =   5535
         Begin MSComctlLib.Slider Slider1 
            Height          =   615
            Left            =   600
            TabIndex        =   26
            Top             =   600
            Width           =   4215
            _ExtentX        =   7435
            _ExtentY        =   1085
            _Version        =   393216
            Min             =   1
            SelStart        =   5
            Value           =   5
         End
         Begin MSComctlLib.Slider Slider2 
            Height          =   615
            Left            =   600
            TabIndex        =   30
            Top             =   1800
            Width           =   4215
            _ExtentX        =   7435
            _ExtentY        =   1085
            _Version        =   393216
            Min             =   1
            SelStart        =   1
            Value           =   1
         End
         Begin MSComctlLib.Slider Slider3 
            Height          =   615
            Left            =   600
            TabIndex        =   34
            Top             =   2880
            Width           =   4215
            _ExtentX        =   7435
            _ExtentY        =   1085
            _Version        =   393216
            LargeChange     =   10
            SmallChange     =   2
            Min             =   100
            Max             =   500
            SelStart        =   200
            TickFrequency   =   0
            Value           =   200
         End
         Begin VB.Label Label13 
            Caption         =   "Zoom factor(%):"
            Height          =   375
            Left            =   120
            TabIndex        =   33
            Top             =   2520
            Width           =   1095
         End
         Begin VB.Label Label12 
            Caption         =   "thick"
            Height          =   255
            Left            =   4800
            TabIndex        =   32
            Top             =   2040
            Width           =   495
         End
         Begin VB.Label Label11 
            Caption         =   "thin"
            Height          =   375
            Left            =   120
            TabIndex        =   31
            Top             =   1920
            Width           =   495
         End
         Begin VB.Label Label10 
            Caption         =   "Drawing width:"
            Height          =   375
            Left            =   120
            TabIndex        =   29
            Top             =   1440
            Width           =   1455
         End
         Begin VB.Label Label9 
            Caption         =   "High"
            Height          =   255
            Left            =   4800
            TabIndex        =   28
            Top             =   720
            Width           =   495
         End
         Begin VB.Label Label8 
            Caption         =   "Low"
            Height          =   255
            Left            =   120
            TabIndex        =   27
            Top             =   720
            Width           =   495
         End
         Begin VB.Label Label7 
            Caption         =   "Drawing quality:"
            Height          =   255
            Left            =   120
            TabIndex        =   25
            Top             =   240
            Width           =   1815
         End
      End
   End
   Begin VB.CommandButton cmdApply 
      Caption         =   "Apply"
      Height          =   375
      Left            =   4920
      TabIndex        =   3
      Top             =   4455
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   2
      Top             =   4455
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   2490
      TabIndex        =   1
      Top             =   4455
      Width           =   1095
   End
   Begin MSComctlLib.TabStrip tbsOptions 
      Height          =   4245
      Left            =   105
      TabIndex        =   0
      Top             =   120
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   7488
      HotTracking     =   -1  'True
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Ganeral"
            Key             =   "Group1"
            Object.ToolTipText     =   "General options"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Interval"
            Key             =   "Group3"
            Object.ToolTipText     =   "Interval options"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Background"
            Key             =   "Group4"
            Object.ToolTipText     =   "Background options"
            ImageVarType    =   2
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim notchg1 As Boolean, notchg2 As Boolean
Dim tempbackstyle As String, tempbackcolour As Long, tempbackpic As String

Public Sub ApplySettings()
pLeft = txtxmin.Text
pRight = txtxmax.Text
pBottom = txtymin.Text
pTop = txtymax.Text
backstyle = tempbackstyle
backcolour = tempbackcolour
backpic = tempbackpic
frmMain.Picgraph.DrawWidth = Slider2.Value
zoomfactor = Slider3.Value
quality = 2 ^ (Slider1.Value - 5)
qualitylevel = Slider1.Value
ReDraw
End Sub


Private Sub cmdApply_Click()
If Stringval(txtxmin) >= Stringval(txtxmax) Or Stringval(txtymin) >= Stringval(txtymax) Then
MsgBox ("The interval you entered is invalid,the maximum must be greater than the minimum")
Exit Sub
End If
    ApplySettings
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
If Stringval(txtxmin) >= Stringval(txtxmax) Or Stringval(txtymin) >= Stringval(txtymax) Then
MsgBox ("The interval you entered is invalid,the maximum must be greater than the minimum")
Exit Sub
End If

    ApplySettings
    Unload Me
End Sub

Private Sub Command1_Click()
On Error GoTo cancelling
cmndlg.ShowColor
Picture1.Picture = LoadPicture()
Picture1.BackColor = cmndlg.color
tempbackcolour = cmndlg.color
tempbackstyle = "color"
cancelling:
Exit Sub
End Sub

Private Sub Command2_Click()
On Error GoTo cancelling
cmndlg.Filter = "Bitamp files (*.bmp)|*.bmp|"
cmndlg.ShowOpen
Call Picture1.PaintPicture(LoadPicture(cmndlg.Filename), 0, 0, Picture1.ScaleWidth, Picture1.ScaleHeight)
tempbackpic = cmndlg.Filename
tempbackstyle = "picture"
cancelling:
Exit Sub

End Sub

Private Sub Command3_Click()
Slider1.Value = 5
Slider2.Value = 1
Slider3.Value = 200
txtxmin.Text = -10
txtxmax.Text = 10
txtymin.Text = -10
txtymax.Text = 10
txtxcenter.Text = 0
txtycenter.Text = 0
tempbackstyle = "color"
tempbackcolour = vbWhite
Picture1.Picture = LoadPicture()
Picture1.BackColor = tempbackcolour
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim i As Integer
    'handle ctrl+tab to move to the next tab
    If Shift = vbCtrlMask And KeyCode = vbKeyTab Then
        i = tbsOptions.SelectedItem.Index
        If i = tbsOptions.Tabs.Count Then
            'last tab so we need to wrap to tab 1
            Set tbsOptions.SelectedItem = tbsOptions.Tabs(1)
        Else
            'increment the tab
            Set tbsOptions.SelectedItem = tbsOptions.Tabs(i + 1)
        End If
    End If
End Sub

Private Sub Form_Load()
    'center the form
    Me.Move (Screen.Width - Me.Width) / 2, (Screen.Height - Me.Height) / 2

notchg2 = True
txtxmin.Text = Str(pLeft)
txtxmax.Text = Str(pRight)
txtymin.Text = Str(pBottom)
txtymax.Text = Str(pTop)
notchg2 = False
txtxcenter.Text = Str(Round((pLeft + pRight), 6) / 2)
txtycenter.Text = Str(Round((pBottom + pTop), 6) / 2)

Slider1.Value = qualitylevel
Slider2.Value = frmMain.Picgraph.DrawWidth
Slider3.Value = zoomfactor
Select Case backstyle
Case "color"
Picture1.Picture = LoadPicture()
Picture1.BackColor = backcolour
Case "picture"
Call Picture1.PaintPicture(LoadPicture(backpic), 0, 0, Picture1.ScaleWidth, Picture1.ScaleHeight)
End Select
End Sub

Private Sub tbsOptions_Click()
    
    Dim i As Integer
    'show and enable the selected tab's controls
    'and hide and disable all others
    For i = 0 To tbsOptions.Tabs.Count - 1
        If i = tbsOptions.SelectedItem.Index - 1 Then
            picOptions(i).Left = 210
            picOptions(i).Enabled = True
        Else
            picOptions(i).Left = -20000
            picOptions(i).Enabled = False
        End If
    Next
    
End Sub

Private Sub txtxcenter_Change()
If notchg2 = True Then Exit Sub
notchg1 = True
Dim xcenter As Double
xcenter = (Stringval(txtxmin.Text) + Stringval(txtxmax.Text)) / 2
txtxmin.Text = Stringval(txtxmin.Text) + Stringval(txtxcenter.Text) - xcenter
txtxmax.Text = Stringval(txtxmax.Text) + Stringval(txtxcenter.Text) - xcenter
notchg1 = False
End Sub

Private Sub txtxmax_Change()
If notchg1 = True Then Exit Sub
notchg2 = True
txtxcenter.Text = (Stringval(txtxmin.Text) + Stringval(txtxmax.Text)) / 2
notchg2 = False
End Sub

Private Sub txtxmin_Change()
If notchg1 = True Then Exit Sub
notchg2 = True
txtxcenter.Text = (Stringval(txtxmin.Text) + Stringval(txtxmax.Text)) / 2
notchg2 = False
End Sub

Private Sub txtycenter_Change()
If notchg2 = True Then Exit Sub
notchg1 = True
Dim ycenter As Double
ycenter = (Stringval(txtymin.Text) + Stringval(txtymax.Text)) / 2
txtymin.Text = Stringval(txtymin.Text) + Stringval(txtycenter.Text) - ycenter
txtymax.Text = Stringval(txtymax.Text) + Stringval(txtycenter.Text) - ycenter
notchg1 = False
End Sub

Private Sub txtymax_Change()
If notchg1 = True Then Exit Sub
notchg2 = True
txtycenter.Text = (Stringval(txtymin.Text) + Stringval(txtymax.Text)) / 2
notchg2 = False
End Sub

Private Sub txtymin_Change()
If notchg1 = True Then Exit Sub
notchg2 = True
txtycenter.Text = (Stringval(txtymin.Text) + Stringval(txtymax.Text)) / 2
notchg2 = False
End Sub
