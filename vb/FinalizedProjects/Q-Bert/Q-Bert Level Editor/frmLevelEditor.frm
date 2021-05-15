VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmLevelEditor 
   Caption         =   "Q-Bert  Level Editor - (Untitled)"
   ClientHeight    =   8310
   ClientLeft      =   -2880
   ClientTop       =   735
   ClientWidth     =   11880
   Icon            =   "frmLevelEditor.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   8310
   ScaleMode       =   0  'User
   ScaleWidth      =   11880
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   28
      Left            =   5400
      Picture         =   "frmLevelEditor.frx":030A
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   142
      Top             =   7440
      Width           =   735
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4200
      Top             =   7680
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DialogTitle     =   "Open Level"
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   27
      Left            =   7680
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   140
      Top             =   120
      Width           =   735
      Begin VB.Line Line3 
         BorderColor     =   &H000000FF&
         BorderWidth     =   5
         X1              =   0
         X2              =   720
         Y1              =   0
         Y2              =   720
      End
      Begin VB.Line Line5 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   10
         X1              =   240
         X2              =   240
         Y1              =   300
         Y2              =   420
      End
      Begin VB.Line Line2 
         BorderWidth     =   10
         X1              =   480
         X2              =   480
         Y1              =   0
         Y2              =   720
      End
      Begin VB.Line Line1 
         BorderWidth     =   10
         X1              =   240
         X2              =   240
         Y1              =   0
         Y2              =   720
      End
   End
   Begin VB.PictureBox picBoxedIn2 
      Height          =   495
      Left            =   7800
      Picture         =   "frmLevelEditor.frx":52A8
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   137
      Top             =   7200
      Width           =   495
   End
   Begin VB.PictureBox picUpDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   7800
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   136
      Top             =   6960
      Width           =   495
   End
   Begin VB.PictureBox picDownDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   7800
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   135
      Top             =   7680
      Width           =   495
   End
   Begin VB.PictureBox picRightDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   8280
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   134
      Top             =   7200
      Width           =   255
   End
   Begin VB.PictureBox picLeftDoor 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   7560
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   133
      Top             =   7200
      Width           =   255
   End
   Begin VB.PictureBox picWallLeft 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   9720
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   132
      Top             =   7200
      Width           =   255
   End
   Begin VB.PictureBox picWallRight 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   10440
      ScaleHeight     =   465
      ScaleWidth      =   225
      TabIndex        =   131
      Top             =   7200
      Width           =   255
   End
   Begin VB.PictureBox PicWallDown 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   9960
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   130
      Top             =   7680
      Width           =   495
   End
   Begin VB.PictureBox picWallUp 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   9960
      ScaleHeight     =   225
      ScaleWidth      =   465
      TabIndex        =   129
      Top             =   6960
      Width           =   495
   End
   Begin VB.PictureBox picBoxedIn1 
      Height          =   495
      Left            =   9960
      Picture         =   "frmLevelEditor.frx":6428
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   128
      Top             =   7200
      Width           =   495
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
      TabIndex        =   113
      Top             =   840
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
      TabIndex        =   112
      Top             =   1560
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
      TabIndex        =   111
      Top             =   2280
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
      TabIndex        =   110
      Top             =   840
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
      TabIndex        =   109
      Top             =   1560
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
      TabIndex        =   108
      Top             =   2280
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
      TabIndex        =   107
      Top             =   840
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
      TabIndex        =   106
      Top             =   1560
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
      TabIndex        =   105
      Top             =   2280
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
      TabIndex        =   104
      Top             =   2280
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
      TabIndex        =   103
      Top             =   840
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
      TabIndex        =   102
      Top             =   1560
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
      TabIndex        =   101
      Top             =   2280
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
      TabIndex        =   100
      Top             =   840
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
      TabIndex        =   99
      Top             =   1560
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
      TabIndex        =   98
      Top             =   840
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
      TabIndex        =   97
      Top             =   1560
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
      TabIndex        =   96
      Top             =   2280
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
      TabIndex        =   95
      Top             =   840
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
      TabIndex        =   94
      Top             =   1560
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
      TabIndex        =   93
      Top             =   2280
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
      TabIndex        =   92
      Top             =   840
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
      TabIndex        =   91
      Top             =   1560
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
      TabIndex        =   90
      Top             =   2280
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
      TabIndex        =   89
      Top             =   840
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
      TabIndex        =   88
      Top             =   1560
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
      TabIndex        =   87
      Top             =   2280
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
      TabIndex        =   86
      Top             =   840
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
      TabIndex        =   85
      Top             =   1560
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
      TabIndex        =   84
      Top             =   2280
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
      TabIndex        =   83
      Top             =   3000
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
      TabIndex        =   82
      Top             =   3720
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
      TabIndex        =   81
      Top             =   4440
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
      TabIndex        =   80
      Top             =   3000
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
      TabIndex        =   79
      Top             =   3720
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
      TabIndex        =   78
      Top             =   4440
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
      TabIndex        =   77
      Top             =   3000
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
      TabIndex        =   76
      Top             =   3720
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
      TabIndex        =   75
      Top             =   4440
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
      TabIndex        =   74
      Top             =   4440
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
      TabIndex        =   73
      Top             =   3000
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
      TabIndex        =   72
      Top             =   3720
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
      TabIndex        =   71
      Top             =   4440
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
      TabIndex        =   70
      Top             =   3000
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
      TabIndex        =   69
      Top             =   3720
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
      TabIndex        =   68
      Top             =   3000
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
      TabIndex        =   67
      Top             =   3720
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
      TabIndex        =   66
      Top             =   4440
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
      TabIndex        =   65
      Top             =   3000
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
      TabIndex        =   64
      Top             =   3720
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
      TabIndex        =   63
      Top             =   4440
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
      Top             =   3000
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
      TabIndex        =   61
      Top             =   3720
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
      TabIndex        =   60
      Top             =   4440
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
      TabIndex        =   59
      Top             =   3000
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
      TabIndex        =   58
      Top             =   3720
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
      TabIndex        =   57
      Top             =   4440
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
      TabIndex        =   56
      Top             =   3000
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
      TabIndex        =   55
      Top             =   3720
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
      TabIndex        =   54
      Top             =   4440
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
      TabIndex        =   53
      Top             =   5160
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
      TabIndex        =   52
      Top             =   5880
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
      TabIndex        =   51
      Top             =   6600
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
      TabIndex        =   50
      Top             =   5160
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
      TabIndex        =   49
      Top             =   5880
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
      TabIndex        =   48
      Top             =   6600
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
      TabIndex        =   47
      Top             =   5160
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
      TabIndex        =   46
      Top             =   5880
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
      TabIndex        =   45
      Top             =   6600
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
      TabIndex        =   44
      Top             =   6600
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
      TabIndex        =   43
      Top             =   5160
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
      TabIndex        =   42
      Top             =   5880
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
      TabIndex        =   41
      Top             =   6600
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
      TabIndex        =   40
      Top             =   5160
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
      TabIndex        =   39
      Top             =   5880
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
      TabIndex        =   38
      Top             =   5160
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
      TabIndex        =   37
      Top             =   5880
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
      TabIndex        =   36
      Top             =   6600
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
      TabIndex        =   35
      Top             =   5160
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
      TabIndex        =   34
      Top             =   5880
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
      TabIndex        =   33
      Top             =   6600
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
      TabIndex        =   32
      Top             =   5160
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
      TabIndex        =   31
      Top             =   5880
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
      TabIndex        =   30
      Top             =   6600
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
      TabIndex        =   29
      Top             =   5160
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
      TabIndex        =   28
      Top             =   5880
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
      TabIndex        =   27
      Top             =   6600
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
      TabIndex        =   26
      Top             =   5160
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
      TabIndex        =   25
      Top             =   5880
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
      TabIndex        =   24
      Top             =   6600
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
      TabIndex        =   23
      Top             =   120
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
      TabIndex        =   22
      Top             =   120
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
      TabIndex        =   21
      Top             =   120
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
      TabIndex        =   20
      Top             =   120
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
      TabIndex        =   19
      Top             =   120
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
      TabIndex        =   18
      Top             =   120
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
      TabIndex        =   17
      Top             =   120
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
      TabIndex        =   16
      Top             =   120
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
      TabIndex        =   15
      Top             =   120
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
      TabIndex        =   14
      Top             =   120
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   9
      Left            =   7680
      Picture         =   "frmLevelEditor.frx":75A8
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   13
      Top             =   6000
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   1
      Left            =   7680
      Picture         =   "frmLevelEditor.frx":9F0E
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   12
      Top             =   960
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   3
      Left            =   7680
      Picture         =   "frmLevelEditor.frx":B08E
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   11
      Top             =   1800
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   5
      Left            =   7680
      Picture         =   "frmLevelEditor.frx":D0A4
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   10
      Top             =   2640
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   6
      Left            =   7680
      Picture         =   "frmLevelEditor.frx":E974
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   9
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   7
      Left            =   7680
      Picture         =   "frmLevelEditor.frx":10244
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   8
      Top             =   4320
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   8
      Left            =   7680
      Picture         =   "frmLevelEditor.frx":11B14
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   7
      Top             =   5160
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   14
      Left            =   9840
      Picture         =   "frmLevelEditor.frx":133E4
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   6
      Top             =   3480
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   10
      Left            =   9840
      Picture         =   "frmLevelEditor.frx":15C2E
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   5
      Top             =   120
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   11
      Left            =   9840
      Picture         =   "frmLevelEditor.frx":1854A
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   4
      Top             =   960
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   12
      Left            =   9840
      Picture         =   "frmLevelEditor.frx":1AEB0
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   3
      Top             =   1800
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   13
      Left            =   9840
      Picture         =   "frmLevelEditor.frx":1D816
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   2
      Top             =   2640
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   17
      Left            =   9840
      Picture         =   "frmLevelEditor.frx":1F02A
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   1
      Top             =   4320
      Width           =   735
   End
   Begin VB.PictureBox picCube 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   735
      Index           =   16
      Left            =   9840
      Picture         =   "frmLevelEditor.frx":20C84
      ScaleHeight     =   705
      ScaleWidth      =   705
      TabIndex        =   0
      Top             =   5160
      Width           =   735
   End
   Begin VB.Label Label19 
      Caption         =   "This sets the trapblocks (see help for more info)."
      Height          =   855
      Left            =   6240
      TabIndex        =   143
      Top             =   7440
      Width           =   1215
   End
   Begin VB.Label Label18 
      Caption         =   "This will delete all wall, doors and trap blocks."
      Height          =   735
      Left            =   8520
      TabIndex        =   141
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label17 
      Caption         =   "Use this to make walls (see help for info)"
      Height          =   855
      Left            =   10800
      TabIndex        =   139
      Top             =   7080
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "Use this tool to make doors (see help for info)"
      Height          =   855
      Left            =   8640
      TabIndex        =   138
      Top             =   7080
      Width           =   1095
   End
   Begin VB.Label Label15 
      Caption         =   "This cube has a baddie and a blue key."
      Height          =   735
      Left            =   8520
      TabIndex        =   127
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Label Label14 
      Caption         =   "Q-Bert is on this cube."
      Height          =   735
      Left            =   10680
      TabIndex        =   126
      Top             =   4320
      Width           =   1215
   End
   Begin VB.Label Label13 
      Caption         =   "This cube is not jumped, and has a gun with 8 bullets."
      Height          =   855
      Left            =   10680
      TabIndex        =   125
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label12 
      Caption         =   "This cube has a baddie and a red key."
      Height          =   735
      Left            =   10680
      TabIndex        =   124
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label11 
      Caption         =   "This cube has a baddie and a green key."
      Height          =   735
      Left            =   10680
      TabIndex        =   123
      Top             =   1800
      Width           =   1215
   End
   Begin VB.Label Label10 
      Caption         =   "This cube has a baddie and a gun with 8 bullets."
      Height          =   855
      Left            =   10680
      TabIndex        =   122
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label Label9 
      Caption         =   "This cube has a baddie and a yellow key."
      Height          =   735
      Left            =   10680
      TabIndex        =   121
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label8 
      Caption         =   "The transporter: use to go to next level."
      Height          =   735
      Left            =   10680
      TabIndex        =   120
      Top             =   5160
      Width           =   1215
   End
   Begin VB.Label Label7 
      Caption         =   "This cube is not jumped on, and has a green key."
      Height          =   735
      Left            =   8520
      TabIndex        =   119
      Top             =   5160
      Width           =   1215
   End
   Begin VB.Label Label6 
      Caption         =   "This cube is not jumped on, and has a red key."
      Height          =   735
      Left            =   8520
      TabIndex        =   118
      Top             =   4320
      Width           =   1215
   End
   Begin VB.Label Label5 
      Caption         =   "This cube is not jumped on, and a baddie is on it."
      Height          =   735
      Left            =   8520
      TabIndex        =   117
      Top             =   1800
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "This cube is not jumped, and has a blue key."
      Height          =   735
      Left            =   8520
      TabIndex        =   116
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "This cube is not jumped, and has a yellow key."
      Height          =   735
      Left            =   8520
      TabIndex        =   115
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "This cube is not jumped on."
      Height          =   735
      Left            =   8520
      TabIndex        =   114
      Top             =   960
      Width           =   1215
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuNew 
         Caption         =   "&New"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "&Open"
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuSave 
         Caption         =   "&Save"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuSaveAs 
         Caption         =   "&Save As"
      End
      Begin VB.Menu mnuline 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
      End
   End
   Begin VB.Menu mnuHelper 
      Caption         =   "&Help"
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
Attribute VB_Name = "frmLevelEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'This level editor is for Q-Bert
'A few notes:
'a) I made this program because I realized
'   that just coding this in once is better
'   than having to hard code in EVERY level
'b) Please note that there is NO checker of
'   valididity of the levels made. It just reads,
'   creates and writes them. But beware! If you
'   create invalid levels (ex: 2 transporters, 2
'   Q-berts, etc...) then it will wreak havoc with
'   the game.
'e) Muku iz gr8 fyi

