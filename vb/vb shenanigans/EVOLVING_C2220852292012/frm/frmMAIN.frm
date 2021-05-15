VERSION 5.00
Begin VB.Form frmMAIN 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "EVOLVING Creatures"
   ClientHeight    =   8100
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   15270
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   540
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1018
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chSLOW 
      Caption         =   "SLOW"
      Height          =   375
      Left            =   10560
      TabIndex        =   34
      ToolTipText     =   "Slow Down Visualization"
      Top             =   4800
      Width           =   1335
   End
   Begin VB.CheckBox chDisplayInputs 
      Caption         =   "Display Input/Output"
      Height          =   495
      Left            =   10560
      TabIndex        =   33
      ToolTipText     =   "Visualize Creature Inputs and Outputs (Vertical Lines at Right)"
      Top             =   4320
      Width           =   1335
   End
   Begin VB.PictureBox PicFrame 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   5400
      Left            =   120
      ScaleHeight     =   360
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   640
      TabIndex        =   28
      Top             =   6960
      Visible         =   0   'False
      Width           =   9600
   End
   Begin VB.PictureBox picBG 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   5400
      Left            =   960
      Picture         =   "frmMAIN.frx":0000
      ScaleHeight     =   360
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   1280
      TabIndex        =   32
      Top             =   6360
      Visible         =   0   'False
      Width           =   19200
   End
   Begin VB.CheckBox chZERO 
      Caption         =   "Start from ZERO"
      Height          =   375
      Left            =   10560
      TabIndex        =   31
      ToolTipText     =   "Start Training Cretures Popultaion from ZERO [New Random Population]"
      Top             =   2040
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CheckBox chMakeVFrames 
      Caption         =   "Make Video Frames"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   10560
      TabIndex        =   27
      ToolTipText     =   "If there's a new Best Creature at every 50 Generation, draw frames (good at 25fps)"
      Top             =   5160
      Width           =   1335
   End
   Begin VB.CheckBox chDrawNN 
      Caption         =   "Draw Neural Network"
      Height          =   495
      Left            =   10560
      TabIndex        =   26
      ToolTipText     =   "Display NN activity of Current Best Creature"
      Top             =   3840
      Width           =   1335
   End
   Begin VB.CheckBox chDrawPts 
      Caption         =   "Draw Pts"
      Height          =   495
      Left            =   10560
      TabIndex        =   24
      Top             =   3360
      Width           =   1335
   End
   Begin VB.CommandButton cmdEditor 
      Caption         =   "Load / Edit Creature"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   10560
      TabIndex        =   22
      Top             =   2520
      Width           =   1335
   End
   Begin VB.CommandButton setGraphXRange 
      Caption         =   "ALL"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   1800
      TabIndex        =   19
      Top             =   4080
      Width           =   735
   End
   Begin VB.CommandButton setGraphXRange 
      Caption         =   "250"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   2760
      TabIndex        =   18
      Top             =   4080
      Width           =   735
   End
   Begin VB.CommandButton setGraphXRange 
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   3720
      TabIndex        =   17
      Top             =   4080
      Width           =   735
   End
   Begin VB.CommandButton setGraphXRange 
      Caption         =   "50"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   4680
      TabIndex        =   16
      Top             =   4080
      Width           =   735
   End
   Begin VB.HScrollBar sRANGE 
      Height          =   375
      Left            =   5640
      Max             =   2000
      Min             =   10
      TabIndex        =   15
      Top             =   4080
      Value           =   1000
      Width           =   2895
   End
   Begin VB.PictureBox PicGR 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2580
      Left            =   120
      ScaleHeight     =   172
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   561
      TabIndex        =   14
      ToolTipText     =   "Green=Best Creature   Blue=AVG Fitness   Cyan=Population Diversity   Red=Mutation Prob."
      Top             =   1440
      Width           =   8415
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      Text            =   "frmMAIN.frx":151842
      Top             =   120
      Width           =   8415
   End
   Begin VB.PictureBox PICh 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   3975
      Left            =   8640
      ScaleHeight     =   3945
      ScaleWidth      =   1785
      TabIndex        =   3
      Top             =   1320
      Width           =   1815
      Begin VB.HScrollBar sShape 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   35
         Top             =   3600
         Width           =   1455
      End
      Begin VB.HScrollBar sHorizontal 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   29
         Top             =   3120
         Width           =   1455
      End
      Begin VB.HScrollBar sVertical 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   20
         Top             =   2640
         Width           =   1455
      End
      Begin VB.HScrollBar sWALK 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   11
         Top             =   720
         Value           =   100
         Width           =   1455
      End
      Begin VB.HScrollBar sDontJump 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   9
         Top             =   1200
         Width           =   1455
      End
      Begin VB.HScrollBar sAVGH 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   5
         Top             =   1680
         Width           =   1455
      End
      Begin VB.HScrollBar sMaxH 
         Height          =   255
         Left            =   120
         Max             =   100
         TabIndex        =   4
         Top             =   2160
         Width           =   1455
      End
      Begin VB.Label Label8 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Shape"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   36
         ToolTipText     =   "Keep Inital Shape (Too Hi value can make Creature stand Still)"
         Top             =   3360
         Width           =   1575
      End
      Begin VB.Label Label3 
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "WALK"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   480
         Width           =   1575
      End
      Begin VB.Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Stay Horizontal"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   30
         ToolTipText     =   "Keep Normal Orientation"
         Top             =   2880
         Width           =   1575
      End
      Begin VB.Label Label6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Dont change during Training!"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   23
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label Label5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Stay Vertical"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   21
         ToolTipText     =   "Saty at +/- 90°  from Normal Orientation"
         Top             =   2400
         Width           =   1575
      End
      Begin VB.Label Label4 
         BackColor       =   &H00C0C0C0&
         Caption         =   "LEARN TO"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   0
         Width           =   1575
      End
      Begin VB.Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Dont Jump"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   10
         ToolTipText     =   "(Don't Jump)"
         Top             =   960
         Width           =   1575
      End
      Begin VB.Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "MAX Height"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   7
         ToolTipText     =   "Max Height Reached"
         Top             =   1920
         Width           =   1575
      End
      Begin VB.Label Label 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Avg Height"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   6
         ToolTipText     =   "Average Height during train time."
         Top             =   1440
         Width           =   1575
      End
   End
   Begin VB.TextBox TXT 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   8640
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "frmMAIN.frx":151B3F
      Top             =   120
      Width           =   3255
   End
   Begin VB.PictureBox PIC 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5535
      Left            =   12000
      ScaleHeight     =   369
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   209
      TabIndex        =   1
      Top             =   120
      Width           =   3135
   End
   Begin VB.CommandButton cmdTRAIN 
      Caption         =   "Start TRAIN"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   10560
      TabIndex        =   0
      Top             =   1320
      Width           =   1335
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   25
      Text            =   "frmMAIN.frx":151B44
      Top             =   4080
      Width           =   1455
   End
