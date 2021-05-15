VERSION 5.00
Begin VB.Form Intelligence 
   AutoRedraw      =   -1  'True
   Caption         =   "Intelligence Design Lab with 1 or 2 Lobe brain, Gary S. Gaulin, 2011"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
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
   ScaleHeight     =   734
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1016
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CheckBox NotesCheck 
      Caption         =   "Notes"
      Height          =   255
      Left            =   2700
      TabIndex        =   72
      Top             =   60
      Width           =   1035
   End
   Begin VB.CheckBox ChartCheck 
      Caption         =   "Chart"
      Height          =   255
      Left            =   9720
      TabIndex        =   66
      Top             =   60
      Width           =   915
   End
   Begin VB.Frame Frame3 
      Caption         =   "SubSystems"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   12180
      TabIndex        =   59
      ToolTipText     =   $"IntelligenceDesignLab.frx":0000
      Top             =   7680
      Width           =   3075
      Begin VB.CheckBox ColorSystemCheck 
         Caption         =   "Taste"
         Height          =   405
         Index           =   3
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   73
         Top             =   -60
         Value           =   1  'Checked
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.CheckBox ColorSystemCheck 
         Caption         =   "Blue"
         Height          =   405
         Index           =   2
         Left            =   2040
         Style           =   1  'Graphical
         TabIndex        =   63
         Top             =   360
         Value           =   1  'Checked
         Width           =   855
      End
      Begin VB.CheckBox ColorSystemCheck 
         Caption         =   "Green"
         Height          =   405
         Index           =   1
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   62
         Top             =   360
         Value           =   1  'Checked
         Width           =   855
      End
      Begin VB.CheckBox ColorSystemCheck 
         Caption         =   "Red"
         Height          =   405
         Index           =   0
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   61
         Top             =   360
         Value           =   1  'Checked
         Width           =   855
      End
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Courier"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   10215
      Left            =   60
      ScaleHeight     =   677
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   801
      TabIndex        =   0
      Top             =   360
      Width           =   12075
   End
   Begin VB.HScrollBar DrawYScroll 
      Height          =   255
      Left            =   13260
      Max             =   500
      Min             =   1
      TabIndex        =   29
      Top             =   60
      Value           =   50
      Width           =   1035
   End
   Begin VB.HScrollBar DrawXScroll 
      Height          =   255
      Left            =   11820
      Max             =   500
      Min             =   1
      TabIndex        =   27
      Top             =   60
      Value           =   50
      Width           =   1035
   End
   Begin VB.Timer ClockTimer 
      Interval        =   1000
      Left            =   14400
      Top             =   10560
   End
   Begin VB.HScrollBar StepTime 
      Height          =   255
      Left            =   13860
      Max             =   1000
      Min             =   10
      SmallChange     =   10
      TabIndex        =   7
      Top             =   3420
      Value           =   30
      Width           =   1335
   End
   Begin VB.HScrollBar ZoomScroll 
      Height          =   255
      Left            =   720
      Max             =   500
      Min             =   1
      TabIndex        =   1
      Top             =   60
      Value           =   75
      Width           =   1155
   End
   Begin VB.Timer CycleTimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   14760
      Top             =   10560
   End
   Begin VB.Frame Frame2 
      Caption         =   "CONFIDENCE"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1035
      Left            =   12180
      TabIndex        =   12
      Top             =   1200
      Width           =   3075
      Begin VB.HScrollBar ConfAveragesScroll 
         Height          =   255
         Left            =   660
         Max             =   15
         Min             =   1
         TabIndex        =   32
         Top             =   360
         Value           =   12
         Width           =   1335
      End
      Begin VB.Label StoredMemoriesLabel 
         AutoSize        =   -1  'True
         Caption         =   "0"
         Height          =   240
         Left            =   1920
         TabIndex        =   71
         Top             =   720
         Width           =   135
      End
      Begin VB.Label Label8 
         Caption         =   "Stored Memories"
         Height          =   255
         Left            =   120
         TabIndex        =   70
         Top             =   720
         Width           =   1815
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Avgs"
         Height          =   240
         Left            =   120
         TabIndex        =   34
         ToolTipText     =   "Averaging amount, to smooth the Average Confidence line."
         Top             =   360
         Width           =   540
      End
      Begin VB.Label ConfAveragesLabel 
         AutoSize        =   -1  'True
         Caption         =   "512"
         Height          =   240
         Left            =   2040
         TabIndex        =   33
         Top             =   390
         Width           =   375
      End
      Begin VB.Label AvConfLabel 
         AutoSize        =   -1  'True
         Caption         =   "0.0000"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   2040
         TabIndex        =   16
         Top             =   0
         Width           =   840
      End
   End
   Begin VB.CommandButton BitMapCommand 
      Caption         =   "BitMap"
      Height          =   375
      Left            =   14160
      TabIndex        =   13
      ToolTipText     =   $"IntelligenceDesignLab.frx":0092
      Top             =   2340
      Width           =   975
   End
   Begin VB.CheckBox FullScreenCheck 
      Caption         =   "Full"
      Height          =   255
      Left            =   14520
      TabIndex        =   10
      ToolTipText     =   "Full screen mode."
      Top             =   60
      Width           =   795
   End
   Begin VB.CommandButton TurboOrTimerCommand 
      Caption         =   "Turbo"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   13500
      TabIndex        =   17
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton StepCommand 
      Caption         =   "Step"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   13500
      TabIndex        =   18
      Top             =   600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.HScrollBar TurboCyclesScroll 
      Height          =   255
      Left            =   12180
      Max             =   3
      Min             =   1
      TabIndex        =   20
      Top             =   780
      Value           =   3
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton PauseContinueCommand 
      Caption         =   "Pause"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   12180
      TabIndex        =   21
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton SaveSettingsCommand 
      Caption         =   "Save Settings"
      Height          =   375
      Left            =   12240
      TabIndex        =   15
      ToolTipText     =   "Saves the settings to ""IntelligenceForm.txt"" file, to use when program is restarted."
      Top             =   2340
      Width           =   1755
   End
   Begin VB.CheckBox ShowVisualFieldCheck 
      Caption         =   "Visual Field"
      Height          =   255
      Left            =   12240
      TabIndex        =   6
      Top             =   10020
      Width           =   1635
   End
   Begin VB.CheckBox SaveRunFileCheck 
      Caption         =   "Save Run File"
      Height          =   255
      Left            =   12240
      TabIndex        =   37
      ToolTipText     =   $"IntelligenceDesignLab.frx":0137
      Top             =   9060
      Width           =   1815
   End
   Begin VB.Frame Frame1 
      Caption         =   "Food Placement"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2655
      Left            =   12180
      TabIndex        =   42
      Top             =   4800
      Width           =   3075
      Begin VB.HScrollBar FeederFoodAmountScroll 
         Height          =   255
         Left            =   1560
         Max             =   200
         TabIndex        =   67
         Top             =   1500
         Value           =   27
         Width           =   1035
      End
      Begin VB.CheckBox AllowToEatCheck 
         Caption         =   "Allow to Eat"
         Height          =   315
         Left            =   1440
         TabIndex        =   65
         Top             =   300
         Value           =   1  'Checked
         Width           =   1575
      End
      Begin VB.CommandButton ReFeedCommand 
         Caption         =   "ReFeed"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   64
         Top             =   300
         Width           =   1215
      End
      Begin VB.CheckBox ShowFoodAmountCheck 
         Caption         =   "Show Food Amount"
         Height          =   315
         Left            =   120
         TabIndex        =   60
         Top             =   1740
         Value           =   1  'Checked
         Width           =   2535
      End
      Begin VB.HScrollBar FeederSizeScroll 
         Height          =   255
         Left            =   1560
         Max             =   6
         Min             =   1
         TabIndex        =   50
         Top             =   1260
         Value           =   2
         Width           =   1035
      End
      Begin VB.HScrollBar FoodAreaScroll 
         Height          =   255
         Left            =   1560
         Max             =   10
         Min             =   1
         TabIndex        =   44
         Top             =   1020
         Value           =   3
         Width           =   1035
      End
      Begin VB.HScrollBar FeedersScroll 
         Height          =   255
         Left            =   1560
         Max             =   64
         TabIndex        =   47
         Top             =   780
         Value           =   1
         Width           =   1035
      End
      Begin VB.CheckBox MulticolorCheck 
         Caption         =   "Multicolor"
         Height          =   255
         Left            =   120
         TabIndex        =   43
         Top             =   2340
         Width           =   1335
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Food Amount"
         Height          =   240
         Left            =   120
         TabIndex        =   69
         ToolTipText     =   "Amount of food in each feeder."
         Top             =   1500
         Width           =   1380
      End
      Begin VB.Label FeederFoodAmountLabel 
         AutoSize        =   -1  'True
         Caption         =   "27"
         Height          =   240
         Left            =   2640
         TabIndex        =   68
         Top             =   1500
         Width           =   255
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Remaining"
         Height          =   300
         Left            =   420
         TabIndex        =   58
         Top             =   2010
         Width           =   1125
      End
      Begin VB.Label RemainingAmountLabel 
         AutoSize        =   -1  'True
         Caption         =   "0"
         Height          =   225
         Left            =   1620
         TabIndex        =   54
         Top             =   2040
         Width           =   135
      End
      Begin VB.Label FoodSizeLabel2 
         AutoSize        =   -1  'True
         Caption         =   "Feeder Size"
         Height          =   240
         Left            =   120
         TabIndex        =   52
         ToolTipText     =   "Size of each feeder, not including center that is always the same size as its mouth."
         Top             =   1260
         Width           =   1275
      End
      Begin VB.Label FeederSizeLabel 
         AutoSize        =   -1  'True
         Caption         =   "2"
         Height          =   240
         Left            =   2640
         TabIndex        =   51
         Top             =   1260
         Width           =   135
      End
      Begin VB.Label FeedersLabel 
         AutoSize        =   -1  'True
         Caption         =   "1"
         Height          =   240
         Left            =   2640
         TabIndex        =   49
         Top             =   780
         Width           =   135
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         Caption         =   "Feeders"
         Height          =   240
         Left            =   120
         TabIndex        =   48
         ToolTipText     =   "Number of feeders to draw on the screen."
         Top             =   780
         Width           =   885
      End
      Begin VB.Label FoodAreaLabel 
         AutoSize        =   -1  'True
         Caption         =   "3"
         Height          =   240
         Left            =   2640
         TabIndex        =   46
         Top             =   1020
         Width           =   135
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         Caption         =   "Feed Area"
         Height          =   240
         Left            =   120
         TabIndex        =   45
         ToolTipText     =   "How large an area to place feeders."
         Top             =   1020
         Width           =   1110
      End
   End
   Begin VB.CheckBox AddressingCheck 
      Caption         =   "Addressing"
      Height          =   255
      Left            =   8040
      TabIndex        =   26
      Top             =   60
      Width           =   1515
   End
   Begin VB.CheckBox CircuitCheck 
      Caption         =   "Circuit"
      Height          =   255
      Left            =   3900
      TabIndex        =   11
      Top             =   60
      Width           =   1035
   End
   Begin VB.CheckBox DesignCheck 
      Caption         =   "Design"
      Height          =   255
      Left            =   6780
      TabIndex        =   14
      Top             =   60
      Width           =   1095
   End
   Begin VB.CheckBox ConfidenceCheck 
      Caption         =   "Confidence"
      Height          =   255
      Left            =   5100
      TabIndex        =   53
      Top             =   60
      Width           =   1515
   End
   Begin VB.CheckBox ShowEyeSignalsCheck 
      Caption         =   "Eye Signals"
      Height          =   255
      Left            =   12240
      TabIndex        =   38
      Top             =   9780
      Width           =   1575
   End
   Begin VB.CheckBox SeedRandomCheck 
      Caption         =   "Seed Random Generator"
      Height          =   255
      Left            =   12240
      TabIndex        =   55
      ToolTipText     =   $"IntelligenceDesignLab.frx":01D6
      Top             =   8760
      Width           =   2955
   End
   Begin VB.CheckBox ShowAntennaCheck 
      Caption         =   "Antenna"
      Height          =   255
      Left            =   14040
      TabIndex        =   56
      Top             =   10020
      Width           =   1275
   End
   Begin VB.CheckBox ShowSpinCheck 
      Caption         =   "Spin"
      Height          =   255
      Left            =   14040
      TabIndex        =   57
      Top             =   9780
      Width           =   1095
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   " Time Step "
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
      Left            =   13860
      TabIndex        =   74
      Top             =   2940
      Width           =   1335
   End
   Begin VB.Label CycleWasLabel 
      AutoSize        =   -1  'True
      Caption         =   "0 "
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "#,##0.0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   0
      EndProperty
      Height          =   240
      Left            =   12420
      TabIndex        =   41
      Top             =   3060
      Visible         =   0   'False
      Width           =   195
   End
   Begin VB.Label CyclesPerSecondLabel 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   240
      Left            =   12240
      TabIndex        =   40
      Top             =   3600
      Width           =   135
   End
   Begin VB.Label Label4 
      Caption         =   "Cycles/Sec."
      Height          =   315
      Left            =   12240
      TabIndex        =   39
      Top             =   3360
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Current Time"
      Height          =   255
      Left            =   13680
      TabIndex        =   31
      Top             =   4200
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   "Y"
      Height          =   255
      Left            =   12960
      TabIndex        =   30
      Top             =   60
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "X"
      Height          =   255
      Left            =   11520
      TabIndex        =   28
      Top             =   60
      Width           =   255
   End
   Begin VB.Label BornTimeLabel 
      AutoSize        =   -1  'True
      Caption         =   "00:00:00"
      Height          =   240
      Left            =   12240
      TabIndex        =   25
      Top             =   4440
      Width           =   855
   End
   Begin VB.Label BornDateLabel 
      AutoSize        =   -1  'True
      Caption         =   "01/16/2011"
      Height          =   240
      Left            =   12240
      TabIndex        =   24
      Top             =   4200
      Width           =   1125
   End
   Begin VB.Label BornLabel 
      Caption         =   "Born"
      Height          =   255
      Left            =   12240
      TabIndex        =   23
      Top             =   3960
      Width           =   555
   End
   Begin VB.Label ClockLabel 
      AutoSize        =   -1  'True
      Caption         =   "00:00:00"
      Height          =   240
      Left            =   13740
      TabIndex        =   19
      Top             =   4440
      Width           =   855
   End
   Begin VB.Label IntervalLabel 
      AutoSize        =   -1  'True
      Caption         =   "0.03"
      Height          =   240
      Left            =   14760
      TabIndex        =   9
      ToolTipText     =   "Interval is the length of time im MilliSeconds (1/1000 sec.) CycleTimer waits before starting the next Cycle."
      Top             =   3180
      Width           =   435
   End
   Begin VB.Label Label29 
      AutoSize        =   -1  'True
      Caption         =   "Interval"
      Height          =   300
      Left            =   13860
      TabIndex        =   8
      ToolTipText     =   "Interval is the length of time im MilliSeconds CycleTimer waits before starting the next Cycle."
      Top             =   3180
      Width           =   960
   End
   Begin VB.Label Label17 
      AutoSize        =   -1  'True
      Caption         =   "Zoom"
      Height          =   240
      Left            =   120
      TabIndex        =   3
      Top             =   60
      Width           =   600
   End
   Begin VB.Label ZoomLabel 
      AutoSize        =   -1  'True
      Caption         =   "75%"
      Height          =   240
      Left            =   1920
      TabIndex        =   2
      Top             =   60
      Width           =   450
   End
   Begin VB.Label CycleLabel 
      AutoSize        =   -1  'True
      Caption         =   "0"
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "#,##0.0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   0
      EndProperty
      Height          =   240
      Left            =   12240
      TabIndex        =   4
      Top             =   3060
      Width           =   135
   End
   Begin VB.Label CycleLabelLeft 
      AutoSize        =   -1  'True
      Caption         =   "Cycle"
      Height          =   240
      Left            =   12240
      TabIndex        =   5
      Top             =   2820
      Width           =   600
   End
   Begin VB.Label TurboCyclesLabel 
      AutoSize        =   -1  'True
      Caption         =   "Cycles"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   12240
      TabIndex        =   22
      Top             =   570
      Visible         =   0   'False
      Width           =   570
   End
   Begin VB.Label SaveRunLabel 
      AutoSize        =   -1  'True
      Caption         =   "   "
      Height          =   240
      Left            =   14100
      TabIndex        =   36
      Top             =   9060
      Width           =   195
   End
   Begin VB.Label Label5 
      Caption         =   "           Show on Screen           "
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
      Left            =   12240
      TabIndex        =   35
      Top             =   9540
      Width           =   2955
   End
