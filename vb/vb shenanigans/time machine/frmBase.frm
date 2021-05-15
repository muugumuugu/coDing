VERSION 5.00
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "msscript.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmBase 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Liquid Skyes "
   ClientHeight    =   11520
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15360
   DrawStyle       =   5  'Transparent
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "MS Dialog Light"
      Size            =   6
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H000000FF&
   Icon            =   "frmBase.frx":0000
   KeyPreview      =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   11520
   ScaleMode       =   0  'User
   ScaleWidth      =   15360
   Begin VB.TextBox Text6 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arabic Transparent"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   195
      Left            =   4005
      Locked          =   -1  'True
      TabIndex        =   234
      Text            =   "ETC"
      Top             =   11160
      Visible         =   0   'False
      Width           =   450
   End
   Begin VB.TextBox Text9 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arabic Transparent"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   195
      Left            =   4005
      Locked          =   -1  'True
      TabIndex        =   233
      Text            =   "Blur"
      Top             =   11160
      Visible         =   0   'False
      Width           =   450
   End
   Begin VB.TextBox txtDraw 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Dialog"
         Size            =   6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Left            =   3975
      Locked          =   -1  'True
      TabIndex        =   232
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   525
   End
   Begin VB.TextBox txtProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Dialog"
         Size            =   6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Index           =   8
      Left            =   3960
      Locked          =   -1  'True
      TabIndex        =   231
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   555
   End
   Begin VB.TextBox txtProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Index           =   6
      Left            =   4035
      Locked          =   -1  'True
      TabIndex        =   230
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Index           =   5
      Left            =   4035
      Locked          =   -1  'True
      TabIndex        =   229
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Index           =   4
      Left            =   4035
      Locked          =   -1  'True
      TabIndex        =   228
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Index           =   3
      Left            =   4035
      Locked          =   -1  'True
      TabIndex        =   227
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Index           =   1
      Left            =   4035
      Locked          =   -1  'True
      TabIndex        =   226
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Index           =   2
      Left            =   4035
      Locked          =   -1  'True
      TabIndex        =   225
      Text            =   "00.00"
      Top             =   11175
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtEtcSumD 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   210
      Left            =   3990
      Locked          =   -1  'True
      MaxLength       =   4
      TabIndex        =   224
      Top             =   11160
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.TextBox txtWaveSumD 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   210
      Left            =   3990
      Locked          =   -1  'True
      MaxLength       =   4
      TabIndex        =   223
      Top             =   11160
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.TextBox txtETCT 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Dialog"
         Size            =   6
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   168
      Left            =   4680
      Locked          =   -1  'True
      TabIndex        =   222
      Text            =   "00.00"
      Top             =   11280
      Visible         =   0   'False
      Width           =   555
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   10
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   221
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   11
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   220
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   12
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   219
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   13
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   218
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   14
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   217
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   15
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   216
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   16
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   215
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   17
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   214
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   18
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   213
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   19
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   212
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.TextBox txtProcess 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      ForeColor       =   &H00C0FFFF&
      Height          =   168
      Index           =   20
      Left            =   4755
      Locked          =   -1  'True
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   211
      Text            =   "00.00"
      ToolTipText     =   "FFT Calculate Timer "
      Top             =   11280
      Visible         =   0   'False
      Width           =   410
   End
   Begin VB.PictureBox PicPat 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   3870
      Left            =   240
      Picture         =   "frmBase.frx":11C2
      ScaleHeight     =   256
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   40
      TabIndex        =   150
      Top             =   5640
      Visible         =   0   'False
      Width           =   630
   End
   Begin VB.Frame fraBlur 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4620
      Left            =   4455
      TabIndex        =   10
      Top             =   0
      Width           =   3495
      Begin VB.CheckBox chkBlur 
         BackColor       =   &H00000000&
         Caption         =   "Type 4"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   3
         Left            =   2640
         TabIndex        =   191
         Top             =   1440
         Width           =   795
      End
      Begin VB.CheckBox chkBlur 
         BackColor       =   &H00000000&
         Caption         =   "Type 3"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   2
         Left            =   2640
         TabIndex        =   190
         Top             =   1200
         Width           =   795
      End
      Begin VB.CheckBox chkBlur 
         BackColor       =   &H00000000&
         Caption         =   "Type 1"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   0
         Left            =   2640
         TabIndex        =   189
         Top             =   720
         Width           =   795
      End
      Begin VB.CheckBox chkBlur 
         BackColor       =   &H00000000&
         Caption         =   "Type 2"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   1
         Left            =   2640
         TabIndex        =   188
         Top             =   960
         Width           =   795
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   27
         Left            =   2130
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   180
         Text            =   "Cpu 0"
         Top             =   3720
         Width           =   720
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   26
         Left            =   2835
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   179
         Text            =   "Cpu 1"
         Top             =   3720
         Width           =   720
      End
      Begin VB.TextBox txtProcess1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "MS Dialog Light"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   195
         Left            =   2835
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   175
         Text            =   "00"
         Top             =   3915
         Width           =   720
      End
      Begin VB.TextBox txtProcess0 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "MS Dialog Light"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   195
         Left            =   2130
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   174
         Text            =   "00"
         Top             =   3915
         Width           =   720
      End
      Begin VB.TextBox txtProcessSum 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "MS Dialog Light"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   225
         Left            =   2160
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   181
         Text            =   "00"
         Top             =   3495
         Width           =   1425
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C0C0&
         Height          =   240
         Index           =   0
         Left            =   2160
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   177
         Text            =   "WIN Cpu Usage"
         Top             =   3270
         Width           =   1425
      End
      Begin VB.ListBox lstPsent 
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   2880
         ItemData        =   "frmBase.frx":8A06
         Left            =   2055
         List            =   "frmBase.frx":8A08
         TabIndex        =   165
         Top             =   360
         Width           =   550
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00322732&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   150
         Index           =   17
         Left            =   1695
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   172
         Text            =   "ms"
         Top             =   3315
         Width           =   250
      End
      Begin VB.TextBox txtEFRM 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H005B425A&
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "MS Dialog Light"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1170
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   170
         Text            =   "10.00"
         Top             =   3240
         Width           =   540
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   150
         Index           =   9
         Left            =   1695
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   169
         Text            =   "ms"
         Top             =   3525
         Width           =   250
      End
      Begin VB.TextBox txtDoEvSleep 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H005B425A&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1170
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   168
         Text            =   "10.00"
         Top             =   3465
         Width           =   540
      End
      Begin VB.TextBox TextLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00322732&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   225
         Index           =   18
         Left            =   0
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   173
         Text            =   "                Sum : "
         Top             =   3240
         Width           =   2370
      End
      Begin VB.TextBox TextLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   225
         Index           =   6
         Left            =   0
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   176
         Text            =   "Others"
         Top             =   3465
         Width           =   2490
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   240
         Index           =   4
         Left            =   0
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   178
         Text            =   "Timers"
         Top             =   3720
         Width           =   2475
      End
      Begin VB.CheckBox chkSortP 
         BackColor       =   &H00665766&
         Caption         =   "Sort Lists"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   225
         Left            =   0
         TabIndex        =   171
         Top             =   4320
         Value           =   1  'Checked
         Width           =   1440
      End
      Begin VB.ListBox lstFunctions 
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   2880
         ItemData        =   "frmBase.frx":8A0A
         Left            =   120
         List            =   "frmBase.frx":8A11
         TabIndex        =   167
         Top             =   360
         Width           =   1425
      End
      Begin VB.ListBox lstProcess 
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   2880
         ItemData        =   "frmBase.frx":8A23
         Left            =   1530
         List            =   "frmBase.frx":8A2A
         TabIndex        =   166
         Top             =   360
         Width           =   540
      End
      Begin VB.TextBox txtProcess 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00400040&
         BorderStyle     =   0  'None
         ForeColor       =   &H00C0FFFF&
         Height          =   168
         Index           =   0
         Left            =   3000
         Locked          =   -1  'True
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   17
         Text            =   "00.00"
         Top             =   360
         Width           =   525
      End
      Begin VB.TextBox txtTimeP2Sky 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H005B425A&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   2640
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   146
         Text            =   "10.00"
         Top             =   4080
         Width           =   540
      End
      Begin VB.Timer Timer_Sky 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   1920
         Top             =   4200
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   12
         Left            =   2685
         MousePointer    =   1  'Arrow
         TabIndex        =   145
         Text            =   "1"
         Top             =   4320
         Width           =   435
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00D5B797&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   12
         Left            =   2400
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   144
         Top             =   4320
         Width           =   300
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00866CBB&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   12
         Left            =   3105
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   143
         Top             =   4320
         Width           =   300
      End
      Begin VB.PictureBox picBBlur 
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         ForeColor       =   &H80000008&
         Height          =   4260
         Left            =   0
         ScaleHeight     =   4230
         ScaleWidth      =   3465
         TabIndex        =   16
         Top             =   360
         Width           =   3500
      End
      Begin VB.Line Line46 
         BorderColor     =   &H00C0C0C0&
         Index           =   6
         X1              =   120
         X2              =   2760
         Y1              =   3360
         Y2              =   3360
      End
      Begin VB.Label lblBlur 
         Alignment       =   2  'Center
         BackColor       =   &H00473842&
         Caption         =   "Blur"
         BeginProperty Font 
            Name            =   "Modern"
            Size            =   12
            Charset         =   255
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   15
         TabIndex        =   12
         Top             =   30
         Width           =   3465
      End
      Begin VB.Line Line18 
         BorderColor     =   &H00808080&
         X1              =   0
         X2              =   2400
         Y1              =   6725
         Y2              =   6725
      End
      Begin VB.Label lblFileName 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "------------"
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "MS Dialog Light"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   165
         Left            =   240
         MousePointer    =   1  'Arrow
         TabIndex        =   11
         Top             =   960
         Width           =   975
      End
   End
   Begin MSScriptControlCtl.ScriptControl KScript 
      Left            =   6000
      Top             =   10920
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
   Begin VB.Frame fraProcess 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   7455
      Left            =   120
      TabIndex        =   31
      Top             =   0
      Width           =   3975
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   19
         Left            =   2160
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   254
         Top             =   2160
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   18
         Left            =   2160
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   247
         Top             =   1800
         Width           =   300
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   17
         Left            =   1185
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   249
         Top             =   2160
         Width           =   300
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   16
         Left            =   1185
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   243
         Top             =   1800
         Width           =   300
      End
      Begin VB.CheckBox chkATime 
         BackColor       =   &H00800000&
         Caption         =   "LQ Time 1"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   345
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   155
         Top             =   3240
         Value           =   1  'Checked
         Width           =   1395
      End
      Begin VB.TextBox TextLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H0080FF80&
         Height          =   165
         Index           =   15
         Left            =   405
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   257
         Text            =   "    Stp"
         Top             =   2115
         Width           =   795
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.000"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   19
         Left            =   2445
         MaxLength       =   5
         MousePointer    =   1  'Arrow
         TabIndex        =   256
         Text            =   "1"
         Top             =   2220
         Width           =   1155
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   19
         Left            =   3600
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   255
         Top             =   2160
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   2
         Left            =   120
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   184
         Top             =   1440
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   11
         Left            =   120
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   163
         Top             =   1080
         Width           =   300
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H0080FF80&
         Height          =   165
         Index           =   1
         Left            =   360
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   194
         Text            =   "Velocity"
         Top             =   1320
         Width           =   825
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H0080FF80&
         Height          =   165
         Index           =   14
         Left            =   405
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   253
         Text            =   "BStp"
         Top             =   1740
         Width           =   795
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   18
         Left            =   3600
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   246
         Top             =   1800
         Width           =   300
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.000"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   18
         Left            =   2445
         MaxLength       =   5
         MousePointer    =   1  'Arrow
         TabIndex        =   245
         Text            =   "1"
         Top             =   1860
         Width           =   1155
      End
      Begin VB.CheckBox chkTimeEnable 
         BackColor       =   &H00000080&
         Caption         =   "Draw"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   705
         Index           =   1
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   152
         Top             =   2520
         Value           =   1  'Checked
         Width           =   555
      End
      Begin VB.CheckBox chkTimeEnable 
         BackColor       =   &H00800000&
         Caption         =   "Draw"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   705
         Index           =   0
         Left            =   3360
         Style           =   1  'Graphical
         TabIndex        =   252
         Top             =   2520
         Width           =   555
      End
      Begin VB.CheckBox chkAvalue 
         BackColor       =   &H00000080&
         Caption         =   "LQ Time 2"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   345
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   251
         Top             =   3240
         Value           =   1  'Checked
         Width           =   1275
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   17
         Left            =   120
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   250
         Top             =   2160
         Width           =   300
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.000"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   17
         Left            =   405
         MaxLength       =   5
         MousePointer    =   1  'Arrow
         TabIndex        =   248
         Text            =   "2"
         Top             =   2280
         Width           =   795
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   16
         Left            =   120
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   244
         Top             =   1800
         Width           =   300
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFC0&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.000"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   16
         Left            =   405
         MaxLength       =   5
         MousePointer    =   1  'Arrow
         TabIndex        =   242
         Text            =   "11"
         Top             =   1875
         Width           =   795
      End
      Begin VB.CheckBox chkPR 
         BackColor       =   &H00004040&
         Caption         =   "View All Available Thread"
         ForeColor       =   &H00FFFFFF&
         Height          =   345
         Index           =   2
         Left            =   1035
         MaskColor       =   &H000000FF&
         Style           =   1  'Graphical
         TabIndex        =   196
         Top             =   3960
         Value           =   1  'Checked
         Width           =   1875
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   8
         Left            =   1575
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   203
         Top             =   5895
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   8
         Left            =   120
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   202
         Top             =   5895
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   10
         Left            =   120
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   207
         Top             =   6360
         Width           =   300
      End
      Begin VB.CommandButton cmd0 
         BackColor       =   &H0000FF00&
         Caption         =   "One"
         Height          =   225
         Index           =   2
         Left            =   3450
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   235
         Top             =   1320
         UseMaskColor    =   -1  'True
         Width           =   465
      End
      Begin VB.TextBox txtQua 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         ForeColor       =   &H00000000&
         Height          =   225
         Left            =   360
         TabIndex        =   200
         Text            =   "35"
         ToolTipText     =   "JPG Quality"
         Top             =   6465
         Width           =   1215
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Index           =   10
         Left            =   1575
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   208
         Top             =   6360
         Width           =   300
      End
      Begin VB.TextBox Text3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H0080FF80&
         Height          =   225
         Left            =   120
         TabIndex        =   206
         Text            =   "Interval"
         ToolTipText     =   "JPG Quality"
         Top             =   5760
         Width           =   1755
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   8
         Left            =   360
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         OLEDragMode     =   1  'Automatic
         TabIndex        =   199
         Text            =   "2"
         ToolTipText     =   "Auto Shot Interval"
         Top             =   5985
         Width           =   1215
      End
      Begin VB.CommandButton cmdSF 
         BackColor       =   &H0080FFFF&
         Caption         =   "Shot a Picture"
         Height          =   450
         Left            =   120
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   205
         Top             =   5040
         UseMaskColor    =   -1  'True
         Width           =   1755
      End
      Begin VB.CheckBox chkAutoShot 
         BackColor       =   &H00000000&
         Caption         =   "AUTO  SHOT"
         ForeColor       =   &H00E0E0E0&
         Height          =   285
         Left            =   120
         TabIndex        =   204
         ToolTipText     =   "Auto Shot"
         Top             =   5520
         Width           =   1755
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H0080FF80&
         Height          =   255
         Index           =   3
         Left            =   360
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   201
         Text            =   "Photo Quality"
         Top             =   6270
         Width           =   1215
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "+1"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   15
         Left            =   2160
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   159
         Top             =   1080
         Width           =   570
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0FF&
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   2
         Left            =   405
         MousePointer    =   1  'Arrow
         TabIndex        =   151
         Text            =   "1"
         Top             =   1500
         Width           =   795
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   2
         Left            =   1200
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   185
         Top             =   1440
         Width           =   300
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   12
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Index           =   11
         Left            =   1200
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   164
         Top             =   1080
         Width           =   300
      End
      Begin VB.CommandButton cmdLogs 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Show Logs"
         Height          =   345
         Left            =   1380
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   198
         Top             =   3240
         UseMaskColor    =   -1  'True
         Width           =   1185
      End
      Begin VB.CheckBox ChkDraw 
         BackColor       =   &H00008000&
         Caption         =   "Clear Before New Draw "
         ForeColor       =   &H00FFFFFF&
         Height          =   345
         Index           =   4
         Left            =   1035
         MaskColor       =   &H000000FF&
         Style           =   1  'Graphical
         TabIndex        =   197
         Top             =   3600
         Value           =   1  'Checked
         Width           =   1875
      End
      Begin VB.TextBox Text2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H0070616C&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   705
         Left            =   1320
         MousePointer    =   1  'Arrow
         MultiLine       =   -1  'True
         TabIndex        =   195
         Text            =   "frmBase.frx":8A3A
         Top             =   2520
         Width           =   1305
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "-1"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   15
         Left            =   2160
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   158
         Top             =   1560
         Width           =   570
      End
      Begin VB.TextBox txtLQT2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H0070616C&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   705
         Left            =   600
         MousePointer    =   1  'Arrow
         MultiLine       =   -1  'True
         TabIndex        =   193
         Text            =   "frmBase.frx":8A5F
         Top             =   2520
         Width           =   825
      End
      Begin VB.CommandButton cmd0 
         BackColor       =   &H0000FF00&
         Caption         =   "Zero"
         Height          =   345
         Index           =   1
         Left            =   1440
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   187
         Top             =   1080
         UseMaskColor    =   -1  'True
         Width           =   465
      End
      Begin VB.CommandButton cmd0 
         BackColor       =   &H0000FF00&
         Caption         =   "Zero"
         Height          =   345
         Index           =   0
         Left            =   1440
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   186
         Top             =   1440
         UseMaskColor    =   -1  'True
         Width           =   465
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   23
         Left            =   120
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   183
         Text            =   "Draw Mode"
         Top             =   6840
         Width           =   1755
      End
      Begin VB.ComboBox Combo1 
         Height          =   270
         ItemData        =   "frmBase.frx":8A6F
         Left            =   120
         List            =   "frmBase.frx":8AA9
         TabIndex        =   182
         Top             =   7080
         Width           =   1755
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFC0C0&
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   11
         Left            =   405
         MaxLength       =   7
         MousePointer    =   1  'Arrow
         TabIndex        =   162
         Text            =   "1"
         Top             =   1080
         Width           =   795
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "100"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   13
         Left            =   2760
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   161
         Top             =   1560
         Width           =   555
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "100"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   13
         Left            =   2760
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   160
         Top             =   1080
         Width           =   555
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "1000"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   14
         Left            =   3360
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   157
         Top             =   1080
         Width           =   555
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "1000"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   14
         Left            =   3360
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   156
         Top             =   1560
         Width           =   555
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00F8AFA9&
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   13
         Left            =   2160
         MaxLength       =   6
         MousePointer    =   1  'Arrow
         TabIndex        =   154
         Text            =   "1"
         Top             =   1320
         Width           =   1395
      End
      Begin VB.TextBox txtLQT 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H0070616C&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   705
         Left            =   2520
         MousePointer    =   1  'Arrow
         MultiLine       =   -1  'True
         TabIndex        =   153
         Text            =   "frmBase.frx":8B6A
         Top             =   2520
         Width           =   825
      End
      Begin VB.PictureBox picBProcs 
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         ForeColor       =   &H80000008&
         Height          =   6735
         Left            =   0
         ScaleHeight     =   6705
         ScaleWidth      =   3945
         TabIndex        =   209
         Top             =   720
         Width           =   3975
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00322732&
         Caption         =   "First Passengers at the time."
         BeginProperty Font 
            Name            =   "Palatino Linotype"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFC0C0&
         Height          =   255
         Left            =   1440
         TabIndex        =   236
         ToolTipText     =   "Version 5.1 Build 564"
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label lblLQSky 
         Appearance      =   0  'Flat
         BackColor       =   &H00322732&
         Caption         =   "Liquid Skyes "
         BeginProperty Font 
            Name            =   "AngsanaUPC"
            Size            =   21.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0080FF80&
         Height          =   855
         Left            =   0
         TabIndex        =   210
         ToolTipText     =   "Powerd By Kaveh Abdollahi"
         Top             =   -120
         Width           =   3975
      End
      Begin VB.Line Line39 
         BorderColor     =   &H00808080&
         X1              =   120
         X2              =   2380
         Y1              =   2940
         Y2              =   2940
      End
   End
   Begin VB.Frame fraColors 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4095
      Left            =   7935
      TabIndex        =   1
      Top             =   0
      Width           =   3350
      Begin VB.CheckBox chkFallCol 
         BackColor       =   &H00000000&
         Caption         =   "Fall Colors"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Left            =   240
         MaskColor       =   &H000000FF&
         TabIndex        =   149
         Top             =   3780
         Value           =   1  'Checked
         Width           =   1065
      End
      Begin VB.CommandButton cmdSnCGr 
         BackColor       =   &H00FF8080&
         Caption         =   "B"
         Height          =   250
         Index           =   2
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   3195
         Width           =   680
      End
      Begin VB.CommandButton cmdSnCGr 
         BackColor       =   &H0080FF80&
         Caption         =   "G"
         Height          =   250
         Index           =   1
         Left            =   1275
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   3195
         Width           =   680
      End
      Begin VB.CommandButton cmdSnCGr 
         BackColor       =   &H000000FF&
         Caption         =   "R"
         Height          =   250
         Index           =   0
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   3195
         Width           =   680
      End
      Begin VB.TextBox txtRGB 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FF0000&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0FFFF&
         Height          =   195
         Index           =   0
         Left            =   600
         MousePointer    =   1  'Arrow
         TabIndex        =   28
         Text            =   "2"
         Top             =   3480
         Width           =   675
      End
      Begin VB.TextBox txtRGB 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FF0000&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0FFFF&
         Height          =   195
         Index           =   2
         Left            =   1920
         MousePointer    =   1  'Arrow
         TabIndex        =   30
         Text            =   "2"
         Top             =   3480
         Width           =   675
      End
      Begin VB.TextBox txtRGB 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FF0000&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0FFFF&
         Height          =   195
         Index           =   1
         Left            =   1260
         MousePointer    =   1  'Arrow
         TabIndex        =   29
         Text            =   "2"
         Top             =   3480
         Width           =   675
      End
      Begin VB.CommandButton cmdRGB 
         BackColor       =   &H00E0E0E0&
         Caption         =   "BRG"
         Height          =   250
         Index           =   2
         Left            =   2040
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   450
         Width           =   495
      End
      Begin VB.CommandButton cmdRGB 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Set RGB With 0"
         Height          =   250
         Index           =   10
         Left            =   600
         TabIndex        =   23
         Top             =   450
         Width           =   1335
      End
      Begin VB.CheckBox chkCol 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "5"
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   4
         Left            =   2100
         MaskColor       =   &H000000FF&
         TabIndex        =   22
         Top             =   3690
         Width           =   345
      End
      Begin VB.CheckBox chkCol 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "4"
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   3
         Left            =   1770
         MaskColor       =   &H000000FF&
         TabIndex        =   21
         Top             =   3690
         Width           =   345
      End
      Begin VB.CheckBox chkCol 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "3"
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   2
         Left            =   1440
         MaskColor       =   &H000000FF&
         TabIndex        =   20
         Top             =   3690
         Width           =   345
      End
      Begin VB.CheckBox chkCol 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "2"
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   1
         Left            =   1110
         MaskColor       =   &H000000FF&
         TabIndex        =   19
         Top             =   3690
         Width           =   345
      End
      Begin VB.CheckBox chkCol 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "1"
         ForeColor       =   &H000000FF&
         Height          =   315
         Index           =   0
         Left            =   765
         MaskColor       =   &H000000FF&
         TabIndex        =   18
         Top             =   3690
         Width           =   345
      End
      Begin VB.TextBox txtMinC 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   0
         Left            =   240
         MaxLength       =   3
         TabIndex        =   7
         Text            =   "0"
         Top             =   2880
         Width           =   680
      End
      Begin VB.TextBox txtMinC 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00008000&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   1
         Left            =   915
         MaxLength       =   3
         TabIndex        =   8
         Text            =   "0"
         Top             =   2880
         Width           =   680
      End
      Begin VB.TextBox txtMinC 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00800000&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   2
         Left            =   1590
         MaxLength       =   3
         TabIndex        =   9
         Text            =   "0"
         Top             =   2880
         Width           =   680
      End
      Begin VB.CheckBox chkInverse 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00000000&
         Caption         =   "Inverse"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Left            =   2400
         MaskColor       =   &H000000FF&
         TabIndex        =   3
         Top             =   3780
         Width           =   825
      End
      Begin VB.TextBox txtMaxC 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00800000&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   2
         Left            =   1590
         MaxLength       =   3
         TabIndex        =   4
         Text            =   "255"
         Top             =   2685
         Width           =   680
      End
      Begin VB.TextBox txtMaxC 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00008000&
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   1
         Left            =   915
         MaxLength       =   3
         TabIndex        =   5
         Text            =   "255"
         Top             =   2685
         Width           =   680
      End
      Begin VB.TextBox txtMaxC 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000080&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   0
         Left            =   240
         MaxLength       =   3
         TabIndex        =   6
         Text            =   "255"
         Top             =   2685
         Width           =   680
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   195
         Index           =   20
         Left            =   235
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   13
         Text            =   "RGB Limiter"
         Top             =   2490
         Width           =   2040
      End
      Begin VB.PictureBox picBCol 
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         ForeColor       =   &H80000008&
         Height          =   3730
         Left            =   0
         ScaleHeight     =   3705
         ScaleWidth      =   3315
         TabIndex        =   15
         Top             =   360
         Width           =   3345
         Begin VB.CommandButton cmdBackCol 
            BackColor       =   &H00C0C0C0&
            Height          =   250
            Index           =   4
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   241
            Top             =   1680
            Width           =   680
         End
         Begin VB.CommandButton cmdBackCol 
            BackColor       =   &H00473842&
            Height          =   250
            Index           =   3
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   240
            Top             =   1410
            Width           =   680
         End
         Begin VB.CommandButton cmdBackCol 
            BackColor       =   &H00665766&
            Height          =   250
            Index           =   2
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   239
            Top             =   1140
            Width           =   680
         End
         Begin VB.CommandButton cmdBackCol 
            BackColor       =   &H00FFFFFF&
            Height          =   250
            Index           =   1
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   238
            Top             =   870
            Width           =   680
         End
         Begin VB.CommandButton cmdBackCol 
            BackColor       =   &H00000000&
            Height          =   250
            Index           =   0
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   237
            Top             =   600
            Width           =   680
         End
      End
      Begin VB.Line Line4 
         BorderColor     =   &H00C0C0C0&
         Index           =   1
         X1              =   3330
         X2              =   3330
         Y1              =   -4545
         Y2              =   -475
      End
      Begin VB.Label lblColorSet 
         Alignment       =   2  'Center
         BackColor       =   &H00322732&
         Caption         =   "Colors"
         BeginProperty Font 
            Name            =   "Modern"
            Size            =   12
            Charset         =   255
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   0
         TabIndex        =   2
         Top             =   15
         Width           =   3330
      End
      Begin VB.Line Line46 
         BorderColor     =   &H00C0C0C0&
         Index           =   3
         X1              =   338
         X2              =   2978
         Y1              =   720
         Y2              =   720
      End
   End
   Begin VB.Frame fraControls 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Caption         =   "( X ) len of data "
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   9120
      Left            =   11520
      TabIndex        =   50
      Top             =   0
      Width           =   3480
      Begin VB.CheckBox ChkDraw 
         BackColor       =   &H00665766&
         Caption         =   "Draw"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   0
         Left            =   180
         MaskColor       =   &H000000FF&
         TabIndex        =   192
         Top             =   3960
         Value           =   1  'Checked
         Width           =   915
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00866CBB&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   7
         Left            =   3060
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   53
         Top             =   2280
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00D5B797&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   7
         Left            =   2115
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   55
         Top             =   2280
         Width           =   300
      End
      Begin VB.CheckBox chkAlphaEnable 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00473842&
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Left            =   1680
         TabIndex        =   148
         Top             =   2265
         Width           =   210
      End
      Begin VB.CommandButton cmdNormalSize 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "#"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   305
         Left            =   2760
         MaskColor       =   &H00404040&
         Style           =   1  'Graphical
         TabIndex        =   147
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CheckBox chktest 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00473842&
         Caption         =   "High Light"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Left            =   2520
         TabIndex        =   114
         Top             =   8760
         Width           =   210
      End
      Begin VB.TextBox txtFormula 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   180
         TabIndex        =   140
         Top             =   8160
         Width           =   3195
      End
      Begin VB.CheckBox chkScript 
         BackColor       =   &H00000000&
         Caption         =   "Start"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   270
         Left            =   180
         MousePointer    =   1  'Arrow
         Style           =   1  'Graphical
         TabIndex        =   139
         Top             =   8460
         Width           =   780
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H0070616C&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "MS Dialog Light"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   150
         Index           =   8
         Left            =   240
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   133
         Text            =   "Speed"
         Top             =   5865
         Width           =   1425
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         DragMode        =   1  'Automatic
         ForeColor       =   &H001B171C&
         Height          =   225
         Index           =   12
         Left            =   720
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   138
         Top             =   4185
         Width           =   480
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         DragMode        =   1  'Automatic
         ForeColor       =   &H001B171C&
         Height          =   225
         Index           =   13
         Left            =   720
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   137
         Top             =   4425
         Width           =   480
      End
      Begin VB.CheckBox chkP4Opt 
         BackColor       =   &H00473842&
         CausesValidation=   0   'False
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   2
         Left            =   3240
         MaskColor       =   &H000000FF&
         TabIndex        =   127
         Top             =   4440
         Width           =   195
      End
      Begin VB.CheckBox chkP4Opt 
         BackColor       =   &H00473842&
         CausesValidation=   0   'False
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   1
         Left            =   2820
         MaskColor       =   &H000000FF&
         TabIndex        =   126
         Top             =   4440
         Width           =   435
      End
      Begin VB.CheckBox chkP4Opt 
         BackColor       =   &H00473842&
         CausesValidation=   0   'False
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   0
         Left            =   2520
         MaskColor       =   &H000000FF&
         TabIndex        =   123
         Top             =   4440
         Width           =   315
      End
      Begin VB.CheckBox ChkDraw 
         BackColor       =   &H00665766&
         Caption         =   "Clr Draw"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   7
         Left            =   1200
         MaskColor       =   &H000000FF&
         TabIndex        =   121
         Top             =   4440
         Width           =   1275
      End
      Begin VB.CheckBox chkP3Opt 
         BackColor       =   &H00473842&
         CausesValidation=   0   'False
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   2
         Left            =   3240
         MaskColor       =   &H000000FF&
         TabIndex        =   125
         Top             =   4200
         Width           =   195
      End
      Begin VB.CheckBox chkP3Opt 
         BackColor       =   &H00473842&
         CausesValidation=   0   'False
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   1
         Left            =   2820
         MaskColor       =   &H000000FF&
         TabIndex        =   124
         Top             =   4200
         Width           =   435
      End
      Begin VB.CheckBox chkP3Opt 
         BackColor       =   &H00473842&
         CausesValidation=   0   'False
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   0
         Left            =   2520
         MaskColor       =   &H000000FF&
         TabIndex        =   108
         Top             =   4200
         Width           =   315
      End
      Begin VB.CheckBox ChkDraw 
         BackColor       =   &H00473842&
         Caption         =   "P3"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   1
         Left            =   180
         MaskColor       =   &H000000FF&
         TabIndex        =   136
         Top             =   4200
         Value           =   1  'Checked
         Width           =   1035
      End
      Begin VB.CheckBox ChkDraw 
         BackColor       =   &H00473842&
         Caption         =   "Clr Draw"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   5
         Left            =   1200
         MaskColor       =   &H000000FF&
         TabIndex        =   112
         Top             =   4200
         Width           =   1275
      End
      Begin VB.TextBox TextLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H0080FF80&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   10
         Left            =   1260
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   132
         Top             =   6255
         Width           =   405
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         DragMode        =   1  'Automatic
         ForeColor       =   &H001B171C&
         Height          =   225
         Index           =   5
         Left            =   1020
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   128
         Top             =   6735
         Width           =   360
      End
      Begin VB.TextBox txtFpS 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         DragMode        =   1  'Automatic
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   270
         Left            =   240
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   135
         Text            =   "30"
         Top             =   6255
         Width           =   1065
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H008566F0&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   9.75
            Charset         =   1
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   9
         Left            =   240
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   134
         Top             =   6030
         Width           =   1425
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         ForeColor       =   &H00000000&
         Height          =   225
         Index           =   9
         Left            =   735
         MaxLength       =   3
         TabIndex        =   131
         Text            =   "35"
         Top             =   5640
         Width           =   435
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00F8AFA9&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   9.75
            Charset         =   1
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   9
         Left            =   240
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   130
         Top             =   6510
         Width           =   1425
      End
      Begin VB.TextBox TextLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         DragMode        =   1  'Automatic
         ForeColor       =   &H00FAF1F3&
         Height          =   225
         Index           =   7
         Left            =   240
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   129
         Text            =   "Full Power        fps"
         Top             =   6735
         Width           =   1425
      End
      Begin VB.CommandButton cmdCls 
         BackColor       =   &H0080FFFF&
         Caption         =   "Clear Scr"
         Height          =   285
         Left            =   360
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   62
         Top             =   4755
         UseMaskColor    =   -1  'True
         Width           =   1095
      End
      Begin VB.CheckBox chkAlpha 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00473842&
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Left            =   1920
         TabIndex        =   51
         Top             =   2265
         Width           =   210
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H0080FF80&
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   7
         Left            =   2400
         MousePointer    =   1  'Arrow
         TabIndex        =   52
         Text            =   "4"
         Top             =   2280
         Width           =   675
      End
      Begin VB.CheckBox ChkDraw 
         BackColor       =   &H00665766&
         Caption         =   "P4"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Index           =   6
         Left            =   180
         MaskColor       =   &H000000FF&
         TabIndex        =   122
         Top             =   4440
         Width           =   1035
      End
      Begin VB.TextBox txtLScr 
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         ForeColor       =   &H00FFFFC0&
         Height          =   165
         Left            =   447
         Locked          =   -1  'True
         TabIndex        =   82
         Text            =   "00.00"
         Top             =   2040
         Width           =   425
      End
      Begin VB.TextBox txtBR 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   3090
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   118
         Text            =   "2"
         Top             =   1635
         Width           =   200
      End
      Begin VB.TextBox txtBLR 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   2257
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   117
         Text            =   "2"
         Top             =   1635
         Width           =   240
      End
      Begin VB.TextBox txtBL 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   1470
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   116
         Text            =   "2"
         Top             =   1635
         Width           =   200
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Test"
         Height          =   255
         Left            =   2505
         TabIndex        =   115
         Top             =   8760
         Width           =   855
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00D5B797&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   4
         Left            =   2040
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   59
         Top             =   7575
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00D5B797&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   3
         Left            =   2040
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   56
         Top             =   7380
         Width           =   300
      End
      Begin VB.CheckBox chkClrAlter 
         BackColor       =   &H00800080&
         Caption         =   "Alternate Clear"
         ForeColor       =   &H00FFFFFF&
         Height          =   200
         Left            =   180
         MaskColor       =   &H000000FF&
         TabIndex        =   85
         Top             =   5160
         Width           =   1395
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00D5B797&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   1
         Left            =   2110
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   69
         Top             =   2513
         Width           =   300
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.000"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   6
         Left            =   480
         MaxLength       =   5
         MousePointer    =   1  'Arrow
         TabIndex        =   67
         Text            =   "1"
         Top             =   2230
         Width           =   675
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00866CBB&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   6
         Left            =   1140
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   70
         Top             =   2230
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00D5B797&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   6
         Left            =   195
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   68
         Top             =   2230
         Width           =   300
      End
      Begin VB.TextBox txtspm 
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   5
         Left            =   2520
         MaxLength       =   5
         MousePointer    =   1  'Arrow
         TabIndex        =   79
         Text            =   "15"
         Top             =   3360
         Width           =   555
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FAF1F3&
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   1
         Left            =   2400
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   66
         Text            =   "1"
         Top             =   2520
         Width           =   675
      End
      Begin VB.CheckBox chkABalance 
         BackColor       =   &H00000000&
         Caption         =   "Check1"
         Height          =   210
         Left            =   2040
         TabIndex        =   61
         Top             =   3352
         Width           =   210
      End
      Begin VB.CheckBox chkAHeight 
         BackColor       =   &H00473842&
         Caption         =   "Auto Balance Height"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Left            =   180
         MaskColor       =   &H000000FF&
         Style           =   1  'Graphical
         TabIndex        =   78
         Top             =   3357
         Width           =   2055
      End
      Begin VB.TextBox txtBL2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   1710
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   106
         Text            =   "2"
         Top             =   1485
         Width           =   200
      End
      Begin VB.TextBox txtBLR2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   2257
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   105
         Text            =   "2"
         Top             =   1485
         Width           =   240
      End
      Begin VB.TextBox txtBLR3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   2257
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   104
         Text            =   "2"
         Top             =   1335
         Width           =   240
      End
      Begin VB.TextBox txtBand 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   168
         Left            =   1950
         MousePointer    =   1  'Arrow
         TabIndex        =   103
         Text            =   "2"
         Top             =   495
         Width           =   200
      End
      Begin VB.TextBox txtBand3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   168
         Left            =   1950
         MousePointer    =   1  'Arrow
         TabIndex        =   102
         Text            =   "2"
         Top             =   825
         Width           =   200
      End
      Begin VB.TextBox txtBandAvg2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   168
         Left            =   2280
         MousePointer    =   1  'Arrow
         TabIndex        =   101
         Text            =   "2"
         Top             =   660
         Width           =   195
      End
      Begin VB.TextBox txtBandAvg1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   168
         Left            =   2280
         MousePointer    =   1  'Arrow
         TabIndex        =   100
         Text            =   "2"
         Top             =   495
         Width           =   195
      End
      Begin VB.TextBox txtBandAvg3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   168
         Left            =   2280
         MousePointer    =   1  'Arrow
         TabIndex        =   99
         Text            =   "2"
         Top             =   825
         Width           =   195
      End
      Begin VB.TextBox txtBand2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   168
         Left            =   1950
         MousePointer    =   1  'Arrow
         TabIndex        =   98
         Text            =   "2"
         Top             =   660
         Width           =   200
      End
      Begin VB.TextBox txtBL3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   1950
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   97
         Text            =   "2"
         Top             =   1335
         Width           =   200
      End
      Begin VB.TextBox txtBR3 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   2595
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   96
         Text            =   "2"
         Top             =   1335
         Width           =   200
      End
      Begin VB.TextBox txtBR2 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   150
         Left            =   2835
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   95
         Text            =   "2"
         Top             =   1485
         Width           =   200
      End
      Begin VB.TextBox Text31 
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   195
         Left            =   2790
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   88
         Text            =   "Midl"
         Top             =   660
         Width           =   300
      End
      Begin VB.TextBox Text30 
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   195
         Left            =   2940
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   87
         Text            =   "Bass"
         Top             =   480
         Width           =   360
      End
      Begin VB.TextBox Text29 
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00C0C0C0&
         Height          =   195
         Left            =   2595
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   86
         Text            =   "Treble"
         Top             =   840
         Width           =   435
      End
      Begin VB.TextBox txtProcess 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H001E1E1E&
         BorderStyle     =   0  'None
         ForeColor       =   &H00C0FFFF&
         Height          =   168
         Index           =   9
         Left            =   1395
         Locked          =   -1  'True
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   75
         Text            =   "00.00"
         Top             =   390
         Width           =   410
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00F8AFA9&
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   3
         Left            =   2280
         MousePointer    =   1  'Arrow
         TabIndex        =   83
         Text            =   "2"
         Top             =   7380
         Width           =   795
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00F8AFA9&
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   4
         Left            =   2280
         MousePointer    =   1  'Arrow
         TabIndex        =   60
         Text            =   "4"
         Top             =   7575
         Width           =   795
      End
      Begin VB.TextBox txtspm 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00DDD3E0&
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   0
         Left            =   2400
         MaxLength       =   4
         MousePointer    =   1  'Arrow
         TabIndex        =   65
         Text            =   "256"
         Top             =   2760
         Width           =   675
      End
      Begin VB.TextBox txtProcess 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00400040&
         BorderStyle     =   0  'None
         ForeColor       =   &H00C0FFFF&
         Height          =   168
         Index           =   7
         Left            =   2472
         Locked          =   -1  'True
         MousePointer    =   14  'Arrow and Question
         TabIndex        =   57
         Text            =   "00.00"
         Top             =   7800
         Width           =   410
      End
      Begin VB.CheckBox chkAdjFreq 
         BackColor       =   &H00473842&
         Caption         =   "Adjustment (X Level)"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   0
         Left            =   180
         TabIndex        =   107
         Top             =   7365
         Value           =   1  'Checked
         Width           =   1875
      End
      Begin VB.CheckBox chkPause 
         BackColor       =   &H00665766&
         Caption         =   "Pause"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Left            =   120
         TabIndex        =   94
         Top             =   67
         Width           =   750
      End
      Begin VB.CheckBox chkAdjFreq 
         BackColor       =   &H00473842&
         Caption         =   "Adjustment (Z Level)"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   1
         Left            =   180
         TabIndex        =   93
         Top             =   7590
         Value           =   1  'Checked
         Width           =   1875
      End
      Begin VB.CommandButton cmdExit 
         Appearance      =   0  'Flat
         BackColor       =   &H00F1EDED&
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   305
         Left            =   3120
         MaskColor       =   &H000040C0&
         Style           =   1  'Graphical
         TabIndex        =   90
         TabStop         =   0   'False
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdMiniMize 
         Appearance      =   0  'Flat
         BackColor       =   &H00F1EDED&
         Caption         =   "_"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   305
         Left            =   2400
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   89
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.TextBox TextLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   25
         Left            =   195
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   84
         Text            =   "Sec of Last Freq  Match In Screen "
         Top             =   2025
         Width           =   3150
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   5
         Left            =   3060
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   81
         Top             =   3360
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   5
         Left            =   2280
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   80
         Top             =   3360
         Width           =   300
      End
      Begin VB.TextBox TextLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   24
         Left            =   180
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   77
         Text            =   "Base Heigth of Scope  "
         Top             =   2745
         Width           =   1920
      End
      Begin VB.CheckBox chkInc 
         BackColor       =   &H00665766&
         Caption         =   "Increase Scope Height"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Left            =   180
         MaskColor       =   &H000000FF&
         TabIndex        =   76
         Top             =   2985
         Value           =   1  'Checked
         Width           =   3195
      End
      Begin VB.TextBox TextLabel 
         Appearance      =   0  'Flat
         BackColor       =   &H00665766&
         BorderStyle     =   0  'None
         DragMode        =   1  'Automatic
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Index           =   2
         Left            =   180
         Locked          =   -1  'True
         MousePointer    =   1  'Arrow
         TabIndex        =   74
         Text            =   "Scopes Count  "
         Top             =   2505
         Width           =   1920
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00866CBB&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   0
         Left            =   3060
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   73
         Top             =   2760
         Width           =   300
      End
      Begin VB.CommandButton cmdSmaler 
         Appearance      =   0  'Flat
         BackColor       =   &H00D5B797&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   0
         Left            =   2115
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   72
         Top             =   2760
         Width           =   300
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00866CBB&
         Caption         =   "+"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   1
         Left            =   3060
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   71
         Top             =   2513
         Width           =   300
      End
      Begin VB.CommandButton cmdInvertPage 
         BackColor       =   &H00FFFF80&
         Caption         =   "Inverse Scr"
         Height          =   285
         Left            =   2220
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   64
         Top             =   4755
         UseMaskColor    =   -1  'True
         Width           =   1095
      End
      Begin VB.CheckBox chkTransparent 
         BackColor       =   &H00473842&
         Caption         =   "Transparent All Panels"
         ForeColor       =   &H00E0E0E0&
         Height          =   210
         Left            =   1560
         TabIndex        =   63
         Top             =   5160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00866CBB&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   4
         Left            =   3060
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   58
         Top             =   7575
         Width           =   300
      End
      Begin VB.CommandButton cmdLarger 
         Appearance      =   0  'Flat
         BackColor       =   &H00866CBB&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MV Boli"
            Size            =   8.25
            Charset         =   1
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   3
         Left            =   3060
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   54
         Top             =   7380
         Width           =   300
      End
      Begin VB.PictureBox PicFFT 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H001E1E1E&
         DrawWidth       =   2
         FillColor       =   &H00FF0000&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00665766&
         Height          =   1470
         Left            =   1350
         Negotiate       =   -1  'True
         ScaleHeight     =   117.517
         ScaleMode       =   0  'User
         ScaleWidth      =   40.306
         TabIndex        =   109
         Top             =   390
         Width           =   2010
      End
      Begin VB.PictureBox picBCtrl 
         Appearance      =   0  'Flat
         BackColor       =   &H00473842&
         ForeColor       =   &H80000008&
         Height          =   8760
         Left            =   0
         ScaleHeight     =   8730
         ScaleWidth      =   3450
         TabIndex        =   110
         Top             =   360
         Width           =   3475
      End
      Begin VB.CommandButton cmdMini 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Caption         =   "Sho"
         Height          =   305
         Left            =   960
         MaskColor       =   &H00404040&
         Style           =   1  'Graphical
         TabIndex        =   92
         Top             =   30
         UseMaskColor    =   -1  'True
         Visible         =   0   'False
         Width           =   450
      End
      Begin VB.CommandButton cmdMax 
         Appearance      =   0  'Flat
         BackColor       =   &H00F1EDED&
         Caption         =   "Hid"
         Height          =   305
         Left            =   960
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   91
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   450
      End
      Begin VB.Label Label 
         BackColor       =   &H00400000&
         Caption         =   "Y="
         ForeColor       =   &H00FFFFFF&
         Height          =   150
         Index           =   0
         Left            =   0
         MousePointer    =   1  'Arrow
         TabIndex        =   141
         Top             =   8820
         Width           =   180
      End
      Begin VB.Label lblControls 
         Alignment       =   2  'Center
         BackColor       =   &H00665766&
         Caption         =   "   Controls"
         BeginProperty Font 
            Name            =   "Modern"
            Size            =   12
            Charset         =   255
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   0
         TabIndex        =   111
         Top             =   30
         Width           =   3450
      End
      Begin VB.Line Line34 
         BorderColor     =   &H00808080&
         X1              =   1200
         X2              =   3180
         Y1              =   2340
         Y2              =   2340
      End
      Begin VB.Line Line46 
         BorderColor     =   &H00C0C0C0&
         Index           =   2
         X1              =   15
         X2              =   3465
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Line Line46 
         BorderColor     =   &H00C0C0C0&
         Index           =   4
         X1              =   15
         X2              =   3470
         Y1              =   2760
         Y2              =   2760
      End
      Begin VB.Line Line46 
         BorderColor     =   &H00C0C0C0&
         Index           =   5
         X1              =   360
         X2              =   3000
         Y1              =   5520
         Y2              =   5520
      End
      Begin VB.Line Line46 
         BorderColor     =   &H00C0C0C0&
         Index           =   7
         X1              =   360
         X2              =   3000
         Y1              =   4200
         Y2              =   4200
      End
   End
   Begin VB.Frame fraLogs 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Caption         =   "( X ) len of data "
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   6960
      Left            =   1200
      TabIndex        =   32
      Top             =   4080
      Visible         =   0   'False
      Width           =   12960
      Begin VB.CommandButton cmdHideLogs 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Hide Logs"
         Height          =   255
         Left            =   11640
         TabIndex        =   49
         Top             =   45
         Width           =   1215
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "MS Dialog Light"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00E0E0E0&
         Height          =   5460
         Index           =   0
         Left            =   180
         MultiSelect     =   2  'Extended
         TabIndex        =   36
         ToolTipText     =   "Frequences Bass Midl Treb"
         Top             =   840
         Width           =   5505
      End
      Begin VB.TextBox txtlstLogs 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   180
         MousePointer    =   1  'Arrow
         TabIndex        =   48
         Text            =   "     Time        BAS  MDL  TRB                     Avrage"
         Top             =   630
         Width           =   4545
      End
      Begin VB.CheckBox chkALog 
         BackColor       =   &H00000000&
         Caption         =   "Auto"
         ForeColor       =   &H00E0E0E0&
         Height          =   200
         Left            =   4320
         MaskColor       =   &H000000FF&
         TabIndex        =   47
         Top             =   6627
         Width           =   705
      End
      Begin VB.CommandButton cmdGetLog 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Get Log"
         Height          =   255
         Left            =   3000
         TabIndex        =   46
         Top             =   6600
         Width           =   1215
      End
      Begin VB.CommandButton cmdCopy2Excel 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Send To Excel"
         Height          =   255
         Left            =   7200
         TabIndex        =   35
         Top             =   6600
         Width           =   1215
      End
      Begin VB.PictureBox picBLogs 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   6585
         Left            =   15
         ScaleHeight     =   6555
         ScaleWidth      =   12885
         TabIndex        =   33
         Top             =   360
         Width           =   12915
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   9
         Left            =   1620
         TabIndex        =   45
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   8
         Left            =   1620
         TabIndex        =   44
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   7
         Left            =   1620
         TabIndex        =   43
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   6
         Left            =   1620
         TabIndex        =   42
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   5
         Left            =   1620
         TabIndex        =   41
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   4
         Left            =   1620
         TabIndex        =   40
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   3
         Left            =   1620
         TabIndex        =   39
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   2
         Left            =   1620
         TabIndex        =   38
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.ListBox lstLogs 
         BackColor       =   &H00000000&
         Height          =   5610
         Index           =   1
         Left            =   1620
         TabIndex        =   37
         Top             =   840
         Visible         =   0   'False
         Width           =   5295
      End
      Begin VB.Label lblLogs 
         Alignment       =   2  'Center
         BackColor       =   &H00400000&
         Caption         =   "Logs"
         BeginProperty Font 
            Name            =   "Modern"
            Size            =   12
            Charset         =   255
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   15
         TabIndex        =   34
         Top             =   30
         Width           =   12930
      End
      Begin VB.Line Line13 
         BorderColor     =   &H00C0C0C0&
         X1              =   15
         X2              =   12960
         Y1              =   15
         Y2              =   15
      End
      Begin VB.Line Line12 
         BorderColor     =   &H00C0C0C0&
         X1              =   12950
         X2              =   12950
         Y1              =   0
         Y2              =   7170
      End
      Begin VB.Line Line46 
         BorderColor     =   &H00C0C0C0&
         Index           =   13
         X1              =   15
         X2              =   12960
         Y1              =   330
         Y2              =   330
      End
      Begin VB.Line Line11 
         BorderColor     =   &H00C0C0C0&
         X1              =   0
         X2              =   0
         Y1              =   30
         Y2              =   6960
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00C0C0C0&
         X1              =   15
         X2              =   12960
         Y1              =   6945
         Y2              =   6945
      End
   End
   Begin VB.Timer Timer_AutoSave 
      Interval        =   100
      Left            =   6960
      Top             =   11040
   End
   Begin VB.Timer Timer_AutoLog 
      Interval        =   200
      Left            =   6600
      Top             =   11040
   End
   Begin VB.TextBox txtFrm 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arabic Transparent"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   15000
      Locked          =   -1  'True
      MaxLength       =   5
      TabIndex        =   14
      TabStop         =   0   'False
      Text            =   "0"
      Top             =   0
      Width           =   360
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   5400
      Top             =   11040
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Timer Timer_Process 
      Interval        =   100
      Left            =   7680
      Top             =   11040
   End
   Begin VB.ComboBox DevicesBox 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "frmBase.frx":8B7A
      Left            =   360
      List            =   "frmBase.frx":8B7C
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   11160
      Visible         =   0   'False
      Width           =   1305
   End
   Begin VB.PictureBox picBuffEE2 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      ClipControls    =   0   'False
      Enabled         =   0   'False
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontTransparent =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   11520
      Left            =   0
      ScaleHeight     =   11520
      ScaleWidth      =   15360
      TabIndex        =   113
      Top             =   0
      Visible         =   0   'False
      Width           =   15360
      Begin VB.Timer Timer_AHeight 
         Interval        =   5
         Left            =   7320
         Top             =   11040
      End
      Begin VB.Line Line3 
         X1              =   120
         X2              =   1680
         Y1              =   1680
         Y2              =   1680
      End
   End
   Begin VB.PictureBox picBuffEE 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      ClipControls    =   0   'False
      Enabled         =   0   'False
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontTransparent =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   11520
      Left            =   0
      ScaleHeight     =   11520
      ScaleMode       =   0  'User
      ScaleWidth      =   15360
      TabIndex        =   120
      Top             =   0
      Visible         =   0   'False
      Width           =   15360
   End
   Begin VB.PictureBox PicPrime 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      ClipControls    =   0   'False
      Enabled         =   0   'False
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontTransparent =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   11520
      Left            =   0
      ScaleHeight     =   11520
      ScaleWidth      =   15360
      TabIndex        =   142
      Top             =   0
      Visible         =   0   'False
      Width           =   15360
   End
   Begin VB.PictureBox picViewEE 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      ClipControls    =   0   'False
      Enabled         =   0   'False
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontTransparent =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   11520
      Left            =   0
      ScaleHeight     =   256
      ScaleMode       =   0  'User
      ScaleWidth      =   256
      TabIndex        =   119
      Top             =   0
      Width           =   15360
      Begin VB.Timer Timer_Seconds 
         Interval        =   1000
         Left            =   7320
         Top             =   11040
      End
   End
   Begin VB.Line Line1 
      BorderColor     =   &H0080FFFF&
      X1              =   -120
      X2              =   -120
      Y1              =   -2640
      Y2              =   -840
   End
