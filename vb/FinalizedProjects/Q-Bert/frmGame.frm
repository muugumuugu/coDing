VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmGame 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   Caption         =   "Q-Bert II"
   ClientHeight    =   8010
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   9030
   Icon            =   "frmGame.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   8010
   ScaleWidth      =   9030
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   8400
      Top             =   6600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox picCube 
      Height          =   735
      Index           =   15
      Left            =   8280
      Picture         =   "frmGame.frx":030A
      ScaleHeight     =   675
      ScaleWidth      =   675
      TabIndex        =   128
      Top             =   3480
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   16
      Left            =   8280
      Picture         =   "frmGame.frx":3224
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   127
      Top             =   4200
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   18
      Left            =   8280
      Picture         =   "frmGame.frx":590C
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   126
      Top             =   5640
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   17
      Left            =   8280
      Picture         =   "frmGame.frx":85FC
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   125
      Top             =   4920
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   13
      Left            =   8280
      Picture         =   "frmGame.frx":A256
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   124
      Top             =   2040
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   12
      Left            =   8280
      Picture         =   "frmGame.frx":BA6A
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   123
      Top             =   1320
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   11
      Left            =   8280
      Picture         =   "frmGame.frx":E3D0
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   122
      Top             =   600
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   10
      Left            =   7560
      Picture         =   "frmGame.frx":10D36
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   121
      Top             =   7080
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   14
      Left            =   8280
      Picture         =   "frmGame.frx":13652
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   120
      Top             =   2760
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   8
      Left            =   7560
      Picture         =   "frmGame.frx":15E9C
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   119
      Top             =   5640
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   7
      Left            =   7560
      Picture         =   "frmGame.frx":1776C
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   118
      Top             =   4920
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   6
      Left            =   7560
      Picture         =   "frmGame.frx":1903C
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   117
      Top             =   4200
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   5
      Left            =   7560
      Picture         =   "frmGame.frx":1A90C
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   116
      Top             =   3480
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   4
      Left            =   7560
      Picture         =   "frmGame.frx":1C1DC
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   115
      Top             =   2760
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   3
      Left            =   7560
      Picture         =   "frmGame.frx":1E1F2
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   114
      Top             =   2040
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   2
      Left            =   7560
      Picture         =   "frmGame.frx":20208
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   113
      Top             =   1320
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Height          =   735
      Index           =   1
      Left            =   7560
      Picture         =   "frmGame.frx":21388
      ScaleHeight     =   675
      ScaleWidth      =   675
      TabIndex        =   112
      Top             =   600
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   9
      Left            =   7560
      Picture         =   "frmGame.frx":22508
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   111
      Top             =   6360
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   81
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   110
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   101
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   109
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   91
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   108
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   21
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   107
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   11
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   106
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   31
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   105
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   41
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   104
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   51
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   103
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   61
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   102
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   71
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   101
      Top             =   600
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   810
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   100
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   89
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   99
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   98
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   98
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   1010
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   97
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   109
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   96
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   108
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   95
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   910
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   94
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   99
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   93
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   18
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   92
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   210
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   91
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   29
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   90
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   38
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   89
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   110
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   88
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   19
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   87
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   28
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   86
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   49
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   85
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   58
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   84
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   310
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   83
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   39
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   82
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   48
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   81
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   410
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   80
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   510
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   79
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   59
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   78
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   68
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   77
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   610
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   76
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   69
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   75
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   78
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   74
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   710
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   73
      Top             =   7080
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   79
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   72
      Top             =   6360
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   88
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   71
      Top             =   5640
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   87
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   70
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   86
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   69
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   95
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   68
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   107
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   67
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   106
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   66
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   105
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   65
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   97
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   64
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   96
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   63
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   15
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   62
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   27
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   61
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   26
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   60
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   35
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   59
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   17
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   58
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   16
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   57
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   25
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   56
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   46
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   55
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   55
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   54
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   37
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   53
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   36
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   52
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   45
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   51
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   47
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   50
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   57
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   49
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   56
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   48
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   65
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   47
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   67
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   46
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   66
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   45
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   75
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   44
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   77
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   43
      Top             =   4920
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   76
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   42
      Top             =   4200
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   85
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   41
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   84
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   40
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   83
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   39
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   92
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   38
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   104
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   37
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   103
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   36
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   102
      Left            =   6600
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   35
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   94
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   34
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   93
      Left            =   5880
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   33
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   12
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   32
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   24
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   31
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   23
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   30
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   32
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   29
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   14
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   28
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   13
      Left            =   120
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   27
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   22
      Left            =   840
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   26
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   43
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   25
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   52
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   24
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   34
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   23
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   33
      Left            =   1560
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   22
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   42
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   21
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   44
      Left            =   2280
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   20
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   54
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   19
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   53
      Left            =   3000
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   18
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   62
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   17
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   64
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   16
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   63
      Left            =   3720
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   15
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   72
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   14
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   74
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   13
      Top             =   2760
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   73
      Left            =   4440
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   12
      Top             =   2040
      Width           =   735
   End
   Begin VB.PictureBox picBoard 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   82
      Left            =   5160
      ScaleHeight     =   735
      ScaleWidth      =   735
      TabIndex        =   11
      Top             =   1320
      Width           =   735
   End
   Begin VB.PictureBox picInventory 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   6600
      Picture         =   "frmGame.frx":24E6E
      ScaleHeight     =   345
      ScaleWidth      =   465
      TabIndex        =   9
      Top             =   0
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Timer tmrEverything 
      Interval        =   400
      Left            =   360
      Top             =   120
   End
   Begin VB.PictureBox picInventory 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   4680
      Picture         =   "frmGame.frx":25086
      ScaleHeight     =   345
      ScaleWidth      =   465
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.PictureBox picInventory 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   5160
      Picture         =   "frmGame.frx":25874
      ScaleHeight     =   345
      ScaleWidth      =   465
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.PictureBox picInventory 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   5640
      Picture         =   "frmGame.frx":26018
      ScaleHeight     =   345
      ScaleWidth      =   465
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.PictureBox picInventory 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   6120
      Picture         =   "frmGame.frx":26806
      ScaleHeight     =   345
      ScaleWidth      =   465
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label lblBullets 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   7080
      TabIndex        =   10
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Inventory:"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   3840
      TabIndex        =   8
      Top             =   120
      Width           =   735
   End
   Begin VB.Label label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Score:"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   1080
      TabIndex        =   7
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblScore 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   1560
      TabIndex        =   6
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Level:"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2640
      TabIndex        =   5
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblLevel 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   3120
      TabIndex        =   4
      Top             =   120
      Width           =   735
   End
   Begin VB.Menu mnuGame 
      Caption         =   "&Game"
      Begin VB.Menu mnuNewGame 
         Caption         =   "&New Game"
         Shortcut        =   {F12}
      End
      Begin VB.Menu mnuLoadGame 
         Caption         =   "&Load Game"
         Shortcut        =   ^L
      End
      Begin VB.Menu mnuPause 
         Caption         =   "&Pause Game"
         Shortcut        =   ^P
      End
      Begin VB.Menu mnuContinue 
         Caption         =   "&Continue Game"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuStopGame 
         Caption         =   "&Stop Game"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuline1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHighScores 
         Caption         =   "&View High Scores"
         Shortcut        =   ^H
      End
   End
   Begin VB.Menu mnuHelper 
      Caption         =   "H&elp"
      Begin VB.Menu mnuAbout 
         Caption         =   "&About"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuHelp 
         Caption         =   "&Help"
         Shortcut        =   {F1}
      End
   End