'''''''''''''''''''''''''''''''''''''''''''''
'           Sub Initlevel()                 '
'           Initialize level                '
'''''''''''''''''''''''''''''''''''''''''''''
Sub InitLevel()
'here's where we clear the gameboard,
'lastupdated, and transporterhere variables to
'their default state.
Dim CountX As Integer, CountY As Integer 'counters
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
        LastUpdated(CountX, CountY, BLOCKTYPE) = NO
        TransporterHere(CountX, CountY) = NO
    Next CountY
Next CountX
UpdateBoard
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Sub InputLevel()                '
'           Get the level from file         '
'''''''''''''''''''''''''''''''''''''''''''''
Sub InputLevel()
On Error GoTo errhandler 'you never know what can go wrong!
Dim FileName As String
Dim iFileNum As Integer
Dim CountX As Integer
Dim CountY As Integer
Dim CountZ As Integer
iFileNum = FreeFile 'set it to the next available slot (should be 1)
FileName = CurrentFileName
'open: VB keyword For Input: We want to read from
'the file Lock Read Write: nobody else can Read
'or write As iFilenum: which file to open it (1 to 255)
Open CurrentFileName For Input Lock Read Write As iFileNum
For CountX = 1 To 10 'X axis
    For CountY = 1 To 10 'Y axis
        'All the things. Beware! Nothing to do with 3D!
        For CountZ = 1 To MAXNEEDEDDIMENSIONS
            Input #iFileNum, GameBoard(CountX, CountY, CountZ)
        Next CountZ
        Input #iFileNum, TransporterHere(CountX, CountY)
        'clear the board while we're at it: wouldn't
        'want any lines to stay
        picBoard(CountX & CountY).Cls
    Next CountY
Next CountX
'clean up when done
Close iFileNum
'put our newly aquired data on screen
UpdateBoard
Exit Sub 'we don't want errhandler to execute if there's no err
errhandler:
Dim Response
'display err and ask to continue
Response = MsgBox("Error " & Err & " occured:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbCritical + vbYesNo, "Level Editor Error")
If Response = vbNo Then
    End 'if user wants to end then end
Else ' if user wants to continue then resume
    Resume Next
End If
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Function Openlevel() As Boolean '
'           Get the level to open from      '
'           The CommonDialog box.           '
'''''''''''''''''''''''''''''''''''''''''''''
Function OpenLevel() As Boolean
On Error GoTo errhandler 'if the user pressed Cancel
Dim iFileNum As Integer
With CommonDialog1
    .CancelError = True 'if user pressed cancel=generate err
    .DialogTitle = "Open Level"
    .FileName = "*.qlv" 'to be displayed in the txtbox
    'the filter for the CommonDialog: before the
    ' | : what you see, after the | : what the
    'filter looks for as file extension
    .Filter = "Q-Bert II Level (*.qlv)|*.qlv"
    'this hides the 'Open as Read Only' check box
    .Flags = cdlOFNHideReadOnly
    'Now show it!
    .ShowOpen
    If .FileName = "" Then 'if no file
        OpenLevel = False 'not succeeded
        Exit Function
    End If
    CurrentFileName = .FileName