End
Attribute VB_Name = "frmBase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Wave As WaveHdr, te As Long, te2 As Long

Private Sub chkAHeight_Click()
    If chkAHeight Then Timer_AHeight.Enabled = True
End Sub

Private Sub chkAlphaEnable_Click()
    If chkAlphaEnable Then
        txtspm(7).Enabled = False
        cmdLarger(7).Enabled = False
        cmdSmaler(7).Enabled = False
        chkAlpha.Enabled = False
    Else
        txtspm(7).Enabled = True
        cmdLarger(7).Enabled = True
        cmdSmaler(7).Enabled = True
        chkAlpha.Enabled = True
    End If
End Sub

Private Sub chkAutoShot_Click()
    If chkAutoShot Then
        Timer_AutoSave.Enabled = True
    Else
        Timer_AutoSave.Enabled = False
    End If
End Sub


Private Sub chkClrAlter_Click()
    minY = 0: maxY = 768
    kaAltrCls
End Sub

Private Sub chkCol_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
Dim A As Byte
    If chkCol(Index) = 1 Then
        For A = 0 To chkCol.count - 1
           chkCol(A) = 0
        Next A
     chkCol(Index) = 1
    End If
End Sub

Private Sub ChkDraw_Click(Index As Integer)
Dim x As Integer
    If Index = 0 Or Index = 1 Or Index = 6 And ChkDraw(Index) = 0 Then ' cmdCls_Click
         picTmp.ForeColor = vbBlack
        For x = 1 To 20
            Polyline picTmp.hdc, PtL(0, x), 512
        Next x
    End If