End
Attribute VB_Name = "frmMAIN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'
'***********************************************************************
'***********************************************************************
'***                                                                 ***
'***   Author: Roberto Mior (reexre@gmail.com)                       ***
'***                                                                 ***
'***                                                                 ***
'***   CopyRights:                                                   ***
'***   You can use this code as you want only if you cite the        ***
'***   author in your code/application                               ***
'***                                                                 ***
'***********************************************************************
'***********************************************************************
'

Option Base 1
Option Explicit




Private Graph      As New clsGraph


Private NC         As Long
Private Ninp       As Long
Private Nout       As Long
Private NoutLink       As Long

Private Inp()      As Double
Private Out()      As Double
Private OutLink()  As Long
Private InLink()   As Long
Public NumberOfInputLinks As Long




Private tmpDrawPTS As Integer

Private DrawInputsX As Long
Private DrawInputsY As Long




Private Sub cmdEditor_Click()
    Load frmEDITOR
    frmEDITOR.Show

End Sub

Private Sub cmdTRAIN_Click()
    Dim I          As Long


    Dim Kdg        As Single
    Dim C          As Long
    Dim G          As Long
    Dim X          As Long
    Dim Y          As Long


    Dim CurBESTV   As Single
    Dim BestCRE    As Long

    Dim FFF        As Single
    Dim PanX       As Long
    Dim CamX       As Single
    Dim col        As Long
    Dim col2       As Long

    Dim YYY2       As Long
    Dim XmCAMX     As Long
    Dim DoFrames   As Boolean
    Dim AA         As Single

    Dim XX1        As Long
    Dim XX2        As Long
    Dim YY1        As Long

    Dim X3         As Long

    Dim WW1        As Long
    Dim WW2        As Long

    Dim CX         As Long
    Dim CY         As Long

    Dim PTSidx     As Long
    Dim RotIdx     As Long
    Dim GRDIdx     As Long
    Dim VELIdx     As Long
    Dim RotVELidx  As Long

    Dim II         As Long


    cmdEditor.Enabled = False
    cmdTRAIN.Enabled = False
    PICh.Enabled = False



    INITIALIZENN

    'PTSidx = NumberOfInputLinks * 2 + 1
    'RotIdx = NumberOfInputLinks * 2 + CRE(1).NP + 1
    PTSidx = CRE(1).NP + CRE(1).NP * 2 + 1
    RotIdx = CRE(1).NP * 2 + CRE(1).NP * 2 + 1
    
    
    GRDIdx = RotIdx + 4
    VELIdx = GRDIdx + 1
    RotVELidx = VELIdx + 4


    'PTSidx = Nout * 2 + 1
    'RotIdx = Nout * 2 + CRE(1).NP + 1
    'GRDIdx = RotIdx + 4
    'VELIdx = GRDIdx + 1



    col = RGB(120, 160, 120)
    col2 = RGB(200, 255, 200)

    YYY2 = MaxY - 200

    TrainTime = 15000 '12000             '10000 '8000              '6000              '5000
    TrainTime = (TrainTime \ 500) * 500
INVTrainTime = 1 / TrainTime

    DrawInputsX = 200
    DrawInputsY = MaxY - 150


