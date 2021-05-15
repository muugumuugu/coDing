VERSION 5.00
Begin VB.Form Addressing 
   Caption         =   "Addressing"
   ClientHeight    =   8370
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9330
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
   ScaleHeight     =   8370
   ScaleWidth      =   9330
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame AddressingFrame 
      Caption         =   "ADDRESSING"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   915
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   9135
      Begin VB.HScrollBar FacetsScroll 
         Height          =   255
         Left            =   1860
         Max             =   31
         Min             =   1
         TabIndex        =   8
         Top             =   540
         Value           =   15
         Width           =   1395
      End
      Begin VB.CheckBox TwoLobeCheck 
         Caption         =   "Two Lobe"
         Height          =   315
         Left            =   120
         TabIndex        =   6
         Top             =   480
         Value           =   1  'Checked
         Width           =   1395
      End
      Begin VB.Label Label8 
         Caption         =   "Locations"
         Height          =   255
         Left            =   7980
         TabIndex        =   16
         Top             =   480
         Width           =   1035
      End
      Begin VB.Label Label7 
         Caption         =   "Total PC"
         Height          =   255
         Left            =   7980
         TabIndex        =   15
         ToolTipText     =   "Total number of Addressing Bits used by all color subsystems in both lobes."
         Top             =   240
         Width           =   1035
      End
      Begin VB.Label TotalLocationsLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "123,456,789"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Height          =   240
         Left            =   6720
         TabIndex        =   14
         Top             =   480
         Width           =   1215
      End
      Begin VB.Label AddrBitsPCLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "31"
         Height          =   240
         Left            =   7680
         TabIndex        =   13
         Top             =   240
         Width           =   255
      End
      Begin VB.Label FrameFacetsLabel 
         AutoSize        =   -1  'True
         Caption         =   "Facets"
         Height          =   240
         Left            =   1920
         TabIndex        =   11
         Top             =   300
         Width           =   720
      End
      Begin VB.Label FacetBitsLabel 
         AutoSize        =   -1  'True
         Caption         =   "Bits ="
         Height          =   240
         Left            =   3300
         TabIndex        =   10
         Top             =   540
         Width           =   585
      End
      Begin VB.Label FacetsLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "000"
         Height          =   240
         Left            =   2880
         TabIndex        =   9
         Top             =   300
         Width           =   375
      End
      Begin VB.Label AddressBitsLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "31"
         Height          =   240
         Left            =   5100
         TabIndex        =   4
         Top             =   240
         Width           =   255
      End
      Begin VB.Label SystemLocationsLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "123,456,789"
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "#,##0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Height          =   240
         Left            =   4140
         TabIndex        =   3
         Top             =   480
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "Bits"
         Height          =   195
         Left            =   5400
         TabIndex        =   2
         ToolTipText     =   "Number of Addressing Bits for each color subsystem, not including number of systems and lobes."
         Top             =   240
         Width           =   435
      End
      Begin VB.Label Label3 
         Caption         =   "Locations"
         Height          =   255
         Left            =   5400
         TabIndex        =   1
         Top             =   480
         Width           =   1035
      End
      Begin VB.Label Label4 
         Caption         =   " "
         Height          =   315
         Left            =   5580
         TabIndex        =   5
         Top             =   240
         Width           =   135
      End
      Begin VB.Label Label9 
         Caption         =   " "
         Height          =   315
         Left            =   5340
         TabIndex        =   17
         Top             =   180
         Width           =   135
      End
   End
   Begin VB.Frame OneLobeFrame 
      Caption         =   "One Lobe"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   120
      TabIndex        =   18
      Top             =   1740
      Width           =   6915
      Begin VB.CommandButton UnCheckAllOneLobeCommand 
         Caption         =   "UnCheck All"
         Height          =   375
         Left            =   4920
         TabIndex        =   76
         Top             =   0
         Width           =   1695
      End
      Begin VB.CommandButton CheckAllOneLobeCommand 
         Caption         =   "Check All"
         Height          =   375
         Left            =   3120
         TabIndex        =   75
         Top             =   0
         Width           =   1695
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   55
         Left            =   6960
         TabIndex        =   74
         Top             =   3840
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   54
         Left            =   6960
         TabIndex        =   73
         Top             =   3600
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   53
         Left            =   6960
         TabIndex        =   72
         Top             =   3360
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   52
         Left            =   6960
         TabIndex        =   71
         Top             =   3120
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   51
         Left            =   6960
         TabIndex        =   70
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   50
         Left            =   6960
         TabIndex        =   69
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   49
         Left            =   6960
         TabIndex        =   68
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   48
         Left            =   6960
         TabIndex        =   67
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   47
         Left            =   6960
         TabIndex        =   66
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   46
         Left            =   6960
         TabIndex        =   65
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   45
         Left            =   6960
         TabIndex        =   64
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   44
         Left            =   6960
         TabIndex        =   63
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   43
         Left            =   6960
         TabIndex        =   62
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   42
         Left            =   6960
         TabIndex        =   61
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   41
         Left            =   4680
         TabIndex        =   60
         Top             =   3840
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   40
         Left            =   4680
         TabIndex        =   59
         Top             =   3600
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   39
         Left            =   4680
         TabIndex        =   58
         Top             =   3360
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   38
         Left            =   4680
         TabIndex        =   57
         Top             =   3120
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   37
         Left            =   4680
         TabIndex        =   56
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   36
         Left            =   4680
         TabIndex        =   55
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   35
         Left            =   4680
         TabIndex        =   54
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   34
         Left            =   4680
         TabIndex        =   53
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   33
         Left            =   4680
         TabIndex        =   52
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   32
         Left            =   4680
         TabIndex        =   51
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   31
         Left            =   4680
         TabIndex        =   50
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   30
         Left            =   4680
         TabIndex        =   49
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   29
         Left            =   4680
         TabIndex        =   48
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   28
         Left            =   4680
         TabIndex        =   47
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   27
         Left            =   2400
         TabIndex        =   46
         Top             =   3840
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   26
         Left            =   2400
         TabIndex        =   45
         Top             =   3600
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   25
         Left            =   2400
         TabIndex        =   44
         Top             =   3360
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   24
         Left            =   2400
         TabIndex        =   43
         Top             =   3120
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   23
         Left            =   2400
         TabIndex        =   42
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   22
         Left            =   2400
         TabIndex        =   41
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   21
         Left            =   2400
         TabIndex        =   40
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   20
         Left            =   2400
         TabIndex        =   39
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   19
         Left            =   2400
         TabIndex        =   38
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   18
         Left            =   2400
         TabIndex        =   37
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   17
         Left            =   2400
         TabIndex        =   36
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   16
         Left            =   2400
         TabIndex        =   35
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   15
         Left            =   2400
         TabIndex        =   34
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   14
         Left            =   2400
         TabIndex        =   33
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   13
         Left            =   120
         TabIndex        =   32
         Top             =   3840
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   12
         Left            =   120
         TabIndex        =   31
         Top             =   3600
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   11
         Left            =   120
         TabIndex        =   30
         Top             =   3360
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   10
         Left            =   120
         TabIndex        =   29
         Top             =   3120
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   28
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   27
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   26
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   25
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   24
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   23
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   22
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   21
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   20
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox OneLobeCheck 
         Caption         =   "OneLobeCheck"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   19
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         Caption         =   "Taste SubSystem"
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
         Left            =   6960
         TabIndex        =   80
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         Caption         =   "Blue SubSystem"
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
         Left            =   4680
         TabIndex        =   79
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         Caption         =   "Green SubSystem"
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
         Left            =   2400
         TabIndex        =   78
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         Caption         =   "Red SubSystem"
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
         Left            =   120
         TabIndex        =   77
         Top             =   420
         Width           =   1995
      End
   End
   Begin VB.Frame RightLobeFrame 
      Caption         =   "Right Lobe"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   120
      TabIndex        =   128
      Top             =   5040
      Width           =   6915
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   39
         Left            =   6960
         TabIndex        =   174
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   38
         Left            =   6960
         TabIndex        =   173
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   37
         Left            =   6960
         TabIndex        =   172
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   36
         Left            =   6960
         TabIndex        =   171
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   35
         Left            =   6960
         TabIndex        =   170
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   34
         Left            =   6960
         TabIndex        =   169
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   33
         Left            =   6960
         TabIndex        =   168
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   32
         Left            =   6960
         TabIndex        =   167
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   31
         Left            =   6960
         TabIndex        =   166
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   30
         Left            =   6960
         TabIndex        =   165
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   29
         Left            =   4680
         TabIndex        =   164
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   28
         Left            =   4680
         TabIndex        =   163
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   27
         Left            =   4680
         TabIndex        =   162
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   26
         Left            =   4680
         TabIndex        =   161
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   25
         Left            =   4680
         TabIndex        =   160
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   24
         Left            =   4680
         TabIndex        =   159
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   23
         Left            =   4680
         TabIndex        =   158
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   22
         Left            =   4680
         TabIndex        =   157
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   21
         Left            =   4680
         TabIndex        =   156
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   20
         Left            =   4680
         TabIndex        =   155
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   19
         Left            =   2400
         TabIndex        =   154
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   18
         Left            =   2400
         TabIndex        =   153
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   17
         Left            =   2400
         TabIndex        =   152
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   16
         Left            =   2400
         TabIndex        =   151
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   15
         Left            =   2400
         TabIndex        =   150
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   14
         Left            =   2400
         TabIndex        =   149
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   13
         Left            =   2400
         TabIndex        =   148
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   12
         Left            =   2400
         TabIndex        =   147
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   11
         Left            =   2400
         TabIndex        =   146
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   10
         Left            =   2400
         TabIndex        =   145
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   144
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   143
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   142
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   141
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   140
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   139
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   138
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   137
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   136
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox RightLobeCheck 
         Caption         =   "RightLobeChck"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   135
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CommandButton UnCheckAllRightLobeCommand 
         Caption         =   "UnCheck All"
         Height          =   375
         Left            =   4920
         TabIndex        =   130
         Top             =   0
         Width           =   1695
      End
      Begin VB.CommandButton CheckAllRightLobeCommand 
         Caption         =   "Check All"
         Height          =   375
         Left            =   3120
         TabIndex        =   129
         Top             =   0
         Width           =   1695
      End
      Begin VB.Label Label19 
         Alignment       =   2  'Center
         Caption         =   "Taste SubSystem"
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
         Left            =   6960
         TabIndex        =   134
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label18 
         Alignment       =   2  'Center
         Caption         =   "Blue SubSystem"
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
         Left            =   4680
         TabIndex        =   133
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label17 
         Alignment       =   2  'Center
         Caption         =   "Green SubSystem"
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
         Left            =   2400
         TabIndex        =   132
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         Caption         =   "Red SubSystem"
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
         Left            =   120
         TabIndex        =   131
         Top             =   420
         Width           =   1995
      End
   End
   Begin VB.Frame LeftLobeFrame 
      Caption         =   "Left Lobe"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   120
      TabIndex        =   81
      Top             =   1740
      Width           =   6915
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   39
         Left            =   6960
         TabIndex        =   127
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   38
         Left            =   6960
         TabIndex        =   126
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   37
         Left            =   6960
         TabIndex        =   125
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   36
         Left            =   6960
         TabIndex        =   124
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   35
         Left            =   6960
         TabIndex        =   123
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   34
         Left            =   6960
         TabIndex        =   122
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   33
         Left            =   6960
         TabIndex        =   121
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   32
         Left            =   6960
         TabIndex        =   120
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   31
         Left            =   6960
         TabIndex        =   119
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   30
         Left            =   6960
         TabIndex        =   118
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   29
         Left            =   4680
         TabIndex        =   117
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   28
         Left            =   4680
         TabIndex        =   116
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   27
         Left            =   4680
         TabIndex        =   115
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   26
         Left            =   4680
         TabIndex        =   114
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   25
         Left            =   4680
         TabIndex        =   113
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   24
         Left            =   4680
         TabIndex        =   112
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   23
         Left            =   4680
         TabIndex        =   111
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   22
         Left            =   4680
         TabIndex        =   110
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   21
         Left            =   4680
         TabIndex        =   109
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   20
         Left            =   4680
         TabIndex        =   108
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   19
         Left            =   2400
         TabIndex        =   107
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   18
         Left            =   2400
         TabIndex        =   106
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   17
         Left            =   2400
         TabIndex        =   105
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   16
         Left            =   2400
         TabIndex        =   104
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   15
         Left            =   2400
         TabIndex        =   103
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   14
         Left            =   2400
         TabIndex        =   102
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   13
         Left            =   2400
         TabIndex        =   101
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   12
         Left            =   2400
         TabIndex        =   100
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   11
         Left            =   2400
         TabIndex        =   99
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   10
         Left            =   2400
         TabIndex        =   98
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   97
         Top             =   2880
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   96
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   95
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   94
         Top             =   2160
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   93
         Top             =   1920
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   92
         Top             =   1680
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   91
         Top             =   1440
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   90
         Top             =   1200
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   89
         Top             =   960
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CheckBox LeftLobeCheck 
         Caption         =   "LeftLobeCheck"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   88
         Top             =   720
         Value           =   1  'Checked
         Width           =   1935
      End
      Begin VB.CommandButton CheckAllLeftLobeCommand 
         Caption         =   "Check All"
         Height          =   375
         Left            =   3120
         TabIndex        =   83
         Top             =   0
         Width           =   1695
      End
      Begin VB.CommandButton UnCheckAllLeftLobeCommand 
         Caption         =   "UnCheck All"
         Height          =   375
         Left            =   4920
         TabIndex        =   82
         Top             =   0
         Width           =   1695
      End
      Begin VB.Label Label15 
         Alignment       =   2  'Center
         Caption         =   "Red SubSystem"
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
         Left            =   120
         TabIndex        =   87
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         Caption         =   "Green SubSystem"
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
         Left            =   2400
         TabIndex        =   86
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label13 
         Alignment       =   2  'Center
         Caption         =   "Blue SubSystem"
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
         Left            =   4680
         TabIndex        =   85
         Top             =   420
         Width           =   1995
      End
      Begin VB.Label Label12 
         Alignment       =   2  'Center
         Caption         =   "Taste SubSystem"
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
         Left            =   6960
         TabIndex        =   84
         Top             =   420
         Width           =   1995
      End
   End
   Begin VB.CommandButton SaveSettingsCommand 
      Caption         =   "Save Settings"
      Height          =   375
      Left            =   7440
      TabIndex        =   12
      ToolTipText     =   "Saves the number of Lobes and Facets to ""IntelligenceForm.txt"" file, to use when program is restarted.  "
      Top             =   60
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Chaging the following will start new lifetime, restarts at Cycle 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   120
      TabIndex        =   7
      Top             =   60
      Width           =   5475
   End