End Sub

Private Sub chkInc_Click()
    If chkInc Then
      chkInc.ForeColor = &HFFFF&
      chkInc.BackColor = &HFF&
     Else
      chkInc.ForeColor = &HE0E0E0
      chkInc.BackColor = &H0&
    End If
End Sub
'

Private Sub chkP3Opt_Click(Index As Integer)
If Index = 2 Then
      chkP3Opt(0) = chkP3Opt(0) * -1 + 1
      chkP3Opt(1) = chkP3Opt(1) * -1 + 1
End If
End Sub

Private Sub chkP4Opt_Click(Index As Integer)
If Index = 2 Then
      chkP4Opt(0) = chkP4Opt(0) * -1 + 1
      chkP4Opt(1) = chkP4Opt(1) * -1 + 1
End If
End Sub

Private Sub chkTransparent_Click()
 
 If chkTransparent Then Exit Sub
    
      picBCtrl.Cls
      picBCol.Cls
      picBBlur.Cls
      picBProcs.Cls
      picBLogs.Cls
 
End Sub


Private Sub cmd0_Click(Index As Integer)
    If Index = 0 Then txtspm(2) = 0
    If Index = 1 Then LQT2 = 0: txtspm(11) = 0
    If Index = 2 Then txtspm(13) = 1: LQT = 1
    txtspm(2).Refresh
    txtspm(11).Refresh