End With
InputLevel 'get level from file
Exit Function 'get out: we don't want to run the
'errhandler if there is no error!
errhandler:
If Err = cdlCancel Then 'if user pressed Cancel
    OpenLevel = False 'open failed
    Exit Function
End If
End Function


'''''''''''''''''''''''''''''''''''''''''''''
'           Function SaveLevel() As Boolean '
'           (Save As procedure): Get file   '
'           to save to from CommonDialog    '
'''''''''''''''''''''''''''''''''''''''''''''
Function SaveLevel() As Boolean
On Error GoTo errhandler 'If user pressed cancel, a err is generated
Dim iFileNum As Integer
With CommonDialog1
    .CancelError = True 'if user pressess cancel=generate err
    .DialogTitle = "Save Level"
    .FileName = "*.qlv" 'to appear in textbox
    'the filter for the CommonDialog: before the
    ' | : what you see, after the | : what the
    'filter looks for as file extension
    .Filter = "Q-Bert II Level (*.qlv)|*.qlv"
    'These flags hide the 'Open as Read Only'
    'check box and prompts the user if the file
    'that he wants to save to already exists
    .Flags = cdlOFNHideReadOnly Or cdlOFNOverwritePrompt
    .ShowSave 'Show it!
    If .FileName = "" Then 'no file
        SaveLevel = False 'save unsuccessfull
        Exit Function
    End If
    SaveLevel = True
    CurrentFileName = .FileName
    frmLevelEditor.Caption = "Q-Bert II Level Editor - " & CurrentFileName
