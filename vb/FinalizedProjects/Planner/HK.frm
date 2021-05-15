VERSION 5.00
Begin VB.Form HK 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Planner 2017"
   ClientHeight    =   12900
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   21015
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "HK.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   12900
   ScaleWidth      =   21015
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "31"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   30
      Left            =   18000
      TabIndex        =   60
      Top             =   10320
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   30
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   61
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   30
         Left            =   2760
         Picture         =   "HK.frx":014A
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "30"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   29
      Left            =   15000
      TabIndex        =   58
      Top             =   10320
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   29
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   59
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   29
         Left            =   2760
         Picture         =   "HK.frx":0294
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "29"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   28
      Left            =   12000
      TabIndex        =   56
      Top             =   10320
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   28
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   57
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   28
         Left            =   2760
         Picture         =   "HK.frx":03DE
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "28"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   27
      Left            =   9000
      TabIndex        =   54
      Top             =   10320
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   27
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   55
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   27
         Left            =   2760
         Picture         =   "HK.frx":0528
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "27"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   26
      Left            =   6000
      TabIndex        =   52
      Top             =   10320
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   26
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   53
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   26
         Left            =   2760
         Picture         =   "HK.frx":0672
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "26"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   25
      Left            =   3000
      TabIndex        =   50
      Top             =   10320
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   25
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   51
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   25
         Left            =   2760
         Picture         =   "HK.frx":07BC
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "25"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   24
      Left            =   0
      TabIndex        =   48
      Top             =   10320
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   24
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   49
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   24
         Left            =   2760
         Picture         =   "HK.frx":0906
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "24"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   23
      Left            =   18000
      TabIndex        =   46
      Top             =   7740
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   23
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   47
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   23
         Left            =   2760
         Picture         =   "HK.frx":0A50
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "23"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   22
      Left            =   15000
      TabIndex        =   44
      Top             =   7740
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   22
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   45
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   22
         Left            =   2760
         Picture         =   "HK.frx":0B9A
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "22"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   21
      Left            =   12000
      TabIndex        =   42
      Top             =   7740
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   21
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   43
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   21
         Left            =   2760
         Picture         =   "HK.frx":0CE4
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "21"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   20
      Left            =   9000
      TabIndex        =   40
      Top             =   7740
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   20
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   41
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   20
         Left            =   2760
         Picture         =   "HK.frx":0E2E
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   19
      Left            =   6000
      TabIndex        =   38
      Top             =   7740
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   19
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   39
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   19
         Left            =   2760
         Picture         =   "HK.frx":0F78
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "19"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   18
      Left            =   3000
      TabIndex        =   36
      Top             =   7740
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   18
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   37
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   18
         Left            =   2760
         Picture         =   "HK.frx":10C2
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "18"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   17
      Left            =   0
      TabIndex        =   34
      Top             =   7740
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   17
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   35
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   17
         Left            =   2760
         Picture         =   "HK.frx":120C
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "17"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   16
      Left            =   18000
      TabIndex        =   32
      Top             =   5160
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   16
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   33
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   16
         Left            =   2760
         Picture         =   "HK.frx":1356
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "16"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   15
      Left            =   15000
      TabIndex        =   30
      Top             =   5160
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   15
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   31
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   15
         Left            =   2760
         Picture         =   "HK.frx":14A0
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "15"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   14
      Left            =   12000
      TabIndex        =   28
      Top             =   5160
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   14
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   29
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   14
         Left            =   2760
         Picture         =   "HK.frx":15EA
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "14"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   13
      Left            =   9000
      TabIndex        =   26
      Top             =   5160
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   13
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   27
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   13
         Left            =   2760
         Picture         =   "HK.frx":1734
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "13"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   12
      Left            =   6000
      TabIndex        =   24
      Top             =   5160
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   12
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   25
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   12
         Left            =   2760
         Picture         =   "HK.frx":187E
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   11
      Left            =   3000
      TabIndex        =   22
      Top             =   5160
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   11
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   23
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   11
         Left            =   2760
         Picture         =   "HK.frx":19C8
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "11"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   10
      Left            =   0
      TabIndex        =   20
      Top             =   5160
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   10
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   21
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   10
         Left            =   2760
         Picture         =   "HK.frx":1B12
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   9
      Left            =   18000
      TabIndex        =   18
      Top             =   2580
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   9
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   9
         Left            =   2760
         Picture         =   "HK.frx":1C5C
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   8
      Left            =   15000
      TabIndex        =   16
      Top             =   2580
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   8
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   17
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   8
         Left            =   2760
         Picture         =   "HK.frx":1DA6
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   7
      Left            =   12000
      TabIndex        =   14
      Top             =   2580
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   7
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   7
         Left            =   2760
         Picture         =   "HK.frx":1EF0
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   6
      Left            =   9000
      TabIndex        =   12
      Top             =   2580
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   6
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   13
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   6
         Left            =   2760
         Picture         =   "HK.frx":203A
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   5
      Left            =   6000
      TabIndex        =   10
      Top             =   2580
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   5
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   5
         Left            =   2760
         Picture         =   "HK.frx":2184
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   4
      Left            =   3000
      TabIndex        =   8
      Top             =   2580
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   4
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   4
         Left            =   2760
         Picture         =   "HK.frx":22CE
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   3
      Left            =   0
      TabIndex        =   6
      Top             =   2580
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   3
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   3
         Left            =   2760
         Picture         =   "HK.frx":2418
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   2
      Left            =   18000
      TabIndex        =   4
      Top             =   0
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   2
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   5
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   2
         Left            =   2760
         Picture         =   "HK.frx":2562
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   1
      Left            =   15000
      TabIndex        =   2
      Top             =   0
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   1
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   3
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   1
         Left            =   2760
         Picture         =   "HK.frx":26AC
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Frame Fra 
      BackColor       =   &H00C0C0C0&
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Index           =   0
      Left            =   12000
      TabIndex        =   0
      Top             =   0
      Width           =   3015
      Begin VB.TextBox TeX 
         Height          =   2175
         HideSelection   =   0   'False
         Index           =   0
         Left            =   60
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   360
         Width           =   2895
      End
      Begin VB.Image ImX 
         Height          =   240
         Index           =   0
         Left            =   2760
         Picture         =   "HK.frx":27F6
         Top             =   0
         Width           =   240
      End
   End
   Begin VB.Image ACoM 
      Height          =   2415
      Left            =   11100
      Picture         =   "HK.frx":2940
      Stretch         =   -1  'True
      Top             =   60
      Width           =   795
   End
   Begin VB.Shape Sha 
      BorderColor     =   &H000080FF&
      BorderWidth     =   2
      Height          =   855
      Left            =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   4
      Left            =   3060
      Picture         =   "HK.frx":420F
      Stretch         =   -1  'True
      Tag             =   "06Junie"
      Top             =   1680
      Width           =   1830
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   11
      Left            =   8100
      Picture         =   "HK.frx":5A48
      Stretch         =   -1  'True
      Tag             =   "12Desember"
      Top             =   1680
      Width           =   2910
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   10
      Left            =   5040
      Picture         =   "HK.frx":7EA4
      Stretch         =   -1  'True
      Tag             =   "08Augustus"
      Top             =   840
      Width           =   2910
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   9
      Left            =   3060
      Picture         =   "HK.frx":A42D
      Stretch         =   -1  'True
      Tag             =   "04April"
      Top             =   0
      Width           =   1830
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   8
      Left            =   8100
      Picture         =   "HK.frx":BBBB
      Stretch         =   -1  'True
      Tag             =   "11November"
      Top             =   840
      Width           =   2910
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   7
      Left            =   5040
      Picture         =   "HK.frx":E202
      Stretch         =   -1  'True
      Tag             =   "07Julie"
      Top             =   0
      Width           =   1710
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   6
      Left            =   0
      Picture         =   "HK.frx":F922
      Stretch         =   -1  'True
      Tag             =   "03Maart"
      Top             =   1680
      Width           =   2190
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   5
      Left            =   8100
      Picture         =   "HK.frx":115C5
      Stretch         =   -1  'True
      Tag             =   "10Oktober"
      Top             =   0
      Width           =   2490
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   3
      Left            =   0
      Picture         =   "HK.frx":135E0
      Stretch         =   -1  'True
      Tag             =   "02Februarie"
      Top             =   840
      Width           =   2910
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   2
      Left            =   5040
      Picture         =   "HK.frx":15C2C
      Stretch         =   -1  'True
      Tag             =   "09September"
      Top             =   1680
      Width           =   2910
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   1
      Left            =   3060
      Picture         =   "HK.frx":1845A
      Stretch         =   -1  'True
      Tag             =   "05Mei"
      Top             =   840
      Width           =   1650
   End
   Begin VB.Image Imm 
      Appearance      =   0  'Flat
      Height          =   855
      Index           =   0
      Left            =   0
      Picture         =   "HK.frx":199C4
      Stretch         =   -1  'True
      Tag             =   "01Januarie"
      Top             =   0
      Width           =   2910
   End