End Sub

Private Sub cmdBackCol_Click(Index As Integer)
    picTmp.BackColor = cmdBackCol(Index).BackColor
End Sub

Private Sub cmdCls_Click()
    KaCls
End Sub

Private Sub cmdExit_Click()
    Call Form_Unload(0)
End Sub

Private Sub cmdGetLog_Click()
        Loger
End Sub

Private Sub cmdHideLogs_Click()
    cmdLogs_Click
End Sub

Private Sub cmdBlureOpen_Click()
Dim CommonDialog1 As OSDialog
Set CommonDialog1 = New OSDialog

' Examples:-
  Dim Title$, Filt$, InDir$, FileSpec$, CurrPath$
  Dim FIndex As Long

'  LOAD egs
   Title$ = "Blur Files"
   Filt$ = "Blur Files (*.BLR)|*.BLR|All files (*.*)|*.*" '"Pics bmp,jpg,gif,ico,cur,wmf,emf|*.bmp;*.jpg;*.gif;*.ico;*.cur;*.wmf;*.emf"
'   Filt$ = "Open vbp (*.vbp)|*.vbp|All files (*.*)|*.*"
   FileSpec$ = ""
   InDir$ = CurrPath$ 'Pathspec$
'   Set CommonDialog1 = New OSDialog

   CommonDialog1.ShowOpen FileSpec$, Title$, Filt$, InDir$, "", Me.hWnd, FIndex