'MakeINTROFrames


    For GEN = 1 To 99999999
        NPA = 0

        sRANGE.Max = GEN

        CNT = 1
        CurBEST = 1
        
        If DoFrames Then CurBEST = GA.STAT_GenerBestFitINDX
        
        CurBESTV = 9999999999999#
        PanX = -Me.ScaleWidth * 0.5
        TXT = "Best:" & GA.STAT_GenerBestFitINDX & "   (Fitness: " & Int(GA.STAT_GenerBestFit * 100) / 100 & ")" & vbCrLf & "Evaluating:" & vbCrLf
        
        For I = 1 To NC
            If GA.IsIndiChanged(I) Then
                TXT = TXT & " " & I & "[" & GA.IndiParent1(I) & "." & GA.IndiParent2(I) & "]"
                If GA.IsIndiMutated(I) Then TXT = TXT & "(M)"
            End If
        Next

        XX1 = 0
        For I = 1 To NC
            BR.TransferGAGenesToBrain GA, I
            CRE(I).LoadMe "Creatures\" & CreFN, 10 + XX1, MaxY - 1
            CRE(I).DrawOffset = XX1
            'MY MISTERY
            'If sWALK = 0 Then If GA.IsIndiChanged(I) Then XX1 = XX1 + 0.5 / CRE(I).InvSIZE + 2
        Next

        Do


            If DoFrames Then
                If TextFramesDone Then
                    SaveFrame
                Else
                    If Not (INTROframesDone) Then MakeINTROFrames: INTROframesDone = True
                    MakeTextFrames CStr(TXT)

                End If
            End If

            If CNT Mod CyclesForScreenFrame = 0 Then
                If DoFrames Then
                   
                    
                    XX1 = (-CamX - 320) Mod 1280
                    WW1 = Me.ScaleWidth \ 2 + 640 - (Me.ScaleWidth \ 2 - 320 + XX1)
                    WW1 = 1280 - XX1
                    If XX1 > 0 Then
                        XX2 = 0
                        WW2 = XX1
                        X3 = 1280 - WW2
                    End If

                    If WW1 > 1280 Then

                        XX2 = XX1 + 1280
                        WW2 = WW1 - 1280
                        X3 = 0
                    End If

                    BitBlt Me.hdc, Me.ScaleWidth \ 2 - 320 + XX1, Me.ScaleHeight - 360, WW1, 360, _
                           picBG.hdc, 0, 0, vbSrcCopy
                    BitBlt Me.hdc, Me.ScaleWidth \ 2 - 320 + XX2, Me.ScaleHeight - 360, WW2, 360, _
                           picBG.hdc, X3, 0, vbSrcCopy


                    '  BitBlt Me.hdc, 0, 0, Me.ScaleWidth, Me.ScaleHeight, Me.hdc, 0, 0, vbWhite
                    AAA.DIB Me.hdc, Me.Image.Handle, Me.ScaleWidth, Me.ScaleHeight
'floor
                    AAA.LineDIB 0, MaxY \ 1 + 1, Me.ScaleWidth, MaxY \ 1 + 1, vbBlack, 255
                    'For X = 0 To Me.ScaleWidth * 3 Step 100
                    '    XmCAMX = X - CamX
                    '    AAA.LineDIB XmCAMX, MaxY \ 1, XmCAMX - 30, MaxY \ 1 + 30, vbBlack
                    '    AAA.LineDIB XmCAMX, MaxY \ 1, XmCAMX, YYY2, col2
                    'Next
                    'For X = -100 To -Me.ScaleWidth Step -100
                    '    XmCAMX = X - CamX
                    '    AAA.LineDIB XmCAMX, MaxY \ 1, XmCAMX - 30, MaxY \ 1 + 30, col2
                    'Next

                    DrawParticles frmMAIN.hdc, CamX \ 1, True
                    For I = 1 To NC
                        If GA.IsIndiChanged(I) Then
                            If I <> GA.STAT_GenerBestFitINDX Then CRE(I).DRAW frmMAIN.hdc, CamX \ 1, chDrawPts, True
                        End If
                    Next
                    'Draw curr Best foreground
                    CRE(GA.STAT_GenerBestFitINDX).DRAW frmMAIN.hdc, CamX \ 1, chDrawPts, True



                    AAA.Array2Pic

                Else
                    BitBlt Me.hdc, 0, 0, Me.ScaleWidth, Me.ScaleHeight, Me.hdc, 0, 0, vbBlack    'ness