End
Attribute VB_Name = "HK"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'Skrikkeljaar = Leap year
'Maand = Month
'Dag/Dae = Day/Days

'Finish date? NEVER

Dim CMaand As Integer, MP$, PaD$, BiT As String, FF, MaDa$(1 To 12), SkrikkelJaar As Boolean, Dae$(1 To 7)

Private Sub ACoM_Click()

   Dim space$()
   
   For i = 0 To 30
      'Create, then kill. Binary doesn't care if data have changed.
      'If data exist in file, write is passed
      Open PaD$ + CStr(i) + ".TeX" For Append As #5: Close #5
      Kill PaD$ + CStr(i) + ".TeX"
      
      Open PaD$ + CStr(i) + ".TeX" For Binary As #5
         Put #5, , TeX(i).Text
      Close #5
   Next i

End Sub

Private Sub Form_Load()
MDIForm1.Icon = HK.Icon

   '======test for not leap======
   'Dim Niw
   'Niw = "08-19-2015"
   '=============================
   
   FF = vbNewLine
   
   If Right$(App.Path, 1) = "\" Then
      MP$ = App.Path
   Else
      MP$ = App.Path + "\"
   End If
   
   'Get current year
   ak = Val(Format(Now, "yyyy")) 'to test, replace Now with Niw
   
   'Is current year a leap?
   SkrikkelJaar = False
   For i = 2012 To 2048 Step 4
      If ak = i Then
         SkrikkelJaar = True
         Exit For
      End If
   Next i
   
   'set 1st day of each month
   MaDa$(1) = Format("01-01-" & ak, "dddd")
   MaDa$(2) = Format("02-01-" & ak, "dddd")
   MaDa$(3) = Format("03-01-" & ak, "dddd")
   MaDa$(4) = Format("04-01-" & ak, "dddd")
   MaDa$(5) = Format("05-01-" & ak, "dddd")
   MaDa$(6) = Format("06-01-" & ak, "dddd")
   MaDa$(7) = Format("07-01-" & ak, "dddd")
   MaDa$(8) = Format("08-01-" & ak, "dddd")
   MaDa$(9) = Format("09-01-" & ak, "dddd")
   MaDa$(10) = Format("10-01-" & ak, "dddd")
   MaDa$(11) = Format("11-01-" & ak, "dddd")
   MaDa$(12) = Format("12-01-" & ak, "dddd")
   
   'set day names
   Dae$(1) = "Sunday"
   Dae$(2) = "Monday"
   Dae$(3) = "Tuesday"
   Dae$(4) = "Wednsday"
   Dae$(5) = "Thursday"
   Dae$(6) = "Friday"
   Dae$(7) = "Saturday"
   
   tel = 1
   
   'translate
   For i = 1 To 12
      If MaDa$(i) = "Sunday" Then
         MaDa$(i) = "Sunday"
      ElseIf MaDa$(i) = "Monday" Then
         MaDa$(i) = "Monday"
      ElseIf MaDa$(i) = "Tuesday" Then
         MaDa$(i) = "Tuesday"
      ElseIf MaDa$(i) = "Wednesday" Then
         MaDa$(i) = "Wednesday"
      ElseIf MaDa$(i) = "Thursday" Then
         MaDa$(i) = "Thursday"
      ElseIf MaDa$(i) = "Friday" Then
         MaDa$(i) = "Friday"
      ElseIf MaDa$(i) = "Saturday" Then
         MaDa$(i) = "Saturday"
      End If
   Next i
   HK.Caption = "Planner " & Format(Now, "yyyy")
   