End
Attribute VB_Name = "frmGame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'This is Q-Bert II.
'made by muku

'''''''''''''''''''''''''''''''''''''''''''''''
'Sub CompletedGame(LevelsCompleted As Integer)'
'Happens when the user finishes all levels    '
'                                             '
'''''''''''''''''''''''''''''''''''''''''''''''
Sub CompletedGame(LevelsCompleted As Integer)
'the game isn't busy anymore
GameStatus = NOTGAME
'show a cogratulations message
Response = MsgBox("You have completed all " & LevelsCompleted & " levels in Q-Bert II! Congratulations!", vbInformation, "Congratulations!")
'check to see if the plaer scored a high score
CheckHighScores Score
'stop the game
Call mnuStopGame_Click
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Sub InitLevel(Level As Integer) '
'           Show a specific level on screen '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Sub InitLevel(Level As Integer)
'just in case, we're working with files
On Error GoTo errhandler
Dim CountX As Integer
Dim CountY As Integer
Dim CountZ As Integer
Dim TempStr As String
Dim FileName As String
Dim iFileNum As Integer

'clear the form from anything
Me.Cls

'now set ALL ofthe GameBoard to their default
'values
For CountX = 1 To 10 Step 1
    For CountY = 1 To 10 Step 1
        GameBoard(CountX, CountY, BLOCKTYPE) = NOJUMP
        GameBoard(CountX, CountY, LEFTDOORTYPE) = NO
        GameBoard(CountX, CountY, RIGHTDOORTYPE) = NO
        GameBoard(CountX, CountY, UPDOORTYPE) = NO
        GameBoard(CountX, CountY, DOWNDOORTYPE) = NO
        GameBoard(CountX, CountY, LEFTWALL) = NO
        GameBoard(CountX, CountY, RIGHTWALL) = NO
        GameBoard(CountX, CountY, UPWALL) = NO
        GameBoard(CountX, CountY, DOWNWALL) = NO
        GameBoard(CountX, CountY, TRAPBLOCK) = NO
        GameBoard(CountX, CountY, JUMPED) = NO
        GameBoard(CountX, CountY, BADDIETHERE) = NO
        TransporterHere(CountX, CountY) = NO
    Next CountY