'Floor
                    FastLine Me.hdc, 0, MaxY \ 1 + 1, Me.ScaleWidth, MaxY \ 1 + 1, 1, vbWhite
                    For X = 0 To Me.ScaleWidth * 3 Step 100
                        XmCAMX = X - CamX
                        FastLine Me.hdc, XmCAMX, MaxY \ 1, XmCAMX - 30, MaxY \ 1 + 30, 1, vbWhite
                        FastLine Me.hdc, XmCAMX, MaxY \ 1, XmCAMX, YYY2, 1, col
                    Next
                    For X = -100 To -Me.ScaleWidth Step -100
                        XmCAMX = X - CamX
                        FastLine Me.hdc, XmCAMX, MaxY \ 1, XmCAMX - 30, MaxY \ 1 + 30, 1, col
                    Next

                    DrawParticles frmMAIN.hdc, CamX \ 1, False
                    For I = 1 To NC
                        If GA.IsIndiChanged(I) Then
                            CRE(I).DRAW frmMAIN.hdc, CamX \ 1, chDrawPts
                        End If
                    Next

                End If
                '------------------------------------------------------------------------------------------------------
                '------------------------------------------------------------------------------------------------------
                '------------------------------------------------------------------------------------------------------

                If chDisplayInputs Then




                    'Draw Orientation
                    XX1 = 40 * (InputValues(CurBEST, RotIdx) - InputValues(CurBEST, RotIdx + 1))
                    YY1 = 40 * (InputValues(CurBEST, RotIdx + 2) - InputValues(CurBEST, RotIdx + 3))
                    CX = DrawInputsX
                    CY = DrawInputsY
                    FastLine Me.hdc, CX, CY, CX + XX1, CY + YY1, 2, vbRed
                    FastLine Me.hdc, CX, CY, CX + XX1, CY, 2, vbMagenta
                    FastLine Me.hdc, CX, CY, CX, CY + YY1, 2, vbMagenta
                    MyCircle Me.hdc, CX, CY, 42, 1, vbGreen
                    'Draw Height From Ground
                    XX1 = 80 * InputValues(CurBEST, GRDIdx)
                    CX = DrawInputsX + 50
                    CY = DrawInputsY + 40
                    FastLine Me.hdc, CX, CY, CX + 20, CY, 2, vbRed
                    FastLine Me.hdc, CX, CY - 80, CX + 20, CY - 80, 2, vbRed
                    FastLine Me.hdc, CX, CY - XX1 - 1, CX + 20, CY - XX1 - 1, 2, vbMagenta


                    'DRAW Velocities
                    YY1 = 40 * (InputValues(CurBEST, VELIdx) - InputValues(CurBEST, VELIdx + 1))
                    XX1 = 40 * (InputValues(CurBEST, VELIdx + 2) - InputValues(CurBEST, VELIdx + 3))
                    CX = DrawInputsX + 125
                    CY = DrawInputsY
                    FastLine Me.hdc, CX, CY, CX + XX1, CY + YY1, 2, vbRed
                    FastLine Me.hdc, CX, CY, CX + XX1, CY, 2, vbMagenta
                    FastLine Me.hdc, CX, CY, CX, CY + YY1, 2, vbMagenta
                    MyCircle Me.hdc, CX, CY, 42, 1, vbGreen


                    'Draw RotVel
                    XX1 = -40 * (InputValues(CurBEST, RotVELidx) - InputValues(CurBEST, RotVELidx + 1))
                    CY = DrawInputsY
                    CX = DrawInputsX + 185
                    FastLine Me.hdc, CX, CY, CX + 20, CY, 2, vbRed
                    FastLine Me.hdc, CX, CY - 40, CX + 20, CY - 40, 2, vbRed
                    FastLine Me.hdc, CX, CY + 40, CX + 20, CY + 40, 2, vbRed
                    FastLine Me.hdc, CX, CY + XX1, CX + 20, CY + XX1, 2, vbMagenta
                    '                    Stop

                   
                    
                    'DRAW Touch Points
                    CY = DrawInputsY + 40
                    CX = DrawInputsX - 180
                    FastLine Me.hdc, CX, CY, CX + (RotIdx - PTSidx) * 5, CY, 1, vbRed
                    For I = PTSidx To RotIdx - 1
                        XX1 = CX + 5 * (I - PTSidx)
                           YY1 = -InputValues(CurBEST, I) * 30
                        FastLine Me.hdc, XX1, CY, XX1, CY + YY1, 1, vbMagenta
                    Next
                                        
                                        'DRAW touch speed
                    CY = DrawInputsY - 20
                    CX = DrawInputsX - 180
                    'FastLine Me.hdc, CX, CY, CX + CRE(1).NP * 4, CY, 1, vbRed
                    For I = 1 To CRE(1).NP
                        XX1 = CX + 5 * (I - 1)
                        XX2 = XX1 - 5 * InputValues(CurBEST, I + CRE(1).NP) + 5 * InputValues(CurBEST, I + 2 * CRE(1).NP)
                        YY1 = InputValues(CurBEST, I) * 30
                        FastLine Me.hdc, XX1, CY, XX2, CY + YY1, 1, vbMagenta
                    Next
                    
                    
                    
                    
                    ''DRAW Links Stress
                    'CY = DrawInputsY - 20
                    'CX = DrawInputsX - 180
                    'FastLine Me.hdc, CX, CY, CX + PTSidx * 3, CY, 1, vbRed
                    'For I = 1 To PTSidx - 1
                    '    XX1 = CX + 6 * ((I + 1) \ 2)
                    '    YY1 = InputValues(CurBEST, I) * 30 * IIf(I Mod 2 = 0, 1, -1)
                    '    FastLine Me.hdc, XX1, CY, XX1, CY + YY1, 1, vbMagenta
                    'Next
                    
                    
                    
                    
                    'DRAW OUTPUTS
                    CY = DrawInputsY
                    CX = DrawInputsX + 225
                    FastLine Me.hdc, CX, CY, CX + 100, CY, 1, vbRed
                    FastLine Me.hdc, CX, CY - 20, CX + 100, CY - 20, 1, vbGreen
                    FastLine Me.hdc, CX, CY + 20, CX + 100, CY + 20, 1, vbGreen
                    For I = 1 To NoutLink
                        CX = (DrawInputsX + 225) + (I - 1) * 100 / (Nout)
                        YY1 = 40 * OutputValues(CurBEST, I)
                        FastLine Me.hdc, CX, CY - YY1, CX, CY + YY1, 2, vbCyan
                        YY1 = 20 + 70 * ((0.8 * CRE(CurBEST).GetCurrAddedBrainLen(OutLink(I)) / CRE(CurBEST).GetLinkMainL(OutLink(I))))
                          
                        CX = CX + 2
                        FastLine Me.hdc, CX, CY - YY1, CX, CY + YY1, 1, vbMagenta
                    Next
                    For I = NoutLink + 1 To Nout
                        CX = (DrawInputsX + 225) + (I - 1) * 100 / (Nout)
                        YY1 = 40 * OutputValues(CurBEST, I)
                        FastLine Me.hdc, CX, CY - YY1, CX, CY + YY1, 2, vbCyan
                        YY1 = 40 * (0.5 + CRE(CurBEST).GetCurrAddedBrainANG(I - NoutLink) / PIh)
                        CX = CX + 2
                        FastLine Me.hdc, CX, CY - YY1, CX, CY + YY1, 1, vbMagenta
                    Next
                    'If CNT Mod BrainClock = 0 Then
                    '    For I = 1 To 10
                    '        FastLine Me.hdc, 550 + I, MaxY - 140, 550 + I, MaxY - 130, 1, vbRed
                    '    Next
                    'End If

                End If

                '------------------------------------------------------------------------------------------------------
                '------------------------------------------------------------------------------------------------------
                '------------------------------------------------------------------------------------------------------

                If Not (DoFrames) Then MyCircle Me.hdc, CRE(CurBEST).CurrCenX - CamX + CRE(CurBEST).DrawOffset, CRE(CurBEST).CurrCenY, 2, 3, vbRed

                'CamX = CamX * 0.975 + PanX * 0.025
                CamX = CamX * 0.973 + PanX * 0.027

                Me.Refresh
                DoEvents

                If chDrawNN Then BR.DRAW CurBEST, 1: PIC.Refresh
            End If



            If CNT > 700 Then     'Don't Move first N cicles (500,200)
                DoPhysicParticles (CNT Mod CyclesForScreenFrame = 0)
                For I = 1 To NC
                    If GA.IsIndiChanged(I) Then
                        'CRE(I).DRAW frmMAIN.HDC, CamX \ 1, chDrawPts
                        'CRE(I).DoPhysicsV4 I    '*********
                        'CRE(I).DoPhysicsV5 I    '*********
                        CRE(I).DoPhysicsV6 I    '*********
                        
                        'DoAI (I)
                        If CNT Mod BrainClock = 0 Then DoAI (I)
                    End If
                Next

                If CNT Mod CyclesForScreenFrame = 0 Then
                    CurBESTV = 999999999999999#
                    For I = 1 To NC
                        If GA.IsIndiChanged(I) Then
                            FFF = sWALK * CRE(I).TaskWalk
                            FFF = FFF + CRE(I).PenalizationSUM
                            FFF = FFF + sDontJump * CRE(I).TaskDontJUMP * INVTrainTime
                            FFF = FFF + sAVGH * CRE(I).TaskAVGheight * INVTrainTime
                            FFF = FFF + sMaxH * CRE(I).TaskMAXHeight
                            FFF = FFF + sVertical * CRE(I).TaskVerticality * INVTrainTime
                            FFF = FFF + sHorizontal * CRE(I).TaskHorizontality * INVTrainTime
                            FFF = FFF + sShape * CRE(I).TaskShape * INVTrainTime
                            
                            
                            If Not (DoFrames) Then If FFF < CurBESTV Then CurBESTV = FFF: CurBEST = I
                          
                        End If
                    Next
                    PanX = CRE(CurBEST).CurrCenX - Me.ScaleWidth * 0.5 + CRE(CurBEST).DrawOffset

                End If
            End If

            If chSLOW Then
                Me.Refresh
                DoEvents
            End If


            CNT = CNT + 1

            If CNT Mod 1000 = 0 Then Me.Caption = "Generation:" & GEN & "  " & CNT & "    (Avg" & GA.STAT_AVGfit & ")" & "    (Best" & GA.STAT_GenerBestFit & ")    (Video: " & Frame \ 25 & " Seconds at 25fps)": If CNT = TrainTime Then Exit Do

        Loop While True

        For I = 1 To NC
            If GA.IsIndiChanged(I) Then
                GA.IndiFitness(I) = sWALK * CRE(I).TaskWalk
                GA.IndiFitness(I) = GA.IndiFitness(I) + CRE(I).PenalizationSUM
                GA.IndiFitness(I) = GA.IndiFitness(I) + sDontJump * CRE(I).TaskDontJUMP * INVTrainTime
                GA.IndiFitness(I) = GA.IndiFitness(I) + sAVGH * CRE(I).TaskAVGheight * INVTrainTime
                GA.IndiFitness(I) = GA.IndiFitness(I) + sMaxH * CRE(I).TaskMAXHeight
                GA.IndiFitness(I) = GA.IndiFitness(I) + sVertical * CRE(I).TaskVerticality * INVTrainTime
                GA.IndiFitness(I) = GA.IndiFitness(I) + sHorizontal * CRE(I).TaskHorizontality * INVTrainTime
            GA.IndiFitness(I) = GA.IndiFitness(I) + sShape * CRE(I).TaskShape * INVTrainTime
            
            End If
        Next


        GA.DrawFitness PIC
        GA.EVOLVE
        Graph.ADDValue 1, GA.sTAT_NofGEN, GA.STAT_AVGfit
        Graph.ADDValue 2, GA.sTAT_NofGEN, GA.STAT_GenerBestFit
        Graph.ADDValue 3, GA.sTAT_NofGEN, GA.STAT_Diversity
        Graph.ADDValue 4, GA.sTAT_NofGEN, GA.MutProb

        If GA.STAT_GenerBestFitINDX <> BestCRE Then Beep: BestCRE = GA.STAT_GenerBestFitINDX



        'II = 0
        'For I = 1 To NC
        'If GA.IsIndiChanged(I) Then Graph.ADDValue 5 + II, GA.sTAT_NofGEN, I: II = II + 1
        'Next



        If GA.sTAT_NofGEN > 100 Then Graph.MinX = GA.sTAT_NofGEN - 100
        Graph.DRAW PicGR

        GA.SavePOP "Creatures\" & CreFN & "Pop.txt"

        ' DRAW GENES
        'Kdg = 255 / (GA.GeneValuesMax - GA.GeneValuesMin)
        'X = 1
        'Y = 1
        'For C = 1 To NC
        '    For G = 1 To GA.NofGenesMAX
        '        SetPixel PIC.HDC, X, Y, RGB(GA.GeneValue(C, G) * Kdg, 0, 0)
        '        X = X + 1
        '        If X >= PIC.Width Then X = 1: Y = Y + 1
        '    Next
        '    X = 1: Y = Y + 1
        'Next
        'PIC.Refresh
        '-------------------------------

        DoFrames = False

        'If chMakeVFrames Then If GEN = 2 Or (GEN Mod 50 = 0) Then DoFrames = True
        'if chMakeVFrames Then If GEN = 1 Or (GEN Mod 50) = 0 Then If DoVideoBEST <> GA.STAT_GenerBestFitINDX Then DoFrames = True: DoVideoBEST = GA.STAT_GenerBestFitINDX: I = GA.STAT_GenerBestFitINDX: GA.IsIndiChanged(I) = True
        If chMakeVFrames Then If GEN = 1 Or ((GEN + 1) Mod 50) = 0 Then If DoVideoBEST <> GA.STAT_GenerBestFitINDX Then DoFrames = True: DoVideoBEST = GA.STAT_GenerBestFitINDX: GA.IsIndiChanged(DoVideoBEST) = True:



        TextFramesDone = False

        If DoFrames Then
            tmpDrawPTS = chDrawPts.Value
            chDrawPts.Value = vbChecked
            DrawInputsX = frmMAIN.ScaleWidth \ 2 - 100
            DrawInputsY = MaxY - 280
        Else
            chDrawPts.Value = tmpDrawPTS
            DrawInputsX = 200
            DrawInputsY = MaxY - 150
        End If

    Next GEN