End With
WriteLevel 'write to file
Exit Function 'we don't want to run the errhandler
'if no err was generated
errhandler:
If Err = cdlCancel Then 'user pressed cancel
    SaveLevel = False 'save failed
End If
End Function
'''''''''''''''''''''''''''''''''''''''''''''
'           Sub UpdateBoard()               '
'           Where the board gets painted    '
'           on the pictureboxes             '
'''''''''''''''''''''''''''''''''''''''''''''
Sub UpdateBoard()
Dim X, Y
For X = 1 To 10 'X axis
    For Y = 1 To 10 'Y axis
        
        'check if block itself needs updateing,
        'if so, paint the new block on
        If Not (LastUpdated(X, Y, BLOCKTYPE) = GameBoard(X, Y, BLOCKTYPE)) Then
            picBoard(X & Y) = picCube(GameBoard(X, Y, BLOCKTYPE))
            LastUpdated(X, Y, BLOCKTYPE) = GameBoard(X, Y, BLOCKTYPE)
        End If
        
        'check if the left wall is on,
        'if it is, draw a line across the left
        If GameBoard(X, Y, LEFTWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (25, 0)-(25, CUBEHEIGHT)
        End If
        
        'check if the right wall is on,
        'if it is, draw a line across the right
        If GameBoard(X, Y, RIGHTWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (CUBEWIDTH - 25, 0)-(CUBEWIDTH - 25, CUBEHEIGHT)
        End If
        
        'check if the up wall is on,
        'if it is, draw a line across the top
        If GameBoard(X, Y, UPWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, 25)-(CUBEWIDTH, 25)
        End If
        
        'check if the down wall is on,
        'if it is, draw a line across the bottom
        If GameBoard(X, Y, DOWNWALL) = YES Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, CUBEHEIGHT - 25)-(CUBEWIDTH, CUBEHEIGHT - 25)
        End If
        
        'check if the left door is on,
        'if it is, draw a line across the left,
        'and put a colored blob in the middle of
        'the line to indicate which door it is
        If GameBoard(X, Y, LEFTDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (25, 0)-(25, CUBEHEIGHT)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, LEFTDOORTYPE)
            picBoard(X & Y).Line (25, CUBEHEIGHT / 2 - 50)-(25, CUBEHEIGHT / 2 + 50)
            picBoard(X & Y).ForeColor = vbBlack
        End If
        
        'check if the right door is on,
        'if it is, draw a line across the right,
        'and put a colored blob in the middle of
        'the line to indicate which door it is
        If GameBoard(X, Y, RIGHTDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (CUBEWIDTH - 25, 0)-(CUBEWIDTH - 25, CUBEHEIGHT)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, RIGHTDOORTYPE)
            picBoard(X & Y).Line (CUBEWIDTH - 25, CUBEHEIGHT / 2 - 50)-(CUBEWIDTH - 25, CUBEHEIGHT / 2 + 50)
            picBoard(X & Y).ForeColor = vbBlack
        End If
        
        'check if the up door is on,
        'if it is, draw a line across the top,
        'and put a colored blob in the middle of
        'the line to indicate which door it is
        If GameBoard(X, Y, UPDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, 25)-(CUBEWIDTH, 25)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, UPDOORTYPE)
            picBoard(X & Y).Line (CUBEWIDTH / 2 - 50, 25)-(CUBEWIDTH / 2 + 50, 25)
            picBoard(X & Y).ForeColor = vbBlack
        End If
        
        'check if the down door is on,
        'if it is, draw a line across the bottom,
        'and put a colored blob in the middle of
        'the line to indicate which door it is
        If GameBoard(X, Y, DOWNDOORTYPE) <> NO Then
            picBoard(X & Y).DrawWidth = 10
            picBoard(X & Y).Line (0, CUBEHEIGHT - 25)-(CUBEWIDTH, CUBEHEIGHT - 25)
            picBoard(X & Y).ForeColor = GameBoard(X, Y, DOWNDOORTYPE)
            picBoard(X & Y).Line (CUBEWIDTH / 2 - 50, CUBEHEIGHT - 25)-(CUBEWIDTH / 2 + 50, CUBEHEIGHT - 25)
            picBoard(X & Y).ForeColor = vbBlack
        End If
        
        'this is special for the level editor
        '(the rest is identical to the Game)
        'Here the trapblock gets indicated by
        'a thin cross on the picture box
        If GameBoard(X, Y, TRAPBLOCK) = YES Then
            picBoard(X & Y).DrawWidth = 3
            picBoard(X & Y).Line (0, 0)-(CUBEWIDTH, CUBEHEIGHT)
            picBoard(X & Y).Line (0, CUBEHEIGHT)-(CUBEWIDTH, 0)
        End If
    Next Y