Next CountX

'now turn off all inventory items
For CountX = 1 To 5
    Inventory(CountX) = NO
    picInventory(CountX).Visible = False
Next CountX
lblBullets.Visible = False

'now we open a level file. Q-Bert II supports up
'to 999 levels.
'let's see if the level is under ten (ex: 9)
'If it is, add two 00's (ex: 9 -> 009) because
'the level number has to be three digits
'same for under 100; only this time add one 0.
TempStr = Level
If Len(TempStr) = 1 Then
    TempStr = "00" & TempStr
ElseIf Len(TempStr) = 2 Then
    TempStr = "0" & TempStr
End If
'open the level file
FileName = App.Path & "\level" & TempStr & ".qlv"
iFileNum = FreeFile
Open FileName For Input Lock Read Write As iFileNum
'now read everything from the file
For CountX = 1 To 10 'X axis
    For CountY = 1 To 10 'Y axis
        'All the things to read. Beware!
        'Z = Nothing to do with 3D!
        For CountZ = 1 To MAXNEEDEDDIMENSIONS
            Input #iFileNum, GameBoard(CountX, CountY, CountZ)
        Next CountZ
        Input #iFileNum, TransporterHere(CountX, CountY)
        'clear the board while we're at it:
        'wouldn't want any extra lines to stay
        picBoard(CountX & CountY).Cls
    Next CountY
Next CountX
'clean up
Close iFileNum

'set Q-Bert's X & Y
QBertChar.CurrentX = 1
QBertChar.CurrentY = 1

'set all baddies by going to each block and
'seeing if there's a baddie, if so, set a
'instance of the Baddie class to it.
HowManyBaddies = 0
ReDim Baddies(1) As New Baddie
For CountX = 1 To 10
    For CountY = 1 To 10
        If GameBoard(CountX, CountY, BADDIETHERE) = YES Then
            HowManyBaddies = HowManyBaddies + 1
            'Note: ReDim Preserve makes the array
            'larger or smaller , but keeps the
            'info in the array instead
            'of deleting it, like a normal
            'ReDim would
            ReDim Preserve Baddies(HowManyBaddies) As New Baddie
            Baddies(HowManyBaddies).CurrentX = CountX
            Baddies(HowManyBaddies).CurrentY = CountY
            Baddies(HowManyBaddies).Enabled = DISABLED
        End If
    Next CountY
Next CountX

'Give a Save question at the beginning of each
'level, except for the first, because the first
'is always loaded in the beginning, and the
'player doesn't want to save there
If Level > 1 Then
    Response = MsgBox("Do you wish to save your game?", vbQuestion + vbYesNo, "Q-Bert II")
    If Response = vbYes Then
        SaveGame Level
    End If
End If

'now finish up by putting updating some variables
'and repainting the board (UpdateBoard)
CurrentLevel = Level
lblLevel = CurrentLevel
UpdateBoard
Exit Sub
errhandler:
'the following is a File Not Found error.
'this is good, if it's above the ninth level,
'because it means the player completed the game
'Why above the ninth level? Because at least
'ten levels are with Q-Bert II to begin with.
'additional level packets are going to be made
'and are going to be available from Damadros'
'website:
'http://damadros.cjb.net
'or by e-mailing me:
'drmayerson@tiscalinet.be
If Err = 53 And Level > 9 Then
    CompletedGame Level - 1
    Err.Clear
    Exit Sub
End If
'However, any other error isn't good. Display
'the error, and ask if the user wishes to
'continue playing the game.
Response = MsgBox("Error " & Err & " occurred when opening level " & Level & ":" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbCritical + vbYesNo, "Q-bert II")
If Response = vbNo Then
    End