End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Initialize()
    InitCommonControls
  

End Sub

Private Sub Form_Load()
    Dim I          As Long
    Dim J          As Long
    Dim Y          As Single
    Dim D          As Boolean
    Dim II         As Long
    Randomize Timer
    
    Text1.Text = "V" & App.Major & ". " & Text1.Text

    If Dir(App.Path & "\Creatures", vbDirectory) = vbNullString Then MkDir App.Path & "\Creatures"
    If Dir(App.Path & "\Frames", vbDirectory) = vbNullString Then MkDir App.Path & "\Frames"

    If Dir(App.Path & "\Frames\*.*") <> vbNullString Then Kill App.Path & "\Frames\*.*"

    Graph.AddGraphLine 4 '+ 3

    MaxY = Me.ScaleHeight - 20
        

    GravityY = 0.00035
    
    
    NC = 36 '24 '22                       ' 20                       '10
    ReDim CRE(1 To NC)
    
    For I = 1 To NC
    CRE(I).MyIDX = I
    Next
    

    ST = 0.5                      ' 0.4
    'For I = 1 To NC
    '    BuildCreature I, ST
    'Next

    BuildCreature 1, ST
    CRE(1).SaveMe "Creatures\" & "Default.cre"


    CreFN = "Default.cre"


    InitGrad

    AAA.DIB Me.hdc, Me.Image.Handle, Me.ScaleWidth, Me.ScaleHeight