End
Attribute VB_Name = "Intelligence"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'Intelligence Design Lab with 1 or 2-Lobe Trichromatic Brain, by Gary S. Gaulin, 2011
'Program generates rudimentary intelligence with very simple Intelligence Algorithm.
'Adapted from David L. Heiserman "How to Build Your Own Self-Programming Robot" TAB Books 1979
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Option Explicit         'Tells program compiler to report when error is made coding variables.
Const PI = 3.14159265358979     'Constants to give big math numbers a name.
Const PI2 = PI / 2
Const Radian = PI * 2
Const Degrees = Radian / 360
Const EyeGreen = 2209703
Const HairRed = 2327287
Const MouthColor = vbRed
Const BodyColor = 12376314
Const GuitarGreenColor = 3014440
Const MaxFacets = 63
Const WireOnColor = vbRed
Const WireOffColor = vbBlack
Const SystemBits = 2
Const AvFwRvColor = vbRed
Const AvLfRtColor = vbBlue
Const AvCombinedColor = &HFF00FF
Const StoredMemoriesColor = vbBlack
Const StomachAmountColor = &H11C000
Const DataBits = 9
'Long variables (32 bits) are used when possible for fast CPU time on 32 bit computer.
'Boolean program variables are either "True" or "False" like an If..Then... statement is.
Dim ErrorCode As Long
Dim LoadOnly As Boolean
'Memory array to store actions in response to sensors that address it, its brain.
Dim RAM() As Integer            'Main Memory that stores Data for all Subsystems.
Dim MaxRAM As Long
Dim MaxPC As Long
Dim RequiredRAM(2) As Long
Dim AddrBits As Long
Dim AllAddrBits As Long
Dim AllAddrBitsRAM(2, 3) As Long
Dim AllAddrBitsPC(2, 3) As Long
Dim AddrBitsRAM(2, 3) As Long
Dim AddrBitsPC(2, 3) As Long
Dim AllSenseCount(2, 3) As Long
Dim AllSensorBits(2, 3, 32) As Long
Dim AllSenseRead(2, 3, 32) As Long
Dim AllSensorName(2, 3, 32) As String
Dim SenseCheck(2, 3, 32) As Long
Dim SenseCount(2, 3) As Long
Dim SensorBits(2, 3, 32) As Long
Dim SenseRead(2, 3, 32) As Long
Dim SensorName(2, 3, 32) As String
Dim MemLocations As Long
Dim StoredMemories As Long
Dim Addr(3) As Long             'Memory Address used by algorithm.
Dim AllAddr(3) As Long          'Memory Address with all items regardless of being checked or not.
Dim DataOut As Long
Dim DataIn As Long
Dim TruthTable(1, 1, 1, 1, 1, 1, 1) As Long
'Navigation Control neural connections from motion/pattern sensory circuits.
Dim LfSeeSensorN(2, 3) As Long
Dim LfTwdSensorN(2, 3) As Long
Dim LfEyeSensorN(2, 3) As Long
Dim LfAntSensorN(2, 3) As Long
Dim TstFdSensorN(2, 3) As Long
Dim RtAntSensorN(2, 3) As Long
Dim RtEyeSensorN(2, 3) As Long
Dim RtTwdSensorN(2, 3) As Long
Dim RtSeeSensorN(2, 3) As Long
Dim CorreSensorN(2, 3) As Long
Dim GoLftSensorN(2, 3) As Long          'Go Left
Dim GoRgtSensorN(2, 3) As Long          'Go Right
Dim GoFwdSensorN(2, 3) As Long          'Go-Forward is 1 to increase forward speed.
Dim GoRevSensorN(2, 3) As Long          'Go-Reverse is 1 to reduce & reverse speed.
Dim GoLft As Long                       'Go Left
Dim GoRgt As Long                       'Go Right
Dim GoFwd As Long                       'Go-Forward is 1 to increase forward speed.
Dim GoRev As Long                       'Go-Reverse is 1 to reduce & reverse speed.
Dim Velocity As Double                  'Distance of Travel.
Dim SpeedNum As Long                'Current Speed Number, Reverse=0-2, Stop=3, 4-7=Forward.
Dim SpeedWas As Long                'What current Speed Number Was in previous cycle.
Dim SL As Double
Dim SR As Double
Dim StaysSize As Long
Dim DelaySize As Long
'Sensory registers to indicate current environmental conditions.
Dim Correlate(3) As Long
Dim CorrelateWas(3) As Long
Dim CorrelateChange(3) As Long
Dim MOU As Long
Dim Hungry As Long
Dim See(1, 3) As Long
Dim SeeWas(1, 3) As Long
Dim Twd(1, 3) As Long
Dim Cor(3) As Long
Dim Ant(1) As Long                  'Antenna. 0 to 7 depending on air speed & turn.
Dim AntWas(1) As Long               'Antenna reading Was last cycle.
Dim Spin As Long
Dim SpinWas As Long
Dim EyeBri(1, 3) As Double
Dim EyeBriWas(1, 3) As Double
Dim L As Long
Dim S As Long
Dim SN As Long
Dim SubSysColor(3)
Dim BitsData(100) As Long
Dim DataName(100) As String
Dim Header(50) As String
Dim FStr As String                  'File String
Dim NStr As String                  'Number String
Dim NStr1 As String                 'Number String
Dim NStr2 As String                 'Number String
Dim N As Long
Dim N2 As Long
Dim CfStr As String
Dim FwRvCf(3) As Long               'Forward and Reverse Confidence level from 0 to 3
Dim LfRtCf(3) As Long               'Left and Right Confidence level from 0 to 3
Dim FwRvCfIn As Long                'Forward and Reverse Confidence level from 0 to 3
Dim LfRtCfIn As Long                'Left and Right Confidence level from 0 to 3
Dim FwRvCfOut As Long               'Forward and Reverse Confidence level from 0 to 3
Dim LfRtCfOut As Long               'Left and Right Confidence level from 0 to 3
Dim FwRvAdj As Long                 'Forward and Reverse Adjust, -1=Decrement, +1=Increment.
Dim LfRtAdj As Long                 'Left and Right Adjust, -1=Decrement, +1=Increment.
Dim FwRvAdjWas As Long              'Forward and Reverse Adjust, -1=Decrement, +1=Increment.
Dim LfRtAdjWas As Long              'Left and Right Adjust, -1=Decrement, +1=Increment.
Dim AvFwRvCF As Double
Dim AvLfRtCF As Double
Dim AvCF As Double
Dim ConfAverages As Double
Dim D As Double
Dim Bt As Long
Dim BN As Long
Dim BNRev As Long
Dim Bx As Long
Dim FA1 As Double
Dim FA2 As Double
Dim FN1 As Long
Dim FN2 As Long
Dim FacetFrom As Long
Dim FacetTo As Long
Dim TstFd As Long                   'Is 1 when Tastes food.
Dim TstFdWas As Long
Dim Tastes As Long
Dim TastesWas As Long
Dim Flap As Long                    'For alternating draw of wing/wheels on top of each other.
Dim LWidth As Long
Dim LWidth2 As Long
Dim OutlineWidth As Long
Dim OutlineColor As Long
Dim ArcAng As Double
Dim T As Long
Dim SqrD As Double
Dim RSqrT As Double
Dim DX As Long
Dim DY As Long
Dim A As Double
Dim B1, B2, B3, B4, B5, B6, B7 As Long
Dim DrawScale As Double
Dim Things As Long
Dim ThingVisited(1000) As Long      'Number of times it visited there.
Dim ThingX(1000) As Double
Dim ThingY(1000) As Double
Dim ThingR(1000) As Double
Dim ThingAmount(1000) As Long
Dim ThingGone(1000) As Boolean
Dim ThingFood(1000) As Boolean
'Dim ThingToxic(1000) As Boolean
'Dim ThingWet(1000) As Boolean
'Dim ThingEdible(1000) As Boolean
'Dim ThingHasTaste(1000) As Boolean
'Dim ThingTasteBad(1000) As Boolean
'Dim ThingTasteGood(1000) As Boolean
'Dim ThingBitter(1000) As Boolean
'Dim ThingSalty(1000) As Boolean
'Dim ThingSour(1000) As Boolean
'Dim ThingSweet(1000) As Boolean
'Dim ThingMeaty(1000) As Boolean
Dim ThingEdg1Visible(1, 1000) As Boolean
Dim ThingA1(1, 1000) As Double
Dim ThingR1(1, 1000) As Double
Dim ThingX1(1, 1000) As Double
Dim ThingY1(1, 1000) As Double
Dim ThingEdg2Visible(1, 1000) As Boolean
Dim ThingA2(1, 1000) As Double
Dim ThingR2(1, 1000) As Double
Dim ThingX2(1, 1000) As Double
Dim ThingY2(1, 1000) As Double
Dim ThingC(3, 1000) As Long
Dim XB, YB As Double
Dim Xctr, Yctr As Double
Dim Bri(1, 2, MaxFacets) As Double          'Brightness entering Facet, from 0 to 1.
Dim BriWas(1, 3, MaxFacets) As Double       'Brightness entering Facet, from 0 to 1.
Dim BriColor(1, 3, MaxFacets) As Long       'Brightness entering Facet, from 0 to 1.
Dim MaxBright(1, 3) As Double
Dim MaxBri As Double
Dim MaxBriBoth(3) As Double
Dim Eye(1, 3) As Long
Dim EyeWas(1, 3) As Long
Dim ColorName(3) As String
Dim PowerOf2(32) As Long                    '1,2,4,8,16,32,,,2147483648
Dim RemainingFoodSupply As Long
Dim TurboCycles As Long
Dim LRStr(1) As String                      'Array for "L" and "R" character String.
Dim NegPosLfRtMul(1) As Long                'Array for -1 (Left side=0) and +1 (Right side=1)
'Public variables below are loaded by the Design form.
Public Lobes As Long
Public BodyWidth As Double
Public BodyWidthHalf As Double
Public BodyLength As Double
Public BodyLengthHalf As Double
Public FacetBits As Long
Public BodyLnZm As Double
Public BodyRdZm As Double
Public BodyWdZm As Double
Public Zoom As Double
Public WheelA As Double
Public WheelSz As Double
Public WheelSzZm As Double
Public WheelBa As Double
Public WheelBaZm As Double
Public WheelRd As Double
Public WheelRdZm As Double
Public EyeAng1 As Double
Public EyeAng2 As Double
Public Facets As Long
Public EyeRd As Double
Public EyeRdZm As Double
Public EyeSp As Double
Public EyeSpZm As Double
Public EyeFw As Double
Public EyeFwZm As Double
Public EyeFOV As Double
Public InnerFacets As Long
Public MouthR As Double
Public MouthRZm As Double
Public MouthTh As Double
Public MouthThZm As Double
Public MouthFw As Double
Public MouthFwZm As Double
Public FoodRd As Double
Public FoodRdZm As Double
Public FoodArea As Double
Public StomachHolds As Long
Public StomachDrains As Double
Dim StomachAmount As Double
Public AntBasalKnobForward As Double
Public AntBasalKnobSpace As Double
Public AntScapeAngle As Double
Public AntScapeLength As Double
Public AntPedicelAngle As Double
Public AntPedicelLength As Double
Public AntPedicelStrength As Double
Public AntFlagellumLength As Double
Public MotorSpeed As Double                 'Travel dist. per time-step when Speed=1.
Public MotorTurnAngle As Double             'Angle change per GoLft/GoRgt being a 1.
Dim XBasalL As Long
Dim YBasalL As Long
Dim XBasalR As Long
Dim YBasalR As Long
Dim XScapeL As Long
Dim YScapeL As Long
Dim XScapeR As Long
Dim YScapeR As Long
Dim XPedicL As Long
Dim YPedicL As Long
Dim XPedicR As Long
Dim YPedicR As Long
Dim XPedicLCtr As Long
Dim YPedicLCtr As Long
Dim XPedicRCtr As Long
Dim YPedicRCtr As Long
Dim XFlageL As Long
Dim YFlageL As Long
Dim XFlageR As Long
Dim YFlageR As Long
Dim FileLength As Long
Dim FolderPath As String
Dim FilePath As String
Dim ConfColor(4) As Long
Dim TextConfColor(3) As Long
Dim LRspeedColor(1, 3) As Long
Dim StartUpScreenWidth As Long
Dim XD As Double
Dim YD As Double
Dim Rd As Long
Dim Gr As Long
Dim Bl As Long
Dim BotAng As Double
Dim BotAngWas As Double
Dim BotAngChange As Double
Dim BotAngChangeWas As Double
Dim BotX As Double
Dim BotY As Double
Dim BotXWas As Double
Dim BotYWas As Double
Dim DrawX As Long
Dim DrawY As Long
Dim BodyX1 As Double
Dim BodyY1 As Double
Dim BodyX2 As Double
Dim BodyY2 As Double
Dim FacetStep As Double
Dim FacetAng(1, MaxFacets) As Double
Dim BotFacetAng(1, MaxFacets) As Double
Dim FacetCtrAng(1, MaxFacets) As Double
Dim EA As Double
Dim EA1 As Double
Dim EA2 As Double
Dim BetweenEyesX As Double
Dim BetweenEyesY As Double
Dim EyeX(1) As Double
Dim EyeXZm(1) As Long
Dim EyeY(1) As Double
Dim EyeYZm(1) As Long
Dim MouthX As Double
Dim MouthY As Double
Dim MouthXZm As Long
Dim MouthYZm As Long
Dim LftAng As Double
Dim RgtAng As Double
Dim ALft As Double
Dim ARgt As Double
Dim A1 As Double
Dim A2 As Double
Dim R As Double
Dim TW As Long
Dim TW2 As Long
Dim TH As Long
Dim TH2 As Long
Dim C As Long
Dim C1 As Long
Dim C2 As Long
Dim C3 As Long
Dim C4 As Long
Dim X As Double
Dim Y As Double
Dim X1 As Long
Dim Y1 As Long
Dim X2 As Long
Dim Y2 As Long
Dim X3 As Long
Dim Y3 As Long
Dim X1zm, Y1zm, X2zm, Y2zm, Rdzm As Long
Dim FacetFullWidth As Long
Dim XPix As Long
Dim YPix As Long
Dim XCirPix As Long
Dim YCirPix As Long
Dim FSO As Variant
Dim Pic
Dim CirBotX1 As Long
Dim CirBotY1 As Long
Dim CirBotX2 As Long
Dim CirBotY As Long
Dim CirBotSize As Long
Dim RAMHeight As Long
Dim RAMDataHeight As Long
Dim RAMWidth As Long
Dim RAMX1 As Long
Dim RAMY1 As Long
Dim RAMX2 As Long
Dim RAMArrowX1 As Long
Dim RAMArrowX2 As Long
Dim RAMAddrArrowX1 As Long
Dim RAMAddrArrowX2 As Long
Dim RAMY2 As Long
Dim RAMCtr As Long
Dim RAMAddrInY(32) As Long
Dim RAMAddrColor(32) As Long
Dim RAMDataInY(16) As Long
Dim RAMDataOutY(16) As Long
Dim RAMDataInColor(32) As Long
Dim RAMDataOutColor(32) As Long
Dim SensorAddrBit(32) As Long
Dim CNFInPinSpacing As Double
Dim CNFAddrInX(32) As Long
Dim CNFAddrInY As Long
Dim CNFDataInX(1, 1) As Long
Dim CNFDataInY(1, 1) As Long
Dim CNFDataOutX(1, 1) As Long
Dim CNFDataOutY(1, 1) As Long
Dim CNFHeight As Long
Dim CNFHeightHalf As Long
Dim CNFWidth As Long
Dim CNFX1 As Long
Dim CNFX2 As Long
Dim CNFY1 As Long
Dim CNFY2 As Long
Dim CNFY3 As Long
Dim GUESSXCtr As Long
Dim GUESSX1 As Long
Dim GUESSY1 As Long
Dim GUESSX2 As Long
Dim GUESSY2 As Long
Dim GUESSWidth As Long
Dim GUESSWidthHalf As Long
Dim GUESSHeight As Long
Dim GUESSHeightHalf As Long
Dim GUESSArrowX1 As Long
Dim GUESSArrowX2 As Long
Dim ChipDrawWidth As Long
Dim ChipDrawWidthHalf As Long
Dim ChipDrawWidthTriple As Long
Dim InChipDrawWidth As Long
Dim BusWidth As Long
Dim BusWidthDouble As Long
Dim BusWidthTriple As Long
Dim BusSpace As Long
Dim BusSpaceHalf As Long
Dim BusStartX As Long
Dim BusStartY As Long
Dim ArrowX As Long
Dim AnalogBusWidth As Long
Dim Margin As Long
Dim PinSpace As Long
Dim CirHeight As Long
Dim PinX As Long
Dim PinY As Long
Dim DataN As Long
Dim Wire1X As Long
Dim Wire1Y As Long
Dim Wire2X As Long
Dim Wire2Y As Long
Dim Wire3X As Long
Dim Wire3Y As Long
Dim Wire4X As Long
Dim Wire4Y As Long
Dim WireLen As Long
Dim OutX As Long
Dim ArrowWidth As Long
Dim ArrowBump As Long
Dim ArrX As Long
Dim DataInStr As String
Dim DataOutStr As String
Dim AddrStr As String
Dim AddrWasStr As String
Dim PadSize As Long
Dim BusX As Long
Dim BusY As Long
Dim BusX1 As Long
Dim BusY1 As Long
Dim BusX2 As Long
Dim BusY2 As Long
Dim BusRoom As Long
Dim DataBusX1(7) As Long
Dim DataBusY1(7) As Long
Dim DataBusX2(7) As Long
Dim DataBusY2(7) As Long
Dim DataBusColor(7) As Long
Dim DataBusCount As Long
Dim AddrNum As Long
Dim OnOffColor(1) As Long
Dim MotorWidth As Long
Dim MotorHeight As Long
Dim MotorX1(1) As Long
Dim MotorY1(1) As Long
Dim MotorX2(1) As Long
Dim MotorY2(1) As Long
Dim MotorPin(1, 3) As Long
Dim MotorArrowX1 As Long
Dim MotorArrowX2 As Long
Dim Sense As Long
Dim EyeTowardsX(1) As Long
Dim EyeTowardsY(1) As Long
Dim EyeTowardsX1(1) As Long
Dim EyeTowardsY1(1) As Long
Dim EyeTowardsX2(1) As Long
Dim EyeTowardsY2(1) As Long
Dim EyeSeesX(1) As Long
Dim EyeSeesY(1) As Long
Dim EyeSeesX1(1) As Long
Dim EyeSeesY1(1) As Long
Dim EyeSeesX2(1) As Long
Dim EyeSeesY2(1) As Long
Dim BoxWidth As Long
Dim BoxWidthHalf As Long
Dim CorrPinX As Long
Dim CorrPinY As Long
Dim GoFwPinX As Long
Dim GoFwPinY As Long
Dim GoRvPinX As Long
Dim GoRvPinY As Long
Dim GoLfPinX As Long
Dim GoLfPinY As Long
Dim GoRtPinX As Long
Dim GoRtPinY As Long
Dim HungryX As Long
Dim HungryY As Long
Dim LabelX As Long
Dim AnalogColor As Long
Dim XA As Long
Dim SpeedColor(100) As Long         'Memory array to Color code travel speed.
Dim XcPix As Long
Dim YcPix As Long
Dim XcScale As Double
Dim YcScale(4) As Double
Dim XcInc As Double
Dim YcInc As Long
Dim XChart As Long
Dim YChart(4, 1000) As Long

Private Sub DrawXScroll_Scroll()
      Call DrawXScroll_Change
End Sub
Private Sub DrawXScroll_Change()
'Save the Y,Y location to Draw at (set by two Scrolls) into fast calculating Long variable.
If LoadOnly = True Then Exit Sub
   Call DrawBot
End Sub

Private Sub DrawYScroll_Scroll()
       Call DrawYScroll_Change
End Sub
Private Sub DrawYScroll_Change()
'Save the Y,Y location to Draw at (set by two Scrolls) into fast calculating Long variable.
If LoadOnly = True Then Exit Sub
   Call DrawBot
End Sub

Private Sub Form_Load()
 XcPix = Chart.Picture1.Width
 YcPix = Chart.Picture1.Height - 1
'Variables to draw Line Chart
 Set FSO = CreateObject("Scripting.FileSystemObject")
 OnOffColor(0) = WireOffColor
 OnOffColor(1) = WireOnColor
  SubSysColor(0) = vbRed                '0=Red vision SubSystem
  SubSysColor(1) = vbGreen              '1=Green vision SubSystem
  SubSysColor(2) = vbBlue               '2=Blue vision SubSystem
  SubSysColor(3) = vbBlack              '3=No active vision SubSystem
  Set Pic = Picture1                    'Set "Pic" to draw in this forms Picture1 box.
'Center of screen coordinates.
   XCirPix = Circuit.Picture1.Width
   YCirPix = Circuit.Picture1.Height
   XPix = Pic.Width
   YPix = Pic.Height
  Call TurboCyclesScroll_Change         'Calculate TurboCycles and show result in label.
  Call SeedRandomCheck_Click            'Seeds Random generator if checkbox is selected.
'DrawXScroll, DrawYScroll is where to Draw Bot on screen.
  LoadOnly = True       'Load values into scroll, only. Would otherwise draw before ready to start.
   DrawXScroll.Max = XPix - 1
   DrawYScroll.Max = YPix - 1
   DrawXScroll = XPix / 2
   DrawYScroll = YPix / 2
'Save array with Powers of 2 for each N bit position from 0 to 31.  (0)=1, (1)=2, (2)=4,,,
  PowerOf2(0) = 1
 For Bt = 1 To 30            'Filling Bit 0 requires 1 bit of maximum count 31, max N=30 on 32 bit CPU.
  PowerOf2(Bt) = 2 ^ Bt
 Next Bt
'Save array to be used for forming strings that show which color screen is being used.
  ColorName(0) = "Blue"
  ColorName(1) = "Green"
  ColorName(2) = "Red"
  ColorName(3) = ""
'Load array that is Multiplied by to place things on either -1=Left side or +1=Right side of body.
  NegPosLfRtMul(0) = -1
  NegPosLfRtMul(1) = 1
'Load array for converting Lobe Number (0-1) to Lobe String to show on screen.
   LRStr(0) = "Left"
   LRStr(1) = "Right"
'Load Confidence Colors that will be used by program to show its changing level from 0 to 3
  ConfColor(0) = vbRed
  ConfColor(1) = vbYellow
  ConfColor(2) = vbGreen
  ConfColor(3) = vbWhite
  TextConfColor(0) = RGB(255, 180, 180)     'Brighter Red to show on screen better.
  TextConfColor(1) = RGB(180, 255, 180)     'Brighter Green to show on screen better.
  TextConfColor(2) = vbCyan
  TextConfColor(3) = vbWhite
   StartUpScreenWidth = XPix
    Pic.ForeColor = vbWhite
    Pic.FillStyle = 0
    Pic.FontTransparent = False
  Addressing.Hide                           'Load the Addressing Form.
  Chart.Hide
  Circuit.Hide                              'Load the Circuit Form.
   DoEvents                                 'Respond to tasks above.
  Design.Hide                               'Load the Design Form.
  LoadOnly = False
'Load the Confidence TruthTable form and array used by algorithm to set Confidence level.
  ConfidenceTruthTable.Hide
   DoEvents                                 'Respond to tasks above.
   Call LoadSettingsFile                    'Load saved settings for this form.
   Call Design.CalcDesign
   ConfAverages = 2 ^ (ConfAveragesScroll - 1)
   DoEvents                                 'Respond to tasks above.
 Call LoadAddressingArrays
  CycleTimer.Enabled = True                 'Enable Interval Timer for "CycleTimer" Subroutine.
End Sub

'Program goes here when ended by clicking "Close" button [X] in very right corner of screen.
Private Sub Form_Unload(Cancel As Integer)
   Close #2                     'Close file buffer for saving RunDateTime.Txt to finish.
   CycleTimer.Enabled = False   'Make sure timers are disabled before ending program.
   DoEvents                     'Respond to any unfinished tasks that were in progress.
'Computer goes here when the "Close" button is clicked to end program.
   Unload Design                'Unload the Design Form from memory.
   Unload Chart                 'Unload the Chart Form from memory.
   Unload Circuit               'Unload the Circuit Form from memory.
   Unload Addressing            'Unload the Addressing Form from memory.
   Unload ConfidenceTruthTable  'Unload the Truth Table Form from memory.
   Unload Notes                 'Unload the Notes Form from memory.
   DoEvents                     'Respond to tasks above.
'Release all the system and memory resources associated with the forms.
   Set Design = Nothing
   Set Chart = Nothing
   Set Circuit = Nothing
   Set Addressing = Nothing
   Set ConfidenceTruthTable = Nothing
   Set Notes = Nothing
   DoEvents                     'Have Windows respond to the tasks.
   Set Intelligence = Nothing
   DoEvents                     'Have Windows respond to the final task of removing this form.
End Sub                         'End program without anything left running or in RAM.

Private Sub SaveSettingsCommand_Click()
                      FolderPath = App.Path & "\Settings"
  If FSO.FolderExists(FolderPath) = False Then MkDir FolderPath
   Open FolderPath & "\IntelligenceForm.txt" For Output As #1
      Print #1, ZoomScroll
      Print #1, TurboCyclesScroll
      Print #1, ConfAveragesScroll
      Print #1, StepTime
      Print #1, FeedersScroll
      Print #1, FoodAreaScroll
      Print #1, FeederSizeScroll
      Print #1, FeederFoodAmountScroll
      Print #1, ShowFoodAmountCheck
      Print #1, MulticolorCheck
      Print #1, ColorSystemCheck(0)
      Print #1, ColorSystemCheck(1)
      Print #1, ColorSystemCheck(2)
      Print #1, ColorSystemCheck(3)
      Print #1, SeedRandomCheck
      Print #1, SaveRunFileCheck
      Print #1, ShowEyeSignalsCheck
      Print #1, ShowVisualFieldCheck
      Print #1, ShowSpinCheck
      Print #1, ShowAntennaCheck
   Close #1
   SaveSettingsCommand.Caption = "Settings Saved"
End Sub

Private Sub LoadSettingsFile()
   On Error GoTo ErrorExit
 LoadOnly = True
   Open App.Path & "\Settings\IntelligenceForm.txt" For Input As #1
      Input #1, N: ZoomScroll = N
      Input #1, N: TurboCyclesScroll = N
      Input #1, N: ConfAveragesScroll = N
      Input #1, N: StepTime = N
      Input #1, N: FeedersScroll = N
      Input #1, N: FoodAreaScroll = N
      Input #1, N: FeederSizeScroll = N
      Input #1, N: FeederFoodAmountScroll = N
      Input #1, N: ShowFoodAmountCheck = N
      Input #1, N: MulticolorCheck = N
      Input #1, N: ColorSystemCheck(0) = N
      Input #1, N: ColorSystemCheck(1) = N
      Input #1, N: ColorSystemCheck(2) = N
      Input #1, N: ColorSystemCheck(3) = N
      Input #1, N: SeedRandomCheck = N
      Input #1, N: SaveRunFileCheck = N
      Input #1, N: ShowEyeSignalsCheck = N
      Input #1, N: ShowVisualFieldCheck = N
      Input #1, N: ShowSpinCheck = N
      Input #1, N: ShowAntennaCheck = N
ErrorExit:
   Close #1
 LoadOnly = False
End Sub

'One second ClockTimer keeps time on screen, to know how long it has been running.
Private Sub ClockTimer_Timer()
   ClockLabel = Time
   CyclesPerSecondLabel = CycleLabel - CycleWasLabel
   CycleWasLabel = CycleLabel
End Sub

Private Sub ConfAveragesScroll_Change()
   ConfAverages = 2 ^ (ConfAveragesScroll - 1)
   ConfAveragesLabel = ConfAverages
End Sub

Private Sub FullScreenCheck_Click()
 If FullScreenCheck = 1 Then
    XPix = FullScreenCheck.Left + FullScreenCheck.Width - Pic.Left
 Else
    XPix = StartUpScreenWidth
 End If
    Pic.Width = XPix
   Call DrawBot
End Sub

Private Sub ConfidenceCheck_Click()
 If ConfidenceCheck = 1 Then
   Call ConfidenceTruthTable.FillTruthTables(TruthTable())
    ConfidenceTruthTable.Left = ConfidenceCheck.Left * Screen.TwipsPerPixelX
    ConfidenceTruthTable.Top = (Pic.Top * Screen.TwipsPerPixelY) + 400
    ConfidenceTruthTable.Show vbModeless, Intelligence
 Else
    ConfidenceTruthTable.Hide
 End If
End Sub

Private Sub AddressingCheck_Click()
 If AddressingCheck = 1 Then
    Addressing.Left = Screen.Width - Addressing.Width
    Addressing.Top = ((Picture1.Top + Picture1.Height) * Screen.TwipsPerPixelX) - Addressing.Height + 400
    Addressing.Show vbModeless, Intelligence
 Else
    Addressing.Hide
 End If
End Sub

Private Sub ChartCheck_Click()
 If ChartCheck = 0 Then
    Chart.Hide
 Else
    Chart.Left = 0
    Chart.Top = ((Picture1.Top + Picture1.Height) * Screen.TwipsPerPixelX) - Chart.Height + 400
    Chart.Show vbModeless, Intelligence
 End If
End Sub

Private Sub DesignCheck_Click()
 If DesignCheck = 1 Then
    Design.Left = Screen.Width - Design.Width
    Design.Top = ((Picture1.Top + Picture1.Height) * Screen.TwipsPerPixelX) - Design.Height + 400
    Design.Show vbModeless, Intelligence
 Else
    Design.Hide
 End If
End Sub

Private Sub CircuitCheck_Click()
 If CircuitCheck = 0 Then
    Circuit.Hide
 Else
    Circuit.Left = (CircuitCheck.Left + CircuitCheck.Width) * Screen.TwipsPerPixelX
    Circuit.Top = 0
'Show the form on the screen.
   Call CalculateCirBotXY
   Call DrawFullCircuit
    Circuit.Show vbModeless, Intelligence
 End If
End Sub

Private Sub NotesCheck_Click()
 If NotesCheck = 0 Then
    Notes.Hide
 Else
    Notes.Left = 0
    Notes.Top = ((Picture1.Top + Picture1.Height) * Screen.TwipsPerPixelX) - Notes.Height + 400
    Notes.NotesText = vbCrLf & "     LOADING NOTES"
    Notes.Show vbModeless, Intelligence
    DoEvents
    Notes.NotesText.LoadFile App.Path & "\Notes.rtf", rtfRTF
 End If
End Sub

Public Sub CalculateCirBotXY()
Dim AngSave As Double
Dim AntSave(1) As Long
Dim Spd As Long
Dim ScaleSize As Double
    Set Pic = Circuit.Picture1
   DrawScale = 2 ^ Circuit.CircuitSizeScroll
   Pic.Width = XCirPix * DrawScale
   Pic.Height = YCirPix * DrawScale
   XPix = Pic.Width
   YPix = Pic.Height
'Save the leftmost possible point of the Antenna in CirBotX1.
      DrawX = Pic.Width * 0.7               'Set DrawX,Y to center for room all around.
      DrawY = Pic.Height * 0.5
      CirBotSize = Pic.Width / (10 - (4 * (Circuit.BotSizeScroll / 100)))   'Size of body to draw in circuit diagram
      AngSave = BotAngChange                 'Save variable needed to draw turning.
      AntSave(0) = Ant(0)                    'Save variable needed to draw in full reverse.
      BotAngChange = -MotorTurnAngle
      Ant(0) = 0                            '0 is antenna in full reverse speed.
    Call DrawBotInSetPicture(PI, CirBotSize)
   If XFlageL < XPedicL Then
        CirBotX1 = XFlageL                  'Flagellum is the leftmost point of antenna.
   Else
     If XScapeL < XPedicL Then
        CirBotX1 = XScapeL                  'Scape is the leftmost point of antenna.
     Else
        CirBotX1 = XPedicL                  'Pedicel is the leftmost point of antenna.
     End If
   End If
        CirBotX1 = CirBotX1 - (BodyWidth / 20 * CirBotSize)      'Add Antenna thickness.
'Check for leftmost point the Eye instead of Antenna.
                      R = EyeRdZm + (FacetFullWidth / 2.2)
      X = EyeXZm(0) - R
   If X < CirBotX1 Then CirBotX1 = X
'Check for leftmost point the mouth.
      X = MouthXZm - MouthRZm - MouthThZm
   If X < CirBotX1 Then CirBotX1 = X
'Save the lowest possible point of the Antenna in CirBotY1 by moving speed range.
      CirBotY = 0                          'Start off at 0
      BotAngChange = MotorTurnAngle
   For Ant(0) = 0 To 7
     Call DrawBotInSetPicture(PI, CirBotSize)
     If YFlageL > CirBotY Then CirBotY = YFlageL
   Next Ant(0)
      CirBotY = CirBotY + (BodyWidth / 20 * CirBotSize)      'Add Antenna thickness.
'Check for wheels the lowest CirBoty point.
      Y = Sin(WheelA) * WheelRdZm
      Y = Y + DrawY + WheelSzZm + OutlineWidth + OutlineWidth
   If Y > CirBotY Then CirBotY = Y
      CirBotY = CirBotY - DrawY           'Eliminate unneeded DrawY amount.