'   FIndex = 1 bmp
'   FIndex = 2 jpg
'   etc

   Set CommonDialog1 = Nothing

'  SAVE eg
'   Title$ = "Save Mask as 2-color bmp"
'   Filt$ = "Save bmp|*.bmp"
'   InDir$ = CurrPath$ 'Pathspec$
'   FileSpec$=""
'   Set CommonDialog1 = New OSDialog
'   CommonDialog1.ShowSave FileSpec$, Title$, Filt$, InDir$, "", Me.hwnd
'   Set CommonDialog1 = Nothing
'
'   Len(FileSpec$)=0 for cancel
'''''''''''''''''''''''''''''''''''''''''
  Dim intf, x As Integer
  Dim S As String
'
'    CommonDialog1.Filter = "Blur Files (*.BLR)|*.BLR"
'    CommonDialog1.CancelError = True
'    On Error GoTo ErrHandler
'    CommonDialog1.ShowOpen
'
'    If CommonDialog1.FileName <> "" Then
'        MousePointer = 11
'        '        LoadNewFile (CommonDialog1.FileName)
'        intf = FreeFile
'        If Trim(FileSpec$) = "" Then Exit Sub
'        Open FileSpec$ For Input As #intf
'        lstFa.Clear
'        lstFaName.Clear
'        While Not EOF(intf)
'            Input #intf, S
'            lstFa.AddItem Trim(S)
'            Input #intf, S
'            lstFaName.AddItem Trim(S)
'        Wend
'        Close #intf
'        S = ""
'        For x = Len(CommonDialog1.FileName) To 1 Step -1
'            If Mid(CommonDialog1.FileName, x, 1) = "\" Then Exit For
'            DoEvents
'        Next x
'        lblFileName.Caption = Mid(CommonDialog1.FileName, x + 1, Len(CommonDialog1.FileName) - x - 4)
'        picBuff.Cls
'        MousePointer = 0
'        Exit Sub '---> Bottom
'    End If
'ErrHandler:
'
'Exit Sub

End Sub

Public Sub cmdInvertPage_Click()
    KaInvert 0, 0, 1024, 768
    reAl = True
End Sub

Public Sub cmdLarger_Click(Index As Integer)
Dim ct As Integer
   If Index = 16 Then txtspm(16).Text = Val(txtspm(16).Text) + 1: txtspm(16).Refresh
   If Index = 17 Then txtspm(17).Text = Val(txtspm(17).Text) + 1: txtspm(17).Refresh
   If Index = 18 Then
        txtspm(18).Text = Val(txtspm(18).Text) + 1: txtspm(18).Refresh
   End If
   If Index = 19 Then
        txtspm(19).Text = Val(txtspm(19).Text) + 1: txtspm(19).Refresh
   End If
       
   If Index = 0 And Val(txtspm(0).Text) < 768 Then txtspm(0).Text = Val(txtspm(0).Text) + 32
   If Index = 1 And txtspm(1) < 10 Then txtspm(1).Text = Val(txtspm(1).Text) + 1
   If Index = 2 Then txtspm(2).Text = Val(txtspm(2).Text) + 1
   If Index = 3 Then txtspm(3).Text = Val(txtspm(3).Text) + 1
   If Index = 4 Then txtspm(4).Text = Val(txtspm(4).Text) + 1
   If Index = 5 And Val(txtspm(5).Text) < 50 Then txtspm(5).Text = Val(txtspm(5).Text) + 0.15 '* ((11 - txtspm(5)) \ 10 + 1)
   If Index = 6 And txtspm(6) < 4 Then
        txtspm(6) = txtspm(6) + 0.1
        txtspm(6).Refresh
   End If
   If Index = 7 And txtspm(7) < 255 Then txtspm(7).Text = Val(txtspm(7).Text) + 1
   If Index = 8 And txtspm(8) < 100 Then txtspm(8).Text = Val(txtspm(8).Text) + 0.1
   If Index = 9 Then txtspm(9) = txtspm(9) + 1
   If Index = 10 And txtQua < 100 Then txtQua = txtQua + 5
   If Index = 11 Then LQT2 = LQT2 + 0.1: txtspm(11) = LQT2
   If Index = 12 And txtspm(12) < 16 Then txtspm(12) = txtspm(12) + 0.1
   If Index = 15 And LQT < 148931 Then LQT = LQT + 1:  txtspm(13) = LQT: txtspm(13).Refresh
   If Index = 14 And LQT < 148931 - 1000 Then LQT = LQT + 1000: txtspm(13) = LQT: txtspm(13).Refresh
   If Index = 13 And LQT < 148931 - 100 Then
       LQT = LQT + 100
       txtspm(13) = LQT
       txtspm(13).Refresh: frmBase.txtLQT.Refresh
       DoEvents
   End If

End Sub

Private Sub cmdLarger_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    idxL = Index
    DoClickL = True
    DoL = 0
End Sub

Private Sub cmdLarger_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    DoClickL = False
End Sub

Private Sub cmdLogs_Click()
    If fraLogs.Visible = True Then
            fraLogs.Visible = False
            cmdLogs.Caption = "Show Logs"
    Else
        fraLogs.Top = 360
        fraLogs.Visible = True
        fraLogs.ZOrder 0
        cmdLogs.Caption = "Hide Logs"
    End If
End Sub

Private Sub cmdMiniMize_Click()

    frmBase.WindowState = 1

End Sub

Private Sub cmdMax_Click()
If cmdMax.Visible = True And cmdNormalSize.Tag <> "0" Then ShowCursor False
    
    cmdMax.Visible = False
    cmdMini.Visible = True
    
    fraProcess.Visible = False
    fraBlur.Visible = False
    fraControls.Visible = False
    fraColors.Visible = False
    fraLogs.Visible = False
End Sub

Private Sub cmdMini_Click()
If cmdMax.Visible = False And cmdNormalSize.Tag <> "0" Then ShowCursor True
    
    cmdMax.Visible = True
    cmdMini.Visible = False

    fraProcess.Visible = True
    fraBlur.Visible = True
    fraControls.Visible = True
    fraColors.Visible = True
End Sub

Private Sub cmdNormalSize_Click()
If cmdNormalSize.Tag <> "0" Then
    frmBase.Width = frmBase.Width - 3000
    frmBase.Height = frmBase.Height - 2000
    
    picViewEE.Width = frmBase.Width
    picViewEE.Height = frmBase.Height
    picViewEE.Left = 0
    picViewEE.Top = 0
    
    fraControls.Left = fraControls.Left - 3000
    fraColors.Left = fraColors.Left - 2000
    fraBlur.Left = fraBlur.Left - 1000
    fraControls.Top = picViewEE.Top
    fraColors.Top = picViewEE.Top
    fraBlur.Top = picViewEE.Top
    fraProcess.Top = picViewEE.Top
    
    txtFrm.Left = txtFrm.Left - 3000 - 30
    txtFrm.Top = txtFrm.Top + 30
    cmdNormalSize.Tag = "0"
Else
    frmBase.Width = frmBase.Width + 3000
    frmBase.Height = frmBase.Height + 2000
    picViewEE.Width = frmBase.Width
    picViewEE.Height = frmBase.Height
    picViewEE.Left = 0
    picViewEE.Top = 0
    
    fraControls.Left = fraControls.Left + 3000
    fraColors.Left = fraColors.Left + 2000
    fraBlur.Left = fraBlur.Left + 1000
    fraControls.Top = picViewEE.Top
    fraColors.Top = picViewEE.Top
    fraBlur.Top = picViewEE.Top
    fraProcess.Top = picViewEE.Top
    
    txtFrm.Left = txtFrm.Left + 3000
    txtFrm.Top = picViewEE.Top
    cmdNormalSize.Tag = "1"
End If
 
End Sub

Private Sub cmdPrimeView_Click()
Dim a1 As Double, B As Double, co(0 To 255) As Long, coc(0 To 9) As Long, cocS(0 To 255) As Long, tm As Integer
Dim Tm2 As Long, x As Long, y As Long
PicPrime.Cls
'cmdPrime.Enabled = False
    
    For a1 = 0 To 255
'        co(a1) = RGB(a1 ^ 2 \ 32, a1 ^ 2 \ 48, a1 ^ 2 \ 24)
'        co(a1) = RGB(a1 ^ 2 \ (8 * txtspm(10)), a1 ^ 2 \ (8 * txtspm(10)), a1 ^ 2 \ (8 * txtspm(10)))
        co(a1) = RGB(a1 ^ 2 \ 4, a1 ^ 2 \ 4, a1 ^ 2 \ 4)
    Next a1
   ' 148932
    x = 148931
    For y = 1 To 148931 Step PrK(2, LQT) + 1 '+ PrK(3, (y)) + 1
'    For y = 148931 To 1 Step -(PrK(2, LQT) + PrK(3, (y)) + 1)
      
      tm = PrK(3, (y)) - PrK(2, (y)) * 4
      Tm2 = PrK(2, (y)) * 4
      SetPixel PicPrime.hdc, Cos((y - 256) * rad) * tm + 512, Sin((y - 256) * rad) * tm + 384, co(Tm2 \ 4)
    x = x - 1
    Next y

'    For B = 1 To 768 Step txtspm(11)
'    For a1 = 1 To 1024 Step txtspm(12)
'
'      tm = PrK(1, (a1 + B * 148.932 - 148.932)) Mod 10
'      Tm2 = PrK(2, (a1 + B * 148.932 - 148.932))
'      SetPixel PicPrime.hdc, a1, B, co(Tm2)
'
'      coc(tm) = coc(tm) + 1
'      tm = PrK(2, (a1 + B * 148.932 - 148.932))
'      cocS(tm) = cocS(tm) + 1
'
'    Next a1
'    Next B
    
'    For a1 = 0 To 9
'        lstLogs(0).AddItem a1 & "     " & coc(a1)
'    Next a1
'    For a1 = 0 To 255
'      If cocS(a1) <> 0 Then lstLogs(0).AddItem a1 & "     " & cocS(a1)
'    Next a1
    
'    StretchBlt PicPrime.hdc, 0, 0, 1024, 768, _
'               PicPrime.hdc, 0, 0, 1024, 768, vbSrcCopy
End Sub

Private Sub cmdRGB_Click(Index As Integer)
    chRGB (Index)
End Sub
Private Sub cmdRotLeft_Click()

'    tmrAuto.Enabled = False
'    m_Angle = m_Angle - 5
'    If m_Angle < -360 Then m_Angle = 0
    
'    picDest.Cls
'    RotateDC picDest.hdc, shSel.Left + (shSel.Width / 2), shSel.Top + (shSel.Height / 2), picSource.hdc, picSource.Picture.handle, m_Angle

End Sub

Private Sub cmdRotRight_Click()

'    tmrAuto.Enabled = False
'    m_Angle = m_Angle + 5
'    If m_Angle > 360 Then m_Angle = 0
    
'    picDest.Cls
'    RotateDC PicPrime.hdc, 512, 384 _
'           , PicPrime.hdc, PicPrime.Picture.handle, 15 'm_Angle

End Sub


Private Sub cmdRGB_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    fraColors.ZOrder 0
End Sub

Private Sub cmdRColSt_Click()
Dim A As Byte
    For A = 0 To chkCol.count - 1
       chkCol(A) = 0
    Next A
    Colv_R = Primes(LQT) Mod 256
    Colv_G = Primes(LQT - 1) Mod 256
    Colv_B = Primes(LQT - 2) Mod 256
    frmBase.chkCol(Rnd * 5) = 1
    
    A = 0
    Do While cS(0) = 0 Or cS(1) = 0 Or cS(2) = 0
        cS(0) = Rnd * 1: cS(1) = Rnd * 1: cS(2) = Rnd * 1
        A = A + 1
        If A > 200 Then cS(0) = 1: cS(1) = 1: cS(2) = 1: Exit Do
    Loop

End Sub

Private Sub cmdRstCol_Click()

End Sub

Public Sub cmdSmaler_Click(Index As Integer)
Dim cd As Integer
    If Index = 16 Then txtspm(16).Text = Val(txtspm(16).Text) - 1: txtspm(16).Refresh
    If Index = 17 Then txtspm(17).Text = Val(txtspm(17).Text) - 1: txtspm(17).Refresh
    
    If Index = 18 Then
        txtspm(18).Text = Val(txtspm(18).Text) - 1: txtspm(18).Refresh
    End If
    If Index = 19 Then
        txtspm(19).Text = Val(txtspm(19).Text) - 1: txtspm(19).Refresh
    End If
    
    If Index = 0 And Val(txtspm(0).Text) > 32 Then txtspm(0).Text = Val(txtspm(0).Text) - 32: txtspm(0).Refresh
    If Index = 1 And Val(txtspm(1).Text) > 1 Then txtspm(1).Text = Val(txtspm(1).Text) - 1
    If Index = 2 Then txtspm(2).Text = Val(txtspm(2).Text) - 1
    If (Index = 3) And Val(txtspm(3).Text) > 1 Then txtspm(3).Text = Val(txtspm(3).Text) - 1
    If (Index = 4) And Val(txtspm(4).Text) > 1 Then txtspm(4).Text = Val(txtspm(4).Text) - 1
    If Index = 5 And Val(txtspm(5).Text) > 0.15 Then txtspm(5).Text = Val(txtspm(5).Text) - 0.15 '* (txtspm(5) \ 10 + 1)
     If Index = 6 And txtspm(6) > 0 Then
            txtspm(6) = txtspm(6) - 0.1
            txtspm(6).Refresh
     End If
    If Index = 7 And txtspm(7) Then txtspm(Index).Text = Val(txtspm(Index).Text) - 1
   If Index = 8 And txtspm(8) > 0.1 Then txtspm(8).Text = Val(txtspm(8).Text) - 0.1
   If Index = 9 And txtspm(9) > 1 Then txtspm(9) = txtspm(9) - 1
   If Index = 10 And txtQua > 5 Then txtQua = txtQua - 5
   If Index = 11 Then LQT2 = LQT2 - 0.1: txtspm(11) = LQT2
   If Index = 12 And txtspm(12) > 3.1 Then txtspm(12) = txtspm(12) - 0.1
   If Index = 15 And LQT > 1 Then LQT = LQT - 1:  txtspm(13) = LQT: txtspm(13).Refresh
   If Index = 14 And LQT > 1001 Then LQT = LQT - 1000: txtspm(13) = LQT: txtspm(13).Refresh
   If Index = 13 And LQT > 101 Then
       LQT = LQT - 100:  txtspm(13) = LQT
       txtspm(13).Refresh: frmBase.txtLQT.Refresh
       DoEvents
   End If
End Sub

Private Sub cmdSmaler_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    idxS = Index
    DoClickS = True
    DoS = 0
End Sub

Private Sub cmdSmaler_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    DoClickS = False
End Sub

Public Sub cmdSF_Click()
Dim S As String, B As Boolean, x As Integer

    SaveCount = SaveCount + 1
    S = "E:\visu\TEMP\Kv-" & CStr(SaveCount) & ".jpg"
    chkPause.Value = 1
    
    SAVEJPEG S, txtQua, picView
    
    chkPause.Value = 0
    SaveSetting "KV_M_B", "kvvisulation", "SaveCount", SaveCount

End Sub

Private Sub Combo1_Click()
    Combo1_Validate True
End Sub

Private Sub Combo1_Validate(Cancel As Boolean)
    If Combo1.ListIndex > 0 Then picBuff.DrawMode = Combo1.ListIndex + 1
End Sub

Public Sub cmdCopy2Excel_Click()
Dim x As Integer, z1 As Double, Z2 As Double                '''' only for test KRandom()
  ReDim ExelArray(1 To lstLogs(0).ListCount, 0 To 8)
    
    For x = 1 To lstLogs(0).ListCount
        ExelArray(x, 0) = lstLogs(0).List(x - 1)
    Next x
  