End
Attribute VB_Name = "Addressing"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim LoadOnly As Boolean
Dim FolderPath As String
Dim FSO
Dim FullFilePath As String
Dim N As Long
Dim Ch As Long

Private Sub Form_Load()
       Set FSO = CreateObject("Scripting.FileSystemObject")
  Call TwoLobeCheck_Click
  Call LoadAddressingFile
End Sub

Private Sub CheckAllLeftLobeCommand_Click()
 LoadOnly = True
   For Ch = 0 To 39
     LeftLobeCheck(Ch) = 1
   Next Ch
 LoadOnly = False
  Call Intelligence.AddressingChange
End Sub

Private Sub CheckAllRightLobeCommand_Click()
 LoadOnly = True
   For Ch = 0 To 39
     RightLobeCheck(Ch) = 1
   Next Ch
 LoadOnly = False
  Call Intelligence.AddressingChange
End Sub

Private Sub CheckAllOneLobeCommand_Click()
 LoadOnly = True
   For Ch = 0 To 55
     OneLobeCheck(Ch) = 1
   Next Ch
 LoadOnly = False
  Call Intelligence.AddressingChange
End Sub

Private Sub UnCheckAllLeftLobeCommand_Click()
 LoadOnly = True
   For Ch = 0 To 39
     LeftLobeCheck(Ch) = 0
   Next Ch
 LoadOnly = False
  Call Intelligence.AddressingChange