'Check for wheels the rightmost CirBotX2 point.
      CirBotX2 = BodyLnZm + (BodyRdZm / 2)
      X = Cos(WheelA) * WheelRdZm
      X = X + WheelSzZm + OutlineWidth + OutlineWidth
   If X > CirBotX2 Then CirBotX2 = X
      BotAngChange = AngSave                'Restore BotAngChange variable to Angle it Was.
      Ant(0) = AntSave(0)                   'Restore Antenna reading.
'Adjust draw location variables to center at top of screen, pointing to the left.
      CirBotX1 = DrawX - CirBotX1
    Pic.Cls
End Sub

'  GUESS square shows large arrow inside color of guess taken, 0=black and 1=red.
'  Good guess keeps same motor data, has line from data input at bottom to arrow.
'  Random guess is not influenced by what motor data was, shows no line to arrow.
'  ChipAdjWas is from previous cycle because of that used at start of this cycle.
Private Sub DrawGuessChip(DataBit As Long, ChipCnf As Long, ChipAdjWas As Long)
   X1 = GUESSX1 + (GUESSWidth * 0.55)
   GUESSY1 = RAMDataInY(DataBit) - GUESSHeightHalf
   GUESSY2 = RAMDataInY(DataBit) + GUESSHeightHalf
'Set FillStyle to either clear inside square or transparent.
 If ChipCnf = 0 Then
     If DataOut > 0 Or ChipAdjWas = -1 Then       'If not a new memory when 0 then random guess.
       Pic.FillStyle = 0        'Random Guess shows all clear around center arrow.
     Else
       Pic.FillStyle = 1        'Good Guess uses same motor settings, line connects to arrow.
     End If
 Else
       Pic.FillStyle = 1        'Not a Guess draws clear center.
 End If
'Draw GUESS circuits that change state of Data location, that normally stays the same.
     Pic.DrawWidth = BusWidth
  Call WireAroundClear(RAMX2, RAMDataInY(DataBit), RAMArrowX2, RAMDataOutY(DataBit), X1, RAMDataInColor(DataBit))
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, RAMDataInY(DataBit), RAMDataInColor(DataBit))
     Pic.DrawWidth = ChipDrawWidth
     Pic.Line (GUESSX1, GUESSY1)-(GUESSX2, GUESSY2), vbBlack, B
'Draw large arrow.
 If ChipCnf = 0 Then
     Pic.DrawWidth = BusWidth * 2
   If DataOut > 0 Or ChipAdjWas = -1 Then       'If not a new memory when 0 then random guess.
     CfStr = "Random"
     Pic.Line (GUESSX1 + ChipDrawWidth + BusWidth, RAMDataInY(DataBit))-(GUESSX2 - ChipDrawWidth - BusWidth, RAMDataInY(DataBit)), RAMDataInColor(DataBit)
   Else
     CfStr = "Good"
     Pic.Line (GUESSX1 + ChipDrawWidth + BusWidth, RAMDataInY(DataBit))-(X1, RAMDataInY(DataBit)), RAMDataInColor(DataBit)
     Pic.Line -(X1, RAMDataInY(DataBit) + (GUESSHeightHalf)), RAMDataInColor(DataBit)
   End If
      DX = (GUESSX2 - GUESSX1) / 6
    Call DrawLeftRightArrowAlways(GUESSX1 + ChipDrawWidth, GUESSX1 + ChipDrawWidth + DX, RAMDataInY(DataBit), RAMDataInColor(DataBit))
 Else
     CfStr = "Hold"
 End If
'Draw short segment with arrow from Data Out to show what value was when read.
     Pic.DrawWidth = BusWidth
  Call DrawLeftRightArrowAlways(RAMArrowX2 + BusWidth, RAMArrowX1 + BusWidth, RAMDataOutY(DataBit), RAMDataOutColor(DataBit))
     Pic.Line (RAMX2, RAMDataOutY(DataBit))-(RAMArrowX2, RAMDataOutY(DataBit)), RAMDataOutColor(DataBit)
End Sub

Private Sub DrawConfidenceChip(ChipX As Long, ChipY As Long, ChipToX As Long, ChipDirection As Long, ChipN As Long, ChipCnf1 As Long, ChipCnf2 As Long, RAMBit As Long, IncDecAdj As Long)
'Dim ChipHeight2 As Long
Dim ChipX1 As Long
Dim ChipY1 As Long
Dim ChipX2 As Long
Dim ChipY2 As Long
Dim ChipX3 As Long
Dim ChipY3 As Long
Dim CnfStr1 As String
Dim CnfStr2 As String
    ChipX1 = ChipX
    ChipY1 = ChipY
    ChipX2 = ChipX + (CNFWidth * ChipDirection)
    ChipY2 = ChipY + CNFHeight
    ChipX3 = ChipX2 + (CNFHeightHalf * ChipDirection)
    ChipY3 = ChipY + CNFHeightHalf
'Draw lines that connect from pointed side to data pins.
   CnfStr1 = BinStr(2, ChipCnf1)
   CnfStr2 = BinStr(2, ChipCnf2)
   Pic.DrawWidth = BusWidth
'Draw connection from tip of Confidence chip to GUESS lines, On when Confidence=0
    If ChipCnf1 > 0 Then
       C = WireOffColor
    Else
      If IncDecAdj = -1 Then C = WireOnColor Else C = vbBlue
    End If
  Call WireAroundClear(ChipX3, ChipY3, GUESSX2, RAMDataInY(RAMBit + 2), BusStartX, C)
  Call DrawLeftRightArrowAlways(GUESSArrowX1, GUESSArrowX2, RAMDataInY(RAMBit + 2), C)
  Call WireAround(ChipX3, ChipY3, GUESSX2, RAMDataInY(RAMBit + 3), BusStartX, C)
  Call DrawLeftRightArrowAlways(GUESSArrowX1, GUESSArrowX2, RAMDataInY(RAMBit + 3), C)
  Call DrawPad(BusStartX, RAMDataInY(RAMBit + 2), C)
'Draw connection from Confidence chip Cnf1 pin to pin for RAM Data Out.
    Wire4X = CNFDataInX(ChipN, 1) + WireLen
    Wire4Y = CNFDataInY(ChipN, 1) + WireLen
     C4 = OnOffColor(Val(Left(CnfStr1, 1)))
     Pic.DrawWidth = BusWidth
  Call WireAroundClear(Wire4X, Wire4Y, RAMX2, RAMDataOutY(RAMBit + 1), BusStartX - (BusSpace * 1), C4)
  Call DrawLeftRightArrowAlways(RAMArrowX2 + BusWidth, RAMArrowX1 + BusWidth, RAMDataOutY(RAMBit + 1), C4)
'Draw connection from Confidence chip Cnf1 pin to pin for RAM Data In.
    Wire3X = CNFDataOutX(ChipN, 1) + WireLen
    Wire3Y = CNFDataOutY(ChipN, 1) + WireLen
     C3 = OnOffColor(Val(Left(CnfStr2, 1)))
  Call WireAroundClear(Wire3X, Wire3Y, RAMX2, RAMDataInY(RAMBit + 1), BusStartX - (BusSpace * 2), C3)
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, RAMDataInY(RAMBit + 1), C3)
'Draw connection from Confidence chip Cnf0 pin to pin for RAM Data Out.
    Wire2X = CNFDataInX(ChipN, 0) + WireLen
    Wire2Y = CNFDataInY(ChipN, 0) + WireLen
     C2 = OnOffColor(Val(Right(CnfStr1, 1)))
  Call WireAroundClear(Wire2X, Wire2Y, RAMX2, RAMDataOutY(RAMBit), BusStartX - (BusSpace * 3), C2)
  Call DrawLeftRightArrowAlways(RAMArrowX2 + BusWidth, RAMArrowX1 + BusWidth, RAMDataOutY(RAMBit), C2)
'Draw connection from Confidence chip Cnf0 pin to pin for RAM Data In.
    Wire1X = CNFDataOutX(ChipN, 0) + WireLen
    Wire1Y = CNFDataOutY(ChipN, 0) + WireLen
     C1 = OnOffColor(Val(Right(CnfStr2, 1)))
  Call WireAroundClear(Wire1X, Wire1Y, RAMX2, RAMDataInY(RAMBit), BusStartX - (BusSpace * 4), C1)
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, RAMDataInY(RAMBit), C1)
'Draw wires from chip that may have been partially erased from clearing space next to it.
   Pic.Line (Wire4X, Wire4Y)-(BusStartX - (BusSpace * 1), Wire4Y), C4
   Pic.Line (Wire2X, Wire2Y)-(BusStartX - (BusSpace * 3), Wire2Y), C2
'Draw the four diagonal wires from pin to bus.
   Pic.Line (CNFDataInX(ChipN, 1), CNFDataInY(ChipN, 1))-(Wire4X, Wire4Y), C4
   Pic.Line (CNFDataOutX(ChipN, 1), CNFDataOutY(ChipN, 1))-(Wire3X, Wire3Y), C3
   Pic.Line (CNFDataInX(ChipN, 0), CNFDataInY(ChipN, 0))-(Wire2X, Wire2Y), C2
   Pic.Line (CNFDataOutX(ChipN, 0), CNFDataOutY(ChipN, 0))-(Wire1X, Wire1Y), C1
'Draw outline of chip on screen.
   Pic.DrawWidth = ChipDrawWidth
   Pic.Line (ChipX1, ChipY1)-(ChipX2, ChipY1), vbBlack
   Pic.Line (ChipX1, ChipY2)-(ChipX2, ChipY2), vbBlack
   Pic.Line (ChipX1, ChipY1)-(ChipX1, ChipY2), vbBlack
   Pic.Line (ChipX2, ChipY1)-(ChipX3, ChipY3), vbBlack
   Pic.Line (ChipX2, ChipY2)-(ChipX3, ChipY3), vbBlack
End Sub

'For drawing bus lines left or right Around something, in [ or ] shape.
Private Sub WireClear(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, WireColor As Long)
   Pic.DrawWidth = BusWidthTriple
   Pic.Line (WireX1, WireY1)-(WireX2, WireY2), vbWhite
   Pic.DrawWidth = BusWidth
   Pic.Line (WireX1, WireY1)-(WireX2, WireY2), WireColor
End Sub

'For drawing bus lines left or right Around something, in [ or ] shape.
Private Sub WireAround(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, WireOutX As Long, WireColor As Long)
'   Pic.DrawWidth = BusWidth
   Pic.Line (WireX1, WireY1)-(WireOutX, WireY1), WireColor
   Pic.Line -(WireOutX, WireY2), WireColor
   Pic.Line -(WireX2, WireY2), WireColor
End Sub

'For drawing bus lines left or right Around something, in [ or ] shape.
Private Sub WireAroundClear(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, WireOutX As Long, WireColor As Long)
'   Pic.DrawWidth = BusWidthTriple
   Pic.DrawWidth = Pic.DrawWidth * 3
   Pic.Line (WireX1, WireY1)-(WireOutX, WireY1), vbWhite
   Pic.Line -(WireOutX, WireY2), vbWhite
   Pic.Line -(WireX2, WireY2), vbWhite
   Pic.DrawWidth = Pic.DrawWidth / 3
'   Pic.DrawWidth = BusWidth
   Pic.Line (WireX1, WireY1)-(WireOutX, WireY1), WireColor
   Pic.Line -(WireOutX, WireY2), WireColor
   Pic.Line -(WireX2, WireY2), WireColor
End Sub

'For drawing bus lines from Data side, under RAM chip, up to Address pins on other side.
Private Sub WireUnder(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, WireUnderY As Long, WireColor As Long)
   Pic.DrawWidth = BusWidth
   Pic.Line (WireX1, WireY1)-(WireX1, WireUnderY), WireColor
   Pic.Line -(WireX2, WireUnderY), WireColor
   Pic.Line -(WireX2, WireY2), WireColor
End Sub

'For drawing bus lines from Data side, under RAM chip, up to Address pins on other side.
Private Sub WireUnderClear(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, WireUnderY As Long, WireColor As Long)
   Pic.DrawWidth = BusWidthTriple
   Pic.Line (WireX1, WireY1)-(WireX1, WireUnderY), vbWhite
   Pic.Line -(WireX2, WireUnderY), vbWhite
   Pic.Line -(WireX2, WireY2), vbWhite
   Pic.DrawWidth = BusWidth
   Pic.Line (WireX1, WireY1)-(WireX1, WireUnderY), WireColor
   Pic.Line -(WireX2, WireUnderY), WireColor
   Pic.Line -(WireX2, WireY2), WireColor
End Sub

'Draws Arrow head left when ArrowX1<ArrowX2, to right when ArrowX1>ArrowX2, X1 is tip end.
Private Sub DrawLeftRightArrow(ArrowX1 As Long, ArrowX2 As Long, ArrowY As Long, ArrowColor As Long)
 If ColorSystemCheck(S) = 0 Then Exit Sub           'Do not draw if Subsystem is not in circuit.
   Call DrawLeftRightArrowAlways(ArrowX1, ArrowX2, ArrowY, ArrowColor)
End Sub

'Draws Arrow head left when ArrowX1<ArrowX2, to right when ArrowX1>ArrowX2, X1 is tip end.
Private Sub DrawLeftRightArrowAlways(ArrowX1 As Long, ArrowX2 As Long, ArrowY As Long, ArrowColor As Long)
      ArrX = ArrowX2 - ArrowX1
   Pic.Line (ArrowX2, ArrowY - ArrX)-(ArrowX1, ArrowY), ArrowColor
 If (Pic.DrawWidth And 1) = 1 Then       'Is one when odd number width like 3 which centers good.
   Pic.Line -(ArrowX2, ArrowY + ArrX), ArrowColor
 Else       'Move lower part of arrow up one pixel to make mismatch with line look better.
   Pic.Line (ArrowX2, ArrowY + ArrX - 1)-(ArrowX1, ArrowY - 1), ArrowColor
 End If
End Sub

'For drawing bus lines from Data side, under RAM chip, up to Address pins on other side.
Private Sub DrawPad(PadX As Long, PadY As Long, PadColor As Long)
   Pic.DrawWidth = PadSize
 If (BusWidth And 1) = 0 Then       'Is 0 when even number like 2, circle not centered.
'Draw 2 circles to make an oval that fills all around it evenly.
   Pic.PSet (PadX, PadY - 1), PadColor          'Draw first circle
   Pic.PSet (PadX - 1, PadY - 1), PadColor
 Else
   Pic.PSet (PadX, PadY), PadColor          'Draw first circle
 End If
End Sub

Private Sub LabelRAMData(LabelY As Long, LabelStr As String)
   Pic.CurrentY = LabelY - TH2
   Pic.CurrentX = LabelX - Pic.TextWidth(LabelStr)
   Pic.Print LabelStr
End Sub

Private Sub LabelConfidenceIncDec(LabelY As Long, Adj As Long, Cf1 As Long, Cf2 As Long)
  If Adj = 1 Then
    NStr1 = "Increment "
    NStr2 = "+" & Format(Adj) & "=" & Format(Cf2)   'Positive number needs plus sign added.
  Else
    NStr1 = "Decrement "
    NStr2 = Format(Adj) & "=" & Format(Cf2)         'Negative number already has minus sign.
  End If
   Pic.CurrentX = RAMX2 - Pic.TextWidth(NStr1)      'Print strings without width changing.
   Pic.CurrentY = LabelY - (TH * 0.85)
   Pic.Print NStr1
   NStr2 = NStr2 & " out"
   Pic.CurrentX = RAMX2 - Pic.TextWidth(NStr2)      'Print strings without width changing.
   Pic.CurrentY = LabelY
   Pic.Print NStr2;
   NStr = Format(Cf1) & " in "
   Pic.CurrentX = RAMX2 - Pic.TextWidth(NStr & "+1=3 out")
   Pic.CurrentY = LabelY
   Pic.Print NStr;
End Sub

'For drawing two lines in an L at X and Y axis.
Private Sub Wire2LinesBetween(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, WireColor As Long)
 If ColorSystemCheck(S) = 0 Then Exit Sub           'Do not draw if Subsystem is not in circuit.
   Pic.DrawWidth = BusWidth
   Pic.Line (WireX1, WireY1)-(WireX2, WireY1), WireColor
   Pic.Line -(WireX2, WireY2), WireColor
End Sub

'For drawing two lines in an L at X and Y axis.
Private Sub Wire2LinesBetweenClear(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, WireColor As Long)
 If ColorSystemCheck(S) = 0 Then Exit Sub           'Do not draw if Subsystem is not in circuit.
   Pic.DrawWidth = BusWidthTriple
   Pic.Line (WireX1, WireY1)-(WireX2, WireY1), vbWhite
   Pic.Line -(WireX2, WireY2), vbWhite
   Pic.DrawWidth = BusWidth
   Pic.Line (WireX1, WireY1)-(WireX2, WireY1), WireColor
   Pic.Line -(WireX2, WireY2), WireColor
End Sub

Private Sub Wire2LinesBetweenBus(WireX1 As Long, WireY1 As Long, WireX2 As Long, WireY2 As Long, Reading As Long, BusBits As Long)
Dim WireColor As Long
 If ColorSystemCheck(S) = 0 Then Exit Sub           'Do not draw if Subsystem is not in circuit.
    NStr = BinStr(BusBits, Reading)
     Y2 = BusBits * BusWidth / 2
'Clear side where bus line fits inside.
   Pic.DrawWidth = BusWidthTriple
    Y1 = WireY1 + ((BusBits - 1) * BusWidth) - Y2
   Pic.Line (WireX1, Y1)-(WireX2, Y1), vbWhite
'Draw Arrow on side.
   Pic.DrawWidth = BusWidth
  Call DrawLeftRightArrow(ArrowX, ArrowX + ArrowWidth, Y1, OnOffColor(Val(Mid(NStr, BusBits, 1))))
   
'Clear sides where bus line fits inside.
   Pic.DrawWidth = BusWidthTriple
    Y1 = WireY1 - Y2
   Pic.Line (WireX1, Y1)-(WireX2, Y1), vbWhite
'Draw Arrow on side.
   Pic.DrawWidth = BusWidth
  Call DrawLeftRightArrow(ArrowX, ArrowX + ArrowWidth, Y1, OnOffColor(Val(Mid(NStr, 1, 1))))
   
  For N = 0 To BusBits - 1
    Y = N * BusWidth
    Y1 = WireY1 + Y - Y2
   Call Wire2LinesBetween(WireX1, Y1, WireX2 + ((BusBits - N - 1) * CNFInPinSpacing), WireY2, OnOffColor(Val(Mid(NStr, N + 1, 1))))
  Next N
' End If
End Sub

Private Sub DrawStaysBit(WireX As Long, WireY As Long, ValStr As String)
   StaysSize = Pic.FontSize * 1.3
   Pic.FontSize = 10 * DrawScale
   Pic.CurrentY = WireY - (Pic.TextHeight(ValStr) / 2)
   Pic.CurrentX = WireX + StaysSize - (Pic.TextWidth(ValStr) / 2)
   Pic.Print ValStr
   Pic.DrawWidth = ChipDrawWidth
   Pic.Line (WireX, WireY)-(WireX + StaysSize, WireY + StaysSize), vbBlack
   Pic.Line -(WireX + StaysSize + StaysSize, WireY), vbBlack
   Pic.Line -(WireX + StaysSize, WireY - StaysSize), vbBlack
   Pic.Line -(WireX, WireY), vbBlack
End Sub

Private Sub DrawDelayConnect(WireX As Long, WireY As Long, WireColor As Long)
   Pic.DrawWidth = 1
   Pic.Line (WireX - DelaySize, WireY - DelaySize)-(WireX + DelaySize, WireY + DelaySize), WireColor, BF
End Sub

Public Sub DrawFullCircuit()
Dim XS As Long
Dim YS As Long
Dim ChipN As Long
 Circuit.Dialog = "DRAWING"
 Circuit.Dialog.Refresh
  Set Pic = Circuit.Picture1
   DrawScale = 2 ^ Circuit.CircuitSizeScroll
   Pic.Width = XCirPix * DrawScale
   Pic.Height = YCirPix * DrawScale
   XPix = Pic.Width
   YPix = Pic.Height
   Pic.Cls
   Pic.FontTransparent = True
'Make a Binary DataString of "0" or "1" characters for Data Out pins.
   DataOutStr = BinStr(DataBits, DataOut)
   DataInStr = BinStr(DataBits, DataIn)
   AddrStr = BinStr(AllAddrBitsRAM(L, S), Right(AllAddr(S), AllAddrBitsRAM(L, S)))
'Chip drawing sizes.
   ChipDrawWidth = Fix(Pic.Width / 200) + 1
   ChipDrawWidthHalf = ChipDrawWidth / 2
   ChipDrawWidthTriple = ChipDrawWidth * 3
   InChipDrawWidth = Fix(ChipDrawWidth / 3) + 1
'Bus line drawing width sizes.
   BusWidth = Fix(Pic.Width / 300) + 1
   BusWidthDouble = BusWidth * 2
   BusWidthTriple = BusWidth * 3
   PadSize = BusWidth * 3
   DelaySize = PadSize / 2
   AnalogBusWidth = BusWidth * 1.5
'Calculate variables used to draw arrows.
   ArrowWidth = Fix(Pic.Width / 120)
   ArrowBump = ChipDrawWidthHalf + (BusWidth / 2)
'Space between bus wires and room to each side.
   BusSpace = BusWidth * 3
   BusSpaceHalf = BusSpace
   BusRoom = ArrowWidth + (BusSpace * 2)            'Room on each side when next to chip.
   Margin = (YPix / 150)
'Draw bot at bottom of picture.
   DrawX = (XPix / 2) + ((CirBotX1 - CirBotX2) / 2)
   DrawY = YPix - CirBotY - Margin - ChipDrawWidth - (BusWidth * 2)
  Call DrawBotInSetPicture(PI, CirBotSize)
   CirHeight = DrawY - CirBotY - BusSpace - Margin
'Calculate X,Y locations to draw RAM and Confidence chips.
   CNFY1 = Margin + ChipDrawWidthHalf
   RAMWidth = Pic.Width / 3.2
   RAMCtr = Pic.Width * 0.6
   CNFHeight = CirHeight / 14
   CNFY2 = CNFY1 + CNFHeight
   CNFY3 = CNFY2 + CNFHeight
   Pic.FontSize = 14 * DrawScale
   RAMY1 = CNFY3 + Pic.TextHeight("A")
   RAMX1 = RAMCtr - (RAMWidth / 2)
   RAMX2 = RAMX1 + RAMWidth
   CNFX1 = Margin + ChipDrawWidthHalf
   CNFWidth = RAMX2 - CNFX1
   RAMHeight = CirHeight - CNFY3 - ChipDrawWidth - (BusSpace * 5) - Pic.TextHeight("A")
   RAMDataHeight = Fix(RAMHeight / DataBits / 2) * 2    'Round off to 16 equal heights.
   N = RAMHeight - (RAMDataHeight * DataBits)
   CNFHeight = CNFHeight + (N / 2)                      'Give lost space to Cnf heights.
   CNFHeightHalf = CNFHeight / 2
   CNFHeight = CNFHeightHalf * 2
   CNFX2 = RAMX2 + CNFHeightHalf
   CNFY2 = CNFY1 + CNFHeight                            'Recalculate Y for new CNFHeight
   CNFY3 = CNFY2 + CNFHeight
   RAMY1 = CNFY3 + Pic.TextHeight("A")
   RAMHeight = RAMDataHeight * DataBits
   RAMY2 = RAMY1 + RAMHeight
'Label RAM chip Address_Data
   Pic.FontSize = 14 * DrawScale
   Pic.CurrentY = RAMY1 - (Pic.TextHeight("A") * 0.9)
   Pic.CurrentX = RAMX1 + BusSpace
   Pic.Print "Address";
   Pic.CurrentX = RAMX2 - BusSpace - Pic.TextWidth("Data")
   Pic.Print "Data";
'Label upper left of Confidence chips.
   Pic.FontSize = 14 * DrawScale
   Pic.CurrentX = CNFX1
   Pic.CurrentY = CNFY1
   Pic.Print " Confidence Left/Right"
   Pic.CurrentX = CNFX1
   Pic.CurrentY = CNFY2
   Pic.Print " Confidence Fwd/Rev"
'Text Height of 10 point type used to label inside chips.
   Pic.FontSize = 12 * DrawScale
   TH = Pic.TextHeight("M")
'Label lower right of Confidence chips to show confidence level Increment or Decrement.
   Call LabelConfidenceIncDec(CNFY3 - TH, FwRvAdj, FwRvCfIn, FwRvCfOut)
   Call LabelConfidenceIncDec(CNFY2 - TH, LfRtAdj, LfRtCfIn, LfRtCfOut)
'Text Height of 8 point type used to label inside chips.
   Pic.FontSize = 8 * DrawScale
   TH = Pic.TextHeight("M")
   TH2 = TH / 2