'  ExelArray(X + 1, 0) = z1
'  ExelArray(X + 1, 1) = z2
    
  ExcelSaveArray
End Sub

Private Sub Command1_Click()
'    DelCtrls
End Sub

Public Sub cmdPrime_Click()
Dim a1 As Double, B As Double, co(0 To 255) As Long, coc(0 To 9) As Long, cocS(0 To 255) As Long, tm As Integer
Dim Tm2 As Long

'cmdPrime.Enabled = False
    For a1 = 0 To 255
'        co(a1) = RGB(a1 ^ 2 \ 32, a1 ^ 2 \ 48, a1 ^ 2 \ 24)
        co(a1) = RGB(a1 ^ 2 \ (4 * txtspm(10)), a1 ^ 2 \ (6 * txtspm(10)), a1 ^ 2 \ (3 * txtspm(10)))
    Next a1
    
    For B = 1 To 768 Step 3
    For a1 = 1 To 1024 Step 2
      
      tm = PrK(1, (a1 + B * 148.932 - 148.932)) Mod 10
      Tm2 = PrK(2, (a1 + B * 148.932 - 148.932))
      SetPixel frmBase.PicPrime.hdc, a1, B, co(Tm2)
      
      coc(tm) = coc(tm) + 1
      tm = PrK(2, (a1 + B * 148.932 - 148.932))
      cocS(tm) = cocS(tm) + 1
    
    Next a1
    Next B
    
    For a1 = 0 To 9
        lstLogs(0).AddItem a1 & "     " & coc(a1)
    Next a1
    For a1 = 0 To 255
      If cocS(a1) <> 0 Then lstLogs(0).AddItem a1 & "     " & cocS(a1)
    Next a1
    