End Sub
Private Sub INITIALIZENN()
    Dim I          As Long
    Dim J          As Long
    Dim S          As String
    Dim Intermed   As Long
    Dim XX1        As Long

    XX1 = 0
    For I = 1 To NC
        CRE(I).LoadMe "Creatures\" & CreFN, 10 + XX1, MaxY - 1
        CRE(I).DrawOffset = XX1
        If sWALK = 0 Then XX1 = XX1 + 0.5 / CRE(I).InvSIZE + 2
    Next

    Nout = 0
    NumberOfInputLinks = 0
    For J = 1 To CRE(1).NL
        If CRE(1).IsLinkDynamic(J) Then
            Nout = Nout + 1
            ReDim Preserve OutLink(Nout)
            OutLink(Nout) = J
        Else
            NumberOfInputLinks = NumberOfInputLinks + 1
            ReDim Preserve InLink(NumberOfInputLinks)
            InLink(NumberOfInputLinks) = J
        End If

    Next


    NoutLink = Nout
    Nout = Nout + CRE(1).NM
    
    

    'Ninp = (CRE(1).NL - Nout) * 2 + CRE(1).NP + (4 + 1 + 2 + 2 + 2) '11
    Ninp = CRE(1).NP * 4 + (4 + 1 + 2 + 2 + 2) '11

    
    ReDim InputValues(1 To NC, 1 To Ninp)
    ReDim OutputValues(1 To NC, 1 To Nout)

    If Nout = 0 Then Exit Sub


    S = "Creature composed by:" & vbCrLf & vbCrLf
    S = S & "Points : " & CRE(1).NP & vbCrLf
    S = S & "Links : " & CRE(1).NL & " (with Brain: " & NoutLink & ". Without Brain: " & CRE(1).NL - NoutLink & ")" & vbCrLf
    S = S & "Muscles (with brain) : " & CRE(1).NM & vbCrLf & vbCrLf
    
    S = S & "NEURAL NETWORK" & vbCrLf