'Calculate the Y locations for RAM Data In/Out pins.
   Pic.FillStyle = 1             'Do not fill circles with color.
   Pic.DrawWidth = InChipDrawWidth
      XS = RAMX2 - (RAMWidth / 2.4)
  For N = 0 To DataBits - 1
      Y1 = RAMY1 + (N * RAMDataHeight)
      Y2 = Y1 + RAMDataHeight
      YS = RAMDataHeight * 0.27
     RAMDataInY(N) = Y1 + YS
     RAMDataOutY(N) = Y2 - YS
     RAMDataInColor(N) = OnOffColor(Val(Mid(DataInStr, DataBits - N, 1)))
     RAMDataOutColor(N) = OnOffColor(Val(Mid(DataOutStr, DataBits - N, 1)))
  Next N
'Calculate the Y locations for RAM Address In pins.
      YS = RAMHeight * (1 / AllAddrBitsRAM(L, S)) / 2
  For N = 0 To AllAddrBitsRAM(L, S) - 1
     RAMAddrInY(N) = RAMY1 + YS + (RAMHeight * (N / AllAddrBitsRAM(L, S)))
     RAMAddrColor(N) = OnOffColor(Val(Mid(AddrStr, AllAddrBitsRAM(L, S) - N, 1)))
  Next N
   RAMArrowX1 = RAMX2 + ArrowBump
   RAMArrowX2 = RAMArrowX1 + ArrowWidth
'Calculate Guess chip sizes and location.
   GUESSHeightHalf = RAMDataHeight / 3.5
   GUESSHeight = GUESSHeightHalf * 2
   GUESSWidthHalf = GUESSHeightHalf + ChipDrawWidth
   GUESSWidth = GUESSWidthHalf * 2
   GUESSX1 = RAMArrowX2 + BusWidth + (BusSpace * 6.5)
   GUESSX2 = GUESSX1 + GUESSWidth
   GUESSXCtr = (GUESSX1 + GUESSX2) / 2
   GUESSArrowX1 = GUESSX2 + ((BusWidth + ChipDrawWidth) / 2)
   GUESSArrowX2 = GUESSArrowX1 + ArrowWidth
    Pic.FillColor = vbWhite
'Calculate Motor sizes and X,Y locations.
   TW = Pic.TextWidth("MOTORS")
   MotorWidth = TW
   MotorHeight = (TH * 3) + (ChipDrawWidth * 2)
   MotorX2(0) = RAMX2
   MotorX1(0) = MotorX2(0) - TW
   MotorY1(0) = DrawY + ChipDrawWidth + TH2
   MotorY2(0) = MotorY1(0) + MotorHeight
   MotorX2(1) = RAMX2
   MotorX1(1) = MotorX2(1) - TW
   MotorY1(1) = DrawY - ChipDrawWidth - TH2
   MotorY2(1) = MotorY1(1) - MotorHeight
   MotorPin(0, 1) = MotorY1(0) + TH2 + ChipDrawWidth
   MotorPin(0, 2) = MotorY1(0) + (TH * 1.5) + ChipDrawWidth
   MotorPin(0, 3) = MotorY1(0) + (TH * 2.5) + ChipDrawWidth
   MotorPin(1, 1) = MotorY1(1) - TH2 - ChipDrawWidth
   MotorPin(1, 2) = MotorY1(1) - (TH * 1.5) - ChipDrawWidth
   MotorPin(1, 3) = MotorY1(1) - (TH * 2.5) - ChipDrawWidth
   MotorArrowX1 = MotorX1(0) - ArrowBump
   MotorArrowX2 = MotorArrowX1 - ArrowWidth
'Clear space to Draw Motors into picture of Bot.
   Pic.FillStyle = 0            'Clear center of square.
   Pic.DrawWidth = ChipDrawWidth * 4
   Pic.Line (MotorX1(0), MotorY2(0))-(MotorX2(1), MotorY2(1)), vbWhite, B
   Pic.DrawWidth = 1
   Pic.Line (MotorX1(0) - BusRoom - (BusSpace * 4), RAMY2)-(MotorX1(1) - ChipDrawWidth, MotorPin(0, 3) + BusSpace), vbWhite, B
   Pic.Line (MotorX2(0) + BusRoom + (BusSpace * 4), RAMY2)-(MotorX2(1) + ChipDrawWidth, MotorPin(0, 3) + BusSpace), vbWhite, B
'Draw bus lines from RAM Data to Motors.
   X1 = RAMX1 - BusRoom: X2 = RAMX2 + BusRoom
   Pic.DrawWidth = BusWidth
'Draw GoRight wires.
  Call WireAroundClear(RAMX2, RAMDataOutY(7), MotorX2(1), MotorPin(1, 1), X2, RAMDataInColor(7))
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, MotorPin(1, 1), RAMDataInColor(7))
'Draw GoLeft wires.
   X1 = X1 - BusSpace: X2 = X2 + BusSpace
  Call WireAroundClear(RAMX2, RAMDataOutY(6), MotorX2(0), MotorPin(0, 1), X2, RAMDataInColor(6))
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, MotorPin(0, 1), RAMDataInColor(6))
'Draw GoReverse wires.
   X1 = X1 - BusSpace: X2 = X2 + BusSpace
  Call WireAroundClear(RAMX2, RAMDataOutY(3), MotorX2(0), MotorPin(0, 2), X2, RAMDataInColor(3))
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, MotorPin(0, 2), RAMDataInColor(3))
  Call WireClear(X2, MotorPin(1, 2), MotorX2(0), MotorPin(1, 2), RAMDataInColor(3))
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, MotorPin(1, 2), RAMDataInColor(3))
  Call DrawPad(X2, MotorPin(1, 2), RAMDataInColor(3))
'Draw GoForward wires.
   X1 = X1 - BusSpace: X2 = X2 + BusSpace
   Pic.DrawWidth = BusWidth
  Call WireAroundClear(RAMX2, RAMDataOutY(2), MotorX2(0), MotorPin(0, 3), X2, RAMDataInColor(2))
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, MotorPin(0, 3), RAMDataInColor(2))
  Call WireClear(X2, MotorPin(1, 3), MotorX2(0), MotorPin(1, 3), RAMDataInColor(2))
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, MotorPin(1, 3), RAMDataInColor(2))
  Call DrawPad(X2, MotorPin(1, 3), RAMDataInColor(2))
'Calculate where to begin drawing Motor and Correlation bus lines.
   GoRtPinX = MotorX1(0) - BusRoom
   GoRtPinY = RAMY2 + (BusSpace * 1.5)
   GoLfPinX = GoRtPinX - BusSpace
   GoLfPinY = GoRtPinY + BusSpace
   GoRvPinX = GoLfPinX - BusSpace
   GoRvPinY = GoLfPinY + BusSpace
   GoFwPinX = GoRvPinX - BusSpace
   GoFwPinY = GoRvPinY + BusSpace
   CorrPinX = (GoRvPinX + EyeXZm(0)) / 2
   CorrPinY = GoFwPinY + BusSpace
'Calculate EyeSees boxes.
   BoxWidth = Pic.TextWidth(" 0 ") + ChipDrawWidth
   BoxWidthHalf = BoxWidth / 2
   EyeSeesX1(0) = EyeXZm(0) - BoxWidthHalf
   EyeSeesX2(0) = EyeSeesX1(0) + BoxWidth
   EyeSeesY2(0) = DrawY + CirBotY
   EyeSeesY1(0) = EyeSeesY2(0) - BoxWidth
   EyeSeesX(0) = (EyeSeesX1(0) + EyeSeesX2(0)) / 2
   EyeSeesY(0) = (EyeSeesY1(0) + EyeSeesY2(0)) / 2
   EyeSeesX1(1) = EyeSeesX1(0)
   EyeSeesX2(1) = EyeSeesX2(0)
   EyeSeesY2(1) = DrawY - CirBotY
   EyeSeesY1(1) = EyeSeesY2(1) + BoxWidth
   EyeSeesX(1) = (EyeSeesX1(1) + EyeSeesX2(1)) / 2
   EyeSeesY(1) = (EyeSeesY1(1) + EyeSeesY2(1)) / 2
'Calculate locations for EyeTowards boxes.
   EyeTowardsX2(0) = EyeSeesX(0) - BoxWidth - ChipDrawWidth
   EyeTowardsX1(0) = EyeTowardsX2(0) - BoxWidth
   EyeTowardsX(0) = (EyeTowardsX1(0) + EyeTowardsX2(0)) / 2
   EyeTowardsY(0) = (EyeSeesY(0) + EyeYZm(0)) / 2
   EyeTowardsY1(0) = EyeTowardsY(0) - BoxWidthHalf
   EyeTowardsY2(0) = EyeTowardsY1(0) + BoxWidth
   EyeTowardsX(1) = EyeTowardsX(0)
   EyeTowardsX2(1) = EyeTowardsX2(0)
   EyeTowardsX1(1) = EyeTowardsX1(0)
   EyeTowardsY(1) = (EyeSeesY(1) + EyeYZm(1)) / 2
   EyeTowardsY1(1) = EyeTowardsY(1) - BoxWidthHalf
   EyeTowardsY2(1) = EyeTowardsY1(1) + BoxWidth
'Clear space around EyeSees and EyeTowards Boxes
   Pic.DrawWidth = ChipDrawWidthTriple
   Pic.Line (EyeSeesX1(0), EyeSeesY1(0))-(EyeSeesX2(0), EyeSeesY2(0)), vbWhite, B
   Pic.Line (EyeSeesX1(1), EyeSeesY1(1))-(EyeSeesX2(1), EyeSeesY2(1)), vbWhite, B
   Pic.Line (EyeTowardsX1(0), EyeTowardsY1(0))-(EyeTowardsX2(0), EyeTowardsY2(0)), vbWhite, B
   Pic.Line (EyeTowardsX1(1), EyeTowardsY1(1))-(EyeTowardsX2(1), EyeTowardsY2(1)), vbWhite, B
'Calculate X,Y points of the 4 diagonal In/Out pins of 2 Confidence chips into array.
    WireLen = CNFHeightHalf * 0.25
  For ChipN = 0 To 1
      C = CNFHeight * ChipN
    For DataN = 0 To 1
      N = CNFHeightHalf * DataN / 2
      CNFDataOutX(ChipN, DataN) = RAMX2 + (CNFHeightHalf * 0.2) + N
      CNFDataOutY(ChipN, DataN) = CNFY1 + CNFHeight - (CNFHeightHalf * 0.2) - N + C
      CNFDataInX(ChipN, DataN) = RAMX2 + (CNFHeightHalf * 0.4) + N
      CNFDataInY(ChipN, DataN) = CNFY1 + CNFHeight - (CNFHeightHalf * 0.4) - N + C
    Next DataN
  Next ChipN
'Draw lines to Guess chips.
   Y1 = RAMDataInY(2) - GUESSHeightHalf
   X1 = GUESSX1 + (GUESSWidth * 0.8)
   N = DataBits - 1
  Call WireClear(X1, Y1, X1, RAMDataOutY(N), RAMDataOutColor(N))
   Pic.DrawWidth = BusWidth * 3
   Pic.Line (RAMX2, RAMDataOutY(N))-(X1 - BusWidthDouble, RAMDataOutY(N)), vbWhite
   Pic.DrawWidth = BusWidth
   Pic.Line (RAMX2, RAMDataOutY(N))-(X1, RAMDataOutY(N)), OnOffColor(Val(Left(DataOutStr, 1)))
'Draw the <1> that stays value of 1 in circuit and in legend.
   X2 = GUESSX1 - BusSpace
  Call WireClear(RAMX2, RAMDataInY(N), X2, RAMDataInY(N), OnOffColor(1))
  Call DrawStaysBit(X2, RAMDataInY(N), "1")
   Pic.DrawWidth = BusWidth
  Call DrawLeftRightArrowAlways(RAMArrowX1, RAMArrowX2, RAMDataInY(N), OnOffColor(1))
  Call DrawLeftRightArrowAlways(RAMArrowX2 + BusWidth, RAMArrowX1 + BusWidth, RAMDataOutY(N), RAMDataOutColor(N))
'Calculate the X locations for drawing up to Confidence chip pins.
     CNFAddrInY = CNFY2 + CNFHeight
           DX = (RAMX1 - BusRoom - CNFX1)
      XS = DX * (1 / AllAddrBitsRAM(L, S)) / 2   'Space before first pin.
      CNFInPinSpacing = DX / AllAddrBitsRAM(L, S)
      Bt = 0
'Calculate X location of Confidence chip Input pins.
  For N = 0 To AllSenseCount(L, S) - 1
     CNFAddrInX(N) = CNFX1 + XS + (DX * (Bt / AllAddrBitsRAM(L, S))) + ChipDrawWidth
     SensorAddrBit(N) = Bt
      Bt = Bt + AllSensorBits(L, S, N)
  Next N
'Calculate location to draw sensor arrows on lines that lead to Confidence circuit.
 If Lobes = 1 Then
   ArrowX = CNFAddrInX(RtSeeSensorN(L, S)) + BusSpace
 Else
   ArrowX = CNFAddrInX(TstFdSensorN(L, S)) + (BusSpace * 2)
 End If
   Pic.FontSize = 8 * DrawScale
'Draw Mouth line and arrow.
   Call Wire2LinesBetweenClear(MouthXZm, MouthYZm, CNFAddrInX(TstFdSensorN(L, S)), CNFAddrInY, OnOffColor(TstFd))
   Call DrawLeftRightArrow(ArrowX, ArrowX + ArrowWidth, MouthYZm, OnOffColor(TstFd))
'Draw Left Antenna lines.
   XPedicLCtr = (XScapeL + XPedicL) / 2
   YPedicLCtr = (YScapeL + YPedicL) / 2
 If L <> 1 Then
   Call Wire2LinesBetweenBus(XPedicLCtr, YPedicLCtr, CNFAddrInX(LfAntSensorN(L, S)), CNFAddrInY, Ant(0), AllSensorBits(L, S, LfAntSensorN(L, S)))
   NStr = Format(Ant(0))
   Pic.CurrentX = XPedicLCtr - (BusSpace * 2) - Pic.TextWidth(NStr)
   Pic.CurrentY = YPedicLCtr - TH - (TH / 4)
   Pic.FontSize = 8 * DrawScale
   Pic.Print NStr
 End If
'Draw Right Antenna lines.
   XPedicRCtr = (XScapeR + XPedicR) / 2
   YPedicRCtr = (YScapeR + YPedicR) / 2
 If L <> 0 Then
   Call Wire2LinesBetweenBus(XPedicRCtr, YPedicRCtr, CNFAddrInX(RtAntSensorN(L, S)), CNFAddrInY, Ant(1), AllSensorBits(L, S, RtAntSensorN(L, S)))
   NStr = Ant(1)
   Pic.CurrentX = XPedicRCtr - (BusSpace * 2) - Pic.TextWidth(NStr)  '(BusSpace * 2) - Pic.TextWidth(NStr)
   Pic.CurrentY = YPedicRCtr
   Pic.Print NStr
 End If
'Draw lines for each Eye.
 If L <> 1 Then Call Wire2LinesBetweenBus(EyeXZm(0), EyeYZm(0), CNFAddrInX(LfEyeSensorN(L, S)), CNFAddrInY, Eye(0, S), AllSensorBits(L, S, LfEyeSensorN(L, S)))
 If L <> 0 Then Call Wire2LinesBetweenBus(EyeXZm(1), EyeYZm(1), CNFAddrInX(RtEyeSensorN(L, S)), CNFAddrInY, Eye(1, S), AllSensorBits(L, S, RtEyeSensorN(L, S)))
'Draw Eye Correlation circuit into picture of Bot, between eyes.
 Call Wire2LinesBetweenClear(EyeXZm(1), DrawY, CorrPinX, CorrPinY, OnOffColor(Cor(S)))
 Call Wire2LinesBetween(CorrPinX, CorrPinY, CNFAddrInX(CorreSensorN(L, S)), CNFAddrInY, OnOffColor(Cor(S)))
   NStr = Format(Cor(S))
   X1 = EyeXZm(0) - BoxWidthHalf
   X2 = X1 + BoxWidth
   Y1 = DrawY - TH
   Y2 = DrawY + TH
'Draw connection between each eye to Correlation circuit box and Sees circuit box.
   Pic.DrawWidth = AnalogBusWidth * 3               'Clear between two for wires.
   Pic.Line (EyeXZm(0), EyeSeesY(0))-(EyeXZm(1), EyeSeesY(1)), vbWhite
   Pic.DrawWidth = AnalogBusWidth
   Pic.Line (EyeXZm(0), EyeSeesY(0))-(EyeXZm(0), Y2), Eye(0, S) / Facets * vbRed
   Pic.Line (EyeXZm(1), EyeSeesY(1))-(EyeXZm(1), Y1), Eye(1, S) / Facets * vbRed
'Draw Correlation Arrow and Line showing signal changing for next Address cycle.
   DX = (EyeXZm(1) + DrawX) / 2
  Call DrawLeftRightArrow(DX + ArrowWidth, DX, DrawY, OnOffColor(Cor(S)))
'Draw the correlation circuit box.
   Pic.FillStyle = 0
   Pic.DrawWidth = ChipDrawWidth
   Pic.Line (X1, Y1)-(X2, Y2), vbBlack, B
   Pic.CurrentX = X1 + BoxWidthHalf - (Pic.TextWidth(NStr) / 2)
   Pic.CurrentY = DrawY - (Pic.TextHeight(NStr) / 2)
   Pic.FontSize = 8 * DrawScale
   Pic.Print NStr
'Draw EyeTowards Boxes.
 If L <> 1 Then
   Call Wire2LinesBetweenClear(EyeTowardsX(0), EyeTowardsY(0), CNFAddrInX(LfTwdSensorN(L, S)), CNFAddrInY, OnOffColor(Twd(0, S)))
   Call DrawLeftRightArrow(ArrowX, ArrowX + ArrowWidth, EyeTowardsY(0), OnOffColor(Twd(0, S)))
 End If
 If L <> 0 Then
   Call Wire2LinesBetweenClear(EyeTowardsX(1), EyeTowardsY(1), CNFAddrInX(RtTwdSensorN(L, S)), CNFAddrInY, OnOffColor(Twd(1, S)))
   Call DrawLeftRightArrow(ArrowX, ArrowX + ArrowWidth, EyeTowardsY(1), OnOffColor(Twd(1, S)))
 End If
   Pic.DrawWidth = ChipDrawWidth
   Pic.Line (EyeTowardsX1(0), EyeTowardsY1(0))-(EyeTowardsX2(0), EyeTowardsY2(0)), vbBlack, B
   Pic.Line (EyeTowardsX1(1), EyeTowardsY1(1))-(EyeTowardsX2(1), EyeTowardsY2(1)), vbBlack, B
   NStr = Format(Twd(0, S))
   TW2 = Pic.TextWidth(NStr) / 2
   Pic.CurrentX = EyeTowardsX(0) - TW2
   Pic.CurrentY = EyeTowardsY(0) - TH2
   Pic.Print NStr
   NStr = Format(Twd(1, S))
   TW2 = Pic.TextWidth(NStr) / 2
   Pic.CurrentX = EyeTowardsX(1) - TW2
   Pic.CurrentY = EyeTowardsY(1) - TH2
   Pic.Print NStr
'Draw EyeSees Boxes.
 If L <> 1 Then
   Call Wire2LinesBetweenClear(EyeSeesX(0), EyeSeesY(0), CNFAddrInX(LfSeeSensorN(L, S)), CNFAddrInY, OnOffColor(See(0, S)))
   Call DrawLeftRightArrow(ArrowX, ArrowX + ArrowWidth, EyeSeesY(0), OnOffColor(See(0, S)))
 End If
 If L <> 0 Then
   Call Wire2LinesBetweenClear(EyeSeesX(1), EyeSeesY(1), CNFAddrInX(RtSeeSensorN(L, S)), CNFAddrInY, OnOffColor(See(1, S)))
   Call DrawLeftRightArrow(ArrowX, ArrowX + ArrowWidth, EyeSeesY(1), OnOffColor(See(1, S)))
 End If
   Pic.DrawWidth = ChipDrawWidth
   Pic.Line (EyeSeesX1(0), EyeSeesY1(0))-(EyeSeesX2(0), EyeSeesY2(0)), vbBlack, B
   Pic.Line (EyeSeesX1(1), EyeSeesY1(1))-(EyeSeesX2(1), EyeSeesY2(1)), vbBlack, B
   NStr = Format(See(0, S))
   TW2 = Pic.TextWidth(NStr) / 2
   Pic.CurrentX = EyeSeesX(0) - TW2
   Pic.CurrentY = EyeSeesY(0) - TH2
   Pic.Print NStr
   NStr = Format(See(1, S))
   TW2 = Pic.TextWidth(NStr) / 2
   Pic.CurrentX = EyeSeesX(1) - TW2
   Pic.CurrentY = EyeSeesY(1) - TH2
   Pic.Print NStr
'Draw GoRight wiring from RAM Address to Motors.
 Call Wire2LinesBetween(GoRtPinX, GoRtPinY, CNFAddrInX(GoRgtSensorN(L, S)), CNFAddrInY, OnOffColor(GoRgt))
   Pic.DrawWidth = BusWidth
   Pic.Line (GoRtPinX, GoRtPinY)-(GoRtPinX, MotorPin(1, 1)), OnOffColor(GoRgt)
   Pic.Line -(MotorX1(1), MotorPin(1, 1)), OnOffColor(GoRgt)
  Call DrawLeftRightArrowAlways(MotorArrowX2 - BusWidth, MotorArrowX1 - BusWidth, MotorPin(1, 1), OnOffColor(GoRgt))
'Draw GoLeft wiring from RAM Address to Motors.
 Call Wire2LinesBetween(GoLfPinX, GoLfPinY, CNFAddrInX(GoLftSensorN(L, S)), CNFAddrInY, OnOffColor(GoLft))
   Pic.Line (GoLfPinX, GoLfPinY)-(GoLfPinX, MotorPin(0, 1)), OnOffColor(GoLft)
   Pic.Line -(MotorX1(1), MotorPin(0, 1)), OnOffColor(GoLft)
  Call DrawLeftRightArrowAlways(MotorArrowX2 - BusWidth, MotorArrowX1 - BusWidth, MotorPin(0, 1), OnOffColor(GoLft))
'Draw GoReverse wires from RAM Address to Motors.
 Call Wire2LinesBetween(GoRvPinX, GoRvPinY, CNFAddrInX(GoRevSensorN(L, S)), CNFAddrInY, OnOffColor(GoRev))
   Pic.Line (GoRvPinX, GoRvPinY)-(GoRvPinX, MotorPin(0, 2)), OnOffColor(GoRev)
   Pic.Line -(MotorX1(1), MotorPin(0, 2)), OnOffColor(GoRev)
  Call DrawLeftRightArrowAlways(MotorArrowX2 - BusWidth, MotorArrowX1 - BusWidth, MotorPin(0, 2), OnOffColor(GoRev))
  Call WireClear(MotorX1(1), MotorPin(1, 2), GoRvPinX, MotorPin(1, 2), OnOffColor(GoRev))
  Call DrawLeftRightArrowAlways(MotorArrowX2 - BusWidth, MotorArrowX1 - BusWidth, MotorPin(1, 2), OnOffColor(GoRev))
  Call DrawPad(GoRvPinX, MotorPin(1, 2), OnOffColor(GoRev))
'Draw GoForward wires from RAM Address to Motors.
 Call Wire2LinesBetween(GoFwPinX, GoFwPinY, CNFAddrInX(GoFwdSensorN(L, S)), CNFAddrInY, OnOffColor(GoFwd))
   Pic.DrawWidth = BusWidth
   Pic.Line (GoFwPinX, GoFwPinY)-(GoFwPinX, MotorPin(0, 3)), OnOffColor(GoFwd)
   Pic.Line -(MotorX1(1), MotorPin(0, 3)), OnOffColor(GoFwd)
  Call DrawLeftRightArrowAlways(MotorArrowX2 - BusWidth, MotorArrowX1 - BusWidth, MotorPin(0, 3), OnOffColor(GoFwd))
  Call WireClear(MotorX1(1), MotorPin(1, 3), GoFwPinX, MotorPin(1, 3), OnOffColor(GoFwd))
  Call DrawLeftRightArrowAlways(MotorArrowX2 - BusWidth, MotorArrowX1 - BusWidth, MotorPin(1, 3), OnOffColor(GoFwd))
  Call DrawPad(GoFwPinX, MotorPin(1, 3), OnOffColor(GoFwd))