Else
    Resume Next
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Sub InitGame()                  '
'           Initialize game but not start it'
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Sub InitGame()
'show the first level on the screen
InitLevel 1
'no game is busy, but everything is ready to
'start
GameStatus = NOTGAME
'reset score, level and their labels
Score = 0
CurrentLevel = 1
lblScore = Score
lblLevel = CurrentLevel
'hide some menu's only used in the game
mnuContinue.Visible = False
mnuPause.Visible = False
mnuStopGame.Visible = False
End Sub

''''''''''''''''''''''''''''''''''''''''''''''
'Sub KeyPressed(WhichKey As KeyCodeConstants)'
'This gets called when the user presses a key'
'                                            '
''''''''''''''''''''''''''''''''''''''''''''''
Sub KeyPressed(WhichKey As KeyCodeConstants)
'make sure the game is on, otherwise it's
'pointless to do anything about it.
If GameStatus = YESGAME Then
'now see what key is pressed and call the
'correct sub
    If WhichKey = vbKeyLeft < 0 Then
        QBertChar.Move 3
    ElseIf WhichKey = vbKeyRight < 0 Then
        QBertChar.Move 1
    ElseIf WhichKey = vbKeyUp < 0 Then
        QBertChar.Move 4
    ElseIf WhichKey = vbKeyDown < 0 Then
        QBertChar.Move 2
    ElseIf WhichKey = vbKeySpace < 0 Then
        QBertChar.OpenDoors
    ElseIf WhichKey = vbKeyControl < 0 Then
        QBertChar.Shoot
    End If
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Sub LoadGame()                  '
'           Load game from commondialog     '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Sub LoadGame()
On Error GoTo errhandler 'If user pressed cancel,
'on the commondialog, an error is generated
Dim iFileNum As Integer
Dim FileName As String
Dim TempInt As Integer
Dim TempScore As Long
Dim TempDbl As Double
With CommonDialog1
    'if user presses cancel=generate err
    .CancelError = True
    'what to appear in the (normally blue)
    'titelbar
    .DialogTitle = "Open Game"
    .FileName = "*.qsg" 'to appear in textbox
    'the filter for the CommonDialog: before the
    ' | : what you see, after the | : what the
    'filter looks for as file extension
    .Filter = "Q-Bert II Savegame (*.qsg)|*.qsg"
    'This flag hides the 'Open as Read Only'
    'checkbox
    .Flags = cdlOFNHideReadOnly
ShowOpenAgain:
    .ShowOpen 'Show the commondialog!
    If .FileName = "" Then 'no file
        Exit Sub
    End If
End With

'now we open the file from the commondialog
iFileNum = FreeFile
FileName = CommonDialog1.FileName
Open FileName For Input Lock Read Write As iFileNum
'we read level & score
Input #iFileNum, TempInt
Input #iFileNum, TempScore
'close the file
Close iFileNum
'and set the variables to their new values
Score = TempScore
lblScore = Score
lblScore.Refresh
'and we initialize the level
InitLevel TempInt

Exit Sub 'we don't want to run the errhandler
'if no err was generated
errhandler:
If Err = cdlCancel Then 'user pressed cancel
    Exit Sub 'open failed