End Sub

Private Sub Command2_Click()

End Sub

Private Sub Form_Activate()

  Static waveFormat As WaveFormatEx

    With waveFormat
        .FormatTag = WAVE_FORMAT_PCM
        .Channels = 2
        .SamplesPerSec = 11025 '11khz
        .BitsPerSample = 8
        .BlockAlign = (.Channels * .BitsPerSample) \ 8
        .AvgBytesPerSec = .BlockAlign * .SamplesPerSec
        .ExtraDataSize = 0
    End With
    waveInOpen DevHandle, DevicesBox.ListIndex, VarPtr(waveFormat), 0, 0, 0
    If DevHandle = 0 Then
        Call MsgBox("Wave input device didn't open!", vbExclamation, "Ack!") ' 
        Exit Sub
    End If
    Call waveInStart(DevHandle)
    Inited = True
    DoEv = True
    
    BaseSub

End Sub

Private Sub Form_DblClick()
    If cmdMax.Visible = True Then
        cmdMax_Click
      Else
        cmdMini_Click
    End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
DoEvents
    If KeyCode = Asc("s") Or KeyCode = Asc("S") Then cmdSF_Click
    If KeyCode = 107 Then cmdLarger_Click 2
    If KeyCode = 109 Then cmdSmaler_Click 2
    If KeyCode = vbKeyRight Then cmdLarger_Click 2
    If KeyCode = vbKeyLeft Then cmdSmaler_Click 2
    If KeyCode = 27 Then cmdMini_Click
DoEvents
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
    DoEvents
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
    DoEvents
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
DoEvents
    PointerX = x
    PointerY = y
End Sub
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If frmBase.Width + (x - PointerX) <= 15360 Then frmBase.Width = frmBase.Width + (x - PointerX)
    If frmBase.Height + (y - PointerY) <= 11520 Then frmBase.Height = frmBase.Height + (y - PointerY)
    If frmBase.Width + (x - PointerX) > 15360 Then frmBase.Width = 15360
    If frmBase.Height + (y - PointerY) > 11520 Then frmBase.Height = 11520
    
    picBuffEE.Width = frmBase.Width
    picBuffEE.Height = frmBase.Height
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    
'    If x > frmBase.Width - 100 And x < frmBase.Width Then
''          frmBase.MousePointer = 9
'      ElseIf x > 0 And x < 100 Then
''          frmBase.MousePointer = 9
'      ElseIf y > frmBase.Height - 100 And y < frmBase.Height Then
''          frmBase.MousePointer = 7
'      ElseIf y > 0 And y < 100 Then
''          frmBase.MousePointer = 7
'      Else
''          frmBase.MousePointer = 0
'    End If


End Sub


Private Sub Form_Resize()
    picViewEE.Width = frmBase.Width
    picViewEE.Height = frmBase.Height
    txtFrm.Left = frmBase.Width - 360
    fraControls.Left = frmBase.Width - fraControls.Width - 360
    fraColors.Left = fraControls.Left - fraColors.Width
    fraBlur.Left = fraColors.Left - fraBlur.Width
End Sub

Private Sub lblControls_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraControls.ZOrder 0
End Sub

Private Sub txtFormula_Click()
    chkScript.Value = 0
End Sub

Private Sub Form_Load()
    
    Set picView = picViewEE
    Set picBuff = picBuffEE
    Set picBuffSe = picBuffEE
    Set picBuffSe2 = picBuffEE
    Set picTmp = picBuffEE2
    picView.Refresh
    picView.Visible = True
    picView.ZOrder 1
    
    initSetData
    
    SsPtr = 0
    txP = 1: tyP = 1
    Set Clk = New cCpuClk                                     'Create the CpuClk instance
    DoEvents
    Call QueryPerformanceFrequency(cCycles) ' 
    
    stFirst = 1
    dRFlag = 1
    
    fraProcess.Height = 350
    fraBlur.Height = 350
    fraControls.Height = 350

    FlgBlur = 1
    Set_Process
    
    xColStp = 1
    yCol = 5
    xCol = 5
    
    LoadREG
    
'    On Error Resume Next
'      Debug.Print 1 / 0
'      If Err Then
'          MsgBox " . If Compile The Code Before Run . Its Runing About 2 Times Farster!!!", , " LQ_SKYS Present  ..."
'      End If

End Sub