'Draw Motors into picture of Bot.
   Pic.FillStyle = 0             'Fill square with white.
 For N = 0 To 1
   Pic.DrawWidth = ChipDrawWidth
   Pic.Line (MotorX1(N), MotorY1(N))-(MotorX2(N), MotorY2(N)), vbBlack, B
 Next N
   Pic.CurrentX = MotorX1(0)
   Pic.CurrentY = DrawY - TH2
   Pic.Print "MOTORS"
   XS = MotorX1(0) + ChipDrawWidth
   Pic.CurrentX = XS
   Pic.CurrentY = MotorPin(0, 1) - TH2
   Pic.Print " GoLft"
   Pic.CurrentX = MotorX1(0) + ChipDrawWidth
   Pic.CurrentY = MotorPin(0, 2) - TH2
   Pic.Print " GoRev"
   Pic.CurrentX = MotorX1(0) + ChipDrawWidth
   Pic.CurrentY = MotorPin(0, 3) - TH2
   Pic.Print " GoFwd"
   Pic.CurrentX = MotorX1(1) + ChipDrawWidth
   Pic.CurrentY = MotorPin(1, 1) - TH2
   Pic.Print " GoRgt"
   Pic.CurrentX = MotorX1(1) + ChipDrawWidth
   Pic.CurrentY = MotorPin(1, 2) - TH2
   Pic.Print " GoRev"
   Pic.CurrentX = MotorX1(1) + ChipDrawWidth
   Pic.CurrentY = MotorPin(1, 3) - TH2
   Pic.Print " GoFwd"
'Draw Eye reading in center of Eye.
      R = TH * 0.85
      Pic.DrawWidth = TH / 5
      FStr = Format(Eye(0, S))         'Left Eye
   Pic.FillStyle = 0                    'Fill circle with white.
      Pic.Circle (EyeXZm(0), EyeYZm(0)), R, SubSysColor(S)
      Pic.CurrentX = EyeXZm(0) - Pic.TextWidth(FStr) / 2
      Pic.CurrentY = EyeYZm(0) - TH2
      Pic.Print FStr
      FStr = Format(Eye(1, S))         'Right Eye
      Pic.Circle (EyeXZm(1), EyeYZm(1)), R, SubSysColor(S)
      Pic.CurrentX = EyeXZm(1) - Pic.TextWidth(FStr) / 2
      Pic.CurrentY = EyeYZm(1) - TH2
      Pic.Print FStr
'Label RAM Input names, and if sensor checked draw line and square connector for delayed line.
   RAMAddrArrowX1 = RAMX1
   RAMAddrArrowX2 = RAMAddrArrowX1 - ArrowWidth
 For N = AllSenseCount(L, S) - 1 To 0 Step -1
  For N2 = 0 To AllSensorBits(L, S, N) - 1
    BNRev = SensorAddrBit(N) + (AllSensorBits(L, S, N) - 1) - N2
    BN = SensorAddrBit(N) + N2
    Pic.CurrentX = RAMX1 + ChipDrawWidth
    Pic.CurrentY = RAMAddrInY(BNRev) - TH2
    Pic.Print AllSensorName(L, S, N);
    If AllSensorBits(L, S, N) > 1 Then Pic.Print Format(AllSensorBits(L, S, N) - N2 - 1)
   If SenseCheck(L, S, N) = 1 And ColorSystemCheck(S) = 1 Then
      X2 = CNFAddrInX(N) + (((AllSensorBits(L, S, N) - 1) - N2) * CNFInPinSpacing)
    Pic.DrawWidth = BusWidthTriple
    Pic.Line (RAMX1, RAMAddrInY(BNRev))-(X2 + BusWidthTriple, RAMAddrInY(BNRev)), vbWhite
    Pic.DrawWidth = BusWidth
    Pic.Line (RAMX1, RAMAddrInY(BNRev))-(X2, RAMAddrInY(BNRev)), RAMAddrColor(BNRev)
'Draw to Delayed connection square or lines up to conf.
    If Circuit.DelaysCheck = 1 Then
      Call DrawDelayConnect(X2, RAMAddrInY(SensorAddrBit(N) + AllSensorBits(L, S, N) - N2 - 1), RAMAddrColor(BNRev))
    Else
'Draw line up to Confidence chip, on right side of lines already there from sensors.
      Y2 = CNFAddrInY + (ChipDrawWidth * 2)
      Pic.Line (X2 + BusWidth, RAMAddrInY(BNRev))-(X2 + BusWidth, Y2), RAMAddrColor(BNRev)
      Pic.DrawWidth = BusWidthDouble
      Pic.PSet (X2 + BusWidth / 2, Y2), RAMAddrColor(BNRev)
    End If
      Pic.DrawWidth = BusWidth
     Call DrawLeftRightArrow(RAMAddrArrowX1 - ChipDrawWidth, RAMAddrArrowX2 - ChipDrawWidth, RAMAddrInY(BNRev), RAMAddrColor(BNRev))
   End If
  Next N2
 Next N
'Draw pointed Confidence chips.
     BusStartX = Pic.Width - Margin - (BusSpace * 6)
    Call DrawConfidenceChip(CNFX1, CNFY2, Pic.Width * 0.85, 1, 1, FwRvCfIn, FwRvCfOut, 0, FwRvAdjWas)
     BusStartX = Pic.Width - Margin - (PadSize / 2) - 1
    Call DrawConfidenceChip(CNFX1, CNFY1, Pic.Width * 0.95, 1, 0, LfRtCfIn, LfRtCfOut, 4, LfRtAdjWas)
'Label Confidence chip lines.
   Pic.CurrentY = CNFY1 + CNFHeightHalf - TH
   Pic.CurrentX = CNFX2
   Pic.Print " LfRtGuess"
   Pic.CurrentY = CNFY2 + CNFHeightHalf - TH
   Pic.CurrentX = CNFX2
   Pic.Print " FwRvGuess"
'Draw the Guess chips.
    Pic.FontSize = 8 * DrawScale
   Call DrawGuessChip(2, FwRvCfIn, FwRvAdjWas)
               CfStr = Left(CfStr, 4) & " "
    Pic.CurrentX = GUESSX1 - Pic.TextWidth(CfStr) ''- (ChipDrawWidth / 2)
    Pic.CurrentY = GUESSY1 - Pic.TextHeight(CfStr) + TH2
    Pic.Print CfStr
   Call DrawGuessChip(3, FwRvCfIn, FwRvAdjWas)
   Call DrawGuessChip(6, LfRtCfIn, LfRtAdjWas)
   Call DrawGuessChip(7, LfRtCfIn, LfRtAdjWas)
               X = GUESSX2 - (ChipDrawWidth / 2)
    Pic.CurrentX = X
    Pic.CurrentY = GUESSY2 + (ChipDrawWidth / 2)
    Pic.Print CfStr
    Pic.CurrentX = X
    Pic.CurrentY = GUESSY2 + (TH * 0.9)
  If CfStr = "Hold" Then
    Pic.Print "Memory"
  Else
    Pic.Print "Guess"
  End If
'Label RAM chip on lower right.
    Pic.FontSize = 14 * DrawScale
    NStr = "RAM" & S
    Pic.CurrentY = RAMY2
    XS = RAMX2 - Pic.TextWidth(NStr)
    Pic.CurrentX = XS
    Pic.Print NStr
 If Lobes = 2 Then
    Pic.CurrentX = XS
    Pic.CurrentY = RAMY2 + Pic.TextHeight(NStr)
    Pic.Print LRStr(L)
 End If
'Draw RAM chip.
    Pic.DrawWidth = ChipDrawWidth
    Pic.FillStyle = 1           'Do not fill inside of circle with color.
    Pic.Line (RAMX1, RAMY1)-(RAMX2, RAMY2), vbBlack, B
'Label RAM chip Data I/O pins.
    Pic.FontSize = 8 * DrawScale
    LabelX = RAMX2 - ChipDrawWidth
    Call LabelRAMData(RAMDataInY(0), "ConfIn0A")
    Call LabelRAMData(RAMDataOutY(0), "ConfOut0A")
    Call LabelRAMData(RAMDataInY(1), "ConfIn1A")
    Call LabelRAMData(RAMDataOutY(1), "ConfOut1A")
    Call LabelRAMData(RAMDataInY(2), "GoFwdIn")
    Call LabelRAMData(RAMDataOutY(2), "GoFwdOut")
    Call LabelRAMData(RAMDataInY(3), "GoRevIn")
    Call LabelRAMData(RAMDataOutY(3), "GoRevOut")
    Call LabelRAMData(RAMDataInY(4), "ConfIn0B")
    Call LabelRAMData(RAMDataOutY(4), "ConfOut0B")
    Call LabelRAMData(RAMDataInY(5), "ConfIn1B")
    Call LabelRAMData(RAMDataOutY(5), "ConfOut1B")
    Call LabelRAMData(RAMDataInY(6), "GoLftIn")
    Call LabelRAMData(RAMDataOutY(6), "GoLftOut")
    Call LabelRAMData(RAMDataInY(7), "GoRgtIn")
    Call LabelRAMData(RAMDataOutY(7), "GoRgtOut")
    Call LabelRAMData(RAMDataInY(8), "NotNewIn")
    Call LabelRAMData(RAMDataOutY(8), "NotNewOut")
'Draw Pads for wires from RAM Data back to Address chip pins.
  For N = 0 To DataBusCount - 1
    Call DrawPad(DataBusX1(N), DataBusY1(N), DataBusColor(N))
  Next N
'Draw Pads for Motor bus connections.
   X1 = RAMX1 - BusRoom: X2 = RAMX2 + BusRoom
  Call DrawPad(X2, RAMDataOutY(7), RAMDataInColor(7))
  Call DrawPad(X2 + BusSpace, RAMDataOutY(6), RAMDataInColor(6))
  Call DrawPad(X2 + (BusSpace * 2), RAMDataOutY(3), RAMDataInColor(3))
  Call DrawPad(X2 + (BusSpace * 3), RAMDataOutY(2), RAMDataInColor(2))
'Print stats:
   Pic.FontSize = 8 * DrawScale
  TH = Pic.TextHeight(NStr)
  TH2 = TH / 2
  X1 = GUESSX1
   Pic.CurrentY = RAMY2 + TH2
   Pic.CurrentX = X1
   Pic.Print Format(AddrBitsRAM(L, S)) & " bit Addr."
   Pic.CurrentX = X1
   Pic.Print Format(2 ^ AddrBitsRAM(L, S), "###,###,###,###")
   Pic.CurrentX = X1
   Pic.CurrentY = Pic.CurrentY + TH2
   Pic.CurrentX = X1
   Pic.Print Format(AddrBitsPC(L, S)) & " bits PC"
   Pic.CurrentX = X1
   Pic.Print Format(2 ^ AddrBitsPC(L, S), "###,###,###,###")
   Pic.Print ""
   Pic.Print ""
   Pic.CurrentX = X1
'Print legend showing symbols used.
  Call DrawStaysBit(X1, Pic.CurrentY, "1")
   Pic.FontSize = 8 * DrawScale
   X3 = X1 + (StaysSize * 2.5)
    Pic.CurrentX = X3
    Pic.CurrentY = Pic.CurrentY - TH2
    Pic.Print " Stays 1"
   Y1 = Pic.CurrentY + TH + TH2
   Y2 = Y1 + (DelaySize * 4)
   X2 = X1 + DelaySize + DelaySize
   X3 = X1 + (StaysSize * 2)
   Pic.DrawWidth = BusWidth
 If Circuit.DelaysCheck = 1 Then
   Pic.Line (X2, Y1)-(X2 + (DelaySize * 4), Y1), OnOffColor(0)
   Pic.Line (X2, Y2)-(X2 + (DelaySize * 4), Y2), OnOffColor(1)
   Call DrawDelayConnect(X2, Y1, OnOffColor(0))
   Call DrawDelayConnect(X2, Y2, OnOffColor(1))
 Else
   Y3 = Y1 + (DelaySize * 3)
   Pic.Line (X2, Y1 - (ChipDrawWidth * 1.5))-(X2, Y2 + DelaySize), OnOffColor(1)
   Pic.Line (X2 + BusWidth, Y1)-(X2 + BusWidth, Y3), OnOffColor(0)
   Pic.Line (X2 + BusWidth, Y3)-(X3, Y3), OnOffColor(0)
   Call DrawLeftRightArrowAlways(X3, X3 - ArrowWidth, Y3, OnOffColor(0))
   Pic.DrawWidth = BusWidthDouble
   Pic.PSet (X2 + (BusWidth / 2), Y1), OnOffColor(0)
 End If
   Pic.CurrentX = X3
   Pic.CurrentY = Y1
   Pic.Print " Delay"
'Credit.
  NStr = "Gary Gaulin, 2011"
   Pic.FontSize = 8 * DrawScale
   Y = YPix - Pic.TextHeight("G") - Margin
   Pic.CurrentY = YPix - Pic.TextHeight("G") - Margin
   Pic.CurrentX = XPix - Pic.TextWidth(NStr) - Margin
   Pic.Print NStr;
'Name of program above Credit.
  NStr = "Intelligence Design Lab"
   X1 = XPix - Pic.TextWidth(NStr) - Margin
   Pic.FontSize = 10 * DrawScale
   Pic.Font.Underline = True
   Pic.CurrentY = Pic.CurrentY - Pic.TextHeight("G")
   Pic.CurrentX = X1
   Pic.Print NStr
   Pic.Font.Underline = False
'Clear Dialog box on screen to indicate finished drawing.
 Circuit.Dialog = ""
 Circuit.Dialog.Refresh
End Sub

Private Sub SeedRandomCheck_Click()
  If SeedRandomCheck = 1 Then
    Randomize    'Seeds Random generator with system timer, else lives same lifetime.
  End If
End Sub

Private Sub ZoomScroll_Change()
   Call ZoomScroll_Scroll
End Sub
Private Sub ZoomScroll_Scroll()
   ZoomLabel = ZoomScroll & "%"
   Call Design.CalcDrawBot
End Sub

Private Sub BitMapCommand_Click()
   SavePicture Pic.Image, App.Path & "\BitMaps\LabScreen.BMP"
End Sub

'_____________________________________Food Frame
Private Sub FeedersScroll_Change()
   Call PlaceFoodInWorld
End Sub
Private Sub FeederFoodAmountScroll_Change()
   Call PlaceFoodInWorld
End Sub
Private Sub FoodAreaScroll_Change()
   Call PlaceFoodInWorld
End Sub
Private Sub ReFeedCommand_Click()
   Call PlaceFoodInWorld
End Sub
Private Sub MulticolorCheck_Click()
   Call PlaceFoodInWorld
End Sub
Private Sub FeederSizeScroll_Change()
   Call PlaceFoodInWorld
End Sub

'Each Thing placed in its world is (assuming it can eaten) a bite sized circle of material.
Private Sub PlaceFoodInWorld()
Dim AreaPixels As Long
Dim AreaPixelsHalf As Long
  If LoadOnly = True Then Exit Sub
'Calculate Food variables.
   Things = 0
   FoodArea = 2 ^ FoodAreaScroll
   FoodAreaLabel = FoodArea
   RemainingFoodSupply = FeedersScroll * FeederFoodAmountScroll
   FeedersLabel = FeedersScroll
   FeederFoodAmountLabel = FeederFoodAmountScroll
   FeederSizeLabel = FeederSizeScroll
      BotX = 0
      BotY = 0
      AreaPixels = BodyWidth * FoodArea
      AreaPixelsHalf = AreaPixels / 2
'Place two Things at the same X,Y
   For T = 1 To FeedersScroll * 2 Step 2
    Things = Things + 1
      ThingX(Things) = (Rnd * AreaPixels) - AreaPixelsHalf
      ThingY(Things) = (Rnd * AreaPixels) - AreaPixelsHalf
      ThingX(T + 1) = ThingX(Things)
      ThingY(T + 1) = ThingY(Things)
'First place a number of green (or multicolor) leave circle at this X,Y
   If MulticolorCheck = 1 Then
      ThingC(0, Things) = 55 + (Rnd * 200)
      ThingC(1, Things) = 55 + (Rnd * 200)
      ThingC(2, Things) = 55 + (Rnd * 200)
   Else
      ThingC(0, Things) = 128
      ThingC(1, Things) = 255
      ThingC(2, Things) = 0
   End If
      ThingC(3, Things) = RGB(ThingC(0, Things), ThingC(1, Things), ThingC(2, Things))
      ThingR(Things) = MouthR * FeederSizeScroll
      ThingGone(Things) = False
'      ThingSour(Things) = False
'      ThingSweet(Things) = False
'      ThingSalty(Things) = False
'      ThingMeaty(Things) = False
'      ThingBitter(Things) = False
'      ThingToxic(Things) = False
'      ThingEdible(Things) = False
      ThingFood(Things) = False
'      ThingHasTaste(Things) = False
'      ThingTasteBad(Things) = True
'      ThingTasteGood(Things) = False
'Place a smaller white center on feeder, for food.
    Things = Things + 1
      ThingC(0, Things) = 255          'Food color
      ThingC(1, Things) = 255
      ThingC(2, Things) = 255
      ThingC(3, Things) = RGB(ThingC(0, Things), ThingC(1, Things), ThingC(2, Things))
      ThingR(Things) = MouthR
      ThingGone(Things) = False                   'Is True after food has been eaten.
      ThingAmount(Things) = FeederFoodAmountScroll
'      ThingSour(Things) = False
'      ThingSweet(Things) = True
'      ThingSalty(Things) = False
'      ThingMeaty(Things) = False
'      ThingBitter(Things) = False
'      ThingToxic(Things) = False
'      ThingEdible(Things) = True
      ThingFood(Things) = True
'      ThingHasTaste(Things) = True
'      ThingTasteBad(Things) = False
'      ThingTasteGood(Things) = True
   Next T
End Sub

Private Sub DrawAllThingsInWorld()
         Pic.FillStyle = 0                      'Fill Circles with color.
         Pic.DrawWidth = 1
             DrawX = DrawXScroll
             DrawY = DrawYScroll
  For T = 1 To Things
    If ThingGone(T) = False Then
         X = DrawX + Fix((ThingX(T) - BotX) * Zoom)
         Y = DrawY + Fix((ThingY(T) - BotY) * Zoom)
         Pic.FillColor = ThingC(3, T)
         Pic.Circle (X, Y), ThingR(T) * Zoom, ThingC(3, T)
    End If
'If thing is edible then print the Amount of Food on the screen.
      If ThingFood(T) = True And ShowFoodAmountCheck = 1 Then
        NStr = Format(ThingAmount(T))
         Pic.CurrentX = X - (Pic.TextWidth(NStr) / 2)
         Pic.CurrentY = Y - (Pic.TextHeight(NStr) / 2)
         Pic.Print NStr
      End If
  Next T
   RemainingAmountLabel = RemainingFoodSupply      'Show count of Food Supply on screen.
End Sub

Public Sub PreCalculateSpeedColors()
'
'       |_____________                          __|_255
'  Rd   |             -Ramp-______________-Ramp-  |_0
'       |        _________________________________|_255
'  Gr   |__-Ramp-                                 |_0
'       |                             ____________|_255
'  Bl   |_______________________-Ramp-            |_0
'
'       RED       YELLOW    GREEN     CYAN     WHITE
'        0         1         2         3         4
'        |__Zone0__|__Zone1__|__Zone2__|__Zone3__|
'
Dim C1 As Long
Dim C2 As Long
Dim V As Long
Dim VN As Long
Dim Mult As Double
Dim Zone As Long
Dim VelPerZone(4) As Long
'Divide span into 4 Zones for color changes, Red-->Yellow-->Green-->Cyan-->White
   For V = 0 To 4
         Zone = Fix(V / 4)
         VN = (V - (Zone * 4))
         VelPerZone(VN) = Zone              'Number of Velocities per Zone, minus one
   Next V
         VelPerZone(2) = VelPerZone(2) - 1      'Make last point end at bright white
                                  SN = 0
'Store color for each Velocity value in SpeedColor(v) array.
   For VN = 0 To 3
      For V = 0 To VelPerZone(VN)
                   Mult = V / (VelPerZone(VN) + 1)
          C1 = Sin(Mult * PI2) * 255
          C2 = Sin((Mult * PI2) + PI2) * 255
        If VN = 0 Then SpeedColor(SN) = RGB(255, C1, 0)         'Red-->Yellow
        If VN = 1 Then SpeedColor(SN) = RGB(C2, 255, 0)         'Yellow-->Green
        If VN = 2 Then SpeedColor(SN) = RGB(0, 255, C1)         'Green-->Cyan
        If VN = 3 Then SpeedColor(SN) = RGB(C1, 255, 255)       'Cyan-->White
                                  SN = SN + 1
      Next V
   Next VN
          SpeedColor(4) = RGB(255, 255, 255)         'White
End Sub

'Functions are used like a number/variable in equations.
Private Function AtnXY(AtnX As Double, AtnY As Double) As Double
Dim Theta As Double
'Calculate Angle to X,Y point.
   If AtnX = 0 Then
        AtnXY = 0
   Else
        Theta = Atn(AtnY / AtnX)
     If AtnX < 0 Then Theta = Theta + PI
        AtnXY = Theta
   End If
End Function
      
Private Function RadianRange(Ang As Double) As Double
     If Ang > Radian Then
        RadianRange = Ang - Radian
     Else
        RadianRange = Ang
     End If
     If Ang < 0 Then RadianRange = Ang + Radian
End Function
      
Private Function BinStr(BitsWide As Long, BinaryValue As Long) As String
Dim Bit01 As Long
Dim BitN As Long
Dim P2 As Long
    P2 = 1
 If BitsWide > 0 Then
   For BitN = 1 To BitsWide
     BinStr = Format((P2 And BinaryValue) / P2) & BinStr
     P2 = P2 + P2        'Doubles same as PowerOf2*2 but P+P can be faster.
   Next BitN
 Else
     BinStr = "None"
 End If
End Function

Private Function PosNeg(PosNegVal As Long)
'Returns number string with "+" as well as "-" added to the left.
   If PosNegVal < 0 Then
      PosNeg = Format(PosNegVal)
   Else
      PosNeg = "+" & Format(PosNegVal)
   End If
End Function

Private Sub PauseContinueCommand_Click()
   If PauseContinueCommand.Caption = "Pause" Then
      PauseContinueCommand.Caption = "Start"
      CycleTimer.Enabled = False                    'Turn off Cycle Timer so it holds each move.
      StepCommand.Visible = True                    'Show the STEP Command button on screen.
      TurboOrTimerCommand.Visible = False
   Else
      PauseContinueCommand.Caption = "Pause"
      CycleTimer.Enabled = True                     'Turn Cycle Timer back on again.
      StepCommand.Visible = False                   'Take the STEP Command button off the screen.
      TurboOrTimerCommand.Visible = True
   End If
End Sub

Private Sub StepCommand_Click()
   Call CycleTimer_Timer        'CycleTimer is also a subroutine to Call like any other "Sub"
End Sub
Private Sub StepTime_Change()
     CycleTimer.Interval = StepTime
     IntervalLabel = Format(StepTime / 1000, "0.00")
End Sub

Private Sub TurboCyclesScroll_Change()
   TurboCycles = (2 ^ TurboCyclesScroll) * 500
   TurboCyclesLabel = Format(TurboCycles) & "/draw"
End Sub

Private Sub TurboOrTimerCommand_Click()
   If TurboOrTimerCommand.Caption = "Turbo" Then
      TurboOrTimerCommand.Caption = "Screen"
      PauseContinueCommand.Visible = False
      StepCommand.Visible = False
      TurboCyclesScroll.Visible = True
      TurboCyclesLabel.Visible = True
      CycleTimer.Interval = 20
      CycleTimer.Enabled = True
   Else
      TurboOrTimerCommand.Caption = "Turbo"
      PauseContinueCommand.Visible = True
      PauseContinueCommand.Caption = "Pause"
      StepCommand.Visible = False
      TurboCyclesScroll.Visible = False
      TurboCyclesLabel.Visible = False
   End If
End Sub

Public Sub DrawBot()
   If Flap = 1 Then Flap = 0 Else Flap = 1      'Alternate which wing/wheels are drawn first.
       AvConfLabel = Format(AvCF, "0.0000")
       Zoom = ZoomScroll
       DrawX = DrawXScroll
       DrawY = DrawYScroll
   Set Pic = Intelligence.Picture1
       Pic.Cls                          'Clear the screen to start drawing this new cycle.
'Test for an Error to show on the screen:
  If ErrorCode = 1 Then
      Pic.CurrentX = 0
      Pic.CurrentY = 0
      Pic.ForeColor = RGB(255, 180, 180)
      Pic.Print "   Computer does not have enough RAM to include all Addressing selected."
      Pic.ForeColor = vbWhite
  End If
   If Hungry = 1 Then Pic.Print " Hungry" Else Pic.Print " Not Hungry"
'_____Draw Environment
   Call DrawAllThingsInWorld
   Call DrawBotInSetPicture(BotAng, ZoomScroll)
'_____Look for Check box that needs special drawing.
  If ShowSpinCheck = 1 Then
     Pic.CurrentX = DrawX
     Pic.CurrentY = DrawY
     Pic.Print Format(Spin)
  End If
  If ShowEyeSignalsCheck = 1 Then
     Call DisplayVision(XPix * 0.035, YPix * 0.65, 24, 16)
  End If
  If CircuitCheck = 1 Then Call DrawFullCircuit
  If SaveRunFileCheck = 1 Then Call SaveAddrDataFile
     StoredMemoriesLabel = StoredMemories
End Sub