'    S = S & "Inputs : " & Ninp & "  (" & CRE(1).NL - Nout & "*2 + " & CRE(1).NP & " + 4 + 1 + 2 + 2 + 2)" & vbCrLf
    S = S & "Inputs : " & Ninp & "  (" & CRE(1).NP & "*4  + 4 + 1 + 2 + 2 + 2)" & vbCrLf
    
    S = S & "Outputs: " & Nout

    TrainString = "TRAINING: " & vbCrLf
    If sWALK <> 0 Then TrainString = TrainString & "Walk           " & sWALK & "%" & vbCrLf
    If sDontJump <> 0 Then TrainString = TrainString & "Dont Jump      " & sDontJump & "%" & vbCrLf
    If sAVGH <> 0 Then TrainString = TrainString & "AVG Height     " & sAVGH & "%" & vbCrLf
    If sMaxH <> 0 Then TrainString = TrainString & "MAX Height     " & sMaxH & "%" & vbCrLf
    If sHorizontal <> 0 Then TrainString = TrainString & "Horizontality  " & sHorizontal & "%" & vbCrLf
    If sVertical <> 0 Then TrainString = TrainString & "Verticality    " & sVertical & "%" & vbCrLf
 If sShape <> 0 Then TrainString = TrainString & "Shape          " & sShape & "%" & vbCrLf
 

    ReDim Inp(1 To Ninp)
    ReDim Out(1 To Nout)

    BR.InitBrains NC, 1
    BR.InitBrainCell 1, Array(Ninp, Nout * 1.5, Nout), 140, PIC '5 u3