End If
'otherwise, something bad happened,
'display the error, and ask the player if he
'wants to continue
Response = MsgBox("Error " & Err & " occurred when loading game:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbCritical + vbYesNo, "Q-bert II")
If Response = vbNo Then
    End
Else
    Resume Next
End If
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Sub ReleaseBaddies()            '
'           Happens when Q-Bert jumps on a  '
'           trapblock                                '
'''''''''''''''''''''''''''''''''''''''''''''
Sub ReleaseBaddies()
Dim BCounter As Integer
Dim Released As Integer
For BCounter = 1 To HowManyBaddies
    'if we've released (activated) two, stop
    If Released = 2 Then
        Exit Sub
    End If
    'if a baddie is disabled (so not dead or
    'active), activate it
    If Baddies(BCounter).Enabled = DISABLED Then
        Baddies(BCounter).Enabled = ACTIVE
        Released = Released + 1
    End If
Next BCounter
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'      Sub SaveGame(LevelReached As Integer)'
'      Save the game to a file              '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Sub SaveGame(LevelReached As Integer)
On Error GoTo errhandler 'If user pressed cancel,
'on the commondialog, an error is generated
Dim iFileNum As Integer
Dim FileName As String
With CommonDialog1
    'if user presses cancel=generate error
    .CancelError = True
    .DialogTitle = "Save Game"
    .FileName = "*.qsg" 'to appear in textbox
    'the filter for the CommonDialog: before the
    ' | : what you see, after the | : what the
    'filter looks for as file extension
    .Filter = "Q-Bert II Savegame (*.qsg)|*.qsg"
    'These flags hide the 'Open as Read Only'
    'check box and prompts the user if the file
    'that he wants to save to already exists
    .Flags = cdlOFNHideReadOnly Or cdlOFNOverwritePrompt
ShowSaveAgain:
    .ShowSave 'Show it!
    If .FileName = "" Then 'no file
        GoTo ShowSaveAgain 'save unsuccessfull
    End If
End With

'now open the file (or create it & open it)
iFileNum = FreeFile
FileName = CommonDialog1.FileName
Open FileName For Output Lock Read Write As iFileNum
'write the player's level & score to the file
Write #iFileNum, LevelReached
Write #iFileNum, Score
'and clean up
Close iFileNum

Exit Sub 'we don't want to run the errhandler
'if no err was generated
errhandler:
If Err = cdlCancel Then 'user pressed cancel
    Exit Sub 'save failed
End If
'something bad happened. Display error & give
'user choice to end or continue program
Response = MsgBox("Error " & Err & " occurred when saving game:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbCritical + vbYesNo, "Q-bert II")
If Response = vbNo Then
    End
Else
    Resume Next
End If
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Sub UpdateBoard()               '
'           Paint changes to the board on   '
'           the screen                      '
'''''''''''''''''''''''''''''''''''''''''''''
Sub UpdateBoard()
Dim X, Y
For X = 1 To 10
    For Y = 1 To 10
        'if the cube picture is the what it
        'should be, leave it alone. Otherwise
        'set it to the right picture
        If Not (LastUpdated(X, Y) = GameBoard(X, Y, BLOCKTYPE)) Then
            picBoard(X & Y) = picCube(GameBoard(X, Y, BLOCKTYPE))
            LastUpdated(X, Y) = GameBoard(X, Y, BLOCKTYPE)
        End If
        'the next four are all wall checkers
        'if there's a wall on a cube,
        'set the cube's drawwidth to 10 so
        'it'll come out nice and fat.
        'then draw a line at the left, right,
        'top or bottom of the cube.
        If GameBoard(X, Y, LEFTWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (25, 0)-(25, CUBEHEIGHT)
        End If
        If GameBoard(X, Y, RIGHTWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (CUBEWIDTH - 25, 0)-(CUBEWIDTH - 25, CUBEHEIGHT)
        End If
        If GameBoard(X, Y, UPWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, 25)-(CUBEWIDTH, 25)
        End If
        If GameBoard(X, Y, DOWNWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, CUBEHEIGHT - 25)-(CUBEWIDTH, CUBEHEIGHT - 25)
        End If
        'now the doors.
        'the only difference between walls and
        'doors is that doors have a small line
        'in the middle of the wall in the color
        'of the door to make it apparent that
        'it's a door and which color it is.
        If GameBoard(X, Y, LEFTDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (25, 0)-(25, CUBEHEIGHT)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, LEFTDOORTYPE)
            picBoard(X & Y).Line (25, CUBEHEIGHT / 2 - 50)-(25, CUBEHEIGHT / 2 + 50)
            picBoard(X & Y).ForeColor = vbBlack
        End If
        If GameBoard(X, Y, RIGHTDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (CUBEWIDTH - 25, 0)-(CUBEWIDTH - 25, CUBEHEIGHT)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, RIGHTDOORTYPE)
            picBoard(X & Y).Line (CUBEWIDTH - 25, CUBEHEIGHT / 2 - 50)-(CUBEWIDTH - 25, CUBEHEIGHT / 2 + 50)
            picBoard(X & Y).ForeColor = vbBlack
        End If
        If GameBoard(X, Y, UPDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, 25)-(CUBEWIDTH, 25)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, UPDOORTYPE)
            picBoard(X & Y).Line (CUBEWIDTH / 2 - 50, 25)-(CUBEWIDTH / 2 + 50, 25)
            picBoard(X & Y).ForeColor = vbBlack
        End If
        If GameBoard(X, Y, DOWNDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, CUBEHEIGHT - 25)-(CUBEWIDTH, CUBEHEIGHT - 25)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, DOWNDOORTYPE)
            picBoard(X & Y).Line (CUBEWIDTH / 2 - 50, CUBEHEIGHT - 25)-(CUBEWIDTH / 2 + 50, CUBEHEIGHT - 25)
            picBoard(X & Y).ForeColor = vbBlack
        End If
    Next Y
Next X
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)'
'Call the KeyPressed sub to handle the keys pressed            '
'                                                              '
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
KeyPressed (KeyCode)
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub Form_Load()         '
'           Load the form                   '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub Form_Load()
'make sure everything is visible
Me.Refresh
'make everything ready to play
InitGame
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuAbout_Click()    '
'           Show the About Dialog           '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuAbout_Click()
'make it modal so that the user must exit the
'about dialog to continue in the main form
frmAbout.Show vbModal, Me
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuContinue_Click() '
'           Continue the game after pausing '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuContinue_Click()
'continue the game (after paused)
If GameStatus = PAUSEGAME Then
    GameStatus = YESGAME
    mnuContinue.Visible = False
    mnuPause.Visible = True
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuHelp_Click()     '
'           Show the Help Dialog            '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuHelp_Click()
'make it modal so that the player can't
'continue with the main form until closing the
'help dialog
frmHelp.Show vbModal, Me
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'          Private Sub mnuHighScores_Click()'
'          Show the highscores Dialog       '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuHighScores_Click()
ViewHighScores
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuLoadGame_Click() '
'           Load a game from a file         '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuLoadGame_Click()
'stop the current game
Call mnuStopGame_Click
'load a game from a file
LoadGame
'start the loaded game
GameStatus = YESGAME
mnuStopGame.Visible = True
mnuPause.Visible = True
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuNewGame_Click()  '
'           Start a new game                '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuNewGame_Click()
'start a new game
Call mnuStopGame_Click
GameStatus = YESGAME
mnuStopGame.Visible = True
mnuPause.Visible = True
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuPause_Click()    '
'           Pause the game                  '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuPause_Click()
'pause the game, if a game is busy
'In the Original Q-Bert, if Q-Bert was dead,
'you could select Pause and then Continue
'and Q-Bert would live again.
'Thanks, Skull Dugrey (skulldugrey@hotmail.com),
'for pointing that out to me.
'Here, that 'cheat' has been disabled.
'No (visible) cheats in Q-Bert II!
'Maybe in Q-Bert III. (see plans text file)
If GameStatus = YESGAME Then
    GameStatus = PAUSEGAME
    mnuContinue.Visible = True
    mnuPause.Visible = False
