VERSION 5.00
Begin VB.Form Design 
   AutoRedraw      =   -1  'True
   Caption         =   "Design"
   ClientHeight    =   10065
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   3645
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   671
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   243
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame EyeFrame 
      Caption         =   "Eyes"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4335
      Left            =   120
      TabIndex        =   10
      Top             =   1800
      Width           =   1635
      Begin VB.HScrollBar InnerFieldScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   82
         Top             =   5220
         Value           =   40
         Width           =   1395
      End
      Begin VB.HScrollBar OuterFOVScroll 
         Height          =   255
         Left            =   120
         Max             =   360
         Min             =   90
         TabIndex        =   60
         Top             =   3240
         Value           =   162
         Width           =   1395
      End
      Begin VB.HScrollBar InnerFOVScroll 
         Height          =   255
         Left            =   120
         Max             =   -180
         Min             =   -1
         TabIndex        =   59
         Top             =   2700
         Value           =   -58
         Width           =   1395
      End
      Begin VB.HScrollBar EyeSpaceScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   20
         TabIndex        =   13
         Top             =   660
         Value           =   60
         Width           =   1395
      End
      Begin VB.HScrollBar EyesForwardScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   12
         Top             =   1740
         Value           =   44
         Width           =   1395
      End
      Begin VB.HScrollBar EyeRadiusScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   20
         TabIndex        =   11
         Top             =   1200
         Value           =   60
         Width           =   1395
      End
      Begin VB.Label Label9 
         Caption         =   "Facets is in Addressing"
         Height          =   555
         Left            =   180
         TabIndex        =   91
         Top             =   3660
         Width           =   1335
      End
      Begin VB.Label InnerFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "000"
         Height          =   240
         Left            =   1140
         TabIndex        =   86
         Top             =   4980
         Width           =   375
      End
      Begin VB.Label Label26 
         Caption         =   "%Facets"
         Height          =   255
         Left            =   180
         TabIndex        =   85
         Top             =   4980
         Width           =   915
      End
      Begin VB.Label Label29 
         Alignment       =   2  'Center
         Caption         =   " Inner Facets "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   84
         ToolTipText     =   "Inner Field is where ""Twd"" Towards bit comes from, sees percentage of entire Field Of View selected by scroll."
         Top             =   4740
         Width           =   1515
      End
      Begin VB.Label InnerFacetsLabel 
         AutoSize        =   -1  'True
         Caption         =   "InnerFacets"
         Height          =   240
         Left            =   180
         TabIndex        =   83
         Top             =   5460
         Width           =   1230
      End
      Begin VB.Label Label22 
         Alignment       =   2  'Center
         Caption         =   " Field Of View "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   65
         Top             =   2160
         Width           =   1515
      End
      Begin VB.Label InnerFOVLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "-58"
         Height          =   240
         Left            =   1185
         TabIndex        =   64
         Top             =   2460
         Width           =   330
      End
      Begin VB.Label OuterFOVLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "162"
         Height          =   240
         Left            =   1140
         TabIndex        =   63
         Top             =   3000
         Width           =   375
      End
      Begin VB.Label Label18 
         Caption         =   "Inner"
         Height          =   195
         Left            =   180
         TabIndex        =   62
         Top             =   2460
         Width           =   615
      End
      Begin VB.Label Label20 
         Caption         =   "Outer"
         Height          =   255
         Left            =   180
         TabIndex        =   61
         Top             =   3000
         Width           =   615
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "Space"
         Height          =   240
         Left            =   180
         TabIndex        =   19
         Top             =   420
         Width           =   690
      End
      Begin VB.Label EyeSpaceLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "60"
         Height          =   240
         Left            =   1260
         TabIndex        =   18
         Top             =   420
         Width           =   255
      End
      Begin VB.Label EyesForwardLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   17
         Top             =   1500
         Width           =   255
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Forward"
         Height          =   240
         Left            =   180
         TabIndex        =   16
         Top             =   1500
         Width           =   855
      End
      Begin VB.Label EyeRadiusLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "60"
         Height          =   240
         Left            =   1260
         TabIndex        =   15
         Top             =   960
         Width           =   255
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Radius"
         Height          =   240
         Left            =   180
         TabIndex        =   14
         Top             =   960
         Width           =   750
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Stomach"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1515
      Left            =   120
      TabIndex        =   32
      Top             =   8520
      Width           =   1635
      Begin VB.HScrollBar StomachDrainsScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   34
         Top             =   1140
         Value           =   50
         Width           =   1395
      End
      Begin VB.HScrollBar StomachHoldsScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   33
         Top             =   600
         Value           =   50
         Width           =   1395
      End
      Begin VB.Label Label28 
         AutoSize        =   -1  'True
         Caption         =   "Drains"
         Height          =   240
         Left            =   180
         TabIndex        =   38
         Top             =   900
         Width           =   690
      End
      Begin VB.Label Label27 
         AutoSize        =   -1  'True
         Caption         =   "Holds"
         Height          =   240
         Left            =   180
         TabIndex        =   37
         Top             =   360
         Width           =   630
      End
      Begin VB.Label StomachDrainsLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   ".1"
         Height          =   240
         Left            =   1320
         TabIndex        =   36
         Top             =   900
         Width           =   195
      End
      Begin VB.Label StomachHoldsLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "500"
         Height          =   240
         Left            =   1140
         TabIndex        =   35
         Top             =   360
         Width           =   375
      End
   End
   Begin VB.CommandButton SaveSettingsCommand 
      Caption         =   "Save Settings"
      Height          =   375
      Left            =   1860
      TabIndex        =   66
      ToolTipText     =   "Saves the settings to ""IntelligenceForm.txt"" file, to use when program is restarted."
      Top             =   120
      Width           =   1755
   End
   Begin VB.Frame Frame2 
      Caption         =   "Antenna"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6075
      Left            =   1920
      TabIndex        =   43
      Top             =   1740
      Width           =   1635
      Begin VB.HScrollBar AntPedicelLengthScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   10
         TabIndex        =   88
         Top             =   4260
         Value           =   50
         Width           =   1395
      End
      Begin VB.HScrollBar AntPedicelStrengthScroll 
         Height          =   255
         Left            =   120
         Max             =   30
         Min             =   5
         TabIndex        =   79
         Top             =   4800
         Value           =   20
         Width           =   1395
      End
      Begin VB.HScrollBar AntFlagellumLengthScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   10
         TabIndex        =   75
         Top             =   5700
         Value           =   50
         Width           =   1395
      End
      Begin VB.HScrollBar AntPedicelAngleScroll 
         Height          =   255
         Left            =   120
         Max             =   40
         Min             =   15
         TabIndex        =   70
         Top             =   3720
         Value           =   25
         Width           =   1395
      End
      Begin VB.HScrollBar AntScapeAngleScroll 
         Height          =   255
         Left            =   120
         Max             =   45
         TabIndex        =   54
         Top             =   2280
         Value           =   20
         Width           =   1395
      End
      Begin VB.HScrollBar AntScapeLengthScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   10
         TabIndex        =   53
         Top             =   2820
         Value           =   50
         Width           =   1395
      End
      Begin VB.HScrollBar AntBasalKnobForwardScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   47
         Top             =   840
         Value           =   80
         Width           =   1395
      End
      Begin VB.HScrollBar AntBasalKnobSpaceScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   44
         Top             =   1380
         Value           =   25
         Width           =   1395
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Length"
         Height          =   240
         Left            =   180
         TabIndex        =   90
         ToolTipText     =   $"DesignForm.frx":0000
         Top             =   4020
         Width           =   705
      End
      Begin VB.Label Label30 
         Alignment       =   2  'Center
         Caption         =   "      PEDICEL      "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   89
         ToolTipText     =   "The Pedicel is between the Scape and Flagellum.  This is where the sensors to detect antenna movement are located."
         Top             =   3240
         Width           =   1515
      End
      Begin VB.Label AntPedicelLengthLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   87
         Top             =   4020
         Width           =   255
      End
      Begin VB.Label Label35 
         AutoSize        =   -1  'True
         Caption         =   "Strength"
         Height          =   240
         Left            =   180
         TabIndex        =   81
         ToolTipText     =   $"DesignForm.frx":00A1
         Top             =   4560
         Width           =   870
      End
      Begin VB.Label AntPedicelStrengthLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "20"
         Height          =   240
         Left            =   1260
         TabIndex        =   80
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label Label37 
         Alignment       =   2  'Center
         Caption         =   "      SCAPE      "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   78
         ToolTipText     =   "The Scape is the part of the antenna that attaches between the head then Flagellum."
         Top             =   1800
         Width           =   1515
      End
      Begin VB.Label AntFlagellumLengthLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   77
         Top             =   5460
         Width           =   255
      End
      Begin VB.Label Label34 
         AutoSize        =   -1  'True
         Caption         =   "Length"
         Height          =   240
         Left            =   180
         TabIndex        =   76
         Top             =   5460
         Width           =   705
      End
      Begin VB.Label Label33 
         Alignment       =   2  'Center
         Caption         =   "  FLAGELLUM  "
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   74
         ToolTipText     =   "The Flagellum is the long part of the antenna that points sideways to each side."
         Top             =   5220
         Width           =   1515
      End
      Begin VB.Label Label32 
         AutoSize        =   -1  'True
         Caption         =   "Angle"
         Height          =   240
         Left            =   180
         TabIndex        =   72
         Top             =   3480
         Width           =   615
      End
      Begin VB.Label AntPedicelAngleLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "25"
         Height          =   240
         Left            =   1260
         TabIndex        =   71
         Top             =   3480
         Width           =   255
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         Caption         =   "Angle"
         Height          =   240
         Left            =   180
         TabIndex        =   58
         Top             =   2040
         Width           =   615
      End
      Begin VB.Label AntScapeAngleLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "20"
         Height          =   240
         Left            =   1260
         TabIndex        =   57
         Top             =   2040
         Width           =   255
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         Caption         =   "Length"
         Height          =   240
         Left            =   180
         TabIndex        =   56
         Top             =   2580
         Width           =   705
      End
      Begin VB.Label AntScapeLengthLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   55
         Top             =   2580
         Width           =   255
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         Caption         =   "Forward"
         Height          =   240
         Left            =   180
         TabIndex        =   49
         Top             =   600
         Width           =   855
      End
      Begin VB.Label AntBasalKnobForwardLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "80"
         Height          =   240
         Left            =   1260
         TabIndex        =   48
         Top             =   600
         Width           =   255
      End
      Begin VB.Label AntBasalKnobSpaceLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "25"
         Height          =   240
         Left            =   1260
         TabIndex        =   46
         Top             =   1140
         Width           =   255
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Space"
         Height          =   240
         Left            =   180
         TabIndex        =   45
         Top             =   1140
         Width           =   690
      End
      Begin VB.Label Label31 
         Alignment       =   2  'Center
         Caption         =   "BASAL KNOB"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   73
         ToolTipText     =   "The Basal Knob joint is where the Scape of the antenna attaches to its head."
         Top             =   360
         Width           =   1515
      End
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4455
      Left            =   3600
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   42
      Text            =   "DesignForm.frx":0142
      Top             =   3960
      Visible         =   0   'False
      Width           =   3375
   End
   Begin VB.Frame MotorFrame 
      Caption         =   "Motor"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1515
      Left            =   120
      TabIndex        =   31
      Top             =   120
      Width           =   1635
      Begin VB.HScrollBar MotorTurnAngleScroll 
         Height          =   255
         Left            =   120
         Max             =   10
         Min             =   2
         TabIndex        =   67
         Top             =   1140
         Value           =   4
         Width           =   1395
      End
      Begin VB.HScrollBar MotorSpeedScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   39
         Top             =   600
         Value           =   50
         Width           =   1395
      End
      Begin VB.Label MotorTurnAngleLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "4"
         Height          =   240
         Left            =   1380
         TabIndex        =   69
         Top             =   900
         Width           =   135
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         Caption         =   "Turn Angle"
         Height          =   240
         Left            =   120
         TabIndex        =   68
         Top             =   900
         Width           =   1140
      End
      Begin VB.Label MotorSpeedLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "0.083"
         Height          =   240
         Left            =   960
         TabIndex        =   41
         Top             =   360
         Width           =   555
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         Caption         =   "Speed"
         Height          =   240
         Left            =   120
         TabIndex        =   40
         ToolTipText     =   $"DesignForm.frx":0148
         Top             =   360
         Width           =   705
      End
   End
   Begin VB.Frame BodyFrame 
      Caption         =   "Body"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1920
      TabIndex        =   30
      Top             =   600
      Width           =   1635
      Begin VB.HScrollBar BodyWidthScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   20
         TabIndex        =   50
         Top             =   600
         Value           =   65
         Width           =   1395
      End
      Begin VB.Label Label36 
         AutoSize        =   -1  'True
         Caption         =   "Width"
         Height          =   240
         Left            =   120
         TabIndex        =   52
         Top             =   360
         Width           =   600
      End
      Begin VB.Label BodyWidthLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "65%"
         Height          =   240
         Left            =   1080
         TabIndex        =   51
         Top             =   360
         Width           =   450
      End
   End
   Begin VB.Frame WheelsFrame 
      Caption         =   "WingWheel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   1920
      TabIndex        =   20
      Top             =   7980
      Width           =   1635
      Begin VB.HScrollBar WheelRadiusScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   23
         Top             =   1680
         Value           =   50
         Width           =   1395
      End
      Begin VB.HScrollBar WheelAngleScroll 
         Height          =   255
         Left            =   120
         Max             =   80
         Min             =   40
         TabIndex        =   22
         Top             =   1140
         Value           =   60
         Width           =   1395
      End
      Begin VB.HScrollBar WheelSizeScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   20
         TabIndex        =   21
         Top             =   600
         Value           =   55
         Width           =   1395
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Radius"
         Height          =   240
         Left            =   165
         TabIndex        =   29
         Top             =   1440
         Width           =   750
      End
      Begin VB.Label WheelRadiusLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   28
         Top             =   1440
         Width           =   255
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "Angle"
         Height          =   240
         Left            =   180
         TabIndex        =   27
         Top             =   900
         Width           =   615
      End
      Begin VB.Label WheelAngleLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "60"
         Height          =   240
         Left            =   1260
         TabIndex        =   26
         Top             =   900
         Width           =   255
      End
      Begin VB.Label WheelSizeLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "55"
         Height          =   240
         Left            =   1260
         TabIndex        =   25
         Top             =   360
         Width           =   255
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Size"
         Height          =   240
         Left            =   180
         TabIndex        =   24
         Top             =   360
         Width           =   465
      End
   End
   Begin VB.Frame MouthFrame 
      Caption         =   "Mouth"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   120
      TabIndex        =   0
      Top             =   6300
      Width           =   1635
      Begin VB.HScrollBar MouthForwardScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   3
         Top             =   1680
         Value           =   50
         Width           =   1395
      End
      Begin VB.HScrollBar MouthThickScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         Min             =   10
         TabIndex        =   2
         Top             =   600
         Value           =   50
         Width           =   1395
      End
      Begin VB.HScrollBar MouthRadiusScroll 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   1
         Top             =   1140
         Value           =   50
         Width           =   1395
      End
      Begin VB.Label MouthForwardLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   9
         Top             =   1440
         Width           =   255
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "Forward"
         Height          =   240
         Left            =   180
         TabIndex        =   8
         Top             =   1440
         Width           =   855
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Thick"
         Height          =   240
         Left            =   180
         TabIndex        =   7
         Top             =   360
         Width           =   585
      End
      Begin VB.Label MouthThickLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   6
         Top             =   360
         Width           =   255
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         Caption         =   "Radius"
         Height          =   240
         Left            =   180
         TabIndex        =   5
         Top             =   900
         Width           =   750
      End
      Begin VB.Label MouthRadiusLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "50"
         Height          =   240
         Left            =   1260
         TabIndex        =   4
         Top             =   900
         Width           =   255
      End
   End