End Sub

Private Sub UnCheckAllRightLobeCommand_Click()
 LoadOnly = True
   For Ch = 0 To 39
     RightLobeCheck(Ch) = 0
   Next Ch
 LoadOnly = False
  Call Intelligence.AddressingChange
End Sub

Private Sub UnCheckAllOneLobeCommand_Click()
 LoadOnly = True
   For Ch = 0 To 55
     OneLobeCheck(Ch) = 0
   Next Ch
 LoadOnly = False
  Call Intelligence.AddressingChange
End Sub

Private Sub LeftLobeCheck_Click(Index As Integer)
 If LoadOnly = True Then Exit Sub
  Call Intelligence.AddressingChange
End Sub

Private Sub RightLobeCheck_Click(Index As Integer)
 If LoadOnly = True Then Exit Sub
  Call Intelligence.AddressingChange
End Sub

Private Sub OneLobeCheck_Click(Index As Integer)
 If LoadOnly = True Then Exit Sub
  Call Intelligence.AddressingChange
End Sub

Private Sub Form_Unload(Cancel As Integer)
'Turn off checkbox on Intelligence form that was used to put this form on screen.
   Intelligence.AddressingCheck = 0
End Sub

Private Sub SaveSettingsCommand_Click()
   Call SaveAddressingFile
   SaveSettingsCommand.Caption = "Settings Saved"