S = S & vbCrLf & "'Genes' Excursion: -/+ " & BR.GetWeightsExcursion(1)

   MsgBox S & vbCrLf & vbCrLf & TrainString, vbInformation


    'MutateOnlySons, 0.05, 0.2, 0.15,
    'sns x gen .13 --> 3
    'GA.INIT1_EvolutionParams MutateOnlySons, 0.001, 0.25, 0.15, 0.08, SelWheel, CrossBySwap, SonToWorst, False, 25, TDbySameFitness, TDActionMutate
    
    'pop size 24
    'GA.INIT1_EvolutionParams MutateAll, 0.001, 0.05, 0.15, 0.08, SelWheel, CrossBySwap, SonToWorst, False, 25, TDbySameFitness, TDActionMutate
    'Pop Size 50
    GA.INIT1_EvolutionParams MutateAll, 0.0001, 0.05, 0.2, 3 / NC, SelWheel, CrossBySwap, SonToWorst, False, 25, TDbySameFitness, TDActionMutate
        
        
        
    GA.INIT2_Pop NC, 0, 50000, BR.GetNofTotalGenes, BR.GetNofTotalGenes, True
    
    If chZERO.Value = vbUnchecked Then If Dir(App.Path & "\Creatures\" & CreFN & "Pop.txt") <> "" Then GA.LoadPOP "Creatures\" & CreFN & "Pop.txt"


    'Dim G As Long
    'Dim V As Single
    'For G = 1 To GA.NofGenesMAX
    'V = RndM * GA.GeneValuesMax
    'For I = 1 To NC
    'GA.GeneValue(I, G) = V
    'Next
    'Next

    For I = 1 To NC
        BR.TransferGAGenesToBrain GA, I
    Next

End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub BuildCreature(wC As Long, ST As Single)
    Dim II         As Long
    Dim Y          As Single

    Y = MaxY - 35

    With CRE(wC)
        .ClearAll
        '.ADDpoint 30, 30 + Y
        '.ADDpoint 60, 30 + Y
        '.ADDpoint 60, 60 + Y
        '.ADDpoint 30, 65 + Y
        '.AddLink 1, 2, ST
        '.AddLink 2, 3, ST
        '.AddLink 3, 4, ST
        '.AddLink 4, 1, ST
        '.AddLink 1, 3, ST, True
        '.AddLink 2, 4, ST, True
        '.ADDpoint 125, 30 + Y
        '.AddLink 2, 5, ST, True


        For II = 1 To 6
            .ADDpoint II * 30 - 20, Y, False
            .ADDpoint II * 30 - 20, Y + 30, False
        Next
        For II = 1 To 9 Step 2
            '.AddLink II, II + 1, ST, IIf(II <> 1, False, True)
            '.AddLink II, II + 2, ST, IIf(II = 3 Or II = 7, False, True)
            '.AddLink II + 1, II + 3, ST, IIf(II = 3 Or II = 7, False, True)
            '.AddLink II, II + 3, ST, IIf(II = 3 Or II = 7, False, True)
            '.AddLink II + 1, II + 2, ST, IIf(II = 3 Or II = 7, False, True)

            .AddLink II, II + 1, ST, False
            .AddLink II, II + 2, ST, True
            .AddLink II + 1, II + 3, ST, True
            .AddLink II, II + 3, ST, False
            .AddLink II + 1, II + 2, ST, False

        Next
        .AddLink 11, 12, ST, True
        .IsLinkDynamic(1) = True
    End With

End Sub
Private Sub DoAI(wCre As Long)

    Dim I          As Long
    Dim aI         As Long
    Dim V          As Single


    aI = 0


    GoTo SkipLinks
    
    For I = 1 To NumberOfInputLinks    'UBound(InLink)
        V = CRE(wCre).GetLinkTension(InLink(I))
        '    For I = 1 To Nout
        '        V = CRE(wCre).GetLinkTension(OutLink(I))

        'If V > 1 Then V = 1
        'If V < -1 Then V = -1
        If V > 0 Then
            aI = aI + 1
            Inp(aI) = V
            aI = aI + 1
            Inp(aI) = 0
        Else
            aI = aI + 1
            Inp(aI) = 0
            aI = aI + 1
            Inp(aI) = -V
        End If

    Next

SkipLinks:

  For I = 1 To CRE(wCre).NP
        aI = aI + 1
        'If CRE(wCre).GetSpeedYTouchGround(I) <> 0 Then Stop
        Inp(aI) = CRE(wCre).GetSpeedYTouchGround(I)
    Next
  For I = 1 To CRE(wCre).NP
        aI = aI + 1: Inp(aI) = CRE(wCre).GetSpeedLeftTouch(I)
    Next
  For I = 1 To CRE(wCre).NP
        aI = aI + 1: Inp(aI) = CRE(wCre).GetSpeedRightTouch(I)
    Next




    For I = 1 To CRE(wCre).NP
        aI = aI + 1
        Inp(aI) = CRE(wCre).GetTouchGround(I)
    Next


  


    ' ORIENTATION
    V = CRE(wCre).CurrDX

    'If V > 1 Then V = 1
    'If V < -1 Then V = -1
    If V > 0 Then
        aI = aI + 1
        Inp(aI) = V
        aI = aI + 1
        Inp(aI) = 0
    Else
        aI = aI + 1
        Inp(aI) = 0
        aI = aI + 1
        Inp(aI) = -V
    End If
    V = CRE(wCre).CurrDY
    'If V > 1 Then V = 1
    'If V < -1 Then V = -1
    If V > 0 Then
        aI = aI + 1
        Inp(aI) = V
        aI = aI + 1
        Inp(aI) = 0
    Else
        aI = aI + 1
        Inp(aI) = 0
        aI = aI + 1
        Inp(aI) = -V
    End If

    'Height From Ground
    aI = aI + 1
    V = CRE(wCre).CurrHeightfromGround * 0.01
    If V > 1 Then V = 1
    Inp(aI) = V

    'Velocity Y
    V = CRE(wCre).CurrVY * 4
    If V > 1 Then V = 1
    If V < -1 Then V = -1
    If V > 0 Then
        aI = aI + 1
        Inp(aI) = V
        aI = aI + 1
        Inp(aI) = 0
    Else
        aI = aI + 1
        Inp(aI) = 0
        aI = aI + 1
        Inp(aI) = -V
    End If
    'Velocity X
    V = CRE(wCre).CurrVX * 4
    If V > 1 Then V = 1
    If V < -1 Then V = -1
    If V > 0 Then
        aI = aI + 1
        Inp(aI) = V
        aI = aI + 1
        Inp(aI) = 0
    Else
        aI = aI + 1
        Inp(aI) = 0
        aI = aI + 1
        Inp(aI) = -V
    End If


    'Rotational VEL
    V = CRE(wCre).RotVEL
    If V > 0 Then
        aI = aI + 1
        Inp(aI) = V
        aI = aI + 1
        Inp(aI) = 0
    Else
        aI = aI + 1
        Inp(aI) = 0
        aI = aI + 1
        Inp(aI) = -V
    End If
    '---------------------------------------------------------------
    '---------------------------------------------------------------
    '---------------------------------------------------------------

    Out = BR.RUN(wCre, 1, Inp)
    
    For I = 1 To NoutLink
        CRE(wCre).AdjAddedBrainLenToReach(OutLink(I)) = (Out(I) - 0.5)
    Next
    For I = NoutLink + 1 To Nout
        CRE(wCre).AdjAddedBrainANGToReach(I - NoutLink) = (Out(I) - 0.5)
    Next
    
    'For I = Nout \ 2 + 1 To Nout
    '    CRE(wCre).AdjSpeed(OutLink(I - Nout \ 2)) = Out(I)
    'Next




    If wCre = CurBEST Then
        For I = 1 To Ninp
            InputValues(wCre, I) = Inp(I)
        Next
        For I = 1 To Nout
            OutputValues(wCre, I) = Out(I)
        Next
    End If

End Sub


Private Sub ReEvaluateAll()
    Exit Sub
    Dim I          As Long

    For I = 1 To NC
        GA.IsIndiChanged(I) = True
    Next
End Sub

Private Sub sAVGH_Change()
    ReEvaluateAll
End Sub

Private Sub sAVGH_Scroll()
    ReEvaluateAll
End Sub

Private Sub setGraphXRange_Click(Index As Integer)
    Select Case Index
        Case 0
            Graph.XRange = 0
        Case 1
            Graph.XRange = 250
        Case 2
            Graph.XRange = 100
        Case 3
            Graph.XRange = 50

    End Select
    If Graph.XRange > 0 And Graph.XRange <= sRANGE.Max Then
        sRANGE = Graph.XRange
    Else
        If GA.sTAT_NofGEN >= sRANGE.Min Then sRANGE = GA.sTAT_NofGEN
    End If
    Graph.DRAW PicGR
    PicGR.Refresh

End Sub

Private Sub sGround_Change()
    ReEvaluateAll
End Sub

Private Sub sMaxH_Change()
    ReEvaluateAll
End Sub

Private Sub sMaxH_Scroll()
    ReEvaluateAll
End Sub

Private Sub sRANGE_Change()
    If sRANGE >= GA.sTAT_NofGEN Then
        Graph.XRange = 0
    Else
        Graph.XRange = sRANGE
    End If
    Graph.DRAW PicGR
    PicGR.Refresh
    DoEvents
End Sub

Private Sub sRANGE_Scroll()
    If sRANGE >= GA.sTAT_NofGEN Then
        Graph.XRange = 0
    Else
        Graph.XRange = sRANGE
    End If
    Graph.DRAW PicGR
    PicGR.Refresh
    DoEvents
End Sub

Private Sub sWALK_Change()
    ReEvaluateAll
End Sub
