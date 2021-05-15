VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form frmSplash 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "City Builder"
   ClientHeight    =   2865
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   8415
   Icon            =   "frmSplash.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2865
   ScaleWidth      =   8415
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "Webdings"
         Size            =   8.25
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   7110
      TabIndex        =   13
      Top             =   2520
      Width           =   1275
   End
   Begin VB.CheckBox chkSounds 
      Caption         =   "Sound Effects"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   3600
      TabIndex        =   12
      Top             =   1170
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7290
      TabIndex        =   9
      Top             =   1140
      Visible         =   0   'False
      Width           =   1005
   End
   Begin VB.ComboBox cmbResolution 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3600
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   1170
      Visible         =   0   'False
      Width           =   2085
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Start"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6210
      TabIndex        =   7
      Top             =   1140
      Visible         =   0   'False
      Width           =   1005
   End
   Begin ComctlLib.ProgressBar Prg 
      Height          =   195
      Left            =   3600
      TabIndex        =   6
      Top             =   1170
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   344
      _Version        =   327682
      Appearance      =   1
   End
   Begin VB.Label tmpLabel 
      AutoSize        =   -1  'True
      Caption         =   "Muku"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   6
      Left            =   5400
      TabIndex        =   11
      Top             =   1800
      Width           =   450
   End
   Begin VB.Label tmpLabel 
      AutoSize        =   -1  'True
      Caption         =   "Music from:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   5
      Left            =   3600
      TabIndex        =   10
      Top             =   2520
      Width           =   1005
   End
   Begin VB.Label tmpLabel 
      AutoSize        =   -1  'True
      Caption         =   "Holiday Island"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   4
      Left            =   5400
      TabIndex        =   5
      Top             =   2520
      Width           =   1215
   End
   Begin VB.Label tmpLabel 
      AutoSize        =   -1  'True
      Caption         =   "Transport Tycoon Duluxe courtesy Google"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Index           =   3
      Left            =   5400
      TabIndex        =   4
      Top             =   2070
      Width           =   2625
      WordWrap        =   -1  'True
   End
   Begin VB.Label tmpLabel 
      AutoSize        =   -1  'True
      Caption         =   "Graphics from:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   2
      Left            =   3600
      TabIndex        =   3
      Top             =   2070
      Width           =   1290
   End
   Begin VB.Label tmpLabel 
      AutoSize        =   -1  'True
      Caption         =   "Created by:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   1
      Left            =   3600
      TabIndex        =   2
      Top             =   1800
      Width           =   1035
   End
   Begin VB.Label lblLoading 
      AutoSize        =   -1  'True
      Caption         =   "Loading..."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   3600
      TabIndex        =   1
      Top             =   900
      Width           =   840
   End
   Begin VB.Label tmpLabel 
      AutoSize        =   -1  'True
      Caption         =   "City Builder"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Index           =   0
      Left            =   3600
      TabIndex        =   0
      Top             =   180
      Width           =   2640
   End
   Begin VB.Image imgLogo 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   2505
      Left            =   90
      Picture         =   "frmSplash.frx":0E42
      Top             =   180
      Width           =   3330
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkSounds_Click()
    m_SoundEffects = IIf(chkSounds.value = vbChecked, True, False)
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdStart_Click()
    cmbResolution.Visible = False
    cmdStart.Visible = False
    cmdExit.Visible = False
    lblLoading = "Loading..."
    Sleep 100
    Prg.Visible = True
    '
    SaveSetting App.Title, "Settings", "DisplayMode", cmbResolution.ListIndex
    DisplayResolution = cmbResolution.ListIndex
    '
    Load frmMain
End Sub

Private Sub Form_Load()
    '
  
    '
    If IsLoaded("frmMain") = False Then
        '
        With cmbResolution
            .AddItem "Window Mode"
            .AddItem "Full Screen Mode"
            .ListIndex = GetSetting(App.Title, "Settings", "DisplayMode", 1)
            .Visible = True
        End With
        cmdStart.Visible = True
        cmdExit.Visible = True
        Prg.Visible = False
        lblLoading = "Select Resolution:"
        '
    Else
        chkSounds.value = IIf(m_SoundEffects, vbChecked, 0)
    End If

End Sub