Private Sub DrawBotInSetPicture(DrawAngle As Double, BotSize As Long)
Dim E As Long
Dim F As Long
   XPix = Pic.Width
   YPix = Pic.Height
'Calculate BodyLine, X1,Y1 is the center of its front (head) end, X2,Y2 is rear end.
      X = Cos(DrawAngle) * BodyLengthHalf           'BodyLength is from scroll on Design form.
      Y = Sin(DrawAngle) * BodyLengthHalf
      BodyX1 = X
      BodyY1 = Y
      BodyX2 = -X
      BodyY2 = -Y
'Find BetweenEyesX,Y point directly Between Eyes, is Forward from the EyeX1,Y1 point.
                     X = Cos(DrawAngle) * EyeFw     'EyeForward is from scroll on Design form.
                     Y = Sin(DrawAngle) * EyeFw
      BetweenEyesX = X + BodyX1                     'Add X,Y amount Forward to Between eyes.
      BetweenEyesY = Y + BodyY1
  For E = 0 To 1                  'For each Eye Number, Left=0 and Right=1
'Calculate EyeX,Y location of Eyes.
                         A = DrawAngle + PI2
                 X = Cos(A) * EyeSp                 'EyeSpacing is from scroll on Design form.
                 Y = Sin(A) * EyeSp
      EyeX(E) = (X * NegPosLfRtMul(E)) + BetweenEyesX + BotX
      EyeY(E) = (Y * NegPosLfRtMul(E)) + BetweenEyesY + BotY
      EyeXZm(E) = DrawX + ((EyeX(E) - BotX) * BotSize)
      EyeYZm(E) = DrawY + ((EyeY(E) - BotY) * BotSize)
  Next E
'Calculate Zoomed variables needed for draw.
    BodyLnZm = (BodyLength * BotSize) + 1
    BodyRdZm = (BodyWidth / 2 * BotSize) + 1
    BodyWdZm = BodyRdZm * 2
    MouthRZm = MouthR * BotSize
    MouthThZm = MouthTh * BotSize
    MouthFwZm = MouthFw * BotSize
     FoodRdZm = MouthR * BotSize
  If FoodRdZm < 0.5 Then FoodRdZm = 0.5
    EyeRdZm = EyeRd * BotSize
    EyeFwZm = EyeFw * BotSize
    EyeSpZm = EyeSp * BotSize
    WheelSzZm = WheelSz * BotSize
    WheelRdZm = WheelRd * BotSize
    WheelBaZm = WheelBa * BotSize
'Calculate Full Width of Facet in pixels to draw white circles with lens inside.
      FacetFullWidth = Fix(EyeRdZm / Facets * PI * (EyeFOV / Radian) * 2) + 1
'Calculate line Width and Color for drawing line around body and in/around wheels.
                         OutlineWidth = (BodyRdZm / 100) + 1
  If FwRvAdj < 0 Then OutlineColor = vbRed Else OutlineColor = vbYellow
'_____Draw 4 wheels, 2 each side, alternate draw of Front/Rear to take steps while moving.
'         C = Val(Right(CycleLabel, 1))
'      If C / 2 = Fix(C / 2) Then               'If cycle is an even number
      If Flap = 0 Then
         Call DrawFrontRearWheels(DrawAngle + 0, 1, 0)    'Draw Front wheels
         Call DrawFrontRearWheels(DrawAngle + PI, 0, 1)   'Draw Rear wheels
      Else                                  'Else if cycle is an odd number
         Call DrawFrontRearWheels(DrawAngle + PI, 0, 1)   'Draw Rear wheels
         Call DrawFrontRearWheels(DrawAngle + 0, 1, 0)    'Draw Front wheels
      End If
'_____Draw Mouth under body.
      Pic.FillStyle = 0                         'Fill circle with solid color.
      Pic.DrawWidth = MouthThZm + 1
         R = (MouthFwZm + ((BodyLnZm + BodyWdZm) / 2))
         X = Cos(DrawAngle) * R
         Y = Sin(DrawAngle) * R
         MouthXZm = DrawX + X
         MouthYZm = DrawY + Y
   If TstFd = 0 Then
      Pic.FillColor = vbBlack                   'Fill empty inner mouth with black.
   Else
      Pic.FillColor = ThingC(3, Tastes)         'Draw color of Tastes around mouth.
      Pic.Circle (MouthXZm, MouthYZm), MouthRZm + MouthThZm + 1, ThingC(3, Tastes)
      Pic.FillColor = vbWhite                   'Fill inner mouth with white teeth.
   End If
      Pic.Circle (MouthXZm, MouthYZm), MouthRZm, MouthColor
'Calculate screen coordinates for drawing body line.
        LWidth2 = Fix(BodyRdZm / 15)
        LWidth = (LWidth2 * 2) + 1
        X1zm = DrawX + (BodyX1 * BotSize)
        Y1zm = DrawY + (BodyY1 * BotSize)
        X2zm = DrawX + (BodyX2 * BotSize)
        Y2zm = DrawY + (BodyY2 * BotSize)
'_____Draw Large Body Line using BodyX1,X2,Y1,Y2 Variables calculated in Vision subroutine.
      Pic.DrawWidth = BodyWdZm + OutlineWidth + 2
      Pic.Line (X1zm, Y1zm)-(X2zm, Y2zm), OutlineColor
      Pic.DrawWidth = BodyWdZm
      Pic.Line (X1zm, Y1zm)-(X2zm, Y2zm), BodyColor
'_____Draw Confidence indicator stripes along each side.
          A1 = RadianRange(-DrawAngle + PI)
          ARgt = RadianRange(A1 + PI2)
          ALft = RadianRange(A1 - PI2)
          R = BodyRdZm - (LWidth * 0.88)
       If R < 3 Then R = 3
          X = Cos(DrawAngle + PI2) * R
          Y = Sin(DrawAngle + PI2) * R
      Pic.FillStyle = 1                         'Do not fill circles with color.
      Pic.DrawWidth = LWidth
      Pic.Line (X1zm - X, Y1zm - Y)-(X2zm - X, Y2zm - Y), ConfColor(FwRvCfIn)    'Left
      Pic.Line (X1zm + X, Y1zm + Y)-(X2zm + X, Y2zm + Y), ConfColor(FwRvCfIn)    'Right
      Pic.Circle (X2zm, Y2zm), R, ConfColor(FwRvCfOut), -ALft, -A1                'Left
      Pic.Circle (X2zm, Y2zm), R, ConfColor(FwRvCfOut), -A1, -ARgt                'Right
'Clear area behind behind eyes and draw confidence color indicator circles.
      Pic.FillStyle = 0                                  'Fill circles with color.
      Pic.FillColor = BodyColor
      Pic.DrawWidth = OutlineWidth
      Pic.Circle (EyeXZm(0), EyeYZm(0)), EyeRdZm, ConfColor(FwRvCfIn)
      Pic.Circle (EyeXZm(1), EyeYZm(1)), EyeRdZm, ConfColor(FwRvCfIn)
'Clear center area where stomach is drawn inside.
      R = R - LWidth
      Pic.Circle (X2zm, Y2zm), R, BodyColor
'Combine the 3 RGB colors into single color number.
  For E = 0 To 1
    For F = 1 To Facets
      For C = 0 To 2
           BriColor(E, C, F) = Bri(E, C, F)
        If BriColor(E, C, F) > 255 Then BriColor(E, C, F) = 255
      Next C
           BriColor(E, 3, F) = RGB(BriColor(E, 0, F), BriColor(E, 1, F), BriColor(E, 2, F))
    Next F
  Next E
'_____Draw pie shaped wedges of color inside facet.
      Pic.FillStyle = 0                         'Fill circles with color.
      Pic.DrawWidth = 1
   For F = 1 To Facets
        ArcAng = RadianRange(FacetAng(0, F) - FacetAng(0, F - 1))
      Pic.FillColor = BriColor(0, 3, F)
        A1 = RadianRange(RadianRange(-FacetAng(0, F - 1)) - DrawAngle)
        A2 = RadianRange(A1 - ArcAng)
        If A2 = 0 Then A2 = Radian              'Incorrectly draws when A2 is zero.
      Pic.Circle (EyeXZm(0), EyeYZm(0)), EyeRdZm, vbWhite, -A1, -A2
      Pic.FillColor = BriColor(1, 3, F)
        A1 = RadianRange(RadianRange(-FacetAng(1, F - 1)) - DrawAngle)
        A2 = RadianRange(A1 + ArcAng)
      Pic.Circle (EyeXZm(1), EyeYZm(1)), EyeRdZm, vbWhite, -A2, -A1
   Next F
'_____Draw draw large white/cyan pixels in center of outer facet with crystal lens inside.
           Pic.FillStyle = 0                    'Fill circles with color.
           Pic.DrawWidth = (FacetFullWidth / 5) + 1
         R = FacetFullWidth / 2.2
   For E = 0 To 1
     For F = 1 To Facets
'If not going Towards System color then draw White circle, else draw Cyan circle.
          If Twd(E, S) = 0 And F <= InnerFacets Then C = RGB(180, 255, 255) Else C = vbWhite
                    A = ((FacetAng(E, F - 1) + FacetAng(E, F)) / 2) + DrawAngle
            X = Cos(A) * EyeRdZm
            Y = Sin(A) * EyeRdZm
       Pic.FillColor = BriColor(E, 3, F)
       Pic.Circle (EyeXZm(E) + X, EyeYZm(E) + Y), R, C
     Next F
   Next E
'When "Visual Field" checkbox is selected show edge lines from outside Edges of food to eyes.
  If ShowVisualFieldCheck = 1 Then
           Pic.DrawWidth = 1
   For E = 0 To 1
    For T = 1 To Things
      If ThingEdg1Visible(E, T) = True Then
          X1 = DrawX + ((EyeX(E) - BotX) * BotSize)
          Y1 = DrawY + ((EyeY(E) - BotY) * BotSize)
          X2 = DrawX + ((ThingX1(E, T) - BotX) * BotSize)
          Y2 = DrawY + ((ThingY1(E, T) - BotY) * BotSize)
         Pic.Line (X1, Y1)-(X2, Y2), ThingC(3, T)
      End If
      If ThingEdg2Visible(E, T) = True Then
          X1 = DrawX + ((EyeX(E) - BotX) * BotSize)
          Y1 = DrawY + ((EyeY(E) - BotY) * BotSize)
          X2 = DrawX + ((ThingX2(E, T) - BotX) * BotSize)
          Y2 = DrawY + ((ThingY2(E, T) - BotY) * BotSize)
           Pic.Line (X1, Y1)-(X2, Y2), ThingC(3, T)
      End If
    Next T
   Next E
  End If
'Draw Antenna
  R = AntBasalKnobForward * BotSize                    'Calculate location for Basal Knob on head
    Xctr = X1zm + (Cos(DrawAngle) * R)
    Yctr = Y1zm + (Sin(DrawAngle) * R)
  R = AntBasalKnobSpace * BotSize / 2
    XD = Cos(DrawAngle + PI2) * R
    YD = Sin(DrawAngle + PI2) * R
   XBasalL = Xctr - XD
   YBasalL = Yctr - YD
   XBasalR = Xctr + XD
   YBasalR = Yctr + YD
'Calculate Scape, section between Basal Knob and Pedicel
  R = AntScapeLength * BotSize
             ALft = DrawAngle - AntScapeAngle - BotAngChange     'Using what AngleWas adds side motion.
    XD = Cos(ALft) * R
    YD = Sin(ALft) * R
   XScapeL = XBasalL + XD
   YScapeL = YBasalL + YD
             ARgt = DrawAngle + AntScapeAngle - BotAngChange
    XD = Cos(ARgt) * R
    YD = Sin(ARgt) * R
   XScapeR = XBasalR + XD
   YScapeR = YBasalR + YD
'Calculate Pedicel, section between Scape and Flagellum
  R = AntPedicelLength * BotSize
             ALft = ALft - AntPedicelAngle + (((Ant(0) - 3) / 4) * AntPedicelStrength)
    XD = Cos(ALft) * R
    YD = Sin(ALft) * R
   XPedicL = XScapeL + XD
   YPedicL = YScapeL + YD
             ARgt = ARgt + AntPedicelAngle - (((Ant(1) - 3) / 4) * AntPedicelStrength)
    XD = Cos(ARgt) * R
    YD = Sin(ARgt) * R
   XPedicR = XScapeR + XD
   YPedicR = YScapeR + YD
'Calculate Flagellum that goes outward from end of Scape
  R = AntFlagellumLength * BotSize * 2
'Flagellum angle
    A = ((Ant(0) - 3) / 4) * AntPedicelStrength
             ALft = ALft - AntPedicelAngle + (((Ant(0) - 3) / 4) * AntPedicelStrength)
    XD = Cos(ALft) * R
    YD = Sin(ALft) * R
   XFlageL = XScapeL + XD
   YFlageL = YScapeL + YD
             ARgt = ARgt + AntPedicelAngle - (((Ant(1) - 3) / 4) * AntPedicelStrength)
    XD = Cos(ARgt) * R
    YD = Sin(ARgt) * R
   XFlageR = XScapeR + XD
   YFlageR = YScapeR + YD
'Draw Flagellum on screen.
  Pic.FillStyle = 0           'Fill inside of Circle with color.
  Pic.FillColor = BodyColor
  Call DrawAntennaSection(BodyWidth / 12 * BotSize, XPedicL, YPedicL, XFlageL, YFlageL, BodyColor)
  Call DrawAntennaSection(BodyWidth / 12 * BotSize, XPedicR, YPedicR, XFlageR, YFlageR, BodyColor)
'Draw Pedicel on screen.
  Call DrawAntennaSection(BodyWidth / 10 * BotSize, XScapeL, YScapeL, XPedicL, YPedicL, SpeedColor(Abs(Ant(0) - 3)))
  If ShowAntennaCheck = 1 Then Pic.Print Format(Ant(0))
  Call DrawAntennaSection(BodyWidth / 10 * BotSize, XScapeR, YScapeR, XPedicR, YPedicR, SpeedColor(Abs(Ant(1) - 3)))
  If ShowAntennaCheck = 1 Then Pic.Print Format(Ant(1))
'Draw Scape on screen.
  Call DrawAntennaSection(BodyWidth / 10 * BotSize, XBasalL, YBasalL, XScapeL, YScapeL, BodyColor)
  Call DrawAntennaSection(BodyWidth / 10 * BotSize, XBasalR, YBasalR, XScapeR, YScapeR, BodyColor)
'Draw Basal Knob on screen.
  Call DrawAntennaSection(BodyWidth / 8 * BotSize, XBasalL, YBasalL, XBasalL, YBasalL, BodyColor)
  Call DrawAntennaSection(BodyWidth / 8 * BotSize, XBasalR, YBasalR, XBasalR, YBasalR, BodyColor)
End Sub

Private Sub DrawAntennaSection(SecWidth As Long, X1Sec As Long, Y1Sec As Long, X2Sec As Long, Y2Sec As Long, SecColor As Long)
  Pic.DrawWidth = SecWidth + 1
  Pic.Line (X1Sec, Y1Sec)-(X2Sec, Y2Sec), vbBlack
  Pic.DrawWidth = (SecWidth * 0.8) + 1
  Pic.Line (X1Sec, Y1Sec)-(X2Sec, Y2Sec), vbWhite
  Pic.DrawWidth = (SecWidth * 0.55) + 1
  Pic.Line (X1Sec, Y1Sec)-(X2Sec, Y2Sec), SecColor
End Sub

Private Sub DrawFrontRearWheels(Ang As Double, LRnumber1 As Long, LRnumber2 As Long)
'Get Color coding of what Motor speed Was, to draw wheel/wings.
   LRspeedColor(0, 0) = SpeedColor(Abs(SpeedWas - 3))
   LRspeedColor(1, 0) = SpeedColor(Abs(SpeedWas - 3))
'Get Color coding of what Motor Speed is now, to draw wheel/wings.
   LRspeedColor(0, 1) = SpeedColor(Abs(SpeedNum - 3))
   LRspeedColor(1, 1) = SpeedColor(Abs(SpeedNum - 3))
      X = Cos(Ang + WheelA) * WheelRdZm
      Y = Sin(Ang + WheelA) * WheelRdZm
   Call DrawWheelWing(LRnumber1, DrawX + X, DrawY + Y)
'Right Rear Wheel
      X = Cos(Ang - WheelA) * WheelRdZm
      Y = Sin(Ang - WheelA) * WheelRdZm
   Call DrawWheelWing(LRnumber2, DrawX + X, DrawY + Y)
End Sub

Private Sub DrawWheelWing(LRnumber As Long, LRX As Long, LRY As Long)
'Use Confidence number 0-3 to determine color to use for outer wing/wheels.
    Pic.FillStyle = 0           'Fill inside of Circle with color.
'Outer White highlight line.
    Pic.DrawWidth = OutlineWidth
'Draw largest circle, fill with color.
    Pic.FillColor = LRspeedColor(LRnumber, 1)
    Pic.Circle (LRX, LRY), WheelSzZm + 1, OutlineColor
'Second circle, second Speed color
    Pic.FillColor = LRspeedColor(LRnumber, 0)
    Pic.Circle (LRX, LRY), (WheelSzZm * 0.55) + 1, OutlineColor
'Draw black outline around wheel.
    Pic.FillStyle = 1           'Do not fill inside of circle with color.
    Pic.Circle (LRX, LRY), WheelSzZm + OutlineWidth + 1, vbBlack
End Sub

Public Sub Vision()
Dim E As Long
Dim F As Long
'Save a copy of what each image pixel was before then erase array to total Brightness in.
  For E = 0 To 1
    For F = 1 To Facets
      BriWas(E, 0, F) = Bri(E, 0, F)
      BriWas(E, 1, F) = Bri(E, 1, F)
      BriWas(E, 2, F) = Bri(E, 2, F)
    Next F
  Next E
  Erase Bri
'Calculate BodyLine, X1,Y1 is the center of its front (head) end, X2,Y2 is rear end.
      X = Cos(BotAng) * BodyLengthHalf          'BodyLength is from scroll on Design form.
      Y = Sin(BotAng) * BodyLengthHalf
      BodyX1 = X
      BodyY1 = Y
      BodyX2 = -X
      BodyY2 = -Y
'Find BetweenEyesX,Y point directly Between Eyes, is Forward from the EyeX1,Y1 point.
                     X = Cos(BotAng) * EyeFw    'EyeForward is from scroll on Design form.
                     Y = Sin(BotAng) * EyeFw
      BetweenEyesX = X + BodyX1                 'Add additional X,Y amount Forward to Between eyes.
      BetweenEyesY = Y + BodyY1
'Calculate EyeX,Y location of Mouth.
      R = MouthFw + BodyLengthHalf
      X = Cos(BotAng) * R                       'EyeForward is from scroll on Design form.
      Y = Sin(BotAng) * R
      MouthX = BetweenEyesX + X
      MouthY = BetweenEyesY + Y
'Calculate EyeX,Y location of Eyes.
 For E = 0 To 1                  'For each Eye Number, Left=0 and Right=1
                         A = BotAng + PI2
                 X = Cos(A) * EyeSp             'EyeSpacing is from scroll on Design form.
                 Y = Sin(A) * EyeSp
      EyeX(E) = (X * NegPosLfRtMul(E)) + BetweenEyesX + BotX
      EyeY(E) = (Y * NegPosLfRtMul(E)) + BetweenEyesY + BotY
 Next E
'Precalculate an array of facet angles rotated to its current Angle.
 For E = 0 To 1                                 'For each Eye Number, Left=0 and Right=1
   For F = 0 To Facets
      EyeX(E) = (X * NegPosLfRtMul(E)) + BetweenEyesX + BotX
        BotFacetAng(E, F) = FacetAng(E, F) + BotAng
   Next F
 Next E
'_______ Find Amount of Light Entering Each Facet of Each Eye
 For E = 0 To 1                                 'For each Eye Number, Left=0 and Right=1
     T = 0
NextThing:                                      'For each Thing in its environment.
     T = T + 1
  If T > Things Then GoTo FinishedThings
'Clear the Distances to tangent point at edge
       ThingR1(E, T) = 0
       ThingR2(E, T) = 0
    If ThingGone(T) = True Then
       ThingEdg1Visible(E, T) = False
       ThingEdg2Visible(E, T) = False
       GoTo NextThing
    End If
'Calculate Distance from its center point to Thing it is seeing
       D = Sqr(((ThingX(T) - BotX) ^ 2) + ((ThingY(T) - BotY) ^ 2))
'Skip what it is directly on top of.
    If D < BodyLength Then GoTo NextThing
'Find Distance from EyeX,Y point to tangent point of outer edge.
       XD = EyeX(E) - ThingX(T)
       YD = EyeY(E) - ThingY(T)
       D = Sqr((XD ^ 2) + (YD ^ 2))
       SqrD = D * D
       RSqrT = ThingR(T) * ThingR(T)
'If EyeX,Y point is not inside the Thing's Circle/Radius (under its eye) then
   If SqrD <= RSqrT Then GoTo NextThing
'Find the Radius from center of Eye to the Thing, represents large Circle intersecting Thing's Circle.
     ThingR1(E, T) = Sqr(SqrD - RSqrT)
     ThingR2(E, T) = ThingR1(E, T)              'Each Circle has two tangent points, edges.
'Find the X1,Y1 & X2,Y2 points where the two circles intersect, point where Eye sees Edge of Thing.
     R = ThingR(T)
     Call CircleIntersect(EyeX(E), EyeY(E), ThingR1(E, T), ThingX(T), ThingY(T), R, ThingX1(E, T), ThingY1(E, T), ThingX2(E, T), ThingY2(E, T))
'Calculate two Angles to edges at points TX1,TY1 and TX2,TY2.  TX1,TY1 is lowest, CCW from 2 Angle,
     ThingA1(E, T) = RadianRange(AtnXY(ThingX1(E, T) - EyeX(E), ThingY1(E, T) - EyeY(E)))
     ThingA2(E, T) = RadianRange(AtnXY(ThingX2(E, T) - EyeX(E), ThingY2(E, T) - EyeY(E)))
  If ThingA2(E, T) < ThingA1(E, T) Then ThingA2(E, T) = ThingA2(E, T) + Radian
'Subtract LftAng from Edge Angles to align A1,A2 with scale of 0 to full Field Of Fiew.
   If E = 0 Then
        A2 = RadianRange(BotFacetAng(E, 0) - ThingA1(E, T))
        A1 = RadianRange(BotFacetAng(E, 0) - ThingA2(E, T))
     If A2 <= EyeFOV Then ThingEdg1Visible(E, T) = True Else ThingEdg1Visible(E, T) = False
     If A1 <= EyeFOV Then ThingEdg2Visible(E, T) = True Else ThingEdg2Visible(E, T) = False
   Else
        A1 = RadianRange(ThingA1(E, T) - BotFacetAng(E, 0))
        A2 = RadianRange(ThingA2(E, T) - BotFacetAng(E, 0))
     If A1 <= EyeFOV Then ThingEdg1Visible(E, T) = True Else ThingEdg1Visible(E, T) = False
     If A2 <= EyeFOV Then ThingEdg2Visible(E, T) = True Else ThingEdg2Visible(E, T) = False
   End If
'Use A1 and A2 to calculate Facet Numbers the two Angles correspond to.
        FN1 = Fix(A1 / EyeFOV * Facets) + 1
        FN2 = Fix(A2 / EyeFOV * Facets) + 1
'If both are greater than number of facets then neither angle is visible.
     If FN1 > Facets And FN2 > Facets Then GoTo NextThing
      If FN1 < 0 Then GoTo NextThing
'If FN1 and FN2 equal each other then both A1 and A2 are inside the same facet.
    If FN1 = FN2 Then
       Call AddColorBrightnessToFacet(E, FN1, T, (ThingA2(E, T) - ThingA1(E, T)) / FacetStep)
     GoTo NextThing
    End If
        FA1 = FacetAng(0, 0) - A1
        FA2 = FacetAng(0, 0) - A2
'If Left Count Number is outside field of view then make it first Facet Number to count from.
    If FN1 > Facets Then
       FacetFrom = 1
    Else
       FacetFrom = FN1 + 1          'Else Left Count Number is inside a facet.
       Call AddColorBrightnessToFacet(E, FN1, T, Abs(FacetAng(0, FN1) - FA1) / FacetStep)
    End If
'If Right Count Number is outside field of view then make it last Facet Number of count.
    If FN2 > Facets Then
       FacetTo = Facets
    Else
       FacetTo = FN2 - 1            'Else Right Count Number is inside a facet.
       Call AddColorBrightnessToFacet(E, FN2, T, Abs(FacetAng(0, FN2 - 1) - FA2) / FacetStep)
    End If
'Fill Facets in between two Angle points.  If N1>N2 then nothing is added to any Total.
      For F = FacetFrom To FacetTo
       Call AddColorBrightnessToFacet(E, F, T, 1)
      Next F
  GoTo NextThing
FinishedThings:
 Next E