End
Attribute VB_Name = "Design"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const PI = 3.14159265358979     'Constants to give big math numbers a name.
Const PI2 = PI / 2
Const Radian = PI * 2
Const Degrees = Radian / 360
'Amount of total body width outward to clear black for drawing circuit diagram inside.
Public LoadOnly As Boolean
Dim FolderPath As String
Dim N As Long
Dim L As Long
Dim S As Long

Dim FacetWd As Double
Dim FacetWdZm As Double
Dim Fovea As Double

Dim FSO As Variant

Private Sub Form_Load()
    Set FSO = CreateObject("Scripting.FileSystemObject")
   Call LoadDesignFile
End Sub

Private Sub Form_Unload(Cancel As Integer)
'Turn off checkbox on Intelligence form that was used to put this form on screen.
   Intelligence.DesignCheck = 0
End Sub

Private Sub SaveSettingsCommand_Click()
   Call SaveDesignFile
   SaveSettingsCommand.Caption = "Settings Saved"
End Sub

Private Sub SaveDesignFile()
                      FolderPath = App.Path & "\Settings"
  If FSO.FolderExists(FolderPath) = False Then MkDir FolderPath
   Open FolderPath & "\DesignForm.txt" For Output As #1
      Print #1, BodyWidthScroll
      Print #1, WheelSizeScroll                                 'Wheel/Wing Frame
      Print #1, WheelAngleScroll
      Print #1, WheelRadiusScroll
      Print #1, StomachHoldsScroll                                 'Feeding Frame
      Print #1, StomachDrainsScroll
      Print #1, EyeRadiusScroll                                 'Eye Frame
      Print #1, EyeSpaceScroll
      Print #1, EyesForwardScroll
      Print #1, MouthRadiusScroll                               'Mouth Frame
      Print #1, MouthThickScroll
      Print #1, MouthForwardScroll
      Print #1, InnerFOVScroll
      Print #1, OuterFOVScroll
      Print #1, InnerFieldScroll
      Print #1, MotorSpeedScroll
      Print #1, MotorTurnAngleScroll
      Print #1, AntBasalKnobForwardScroll
      Print #1, AntBasalKnobSpaceScroll
      Print #1, AntScapeAngleScroll
      Print #1, AntScapeLengthScroll
      Print #1, AntPedicelAngleScroll
      Print #1, AntFlagellumLengthScroll
      Print #1, AntPedicelStrengthScroll
   Close #1