MDIForm1.Caption = HK.Caption
HK.Caption = ""
MDIForm1.WindowState = vbMaximized


End Sub

Private Sub Imm_Click(Index As Integer)
         
   'move selector block to correct position
   Sha.Left = Imm(Index).Left
   Sha.Top = Imm(Index).Top
   Sha.Width = Imm(Index).Width
   Sha.Visible = True
   Sha.ZOrder
   CMaand = Index

   'DAYS of the month
   maand = Val(Left$(Imm(Index).Tag, 2))
      Fra(0).Caption = "1 " & MaDa$(maand)
      For i = 1 To 7
         If MaDa$(maand) = Dae$(i) Then
            tel = i + 1
            
            'if 1st day is Saturday
            If tel > 7 Then
               tel = 1
            End If
            Exit For
         End If
      Next i
      
      '====Set the max days per month
      If maand = 1 Or maand = 3 Or maand = 5 Or maand = 7 Or maand = 8 Or _
      maand = 10 Or maand = 12 Then
         tot = 31
      ElseIf maand = 2 Then
         If SkrikkelJaar = True Then
            tot = 29
         Else
            tot = 28
         End If
      Else
         tot = 30
      End If
      
      'set the day names
      For i = 1 To 30
         If i < tot Then
            Fra(i).Caption = i + 1 & " " & Dae$(tel)
         Else
            Fra(i).Caption = i + 1
         End If
         tel = tel + 1
         If tel > 7 Then tel = 1 Else
      Next i
   
   'create each month
   CDiR
   
   'get saved text
   GetTex

End Sub

Private Sub Imm_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
   
   'Just for user month selector
   For i = 0 To 11
      Imm(i).BorderStyle = 0
   Next i
   
   Imm(Index).BorderStyle = 1
   Imm(Index).ZOrder
   Sha.ZOrder

End Sub

Private Sub ImX_Click(Index As Integer)

   'X clears the text field
   TeX(Index).Text = ""
   
End Sub

Private Sub ImX_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
   
   'I forgot to place in the 1st creation before copy ... :)
   ImX(Index).ToolTipText = "Maak skoon"

End Sub

Sub CDiR()

   'Create each month
   On Local Error Resume Next
   
   MkDir MP$ + Imm(CMaand).Tag
   
   PaD$ = MP$ + Imm(CMaand).Tag + "\"
   
End Sub

Sub GetTex()

   'get tex field data
   For i = 0 To 30
      Open PaD$ + CStr(i) + ".TeX" For Append As #1: Close #1
      Open PaD$ + CStr(i) + ".TeX" For Binary As #5
         BeN = LOF(5)
         BiT = space$(BeN)
         Get #5, , BiT
      Close #5
      TeX(i).Text = BiT
   Next i
   
   'set bit to 1 to clear memory
   BiT = space$(1)

End Sub