'_______ Find Minimum and Maximum Brightnesses value for each Eye.
 For E = 0 To 1                     'For each Eye, 0=Left, 1=Right
  For C = 0 To 2                    'For each Color receptor 0,1,2
         MaxBright(E, C) = 0
'Find new brightest Bit it Sees, and total for Average brightness
    For F = 1 To Facets             'For each Facet
      If Bri(E, C, F) > MaxBright(E, C) Then MaxBright(E, C) = Bri(E, C, F)
    Next F
  Next C
 Next E
 '______Find the brightest value in each Color subsystem for both eyes together.
 For C = 0 To 2                     'For each Color receptor 0,1,2
   If MaxBright(0, C) > MaxBright(1, C) Then
      MaxBriBoth(C) = MaxBright(0, C)
   Else
      MaxBriBoth(C) = MaxBright(1, C)
   End If
 Next C
'________ Find brightest pixel number that it Sees.
 For E = 0 To 1                     'For each Eye, 0=Left, 1=Right
  For C = 0 To 2                    'For each Color receptor 0,1,2
       MaxBri = 0
''Save what Bit number it Was one moment in time ago, then clear variable for what it is now.
       EyeWas(E, C) = Eye(E, C)
       Eye(E, C) = 0
'Find new brightest Bit it Sees, and total for Average brightness
   For F = 1 To Facets              'For each Facet
     If Bri(E, C, F) > MaxBri Then
       MaxBri = Bri(E, C, F)
       Eye(E, C) = F
     End If
   Next F
  Next C
 Next E
 '_______ Sense moving Towards what it Sees.
 For E = 0 To 1                     'For each Eye, 0=Left, 1=Right
  For C = 0 To 2                    'For each Color subsystem 0,1,2
       EyeBriWas(E, C) = EyeBri(E, C)
       EyeBri(E, C) = Bri(E, C, Eye(E, C))
    If Eye(E, C) > 0 Then EyeBri(E, C) = EyeBri(E, C) + Bri(E, C, Eye(E, C) - 1)
    If Eye(E, C) < Facets Then EyeBri(E, C) = EyeBri(E, C) + Bri(E, C, Eye(E, C) + 1)
    If EyeBri(E, C) > EyeBriWas(E, C) Then Twd(E, C) = 1 Else Twd(E, C) = 0
  Next C
 Next E
End Sub

Private Sub AddColorBrightnessToFacet(EyeN As Long, FacetN As Long, ThingN As Long, BriMul As Double)
    Bri(EyeN, 0, FacetN) = Bri(EyeN, 0, FacetN) + (BriMul * ThingC(0, ThingN))
    Bri(EyeN, 1, FacetN) = Bri(EyeN, 1, FacetN) + (BriMul * ThingC(1, ThingN))
    Bri(EyeN, 2, FacetN) = Bri(EyeN, 2, FacetN) + (BriMul * ThingC(2, ThingN))
End Sub

Public Sub CalcFacetAngles()
Dim F As Long
Dim Str1 As String * 4
Dim Str2 As String * 9
Dim Str3 As String * 10
'Facet Number 1 is at mouth, and last FacetAngle(Eye,Facets) is rearmost Facet on outside of body.
'The reading for Num=0 is where Facet1 begins, Num=1 is other side of Facet1 and where 2 begins.
'7 facet eyes would look like the following when angles to each side of center are stored in array.
'Fac   Eye=0   Eye=1
'Num   LftAng  RgtAng
' 0     0.93   -0.93
' 1     0.41   -0.41
' 2    -0.10    0.10
' 3    -0.62    0.62
' 4    -1.13    1.13
' 5    -1.64    1.64
' 6    -2.16    2.16
' 7    -2.67    2.67
    Design.Text1 = " Facet Angles, in Radians." & vbCrLf & "===========================" & vbCrLf & " Num     LftAng    RgtAng" & vbCrLf & "==========================="
'Find lines showing sides of each ommatidia, the facets.
                 EyeFOV = EyeAng2 - EyeAng1
           EA1 = EyeAng1
           EA2 = EyeAng2 + 0.00001     'Small amount added for math round-off, or misses last facet.
'Save angles for each facet for both eyes (Left=0 and Right=1) in FacetAng() array.
                 F = 0
                           FacetStep = EyeFOV / Facets
   For A = EA1 To EA2 Step FacetStep
'Store with ClockWise angles, bots left side to its right.
      FacetAng(0, F) = -A           'Left Eye, Facet Angle
      FacetAng(1, F) = A            'Right Eye, Facet Angle
                  F = F + 1
   Next A
'Calculate Centers of all facets into FacetCenterAngle array
   For F = 1 To Facets
      FacetCtrAng(0, F) = (FacetAng(0, F - 1) + FacetAng(0, F)) / 2
      FacetCtrAng(1, F) = (FacetAng(1, F - 1) + FacetAng(1, F)) / 2
'Find number of Inner Facets by saving the left facet number when it goes negative, to outside.
     If FacetCtrAng(0, F) > 0 And F < Facets Then InnerFacets = F + 1
'Show calculated points in the Text box that is on the Design form so they can be seen.
     LSet Str1 = Format(F)
     RSet Str2 = Format(FacetCtrAng(0, F), "0.000")
     RSet Str3 = Format(FacetCtrAng(1, F), "0.000")
     Design.Text1 = Design.Text1 & vbCrLf & "  " & Str1 & Str2 & Str3
   Next F
End Sub

'Find the X1,Y1 & X2,Y2 points where the two circles intersect, point where Eye sees Edge of Thing.
Private Sub CircleIntersect(CX1 As Double, CY1 As Double, Radius1 As Double, CX2 As Double, CY2 As Double, Radius2 As Double, TX1 As Double, TY1 As Double, TX2 As Double, TY2 As Double)
Dim CX, CY As Double
Dim D2 As Double
Dim H As Double
'Find the distance between the centers of both circles.
   XD = CX1 - CX2
   YD = CY1 - CY2
   D = Sqr(XD * XD + YD * YD)
'Find Distance along line between circle centers to where intersect points are above/below it.
   D2 = (Radius1 * Radius1 - Radius2 * Radius2 + D * D) / (2 * D)
'Height of each line to intersect points, from the center point line between circle centers.
   H = Sqr(Radius1 * Radius1 - D2 * D2)
'Find the two X,Y points where circles intersect.
         CX = CX1 + D2 * (CX2 - CX1) / D
         CY = CY1 + D2 * (CY2 - CY1) / D
   TX1 = CX + H * (CY2 - CY1) / D
   TY1 = CY - H * (CX2 - CX1) / D
   TX2 = CX - H * (CY2 - CY1) / D
   TY2 = CY + H * (CX2 - CX1) / D
End Sub

Private Sub DisplayVision(Xat As Long, Yat As Long, Xsz As Long, Ysz As Long)
Dim Tx As String
Dim E As Long
Dim XE As Long
Dim XE2 As Long
Dim YE As Long
Dim F As Long
Dim RevF As Long
Dim XF As Long
Dim YF0a As Long
Dim YF1a As Long
Dim YF2a As Long
Dim YF3a As Long
Dim YF0b As Long
Dim YF1b As Long
Dim YF2b As Long
Dim YF3b As Long
Dim YF0c As Long
Dim YF1c As Long
Dim YF2c As Long
Dim YF3c As Long
Dim YszBtm As Long
Dim YszTxt As Long
Dim Ystep As Long
Dim Ysp As Long
    Ysp = YPix / 80
    YszBtm = (Ysz * 0.6) + 1
             TH = Pic.TextHeight("H")
    YszTxt = TH + 3
    Ystep = Ysz + YszBtm + Ysp + YszTxt
    XE = Xat
    YF0a = Yat
    YF1a = YF0a + Ystep
    YF2a = YF1a + Ystep
    YF3a = YF2a + Ystep
    YF0b = YF0a + Ysz
    YF1b = YF1a + Ysz
    YF2b = YF2a + Ysz
    YF3b = YF3a + Ysz
    YF0c = YF0b + YszBtm
    YF1c = YF1b + YszBtm
    YF2c = YF2b + YszBtm
    YF3c = YF3b + YszBtm
     Pic.FillStyle = 0
     Pic.DrawWidth = 1
'Draw rows of facets for left and right eye.
      F = Facets + 1
 For E = 0 To 1
    XE2 = XE + (Xsz * (Facets - 1))
   For XF = XE To XE2 Step Xsz
      F = F + NegPosLfRtMul(E)
   RevF = Facets - F + 1
'Red system 0
   If S = 0 Then Pic.DrawWidth = 2 Else Pic.DrawWidth = 1
      Pic.FillColor = RGB(BriColor(E, 0, F), 0, 0)
      Pic.Line (XF, YF0a)-(XF + Xsz, YF0a + Ysz), vbWhite, B
      Pic.FillColor = 0
      Pic.Line (XF, YF0b)-(XF + Xsz, YF0b + YszTxt), vbWhite, B
    If F = Eye(E, 0) Then
                Tx = Format(Eye(E, 0))
      Pic.CurrentX = XF + Fix((Xsz - Pic.TextWidth(Tx)) / 2)
      Pic.CurrentY = YF0b + 2
      Pic.Print Tx
    End If
'Green system 1
   If S = 1 Then Pic.DrawWidth = 2 Else Pic.DrawWidth = 1
      Pic.FillColor = RGB(0, BriColor(E, 1, F), 0)
      Pic.Line (XF, YF1a)-(XF + Xsz, YF1a + Ysz), vbWhite, B
      Pic.FillColor = 0
      Pic.Line (XF, YF1b)-(XF + Xsz, YF1b + YszTxt), vbWhite, B
    If F = Eye(E, 1) Then
                Tx = Format(Eye(E, 1))
      Pic.CurrentX = XF + Fix((Xsz - Pic.TextWidth(Tx)) / 2)
      Pic.CurrentY = YF1b + 2
      Pic.Print Tx
    End If
'Blue system 2
   If S = 2 Then Pic.DrawWidth = 2 Else Pic.DrawWidth = 1
      Pic.FillColor = RGB(0, BriColor(E, 2, F) * 0.8, BriColor(E, 2, F))
      Pic.Line (XF, YF2a)-(XF + Xsz, YF2a + Ysz), vbWhite, B
      Pic.FillColor = 0
      Pic.Line (XF, YF2b)-(XF + Xsz, YF2b + YszTxt), vbWhite, B
    If F = Eye(E, 2) Then
                Tx = Format(Eye(E, 2))
      Pic.CurrentX = XF + Fix((Xsz - Pic.TextWidth(Tx)) / 2)
      Pic.CurrentY = YF2b + 2
      Pic.Print Tx
    End If
   Next XF
     XE = XE + (Xsz * (Facets + 1))
      F = 0
 Next E
End Sub

'Save RunDateTime.Txt file to "Run" folder.
Private Sub SaveRunFileCheck_Click()
Dim N2 As Long
Dim H2 As Long
Dim HN As Long
Dim HS As String
Dim HHei As Long
Dim HCtr As Long
  DataName(1) = "Motor  Left"
  BitsData(1) = 1
  DataName(2) = "Motor Right"
  BitsData(2) = 1
  DataName(3) = "L/R Confidence"
  BitsData(3) = 2
  DataName(4) = "Motor Forward"
  BitsData(4) = 1
  DataName(5) = "Motor Reverse"
  BitsData(5) = 1
  DataName(6) = "F/R Confidence"
  BitsData(6) = 2
'Exit subroutine if program is just getting started.
 If SenseCount(L, S) = 0 Then Exit Sub
'If "Save Run" was checked then open file with header, if unchecked close file showing finish time.
 If SaveRunFileCheck = 1 Then
                      FolderPath = App.Path & "\Run"
  If FSO.FolderExists(FolderPath) = False Then MkDir FolderPath
    FilePath = FolderPath & "\Run" & Format(Now, "mm-dd-yy") & "At" & Format(Now, "hh-mm-ssAM/PM") & ".Txt"
  Open FilePath For Output As #2
     Print #2, "------------------------------------------------------------------"
     Print #2, "Compound Eye Intelligence Design Lab."
     Print #2, "By Gary S. Gaulin, 2011. "
     Print #2, "------------------------------------------------------------------"
     Print #2, " Lobes   : " & Format(Lobes)
     Print #2, " Data    : " & Format(DataBits) & " bits, 2 bytes per data location"
     Print #2, " Address : " & Format(AddrBitsPC(L, S)) & " total addressing bits, " & Format(2 ^ AddrBitsPC(L, S), "###,###,###,###") & " data locations"
     Print #2, "         : " & Format(AddrBitsRAM(L, S)) & " subsystem addressing bits, " & Format(2 ^ AddrBitsRAM(L, S), "###,###,###,###") & " data locations"
     Print #2, " Date    : " & Format(Now, "mm/dd/yy")
     Print #2, " Time    : " & Format(Now, "hh:mm:ss AM/PM")
'Set HeaderHeight to longest text string that must fit vertically in Header.
       HHei = 0
   For N = 0 To SenseCount(L, S) - 1
       If Len(SensorName(L, S, N)) > HHei Then HHei = Len(SensorName(L, S, N))
   Next N
   For N = 1 To 6
       If Len(DataName(N)) > HHei Then HHei = Len(DataName(N))
   Next N
   Erase Header
'If needed then put word "Lobes" into Header showing Names vertically.
   If Lobes = 2 Then
    For N2 = 1 To HHei
       If Len("Lobe") >= N2 Then
         Header(N2) = Header(N2) & Mid("Lobe", 4 + 1 - N2, 1) & String(1, " ")
       Else
         Header(N2) = Header(N2) & " " & String(1, " ")
       End If
     Next N2
   End If
'Put word "System" into Header showing Names vertically.
    For N2 = 1 To HHei
       If Len("System") >= N2 Then
         Header(N2) = Header(N2) & Mid("System", 6 + 1 - N2, 1) & String(SystemBits, " ")
       Else
         Header(N2) = Header(N2) & " " & String(SystemBits, " ")
       End If
     Next N2
'Form left of Header showing Sensor Names vertically.
   For N = 0 To SenseCount(L, S) - 1
    For N2 = 1 To HHei
       If Len(SensorName(L, S, N)) >= N2 Then
         Header(N2) = Header(N2) & Mid(SensorName(L, S, N), Len(SensorName(L, S, N)) + 1 - N2, 1) & String(SensorBits(L, S, N), " ")
       Else
         Header(N2) = Header(N2) & " " & String(SensorBits(L, S, N), " ")
       End If
     Next N2
   Next N
'Add space between Sensor Names and Data Names.
        HCtr = Len(Header(1)) + 1
    For N2 = 1 To HHei
        Header(N2) = Header(N2) & "| "
    Next N2
'Form right of Header showing Data Names vertically.
   For N = 1 To 6
     For N2 = 1 To HHei
       If Len(DataName(N)) >= N2 Then
         Header(N2) = Header(N2) & Mid(DataName(N), Len(DataName(N)) + 1 - N2, 1) & String(BitsData(N), " ")
       Else
         Header(N2) = Header(N2) & " " & String(BitsData(N), " ")
       End If
     Next N2
   Next N
'Print the ADDRESS - DATA  part of header
     Print #2, String(HCtr - 1, "-") & "|" & String(Len(Header(1)) - HCtr, "-")
     HS = String(Fix(HCtr / 2) - 3, " ") & "ADDRESS"
     HS = HS & String(HCtr - Len(HS) - 1, " ") & "|" & "    DATA"
     Print #2, HS
     Print #2, String(HCtr - 1, "-") & "|" & String(Len(Header(1)) - HCtr, "-")
'Print Header lines to text file.
   For N = HHei To 1 Step -1
     Print #2, Header(N)
   Next N
     Print #2, String(Len(Header(1)), "-")
'Close file showing finish time.
 Else
     Print #2, "------------------------------------------------------------------"
     Print #2, " Time:     " & Format(Now, "hh:mm:ss AM/PM")
     Print #2, "------------------------------------------------------------------"
   Close #2
 End If
End Sub

Private Sub SaveAddrDataFile()
If CycleLabel = "0" Then Exit Sub
If Header(1) = "" Then Call SaveRunFileCheck_Click
  If Lobes = 1 Then
    FStr = ""                           'Single Lobe stays 0, not needed in list.
  Else
    FStr = Format(L) & " "              'Two Lobe start with Lobe number.
  End If
    FStr = FStr & BinStr(2, S) & " "    'Add the System number.
  For N = 0 To SenseCount(L, S) - 1       'Add remaining readings to string.
    FStr = FStr & BinStr(SensorBits(L, S, N), SenseRead(L, S, N)) & " "
  Next N
    FStr = FStr & "- "
    FStr = FStr & BinStr(1, GoLft) & " " & BinStr(1, GoRgt) & " " & BinStr(2, LfRtCfOut) & " "
    FStr = FStr & BinStr(1, GoFwd) & " " & BinStr(1, GoRev) & " " & BinStr(2, FwRvCfOut)
   Print #2, FStr
 If LOF(2) > 1000000 Then SaveRunFileCheck = 0
  SaveRunLabel = Format(LOF(2))
End Sub

Private Sub ClearChart()
         Chart.Picture1.Cls
         Chart.Picture1.Line (0, YcPix * 0.33333333)-(XcPix, YcPix * 0.33333333), vbCyan
         Chart.Picture1.Line (0, YcPix * 0.66666666)-(XcPix, YcPix * 0.66666666), vbCyan
End Sub

Private Sub AddToChart()
      YcScale(4) = YcPix / StomachHolds
          XcInc = XcInc + XcScale
       If XcInc > XcPix - 2 Then Call ClearChart: Call ShrinkChart
   If Fix(XcInc) <> Fix(XcInc - XcScale) Then
       YChart(0, XcInc) = ((3 - AvFwRvCF) * YcScale(0))
       YChart(1, XcInc) = ((3 - AvLfRtCF) * YcScale(1))
       YChart(2, XcInc) = ((3 - AvCF) * YcScale(2))
       YChart(3, XcInc) = ((MemLocations - StoredMemories) * YcScale(3))
       YChart(4, XcInc) = ((StomachHolds - StomachAmount) * YcScale(4))
       Chart.Picture1.Line ((XcInc - 1), YChart(0, XcInc - 1))-(XcInc, YChart(0, XcInc)), AvFwRvColor
       Chart.Picture1.Line ((XcInc - 1), YChart(1, XcInc - 1))-(XcInc, YChart(1, XcInc)), AvLfRtColor
       Chart.Picture1.Line ((XcInc - 1), YChart(2, XcInc - 1))-(XcInc, YChart(2, XcInc)), AvCombinedColor
       Chart.Picture1.Line ((XcInc - 1), YChart(3, XcInc - 1))-(XcInc, YChart(3, XcInc)), StoredMemoriesColor
       Chart.Picture1.Line ((XcInc - 1), YChart(4, XcInc - 1))-(XcInc, YChart(4, XcInc)), StomachAmountColor
   End If
End Sub

Private Sub ShrinkChart()
       XcScale = XcScale / 2
  For X = 1 To XcInc + 1
       YChart(0, X / 2) = YChart(0, X)
       YChart(1, X / 2) = YChart(1, X)
       YChart(2, X / 2) = YChart(2, X)
       YChart(3, X / 2) = YChart(3, X)
       YChart(4, X / 2) = YChart(4, X)
  Next X
       XcInc = XcInc / 2
  For X = 1 To XcInc - 1
         Chart.Picture1.Line (X - 1, YChart(0, X - 1))-(X, YChart(0, X)), AvFwRvColor
         Chart.Picture1.Line (X - 1, YChart(1, X - 1))-(X, YChart(1, X)), AvLfRtColor
         Chart.Picture1.Line (X - 1, YChart(2, X - 1))-(X, YChart(2, X)), AvCombinedColor
         Chart.Picture1.Line (X - 1, YChart(3, X - 1))-(X, YChart(3, X)), StoredMemoriesColor
         Chart.Picture1.Line (X - 1, YChart(4, X - 1))-(X, YChart(4, X)), StomachAmountColor
  Next X
End Sub

Private Sub RunMotorsTimeStep()
Dim CF As Double
Dim E As Long
Dim F As Long
'ReFeed if entire RemainingFoodSupply has been consumed.
  If RemainingFoodSupply = 0 Then
         Call PlaceFoodInWorld
  End If
'Update Average Confidences.
  AvFwRvCF = (AvFwRvCF * (1 - (1 / ConfAverages))) + (FwRvCfOut * (1 / ConfAverages))
  AvLfRtCF = (AvLfRtCF * (1 - (1 / ConfAverages))) + (LfRtCfOut * (1 / ConfAverages))
  AvCF = (AvFwRvCF + AvLfRtCF) / 2
  Call AddToChart
  If AvCF = 3 Then Call PlaceFoodInWorld
'Adjust Left and Right Motor velocity.
     SpeedWas = SpeedNum
     SpeedNum = SpeedNum + GoFwd - GoRev
  If SpeedNum > 7 Then SpeedNum = 7
  If SpeedNum < 0 Then SpeedNum = 0
     Velocity = (SpeedNum - 3) * MotorSpeed
'When "Lft" or "Rgt" are zero they add or subtract 0, Angle stays same.
     BotAng = BotAng + (GoRgt * MotorTurnAngle) - (GoLft * MotorTurnAngle)
     BotAngChangeWas = BotAngChange
     BotAngChange = BotAng - BotAngWas
'Save what Antenna reading was in last cycle.
     AntWas(0) = Ant(0)
     AntWas(1) = Ant(1)
'Calculate new Antenna value from 0 to 7 depending on speed and turn direction.
     Ant(0) = SpeedNum
     Ant(1) = SpeedNum
'Add or subtract one from Antenna reading when turning one way or the other.
  If BotAng > BotAngWas Then
     Ant(0) = Ant(0) + 1
     Ant(1) = Ant(1) - 1
  End If
  If BotAng < BotAngWas Then
     Ant(0) = Ant(0) - 1
     Ant(1) = Ant(1) + 1
  End If
'Keep Antenna reading between 0 and 7
  If Ant(0) < 0 Then Ant(0) = 0
  If Ant(0) > 7 Then Ant(0) = 7
  If Ant(1) < 0 Then Ant(1) = 0
  If Ant(1) > 7 Then Ant(1) = 7
'Spin bit is 1 when turning left or right.
     SpinWas = Spin
  If BotAngChange <> 0 And BotAngChange = BotAngChangeWas Then Spin = 1 Else Spin = 0
'Keep Angle range within one radian, for rest of program.
     BotAngWas = BotAng
     BotAng = RadianRange(BotAng)
     BotXWas = BotX
     BotYWas = BotY
     BotX = (Velocity * Cos(BotAng)) + BotX
     BotY = (Velocity * Sin(BotAng)) + BotY
'_______________ CALCULATE NEW VISION SENSORY CONDITIONS THAT NOW EXIST _______________
  Call Vision
'___________________ TASTES FOOD
           TstFdWas = TstFd
           TstFd = 0
  If MOU = 0 Then
   For T = 1 To Things
     If ThingGone(T) = False Then
         X = ThingX(T) - BotX               'Calculate X,Y of Food.
         Y = ThingY(T) - BotY
         XD = X - MouthX                    'Calculate distance between two X points.
         YD = Y - MouthY                    'Calculate distance between two Y points.
          D = Sqr((XD ^ 2) + (YD ^ 2))      'Calculate 2D distance between Mouth and Food.
'If Diameter of food is in radius of mouth then TastesFood.
       If D < ThingR(T) + MouthR And ThingFood(T) = True Then
            TastesWas = Tastes
            Tastes = T
            TstFd = 1
'If allowed to eat it all at once and it is edible then make it Gone.
         If AllowToEatCheck = 1 Then
          If StomachAmount < StomachHolds Then StomachAmount = StomachAmount + 1
             RemainingFoodSupply = RemainingFoodSupply - 1  'Subtract from count of food remaining.
          If ThingAmount(T) > 0 Then ThingAmount(T) = ThingAmount(T) - 1
          If ThingAmount(T) = 0 Then ThingGone(T) = True    'Set this food item as being gone.
         End If
       End If
     End If
   Next T
  End If
'Calculate Left/Right Eye() Correlation, ranges 0=Correlated to +/- number of Facets.
    CorrelateChange(S) = Correlate(S)           'Save what Correlation Was, last cycle.
    Correlate(S) = Eye(0, S) - Eye(1, S)        'Subtract Eye signals for Correlation.
'If correlation has changed then save what it Was, otherwise retains previous reading.
 If CorrelateChange(S) <> Correlate(S) Then CorrelateWas(S) = CorrelateChange(S)               'Save what Correlation Was, last cycle.
 If Eye(0, S) = 0 Or Eye(1, S) = 0 Then
    Cor(S) = 0
 Else
    Cor(S) = 0
   If Abs(Correlate(S)) < Abs(CorrelateWas(S)) Or Correlate(S) = 0 Then Cor(S) = 1
 End If