End Sub

Private Sub SaveAddressingFile()
 If LoadOnly = True Then Exit Sub
    LoadOnly = True
                      FolderPath = App.Path & "\Settings"
  If FSO.FolderExists(FolderPath) = False Then MkDir FolderPath
   Open FolderPath & "\AddressingForm.txt" For Output As #1
      Print #1, TwoLobeCheck
      Print #1, FacetsScroll
    For Ch = 0 To 39
      Print #1, LeftLobeCheck(Ch)
    Next Ch
    For Ch = 0 To 39
      Print #1, RightLobeCheck(Ch)
    Next Ch
    For Ch = 0 To 55
      Print #1, OneLobeCheck(Ch)
    Next Ch
   Close #1
    LoadOnly = False
End Sub

Private Sub LoadAddressingFile()
Dim D As Double
 On Error GoTo LoadErrorExit
                   FullFilePath = App.Path & "\Settings\AddressingForm.txt"
 If FSO.FileExists(FullFilePath) = False Then Exit Sub
 LoadOnly = True
   Open FullFilePath For Input As #1
      Input #1, N: TwoLobeCheck = N
      Input #1, N: FacetsScroll = N
    For Ch = 0 To 39
      Input #1, N: LeftLobeCheck(Ch) = N
    Next Ch
    For Ch = 0 To 39
      Input #1, N: RightLobeCheck(Ch) = N
    Next Ch
    For Ch = 0 To 55
      Input #1, N: OneLobeCheck(Ch) = N
    Next Ch
LoadErrorExit:
   Close #1
 LoadOnly = False
End Sub

Private Sub TwoLobeCheck_Click()
 If TwoLobeCheck = 0 Then
   OneLobeFrame.Visible = True
   LeftLobeFrame.Visible = False
   RightLobeFrame.Visible = False
 Else
   OneLobeFrame.Visible = False
   LeftLobeFrame.Visible = True
   RightLobeFrame.Visible = True
 End If
  If LoadOnly = True Then Exit Sub
  Call Design.CalcDesign
  Call Intelligence.AddressingChange
End Sub

Private Sub FacetsScroll_Scroll()
  Call FacetsScroll_Change
End Sub
Private Sub FacetsScroll_Change()
 If LoadOnly = True Then Exit Sub
  Call Design.CalcDesign
  Call Intelligence.AddressingChange
End Sub