End Sub

Private Sub LoadDesignFile()
Dim D As Double
   On Error GoTo ErrorExit
 LoadOnly = True
   Open App.Path & "\Settings\DesignForm.txt" For Input As #1
      Input #1, N: BodyWidthScroll = N
      Input #1, N: WheelSizeScroll = N                          'Wheel Frame
      Input #1, N: WheelAngleScroll = N
      Input #1, N: WheelRadiusScroll = N
      Input #1, N: StomachHoldsScroll = N                       'Stomach Frame
      Input #1, N: StomachDrainsScroll = N
      Input #1, N: EyeRadiusScroll = N                          'Eye Frame
      Input #1, N: EyeSpaceScroll = N
      Input #1, N: EyesForwardScroll = N
      Input #1, N: MouthRadiusScroll = N                        'Mouth Frame
      Input #1, N: MouthThickScroll = N
      Input #1, N: MouthForwardScroll = N
      Input #1, N: InnerFOVScroll = N
      Input #1, N: OuterFOVScroll = N
      Input #1, N: InnerFieldScroll = N
      Input #1, N: MotorSpeedScroll = N
      Input #1, N: MotorTurnAngleScroll = N
      Input #1, N: AntBasalKnobForwardScroll = N
      Input #1, N: AntBasalKnobSpaceScroll = N
      Input #1, N: AntScapeAngleScroll = N
      Input #1, N: AntScapeLengthScroll = N
      Input #1, N: AntPedicelAngleScroll = N
      Input #1, N: AntFlagellumLengthScroll = N
      Input #1, N: AntPedicelStrengthScroll = N