'If Eye is Not Zero then corresponding "See" bit is 1
    SeeWas(0, S) = See(0, S)
    SeeWas(1, S) = See(1, S)
 If Eye(0, S) = 0 Then
    See(0, S) = 0
 Else
    See(0, S) = 1
 End If
 If Eye(1, S) = 0 Then
    See(1, S) = 0
 Else
    See(1, S) = 1
 End If
 'Update Amount of food in Stomach
    StomachAmount = StomachAmount - StomachDrains
 If StomachAmount < 0 Then StomachAmount = 0
 If StomachAmount < StomachHolds / 3 Then Hungry = 1 Else Hungry = 0
End Sub

Private Sub CycleTimer_Timer()
Dim RepeatN As Long
'Either repeat loop many times without drawing to screen, or Else single cycle (one lobe).
  If TurboOrTimerCommand.Caption = "Screen" Then
    For RepeatN = 2 To TurboCycles      'Subtract one for last MemoryCycle to Draw to screen.
'________ IF 2 LOBES SWITCH LOBE "L" NUMBER, SYSTEM "S" SET WITH OPTION BUTTONS ________
       Call SwitchLobeNumber            'Set Lobe variable to either 0 or 1.
       Call IntelligenceAlgorithm       'Moves Time Step in space, but not to screen.
    Next RepeatN
'Increment Cycle Number (a slow task) all at once here.
   CycleLabel = Format(CDec(CycleLabel) + (TurboCycles / Lobes), "#,###,###,###,###,###,###,###,###,##0")
  Else
'Increment Cycle Number by 1, uses screen text Label to store a very large number.
   CycleLabel = Format(CDec(CycleLabel) + (1 / Lobes), "#,###,###,###,###,###,###,###,###,##0.0")
  End If
'________ IF 2 LOBES SWITCH LOBE "L" NUMBER, SYSTEM "S" SET WITH OPTION BUTTONS ________
       Call SwitchLobeNumber            'Set Lobe variable to either 0 or 1.
       Call IntelligenceAlgorithm       'Moves Time Step in space, but not to screen.
       Call DrawBot                     'Draw everything to screen.
End Sub

Private Sub SwitchLobeNumber()
 If Lobes = 1 Then      'Number of Lobes is selected by CheckBox on Addressing form.
     L = 2              'One Lobe circuit stays L=2
 Else                   'Else switches Lobes then color System after each Lobe sees it.
  If L = 0 Then
     L = 1              'Toggle Lobe number from 0 to 1.
  Else
     L = 0              'Toggle Lobe number from 1 to 0.
  End If
 End If
End Sub

Private Sub LoadAddressingArrays()
  Call AddressingChange
'Put labels on CheckBoxes in Addressing form.
      L = 0
    For S = 0 To 3
      For N = 0 To AllSenseCount(L, S) - 1
        Addressing.LeftLobeCheck((S * AllSenseCount(L, S)) + N).Caption = AllSensorName(L, S, N)
      Next N
    Next S
      L = 1
    For S = 0 To 3
      For N = 0 To AllSenseCount(L, S) - 1
        Addressing.RightLobeCheck((S * AllSenseCount(L, S)) + N).Caption = AllSensorName(L, S, N)
      Next N
    Next S
      L = 2
    For S = 0 To 3
      For N = 0 To AllSenseCount(L, S) - 1
        Addressing.OneLobeCheck((S * AllSenseCount(L, S)) + N).Caption = AllSensorName(L, S, N)
      Next N
    Next S
End Sub

Public Sub AddressingChange()
'Number of Lobes is from Addressing form.
   Lobes = Addressing.TwoLobeCheck + 1
'For 3 color systems, save sensor Name, Bits, and variable to locate for Circuit draw.
 For S = 0 To 3
'Left Lobe of Two Lobe Configuration
   AllSensorName(0, S, 0) = "LeftSees": AllSensorBits(0, S, 0) = 1: LfSeeSensorN(0, S) = 0
   AllSensorName(0, S, 1) = "LeftToward": AllSensorBits(0, S, 1) = 1: LfTwdSensorN(0, S) = 1
   AllSensorName(0, S, 2) = "LeftEye": AllSensorBits(0, S, 2) = FacetBits: LfEyeSensorN(0, S) = 2
   AllSensorName(0, S, 3) = "LeftAnt": AllSensorBits(0, S, 3) = 3: LfAntSensorN(0, S) = 3
   AllSensorName(0, S, 4) = "TasteFood": AllSensorBits(0, S, 4) = 1: TstFdSensorN(0, S) = 4
   AllSensorName(0, S, 5) = "Correlation": AllSensorBits(0, S, 5) = 1: CorreSensorN(0, S) = 5
   AllSensorName(0, S, 6) = "GoForward": AllSensorBits(0, S, 6) = 1: GoFwdSensorN(0, S) = 6
   AllSensorName(0, S, 7) = "GoReverse": AllSensorBits(0, S, 7) = 1: GoRevSensorN(0, S) = 7
   AllSensorName(0, S, 8) = "GoLeft": AllSensorBits(0, S, 8) = 1: GoLftSensorN(0, S) = 8
   AllSensorName(0, S, 9) = "GoRight": AllSensorBits(0, S, 9) = 1: GoRgtSensorN(0, S) = 9
   AllSensorName(0, S, 10) = "": AllSensorBits(0, S, 10) = 2
   AllSensorName(0, S, 11) = "": AllSensorBits(0, S, 11) = 1
   AllSenseCount(0, S) = 10
'Right Lobe of Two Lobe Configuration
   AllSensorName(1, S, 0) = "RightSees": AllSensorBits(1, S, 0) = 1: RtSeeSensorN(1, S) = 0
   AllSensorName(1, S, 1) = "RightToward": AllSensorBits(1, S, 1) = 1: RtTwdSensorN(1, S) = 1
   AllSensorName(1, S, 2) = "RightEye": AllSensorBits(1, S, 2) = FacetBits: RtEyeSensorN(1, S) = 2
   AllSensorName(1, S, 3) = "RightAnt": AllSensorBits(1, S, 3) = 3: RtAntSensorN(1, S) = 3
   AllSensorName(1, S, 4) = "TasteFood": AllSensorBits(1, S, 4) = 1: TstFdSensorN(1, S) = 4
   AllSensorName(1, S, 5) = "Correlation": AllSensorBits(1, S, 5) = 1: CorreSensorN(1, S) = 5
   AllSensorName(1, S, 6) = "GoForward": AllSensorBits(1, S, 6) = 1: GoFwdSensorN(1, S) = 6
   AllSensorName(1, S, 7) = "GoReverse": AllSensorBits(1, S, 7) = 1: GoRevSensorN(1, S) = 7
   AllSensorName(1, S, 8) = "GoLeft": AllSensorBits(1, S, 8) = 1: GoLftSensorN(1, S) = 8
   AllSensorName(1, S, 9) = "GoRight": AllSensorBits(1, S, 9) = 1: GoRgtSensorN(1, S) = 9
   AllSensorName(1, S, 10) = "": AllSensorBits(1, S, 10) = 2
   AllSensorName(1, S, 11) = "": AllSensorBits(1, S, 11) = 1
   AllSenseCount(1, S) = 10
'One Lobe Configuration
   AllSensorName(2, S, 0) = "LeftSees": AllSensorBits(2, S, 0) = 1: LfSeeSensorN(2, S) = 0
   AllSensorName(2, S, 1) = "LeftToward": AllSensorBits(2, S, 1) = 1: LfTwdSensorN(2, S) = 1
   AllSensorName(2, S, 2) = "LeftEye": AllSensorBits(2, S, 2) = FacetBits: LfEyeSensorN(2, S) = 2
   AllSensorName(2, S, 3) = "LeftAnt": AllSensorBits(2, S, 3) = 3: LfAntSensorN(2, S) = 3
   AllSensorName(2, S, 4) = "TasteFood": AllSensorBits(2, S, 4) = 1: TstFdSensorN(2, S) = 4
   AllSensorName(2, S, 5) = "RightAnt": AllSensorBits(2, S, 5) = 3: RtAntSensorN(2, S) = 5
   AllSensorName(2, S, 6) = "RightEye": AllSensorBits(2, S, 6) = FacetBits: RtEyeSensorN(2, S) = 6
   AllSensorName(2, S, 7) = "RightToward": AllSensorBits(2, S, 7) = 1: RtTwdSensorN(2, S) = 7
   AllSensorName(2, S, 8) = "RightSees": AllSensorBits(2, S, 8) = 1: RtSeeSensorN(2, S) = 8
   AllSensorName(2, S, 9) = "Correlation": AllSensorBits(2, S, 9) = 1: CorreSensorN(2, S) = 9
   AllSensorName(2, S, 10) = "GoForward": AllSensorBits(2, S, 10) = 1: GoFwdSensorN(2, S) = 10
   AllSensorName(2, S, 11) = "GoReverse": AllSensorBits(2, S, 11) = 1: GoRevSensorN(2, S) = 11
   AllSensorName(2, S, 12) = "GoLeft": AllSensorBits(2, S, 12) = 1: GoLftSensorN(2, S) = 12
   AllSensorName(2, S, 13) = "GoRight": AllSensorBits(2, S, 13) = 1: GoRgtSensorN(2, S) = 13
   AllSensorName(2, S, 14) = "": AllSensorBits(2, S, 14) = 2
   AllSenseCount(2, S) = 14
 Next S
'Save arrays of Sensory that are checkbox checked on Addressing form.
  Call SaveLobeNumberSensory(0, Addressing.LeftLobeCheck)
  Call SaveLobeNumberSensory(1, Addressing.RightLobeCheck)
  Call SaveLobeNumberSensory(2, Addressing.OneLobeCheck)
'PreCalculate total number of bits required for RAM array.
  For S = 0 To 3
     AllAddrBitsPC(0, S) = AllAddrBitsRAM(0, S) + 3
     AddrBitsPC(0, S) = AddrBitsRAM(0, S) + 3
     AllAddrBitsPC(1, S) = AllAddrBitsRAM(1, S) + 3
     AddrBitsPC(1, S) = AddrBitsRAM(1, S) + 3
     AllAddrBitsPC(2, S) = AllAddrBitsRAM(2, S) + 2
     AddrBitsPC(2, S) = AddrBitsRAM(2, S) + 2
  Next S
'Initialize New Lifetime
     StoredMemories = 0
     StoredMemoriesLabel = 0
     AvCF = 0                           'Clear Average Confidence so it starts at 0.
     AvFwRvCF = 0                       'Clear Average Forward/Reverse Confidence so it starts at 0.
     AvLfRtCF = 0                       'Clear Average Left/Right Confidence so it starts at 0.
'Reset "Clock" that times how long the program has been running.
     CycleLabel = "0.0"                 'Cycle counter back to zero for new lifetime.
     BornDateLabel = Date
     BornTimeLabel = Time
     ClockTimer.Enabled = False         'Disable then Enable timer for full second delay.
     ClockTimer.Enabled = True
'Exit subroutine on error, not end program to report not enough RAM memory to be Addressable.
     S = 0
     Addr(S) = 0                        'Clear Address for no error in loop.
     ErrorCode = 0                      'Clear ErrorCode, no error yet.
 On Error GoTo ErrorExit
'Dimension RAM arrays for subsystem 0-3 and number of lobes of each.
  If Lobes = 1 Then
     L = 2
     MaxRAM = RequiredRAM(L)
     MaxPC = MaxRAM + 2
    ReDim RAM((2 ^ (MaxRAM + 2)) - 1) As Integer
  Else
     L = 0
     If RequiredRAM(0) > RequiredRAM(1) Then MaxRAM = RequiredRAM(0) Else MaxRAM = RequiredRAM(1)
     MaxPC = MaxRAM + 3
    ReDim RAM((2 ^ (MaxRAM + 3)) - 1) As Integer
  End If
'Show Addressing bits on Addressing form.
   Addressing.AddressBitsLabel = MaxRAM
   Addressing.SystemLocationsLabel = Format(2 ^ MaxRAM, "###,###,###,###,###")
   Addressing.AddrBitsPCLabel = MaxPC
                                           MemLocations = 2 ^ MaxPC
   Addressing.TotalLocationsLabel = Format(MemLocations, "###,###,###,###,###")
'Initialize Graphs
    XcScale = 1
  Call ClearChart
    YcScale(0) = YcPix / 3
    YcScale(1) = YcPix / 3
    YcScale(2) = YcPix / 3
    YcScale(3) = YcPix / MemLocations
    XcInc = 0
    YChart(0, 0) = YcPix
    YChart(1, 0) = YcPix
    YChart(2, 0) = YcPix
    YChart(3, 0) = YcPix
    YChart(4, 0) = YcPix
  StomachAmount = StomachHolds * 0.6666666
Exit Sub
'____________ ERROR TRAP EXIT/END FOR WHEN ADDRESSING TOO MANY BITS FOR RAM _____________
ErrorExit:                  'If Error addressing memory then program will go to here.
   ErrorCode = 1                          'Error Code 1 = out of computer RAM space.
   Addr(S) = 0
   AllAddr(S) = 0
   ReDim RAM(1000) As Integer
End Sub

Private Sub SaveLobeNumberSensory(LobeN As Long, Obj As Object)
       RequiredRAM(LobeN) = 0
 For S = 0 To 3
       AllAddrBitsRAM(LobeN, S) = 0
       AddrBitsRAM(LobeN, S) = 0
       SenseCount(LobeN, S) = 0
   For N = 0 To AllSenseCount(LobeN, S) - 1
       Bx = (S * AllSenseCount(LobeN, S)) + N   'CheckBoxes numbered 0 to last, 39 or 55.
     If Obj(Bx) = 1 Then
       SenseCheck(LobeN, S, N) = 1
       SenseCount(LobeN, S) = SenseCount(LobeN, S) + 1
       SensorName(LobeN, S, N) = AllSensorName(LobeN, S, N)
       SensorBits(LobeN, S, N) = AllSensorBits(LobeN, S, N)
       AddrBitsRAM(LobeN, S) = AddrBitsRAM(LobeN, S) + AllSensorBits(LobeN, S, N)
     Else
       SenseCheck(LobeN, S, N) = 0
     End If
       AllAddrBitsRAM(LobeN, S) = AllAddrBitsRAM(LobeN, S) + AllSensorBits(LobeN, S, N)
   Next N
     If AddrBitsRAM(LobeN, S) > RequiredRAM(LobeN) Then RequiredRAM(LobeN) = AddrBitsRAM(LobeN, S)
       SensorName(LobeN, S, SenseCount(LobeN, S)) = ""          'Add L, S array space.
       SensorName(LobeN, S, SenseCount(LobeN, S) + 1) = ""
       SensorBits(LobeN, S, SenseCount(LobeN, S)) = 2
       SensorBits(LobeN, S, SenseCount(LobeN, S) + 1) = 1
       SenseCheck(LobeN, S, AllSenseCount(LobeN, S)) = 1
       SenseCheck(LobeN, S, AllSenseCount(LobeN, S) + 1) = 1
 Next S
End Sub

Public Sub FormUniqueMemoryADDRESS()
 If ErrorCode = 1 Then Exit Sub
      S = S + 1
   If S > 2 Then S = 0
     FwRvCfIn = 0
     LfRtCfIn = 0
'For each Subsystem Number from 0 to 2.
 For SN = 0 To 2
  If ColorSystemCheck(SN) = 1 Then      'Skip subsystems not checked to be in circuit.
     Addr(SN) = 0               'Start with Address zero, will add sensor readings to it below.
     AddrBits = 0               'Address Bits is added to for each sensor.
     AllAddr(SN) = 0            'All Address has all sensor readings, regardless of checked.
     AllAddrBits = 0
'__ ONE LOBE circuit Address includes both Eyes and associated Left/Right senses.
'Single lobe circuit requires around 22 address bits = 4,194,304
   If Lobes = 1 Then
     Call AddToAddr(0, See(0, SN))
     Call AddToAddr(1, Twd(0, SN))
     Call AddToAddr(2, Eye(0, SN))
     Call AddToAddr(3, Ant(0))
     Call AddToAddr(4, TstFd)
     Call AddToAddr(5, Ant(1))
     Call AddToAddr(6, Eye(1, SN))
     Call AddToAddr(7, Twd(1, SN))
     Call AddToAddr(8, See(1, SN))
     Call AddToAddr(9, Cor(SN))
     Call AddToAddr(10, GoFwd)
     Call AddToAddr(11, GoRev)
     Call AddToAddr(12, GoLft)
     Call AddToAddr(13, GoRgt)
     Call AddToAddr(14, SN)                      'Add System number, 2 bits
   Else
'__ TWO LOBE circuit Addresses signals of one Eye only on each cycle.
'Two lobe circuit requires only 14 address bits = 16,384 locations, comparable performance.
     Call AddToAddr(0, See(L, SN))
     Call AddToAddr(1, Twd(L, SN))
     Call AddToAddr(2, Eye(L, SN))
     Call AddToAddr(3, Ant(L))
     Call AddToAddr(4, TstFd)
     Call AddToAddr(5, Cor(SN))
     Call AddToAddr(6, GoFwd)
     Call AddToAddr(7, GoRev)
     Call AddToAddr(8, GoLft)
     Call AddToAddr(9, GoRgt)
     Call AddToAddr(10, SN)                      'Add System number, 2 bits
     Call AddToAddr(11, L)                       'Add Lobe bit for two arrays in addressing.
   End If
'Extract 2-bit Confidence vales from Data value for this Subsystem.
     DataOut = RAM(Addr(SN))                    'Read RAM data into DataOut variable.
      FwRvCf(SN) = (DataOut And 3)              '2 bit Forward/Reverse Confidence.
      LfRtCf(SN) = (DataOut And 48) / 16        '2 bit Left/Right Confidence.
'Set Subsystem number to most Confident.
   If FwRvCf(SN) + LfRtCf(SN) >= FwRvCfIn + LfRtCfIn Then
      FwRvCfIn = FwRvCf(SN)
      LfRtCfIn = LfRtCf(SN)
      S = SN
   End If
  End If
 Next SN
'Count new memories for a total of how many were stored.
  If RAM(Addr(S)) = 0 Then StoredMemories = StoredMemories + 1
End Sub
 
Private Sub AddToAddr(SensorN As Long, SenseReading As Long)
    AllAddr(SN) = AllAddr(SN) + (SenseReading * PowerOf2(AllAddrBits))      'Multiply Value by PowerOf2 position.
    AllAddrBits = AllAddrBits + AllSensorBits(L, SN, SensorN)
 If SenseCheck(L, SN, SensorN) = 0 Then Exit Sub
    Addr(SN) = Addr(SN) + (SenseReading * PowerOf2(AddrBits))      'Multiply Value by PowerOf2 position.
    AddrBits = AddrBits + AllSensorBits(L, SN, SensorN)
    SenseRead(L, SN, SensorN) = SenseReading          'Save Numerical value sensor Reading.
End Sub

Private Sub GaugeMotorConfidence()
'_________ INCREMENT OR DECREMENT CONFIDENCE BY SETTING ADJUSTMENT TO 1 OR -1 __________
     FwRvAdjWas = FwRvAdj                   'Save what Adjustment previously Was.
     LfRtAdjWas = LfRtAdj
     FwRvAdj = -1                           'Set Fw/Rv Adjustment to by default Dec conf.
     LfRtAdj = -1                           'Set Lf/Rt Adjustment to by default Dec conf.
 If ColorSystemCheck(S) = 0 Then Exit Sub   'If Subsystem is not in circuit then Dec conf only.
'Update confidence level adjustments FwRvAdj and LfRtAdj for Navigation.
 If See(0, S) = 0 And See(1, S) = 0 Then            'If both eyes See nothing,
     If Spin = 1 Then LfRtAdj = 1
 Else                                               'Else one or both See something.
   If See(0, S) = 1 And See(1, S) = 1 Then          'If both See something,
     If Twd(0, S) = 1 And Twd(1, S) = 1 And Eye(0, S) <= InnerFacets And Eye(1, S) <= InnerFacets Then FwRvAdj = 1
   Else                                             'Else only one Sees something.
     If See(0, S) = 1 Then                          'If left eye Sees.
       If Twd(0, S) = 1 Then LfRtAdj = 1: FwRvAdj = 1
       If Spin = 1 And Eye(0, S) <= EyeWas(0, S) Then LfRtAdj = 1
     Else                                           'Else right eye Sees.
       If Twd(1, S) = 1 Then LfRtAdj = 1: FwRvAdj = 1
       If Spin = 1 And Eye(1, S) <= EyeWas(1, S) Then LfRtAdj = 1
     End If
   End If
     If Cor(S) = 1 Then LfRtAdj = 1
 End If
     If TstFd = 1 Then LfRtAdj = 1: FwRvAdj = 1
     If TstFd = 0 And TstFdWas = 1 And ThingGone(TastesWas) = False Then LfRtAdj = -1: FwRvAdj = -1
'Save in Truth Table
    TruthTable(0, See(0, S), See(1, S), Twd(0, S), Twd(1, S), Cor(S), Spin) = FwRvAdj
    TruthTable(1, See(0, S), See(1, S), Twd(0, S), Twd(1, S), Cor(S), Spin) = LfRtAdj
End Sub

'_______________________________________________________________________________________
'Algorithm is straight-through code with call to RunMotorsTimeStep to move/draw.
'The "Interval" timer sets interval at which the below subroutine is repeatedly called.
'Vision comes from Eye() that varies from 0 (sees nothing) to number of facets.
'Forms unique Address from sensory bits, used to locate a memory for each encountered.
'Color coding of wheel/wings is Red when stopped to Yellow, to Green, to Cyan, to White.
'Innermost wheel color what speed was, outer is current speed.
'Confidence is traffic light colors then white: 0=Red, 1=Yellow, 2=Green, 3=White.
'Indicator circle (behind eye) and stripe along side shows Confidence levels.
'_______________________________________________________________________________________
Private Sub IntelligenceAlgorithm()
'________ COMBINE SENSORY TO FORM UNIQUE MEMORY ADDRESS IN "Addr" VARIABLE  ________
  Call FormUniqueMemoryADDRESS                  'Combine sensor bits for new Address
     DataOut = RAM(Addr(S))                     'Read RAM data into DataOut variable.
'_________ IF CONFIDENCE=0 THEN MOTOR LATCH BITS GUESSED, ELSE FROM MEMORY _________
 If FwRvCfIn = 0 Then                       'If Forward/Reverse Conf=0 THEN Guess.
  If DataOut > 0 Or FwRvAdj = -1 Then         'If Motors OK GoodGuess = keep same.
    GoFwd = Fix(Rnd + 0.5)                      'One bit Random Guess, 0 or 1=Fwd.
    GoRev = Fix(Rnd + 0.5)                      'One bit Random Guess, 0 or 1=Rev.
  End If                                        'Since Fwd=1 or Rev=1 NonZero Data.
 Else                                       'Else load memory bits to motor latch.
    GoFwd = (DataOut And 4) / 4                 'Get Motor Forward bit from RAM.
    GoRev = (DataOut And 8) / 8                 'Get Motor Reverse bit from RAM.
 End If
 If LfRtCfIn = 0 Then                       'If Left/Right Confidence=0 THEN Guess.
  If DataOut > 0 Or LfRtAdj = -1 Then         'If Motors OK GoodGuess = keep same.
    GoLft = Fix(Rnd + 0.5)                      'One bit Random Guess, 0 or 1=Left.
    GoRgt = Fix(Rnd + 0.5)                      'One bit Random Guess, 0 or 1=Right.
  End If
 Else                                       'Else load memory bits to motor latch.
    GoLft = (DataOut And 64) / 64               'Get Motor Go Left bit from RAM.
    GoRgt = (DataOut And 128) / 128             'Get Motor Go Right bit from RAM.
 End If
'_____________ ACT ON MEMORY OR GUESSED MOTOR ACTIONS (ALWAYS INTENTIONAL) ___________
  Call RunMotorsTimeStep        'Move one (as in physics) Time Step to new Angle,X,Y
'____ DECIDE INCREMENT OR DECREMENT OF CONFIDENCE BY SETTING ADJUSTMENT 1 OR -1 ____
  Call GaugeMotorConfidence
'______________ ADJUST CONFIDENCE LEVELS AND KEEP IN RANGE OF 0 TO 3 _______________
    FwRvCfOut = FwRvCfIn + FwRvAdj
 If FwRvCfOut < 0 Then FwRvCfOut = 0            'Do not allow Conf less than 0
 If FwRvCfOut > 3 Then FwRvCfOut = 3            'Do not allow Conf greater than 3
    LfRtCfOut = LfRtCfIn + LfRtAdj
 If LfRtCfOut < 0 Then LfRtCfOut = 0            'Do not allow Conf less than 0
 If LfRtCfOut > 3 Then LfRtCfOut = 3            'Do not allow Conf greater than 3
'_______ SAVE DATA TO MEMORY LOCATION AT ADDRESS OF LAST MOTOR ACTIONS TRIED _______
 DataIn = 256 + GoRgt * 128 + GoLft * 64 + LfRtCfOut * 16 + GoRev * 8 + GoFwd * 4 + FwRvCfOut
     RAM(Addr(S)) = DataIn                         'Write new Data to RAM.
End Sub     'Will now return to "CycleTimer_Timer()" again and draw to screen there.