End If
End Sub


''''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuStopGame_Click()  '
'           Stop the game                    '
'                                            '
''''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuStopGame_Click()
'Initialize a new game without starting it
InitGame
GameStatus = NOTGAME
CurrentLevel = 1
mnuStopGame.Visible = False
mnuPause.Visible = False
mnuContinue.Visible = False
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Private Sub picBoard_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)'
'Call the KeyPressed sub to handle the keys pressed                                  '
'                                                                                    '
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub picBoard_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
KeyPressed (KeyCode)
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Private Sub picCube_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)'
'Call the KeyPressed sub to handle the keys pressed                                 '
'                                                                                   '
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub picCube_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
KeyPressed (KeyCode)
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Private Sub picInventory_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)'
'Call the KeyPressed sub to handle the keys pressed                                      '
'                                                                                        '
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub picInventory_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
KeyPressed (KeyCode)
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'          Private Sub tmrEverything_Timer()'
'          Where the baddies get moved      '
'          in sizable intervals             '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub tmrEverything_Timer()
Static BCounter As Integer
Dim CountingX As Integer
Dim BaddiesDisabled As Boolean
'only run this if there's a game on
If GameStatus = YESGAME Then
    'check if any baddies are enabled.
    'if any are, continue with the Timer
    BaddiesDisabled = True
    For CountingX = 1 To HowManyBaddies
        If Baddies(CountingX).Enabled = ACTIVE Then
            BaddiesDisabled = False
            Exit For
        End If
    Next CountingX
    If BaddiesDisabled = True Then
        Exit Sub
    End If
Tryagain:
    'if we've cycled through all the baddies,
    'restart at the first
    If BCounter > HowManyBaddies Then
        BCounter = 1
    End If
    'then we move the first available baddie,
    'and exit the sub
    If Baddies(BCounter).Enabled = ACTIVE Then
        Baddies(BCounter).Move
        BCounter = BCounter + 1
    Else
        BCounter = BCounter + 1
        GoTo Tryagain
    End If
End If
End Sub