Private Sub initSetData()
Dim caps As WAVEINCAPS, Which As Long
Dim x As Integer
     
    MVolu = 1
    Fst = True
    DoEv = 11
   
    ABass = 1
    AMidl = 1
    ATreb = 1
    AFreq = 1
    ABass2 = 1
    AMidl2 = 1
    ATreb2 = 1
    AFreq2 = 1
    Randomize (Timer)
    RV = CDbl(Rnd(2) * 255)
    GV = CDbl(Rnd(3) * 255)
    BV = CDbl(Rnd(5) * 255)
    Randomize (Timer)
    RN = CDbl(Rnd(2) * 255)
    GN = CDbl(Rnd(3) * 255)
    BN = CDbl(Rnd(5) * 255)
    
    PiTAdd1 = 8.72664625997165E-03
    PiTAdd2 = 1.74532925199433E-02
    
    For x = 0 To 2
        MaxC(x) = Val(txtMaxC(x).Text)
        MinC(x) = Val(txtMinC(x).Text)
    Next x
    
    Ox = 0
    Oy = 128
    Ox2 = 256
    Oy2 = 128
    BlurNum = 0
    
    tx = 1
    ty = 1

    DevicesBox.Clear
    For Which = 0 To waveInGetNumDevs - 1
        Call waveInGetDevCaps(Which, VarPtr(caps), Len(caps)) ' 
        If caps.Formats And WAVE_FORMAT_1S08 Then 'Now is 1S08 -- Check for devices that can do stereo 8-bit 11kHz
            Call DevicesBox.AddItem(StrConv(caps.ProductName, vbUnicode), Which) ' 
        End If
    Next ' Repeat For-Variable: WHICH
    If DevicesBox.ListCount = 0 Then
        MsgBox "You have no audio input devices!", vbCritical, "Ack!"
        End ' There are better ways to terminate
    End If
    DevicesBox.ListIndex = 0

    ColSt(0) = &H0&     'Black 0+0+0
    ColSt(1) = &HFF&    'Red
    ColSt(2) = &HFF00&  'Green
    ColSt(3) = &HFF0000 'Blue
    ColSt(4) = &HFFFF00 'Cyan B+G
    ColSt(5) = &HFF00FF 'Maginta B+R
    ColSt(6) = &HFFFF&  'Yelow G+R
    ColSt(7) = &H7F7F7F 'Gray  127+127+127
    ColSt(8) = &HFFFFFF 'White 255+255+255
    ColSt(9) = ColSt(8) Xor ColSt(2)
    ColSt(10) = ColSt(5) Xor ColSt(4)

End Sub


Private Sub Form_Unload(Cancel As Integer)
'    Set myThreadTop = Nothing
    
    
    If DevHandle <> 0 Then
    Call waveInReset(DevHandle) ' 
    Call waveInClose(DevHandle) ' 
    DoEvents
    DevHandle = 0
    
    End If
    SaveREG
'    CloseExcel

    End
End Sub

Private Sub fraBlur_Click()
    fraBlur.ZOrder (0)
End Sub

Private Sub fraBlur_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = True
End Sub

Private Sub fraBlur_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraBlur.ZOrder (0)
End Sub

Private Sub fraBlur_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = False
End Sub

Private Sub fraColors_Click()
    fraColors.ZOrder (0)
End Sub

Private Sub fraColors_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = True
End Sub

Private Sub fraColors_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = False
End Sub

Private Sub fraControls_Click()
    fraControls.ZOrder (0)
End Sub


Private Sub fraControls_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = True
End Sub

Private Sub fraControls_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = False
End Sub

Private Sub fraProcess_Click()
    fraProcess.ZOrder (0)
End Sub


Private Sub fraProcess_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = True
End Sub

Private Sub fraProcess_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    DoEv = False
End Sub

Private Sub lblBlur_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraBlur.ZOrder 0
End Sub

Private Sub lblColorSet_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraColors.ZOrder 0
End Sub

Private Sub lblLogs_Click()
'    fraLogs.Visible = False
    If fraLogs.Height > 400 Then
        fraLogs.Height = 350
      Else
        fraLogs.Height = 6960
        fraLogs.ZOrder (0)
    End If
End Sub

Private Sub lblColorSet_Click()
    If fraColors.Height > 400 Then
        fraColors.Height = 350
      Else
        fraColors.Height = 4095
        fraColors.ZOrder (0)
    End If
End Sub

Private Sub lblControls_Click()
    If fraControls.Height > 400 Then
        fraControls.Height = 350
      Else
        fraControls.Height = 9120
        fraControls.ZOrder (0)
    End If
End Sub

Private Sub lblBlur_Click()
    If fraBlur.Height > 400 Then
        fraBlur.Height = 350
      Else
        fraBlur.Height = 4620
        fraBlur.ZOrder (0)
    End If
End Sub

Private Sub lblLogs_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraLogs.ZOrder 0
End Sub

Private Sub lblLQSky_Click()
    If fraProcess.Height > 400 Then
        fraProcess.Height = 350
      Else
        fraProcess.Height = 7455
        fraProcess.ZOrder (0)
    End If
End Sub

Private Sub lblVol_Click()
    lblControls_Click
End Sub

Private Sub cmdSnCGr_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    If cS(Index) > 0 Then
        cS(Index) = -1
    ElseIf cS(Index) < 0 Then
        cS(Index) = 0
    Else
        cS(Index) = 1
    End If
End Sub

Private Sub lblLQSky_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraProcess.ZOrder 0
End Sub

Private Sub List1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraLogs.ZOrder 0
End Sub

Private Sub List2_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraLogs.ZOrder 0
End Sub

Private Sub lstFunctions_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraProcess.ZOrder 0
End Sub

Private Sub lstLogs_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
    fraLogs.ZOrder 0
End Sub

Private Sub lstProcess_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraProcess.ZOrder 0
End Sub

Private Sub lstPsent_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraProcess.ZOrder 0
End Sub

Private Sub picBBlur_Click()
    fraBlur.ZOrder 0
End Sub

Private Sub picBBlur_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraBlur.ZOrder (0)
End Sub

Private Sub picBCol_Click()
    fraColors.ZOrder 0
End Sub

Private Sub picBCol_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraColors.ZOrder 0
End Sub

Private Sub picBCtrl_Click()
    fraControls.ZOrder 0
End Sub

Private Sub picBCtrl_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraControls.ZOrder 0
End Sub

Private Sub picBLogs_Click()
    fraLogs.ZOrder 0
End Sub

Private Sub picBLogs_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraLogs.ZOrder 0
End Sub

Private Sub picBProcs_Click()
    fraProcess.ZOrder 0
End Sub

Private Sub picBProcs_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraProcess.ZOrder 0
End Sub

'Public Sub picview_DblClick()
'    If cmdMax.Visible = True Then
'        cmdMax_Click
'      Else
'        cmdmini_Click
'    End If
'End Sub
'
'Private Sub picView_KeyDown(KeyCode As Integer, Shift As Integer)
'
'    If KeyCode = 27 Then cmdmini_Click
'    If KeyCode = Asc("s") Or KeyCode = Asc("S") Then cmdSF_Click
'
'End Sub
'
'
'Private Sub picview_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
'    DoEv = True
'End Sub
'Private Sub picview_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
'     DoEv = False
'End Sub




Private Sub Timer_AHeight_Timer()
    Timer_AHeight.Tag = Val(Timer_AHeight.Tag) + 1
    If Val(Timer_AHeight.Tag) > 1 Then
        Timer_AHeight.Enabled = False
        chkAHeight.Value = 0
        Timer_AHeight.Tag = "0"
    End If
    If (Abs(maxY - minY) < (txtspm(0) * 1.1)) And (Abs(maxY - minY) > (txtspm(0) * 0.9)) Then
        Timer_AHeight.Enabled = False
        chkAHeight.Value = 0
        Timer_AHeight.Tag = "0"
    End If
End Sub


Private Sub Timer_AutoLog_Timer()
    If frmBase.chkALog.Value Then Loger
End Sub

Private Sub Timer_Process_Timer()
    Dim hIcon As Long, pdhStatus As Long
    Dim dbl As Double

        If AvgUsageCount = 0 Then
            AvgCpu0 = 0
            AvgCpu1 = 0
        End If
        If AvgUsageCount > 100 Then
            AvgCpu0 = AvgCpu0 / AvgUsageCount
            AvgCpu1 = AvgCpu1 / AvgUsageCount
            AvgUsageCount = 1
        End If
    
        PdhCollectQueryData (hQuery)
    
        dbl = PdhVbGetDoubleCounterValue(Counters(0).hCounter, pdhStatus)
        If (pdhStatus = PDH_CSTATUS_VALID_DATA) Or (pdhStatus = PDH_CSTATUS_NEW_DATA) Then
            AvgCpu0 = AvgCpu0 + dbl
        End If
        
        If NumOfCores = 2 Then
            dbl = PdhVbGetDoubleCounterValue(Counters(1).hCounter, pdhStatus)
            If (pdhStatus = PDH_CSTATUS_VALID_DATA) Or (pdhStatus = PDH_CSTATUS_NEW_DATA) Then
                AvgCpu1 = AvgCpu1 + dbl
            End If
        End If
    
     
        AvgUsageCount = AvgUsageCount + 1
    
    txtProcess0 = CStr(Int(AvgCpu0 / AvgUsageCount)) + " %"
    txtProcess1 = CStr(Int(AvgCpu1 / AvgUsageCount)) + " %"
    txtProcessSum.Text = CStr(Int(((AvgCpu0 / AvgUsageCount) + (AvgCpu1 / AvgUsageCount)) / 2)) + " %"
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


End Sub

Private Sub WaveBlur()

  Dim intX As Integer, intY, i As Integer
  Dim intI As Integer, intJ As Integer
  Dim intWidth As Integer, intHeight As Integer

    intWidth = 1024 'picBuff.Width
    intHeight = 768 'picBuff.Height
    Randomize
      For i = 1 To 1000
                 intX = (intWidth) * Rnd
                 intY = (intHeight) * Rnd
                 intI = M1 * Rnd - z1
                 intJ = M2 * Rnd - Z2
                 K1 = K1 * Rnd
                 K2 = K2 * Rnd
                 BitBlt picBuff.hdc, intX + intI, intY + intJ, K1, K2, picBuff.hdc, intX, intY, vbSrcCopy
      Next i

End Sub


Private Sub Timer_AutoSave_Timer()
 TiS = TiS + 1
    If TiS >= txtspm(8) * 10 And chkAutoShot Then
        TiS = 0
        cmdSF_Click
        txtspm(8).BackColor = txtspm(8).BackColor Xor vbBlue
        txtspm(8).ForeColor = txtspm(8).ForeColor Xor vbRed
       ElseIf TiS >= txtspm(8) * 10 * 2 Then
            On Error Resume Next
              Debug.Print 1 / 0
              If Err Then
                        cmdSF_Click
                        txtspm(8).BackColor = txtspm(8).BackColor Xor vbBlue
                        txtspm(8).ForeColor = txtspm(8).ForeColor Xor vbRed
              End If
        TiS = 0
    End If

End Sub

Private Sub Timer_Seconds_Timer()
    St_Time = St_Time + 1
End Sub


Private Sub txtFpS_Change()

    txtFrm = Int(txtFpS)
    If Val(txtFpS.Text) < 16 Then txtFpS.BackColor = &HFF&: GoTo en
    If Val(txtFpS.Text) < 20 Then txtFpS.BackColor = &H64FB&: GoTo en
    If Val(txtFpS.Text) < 24 Then txtFpS.BackColor = &H1E7FA: GoTo en
    If Val(txtFpS.Text) < 28 Then txtFpS.BackColor = &H1FABC: GoTo en
    txtFpS.BackColor = &HFF00&
en:
'    TextLabel(8).BackColor = txtFpS.BackColor
End Sub

Private Sub txtLQT_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    fraProcess.ZOrder 0
End Sub

Private Sub txtMaxC_Change(Index As Integer)
    MaxC(Index) = Val(txtMaxC(Index).Text)
End Sub

Private Sub txtMinC_Change(Index As Integer)
    MinC(Index) = Val(txtMinC(Index).Text)
End Sub

Private Sub txtspm_Change(Index As Integer)
    If Index = 0 Then chkAHeight.Value = 1
    If Val(txtspm(9)) < 1 And Index = 9 Then txtspm(9) = 1
End Sub

Private Sub txtspm_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
DoEvents
End Sub