ErrorExit:
   Close #1
 LoadOnly = False
End Sub

Private Sub AntBasalKnobForwardScroll_Change()
            AntBasalKnobForwardLabel = AntBasalKnobForwardScroll
   Call CalcDesign
End Sub
Private Sub AntBasalKnobSpaceScroll_Change()
            AntBasalKnobSpaceLabel = AntBasalKnobSpaceScroll
   Call CalcDesign
End Sub
Private Sub AntScapeAngleScroll_Change()
            AntScapeAngleLabel = AntScapeAngleScroll
   Call CalcDesign
End Sub
Private Sub AntScapeLengthScroll_Change()
            AntScapeLengthLabel = AntScapeLengthScroll
   Call CalcDesign
End Sub
Private Sub AntPedicelAngleScroll_Change()
            AntPedicelAngleLabel = AntPedicelAngleScroll
   Call CalcDesign
End Sub
Private Sub AntPedicelLengthScroll_Change()
            AntPedicelLengthLabel = AntPedicelLengthScroll
   Call CalcDesign
End Sub
Private Sub AntPedicelStrengthScroll_Change()
            AntPedicelStrengthLabel = AntPedicelStrengthScroll
   Call CalcDesign
End Sub
Private Sub AntFlagellumLengthScroll_Change()
            AntFlagellumLengthLabel = AntFlagellumLengthScroll
   Call CalcDesign