Next X
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Sub WriteLevel()                '
'           Put the level in a file         '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Sub WriteLevel()
On Error GoTo errhandler 'you never know!
Dim FileName As String
Dim iFileNum As Integer
Dim CountX As Integer
Dim CountY As Integer
Dim CountZ As Integer
iFileNum = FreeFile 'set it to the next available fileslot (should be 1)
FileName = CurrentFileName
'open: VB keyword For Output: We want to write to
'the file Lock Read Write: nobody else can Read
'or write As iFilenum: which file to open it (1 to 255)
Open CurrentFileName For Output Lock Read Write As iFileNum
For CountX = 1 To 10 'X axis
    For CountY = 1 To 10 'Y axis
        For CountZ = 1 To MAXNEEDEDDIMENSIONS 'all the stuff to write
            Write #iFileNum, GameBoard(CountX, CountY, CountZ) 'write
        Next CountZ
        Write #iFileNum, TransporterHere(CountX, CountY) 'write
    Next CountY
Next CountX
Close iFileNum 'clean up
Exit Sub 'we don't want errhandler to execute if there's no err
errhandler:
Dim Response
'display err and ask to continue
Response = MsgBox("Error " & Err & " occured:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbCritical + vbYesNo, "Level Editor Error")
If Response = vbNo Then
    End 'if user wants to end then end
Else ' if user wants to continue then resume
    Resume Next
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub Form_Load()         '
'           Initialize a few things for the '
'           first time                      '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub Form_Load()
InitLevel 'set things to their default
'we start with open doors:
LeftDoorColor = DOOROPEN
RightDoorColor = DOOROPEN
UpDoorColor = DOOROPEN
DownDoorColor = DOOROPEN
'We don't have anything loaded yet...
CurrentFileName = "(Untitled)"
End Sub



'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuAbout_Click()    '
'           Qhow the About Form: frmAbout   '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuAbout_Click()
'frmAbout.Show: This shows the frmAbout form
'vbModal: This tells VB to make it that the user
'can't go back to the user form without exiting
'the modal one first
'Me: The object to display it modal over
frmAbout.Show vbModal, Me
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuExit_Click()                 '
'           Exit the program                '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuExit_Click()
Dim Response
Dim SaveResult As Boolean
'See if the user wants to save changes
Response = MsgBox("Do you want to save changes?", vbQuestion + vbYesNo, "Level Editor")
'if he doesn't...end
If Response = vbNo Then
    End
'but if he does, then save...
ElseIf Response = vbYes Then
    If CurrentFileName = "(Untitled)" Then
        SaveResult = SaveLevel
    Else
        SaveResult = True
        WriteLevel
    End If
    'check if the user saved, like he wanted to
    'if he didn't, exit, the user must've done
    'something wrong
    If SaveResult = False Then
        Exit Sub
    Else
    'if everything went OK...end
        End
    End If
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuHelp_Click()     '
'           Shows the Help Form: frmHelp    '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuHelp_Click()
'frmHelp.Show: This shows the frmHelp form
'vbModal: This tells VB to make it that the user
'can't go back to the user form without exiting
'the modal one first
'Me: The object to display it modal over
frmHelp.Show vbModal, Me
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuNew_Click()      '
'           Makes a new Level               '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuNew_Click()
Dim Response
Dim SaveResult As Boolean
'See if the user wants to save changes
Response = MsgBox("Do you want to save changes?", vbQuestion + vbYesNo, "Level Editor")
'if he doesn't...start new level
If Response = vbNo Then
    InitLevel
    frmLevelEditor.Caption = "Q-Bert II Level Editor - (Untitled)"
    CurrentFileName = "(Untitled)"
'but if he does, then save...
ElseIf Response = vbYes Then
    If CurrentFileName = "(Untitled)" Then
        SaveResult = SaveLevel
    Else
        SaveResult = True
        WriteLevel
    End If
    'check if the user saved, like he wanted to
    'if he didn't, exit, the user must've done
    'something wrong
    If SaveResult = False Then
        Exit Sub
    Else
    'if everything went OK...start a new level
    InitLevel
    frmLevelEditor.Caption = "Q-Bert II Level Editor - (Untitled)"
    CurrentFileName = "(Untitled)"
    End If
End If
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuOpen_Click()     '
'           Opens a Level                   '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuOpen_Click()
Dim Response
Dim SaveResult As Boolean
'See if the user wants to save changes
Response = MsgBox("Do you want to save changes?", vbQuestion + vbYesNo, "Level Editor")
'if he doesn't...open a level
If Response = vbNo Then
    OpenLevel
    frmLevelEditor.Caption = "Q-Bert II Level Editor - " & CurrentFileName
'but if he does, then save...
ElseIf Response = vbYes Then
    If CurrentFileName = "(Untitled)" Then
        SaveResult = SaveLevel
    Else
        SaveResult = True
        WriteLevel
    End If
    'check if the user saved, like he wanted to
    'if he didn't, exit, the user must've done
    'something wrong
    If SaveResult = False Then
        Exit Sub
    Else
    'if everything went OK...open the level
        OpenLevel
        frmLevelEditor.Caption = "Q-Bert II Level Editor - " & CurrentFileName
    End If
End If

End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuSave_Click()     '
'           Save the current level          '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuSave_Click()
'if the level hasn't been saved before,
'show the Save As Dialog first
If CurrentFileName = "(Untitled)" Then
    SaveLevel
Else
'if it has been saved befor, just write over it
    WriteLevel
End If
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub mnuSaveAs_Click()   '
'           Saves a level by first showing  '
'           The Save As Dialog              '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub mnuSaveAs_Click()
'show the Save As Dialog
SaveLevel
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picBoard_Click()    '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picBoard_Click(Index As Integer)
Dim TempStr As String, ParsedStr(3) As String
Dim ParseX As Integer, ParseY As Integer
'make the index a string
TempStr = Index
'if X and Y are both single digits (ex: 5 5)
'then we just take the outer digits
If Len(TempStr) = 2 Then
    ParsedStr(0) = Left(TempStr, 1)
    ParsedStr(1) = Right(TempStr, 1)
    'however, if it's three digits long, it must
    'have a 10 in there: check if the 0 from the
    '10 is the last one, if it is, it must
    'be the Y that has the 10 (ex: 5 10)
    'Note: the first block each way (X & Y) is 1,
    'not 0, so a 0 only can be there because of
    'the 10!
ElseIf Len(TempStr) = 3 Then
    ParsedStr(0) = Right(TempStr, 1)
    If ParsedStr(0) = 0 Then
        ParsedStr(0) = Left(TempStr, 1)
        ParsedStr(1) = Right(TempStr, 2)
    Else
        ParsedStr(0) = Left(TempStr, 2)
        ParsedStr(1) = Right(TempStr, 1)
    End If
Else 'it is 4 digits long: both X & Y are 10.
    ParsedStr(0) = Left(TempStr, 2)
    ParsedStr(1) = Right(TempStr, 2)
End If
'Now convert them back to values instead
'of strings
ParseX = Val(ParsedStr(0))
ParseY = Val(ParsedStr(1))

If CurrentTool = 0 Then 'no tool selected
    MsgBox "Please select a tool first!", vbExclamation, "Level Editor"
    Exit Sub
ElseIf CurrentTool < 18 Then 'block tool selected
    GameBoard(ParseX, ParseY, BLOCKTYPE) = CurrentTool
ElseIf CurrentTool < 23 Then 'wall tool selected
    'first, set the wall to yes... (Currenttool-17
    'gives us the right number in the GameBoard
    'collection
    GameBoard(ParseX, ParseY, CurrentTool - 17) = YES
    'Then we set the door to no: there can't be a door
    'and a wall there at the same time!
    GameBoard(ParseX, ParseY, CurrentTool - 13) = NO

'these are all door tools: we must set the right
'door to the right color and we must turn off any
'walls: walls and doors can't be in the same place
ElseIf CurrentTool = LEFTDOORTOOL Then
    GameBoard(ParseX, ParseY, LEFTDOORTYPE) = LeftDoorColor
    GameBoard(ParseX, ParseY, LEFTWALL) = NO
ElseIf CurrentTool = RIGHTDOORTOOL Then
    GameBoard(ParseX, ParseY, RIGHTDOORTYPE) = RightDoorColor
    GameBoard(ParseX, ParseY, RIGHTWALL) = NO
ElseIf CurrentTool = UPDOORTOOL Then
    GameBoard(ParseX, ParseY, UPDOORTYPE) = UpDoorColor
    GameBoard(ParseX, ParseY, UPWALL) = NO
ElseIf CurrentTool = DOWNDOORTOOL Then
    GameBoard(ParseX, ParseY, DOWNDOORTYPE) = DownDoorColor
    GameBoard(ParseX, ParseY, DOWNWALL) = NO
ElseIf CurrentTool = CLEARTOOL Then
    'this tool clears all walls, doors and
    'trapblocks on the selected picture
    GameBoard(ParseX, ParseY, LEFTWALL) = NO
    GameBoard(ParseX, ParseY, RIGHTWALL) = NO
    GameBoard(ParseX, ParseY, UPWALL) = NO
    GameBoard(ParseX, ParseY, DOWNWALL) = NO
    GameBoard(ParseX, ParseY, LEFTDOORTYPE) = NO
    GameBoard(ParseX, ParseY, RIGHTDOORTYPE) = NO
    GameBoard(ParseX, ParseY, UPDOORTYPE) = NO
    GameBoard(ParseX, ParseY, DOWNDOORTYPE) = NO
    GameBoard(ParseX, ParseY, TRAPBLOCK) = NO
    'since these are all lines, we need to Clear
    'the picture box before we see any difference
    picBoard(Index).Cls
ElseIf CurrentTool = TRAPBLOCKSETTER Then
    'this sets the trapblock
    GameBoard(ParseX, ParseY, TRAPBLOCK) = YES
End If

'initialize a couple special things; now we will
'check them and set them accordingly
If CurrentTool < 18 Then
    TransporterHere(ParseX, ParseY) = NO
    GameBoard(ParseX, ParseY, BADDIETHERE) = NO
    GameBoard(ParseX, ParseY, JUMPED) = NO
    If CurrentTool = BADDIENOJUMP Then
        GameBoard(ParseX, ParseY, BADDIETHERE) = YES
    ElseIf CurrentTool > 8 And CurrentTool < 13 Then
        'Baddie with key
        GameBoard(ParseX, ParseY, BADDIETHERE) = YES
    ElseIf CurrentTool = BADDIEGUN Then
        GameBoard(ParseX, ParseY, BADDIETHERE) = YES
    ElseIf CurrentTool = TRANSPORTER Then
        TransporterHere(ParseX, ParseY) = YES
        'Usually the Transporter is Surrounded by walls
        'and the only way to get them down is to
        'jump on all the jumpable cubes, meaning that
        'this cube has to be jumped on,
        'we can't expect Q-Bert to jump on it if there
        'are walls around it?!
        GameBoard(ParseX, ParseY, JUMPED) = YES
    ElseIf CurrentTool = QBERT Then
        'Where q-bert is, he already jumped
        GameBoard(ParseX, ParseY, JUMPED) = YES
    End If
End If
'Now bring our changes on screen!
UpdateBoard
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picCube_Click()     '
'           Set the Current tool to the      '
'           selected picture box            '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picCube_Click(Index As Integer)
'set the active tool to the picture selected
CurrentTool = Index
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picDownDoor_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picDownDoor_Click()
CurrentTool = DOWNDOORTOOL
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'         Private Sub picDownDoor_DblClick()'
'         Set the current color of the down '
'         door tool to the picture clicked  '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picDownDoor_DblClick()
'rotate the colors
If DownDoorColor = DOOROPEN Then
    DownDoorColor = DOORBLUE
ElseIf DownDoorColor = DOORBLUE Then
    DownDoorColor = DOORYELLOW
ElseIf DownDoorColor = DOORYELLOW Then
    DownDoorColor = DOORRED
ElseIf DownDoorColor = DOORRED Then
    DownDoorColor = DOORGREEN
Else
    DownDoorColor = DOOROPEN
End If
picDownDoor.BackColor = DownDoorColor
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picLeftDoor_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picLeftDoor_Click()
CurrentTool = LEFTDOORTOOL
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'         Private Sub picLeftDoor_DblClick()'
'         Set the current color of the left '
'         door tool to the picture clicked  '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picLeftDoor_DblClick()
'rotate the colors
If LeftDoorColor = DOOROPEN Then
    LeftDoorColor = DOORBLUE
ElseIf LeftDoorColor = DOORBLUE Then
    LeftDoorColor = DOORYELLOW
ElseIf LeftDoorColor = DOORYELLOW Then
    LeftDoorColor = DOORRED
ElseIf LeftDoorColor = DOORRED Then
    LeftDoorColor = DOORGREEN
Else
    LeftDoorColor = DOOROPEN
End If
picLeftDoor.BackColor = LeftDoorColor
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picRightDoor_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picRightDoor_Click()
CurrentTool = RIGHTDOORTOOL
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'        Private Sub picRightDoor_DblClick()'
'        Set the current color of the right '
'        door tool to the picture clicked   '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picRightDoor_DblClick()
'rotate the colors
If RightDoorColor = DOOROPEN Then
    RightDoorColor = DOORBLUE
ElseIf RightDoorColor = DOORBLUE Then
    RightDoorColor = DOORYELLOW
ElseIf RightDoorColor = DOORYELLOW Then
    RightDoorColor = DOORRED
ElseIf RightDoorColor = DOORRED Then
    RightDoorColor = DOORGREEN
Else
    RightDoorColor = DOOROPEN
End If
picRightDoor.BackColor = RightDoorColor
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picUpDoor_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picUpDoor_Click()
CurrentTool = UPDOORTOOL
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'         Private Sub picUpDoor_DblClick()  '
'         Set the current color of the up   '
'         door tool to the picture clicked  '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picUpDoor_DblClick()
'rotate the colors
If UpDoorColor = DOOROPEN Then
    UpDoorColor = DOORBLUE
ElseIf UpDoorColor = DOORBLUE Then
    UpDoorColor = DOORYELLOW
ElseIf UpDoorColor = DOORYELLOW Then
    UpDoorColor = DOORRED
ElseIf UpDoorColor = DOORRED Then
    UpDoorColor = DOORGREEN
Else
    UpDoorColor = DOOROPEN
End If
picUpDoor.BackColor = UpDoorColor
End Sub


'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picWallDown_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub PicWallDown_Click()
CurrentTool = DOWNWALLTOOL
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picWallLeft_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picWallLeft_Click()
CurrentTool = LEFTWALLTOOL
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picWallRight_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picWallRight_Click()
CurrentTool = RIGHTWALLTOOL
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub picWallUp_Click() '
'           Set the current selected tool   '
'           to the picture clicked          '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub picWallUp_Click()
CurrentTool = UPWALLTOOL
End Sub