End Sub

Private Sub MotorSpeedScroll_Change()
   Call CalcDesign
            MotorSpeedLabel = Format(Intelligence.MotorSpeed, "0.000")
End Sub
Private Sub MotorTurnAngleScroll_Change()
            MotorTurnAngleLabel = MotorTurnAngleScroll
   Call CalcDesign
End Sub

'_____________________________________Body (on screen) Size.
'Private Sub BodyLengthScroll_Change()
'   Call BodyLengthScroll_Scroll
'End Sub
'Private Sub BodyLengthScroll_Scroll()
'   BodyLengthLabel = BodyLengthScroll ''''/ 100
'   Call CalcDesign
'End Sub
Private Sub BodyWidthScroll_Change()
   Call BodyWidthScroll_Scroll
End Sub
Private Sub BodyWidthScroll_Scroll()
   BodyWidthLabel = Format(BodyWidthScroll) & "%"
   Call CalcDesign
End Sub

'_____________________________________Mouth Frame
Private Sub MouthThickScroll_Change()
   Call MouthThickScroll_Scroll
End Sub
Private Sub MouthThickScroll_Scroll()
        MouthThickLabel = MouthThickScroll
   Call CalcDesign
End Sub
Private Sub MouthRadiusScroll_Change()
   Call MouthRadiusScroll_Scroll
End Sub
Private Sub MouthRadiusScroll_Scroll()
        MouthRadiusLabel = MouthRadiusScroll
   Call CalcDesign
End Sub
Private Sub MouthForwardScroll_Change()
   Call MouthForwardScroll_Scroll
End Sub
Private Sub MouthForwardScroll_Scroll()
        MouthForwardLabel = MouthForwardScroll
   Call CalcDesign
End Sub

'_____________________________________Stomach Frame
Private Sub StomachHoldsScroll_Change()
   Call CalcDesign
End Sub
Private Sub StomachDrainsScroll_Change()
   Call CalcDesign
End Sub

'_____________________________________Eye Frame
Private Sub EyeSpaceScroll_Change()
   Call EyeSpaceScroll_Scroll
End Sub
Private Sub EyeSpaceScroll_Scroll()
        EyeSpaceLabel = EyeSpaceScroll
   Call CalcDesign
End Sub
Private Sub EyeRadiusScroll_Scroll()
   Call EyeRadiusScroll_Change
End Sub
Private Sub EyeRadiusScroll_Change()
   Call CalcDesign
End Sub
Private Sub EyesForwardScroll_Scroll()
   Call EyesForwardScroll_Change
End Sub
Private Sub EyesForwardScroll_Change()
        EyesForwardLabel = EyesForwardScroll
   Call CalcDesign
End Sub
Private Sub InnerFieldScroll_Scroll()
   Call InnerFieldScroll_Change
End Sub
Private Sub InnerFieldScroll_Change()
   Call CalcDesign
End Sub

'_____________________________________Wheel Frame
Private Sub WheelSizeScroll_Change()
   Call WheelSizeScroll_Scroll
End Sub
Private Sub WheelSizeScroll_Scroll()
   WheelSizeLabel = WheelSizeScroll
   Call CalcDesign
End Sub
Private Sub WheelAngleScroll_Change()
   Call WheelAngleScroll_Scroll
End Sub
Private Sub WheelAngleScroll_Scroll()
   WheelAngleLabel = WheelAngleScroll
   Call CalcDesign
End Sub
Private Sub WheelRadiusScroll_Change()
   Call WheelRadiusScroll_Scroll
End Sub
Private Sub WheelRadiusScroll_Scroll()
   WheelRadiusLabel = WheelRadiusScroll
   Call CalcDesign
End Sub

'_____________________________________Fovea Curve Graph Controls
Private Sub PatchesScroll_Change()
   Call PatchesScroll_Scroll
End Sub
Private Sub PatchesScroll_Scroll()
   Call CalcDesign
End Sub
Private Sub InnerFOVScroll_Scroll()
   Call InnerFOVScroll_Change
End Sub
Private Sub InnerFOVScroll_Change()
      OuterFOVScroll.Max = 360 + InnerFOVScroll
        InnerFOVLabel = InnerFOVScroll
   Call CalcDesign
End Sub
Private Sub OuterFOVScroll_Scroll()
   Call OuterFOVScroll_Change
End Sub
Private Sub OuterFOVScroll_Change()
        OuterFOVLabel = OuterFOVScroll
   Call CalcDesign
End Sub

Public Sub CalcDrawBot()
  If LoadOnly = True Then Exit Sub
   Call CalcDesign
   Call Intelligence.DrawBot
End Sub

Public Sub CalcDesign()
 If LoadOnly = True Then Exit Sub
'Calculate Body proportion variables.
   Intelligence.BodyWidth = (BodyWidthScroll / 50)
   Intelligence.BodyWidthHalf = Intelligence.BodyWidth / 2
   Intelligence.BodyLength = 1 + (1 - Intelligence.BodyWidth)
   Intelligence.BodyLengthHalf = Intelligence.BodyLength / 2
'Calculate Eye variables.
   Intelligence.Facets = Addressing.FacetsScroll
   Addressing.FacetsLabel = Format(Intelligence.Facets)
   Intelligence.FacetBits = Fix(Log(Intelligence.Facets) / Log(2)) + 1
   Addressing.FacetBitsLabel = Format(Intelligence.FacetBits) & " bits"
'   Intelligence.InnerFacets = Intelligence.Facets * (InnerFieldScroll / 100)
'   InnerFacetsLabel = Format(Intelligence.InnerFacets) & " facets"
   EyeRadiusLabel = EyeRadiusScroll
   Intelligence.EyeRd = Intelligence.BodyWidthHalf * (EyeRadiusScroll / 100)
   Intelligence.EyeAng1 = (InnerFOVScroll / 360) * Radian
   Intelligence.EyeAng2 = (OuterFOVScroll / 360) * Radian
   Intelligence.EyeFw = (Intelligence.BodyWidthHalf * 0.45) + (EyesForwardScroll / 100 * (Intelligence.BodyWidthHalf * 0.4))
   Intelligence.EyeSp = (Intelligence.BodyWidthHalf * 0.5) + (EyeSpaceScroll / 100 * Intelligence.EyeRd)
'Motor Step Size is divided by Lobes because of it taking two Cycles to cover same distance.
   Intelligence.MotorSpeed = (Intelligence.BodyLength / 50) + (MotorSpeedScroll / 800)
   Intelligence.MotorTurnAngle = MotorTurnAngleScroll * Degrees
'Calculate Mouth variables.
   Intelligence.MouthR = (Intelligence.BodyWidth / 8) + (MouthRadiusScroll / 500)
   Intelligence.MouthTh = Intelligence.MouthR * (MouthThickScroll / 100)
   Intelligence.MouthFw = Intelligence.MouthR * (MouthForwardScroll / 100)
'Calculate Food variables.
   Intelligence.FoodRd = Intelligence.MouthR
'Calculate Wheel/Wing variables.
   Intelligence.WheelSz = Intelligence.BodyWidthHalf * (WheelSizeScroll / 70)
   Intelligence.WheelRd = Intelligence.BodyWidthHalf + (WheelRadiusScroll / 200)
   Intelligence.WheelBa = Intelligence.WheelRd * 2
   Intelligence.WheelA = WheelAngleScroll * Degrees
'Stomach
   Intelligence.StomachHolds = StomachHoldsScroll
   StomachHoldsLabel = Intelligence.StomachHolds
   Intelligence.StomachDrains = StomachDrainsScroll / 1000
   StomachDrainsLabel = Intelligence.StomachDrains
'Antenna Variables
   Intelligence.AntBasalKnobForward = (Intelligence.BodyWidthHalf * 0.75) + (AntBasalKnobForwardScroll / 100 * (Intelligence.BodyWidthHalf * 0.25))
   Intelligence.AntBasalKnobSpace = Intelligence.BodyWidth * (AntBasalKnobSpaceScroll / 150)
   Intelligence.AntScapeAngle = (AntScapeAngleScroll / 360) * Radian
   Intelligence.AntScapeLength = AntScapeLengthScroll / 150
   Intelligence.AntPedicelAngle = (AntPedicelAngleScroll / 360) * Radian
   Intelligence.AntPedicelLength = AntPedicelLengthScroll / 200
   Intelligence.AntPedicelStrength = ((AntPedicelStrengthScroll - 40) / 720) * Radian
   Intelligence.AntFlagellumLength = (AntFlagellumLengthScroll / 100)
  Call Intelligence.CalcFacetAngles
  Call Intelligence.PreCalculateSpeedColors
  Call Intelligence.Vision
  Call Intelligence.DrawBot
  If Intelligence.CircuitCheck = 1 Then Call Intelligence.CalculateCirBotXY
End Sub

