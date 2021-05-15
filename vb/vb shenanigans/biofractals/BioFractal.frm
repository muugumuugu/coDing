VERSION 5.00
Begin VB.Form frmFractal 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fractals"
   ClientHeight    =   8550
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10965
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "BioFractal.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8550
   ScaleWidth      =   10965
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frames 
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H8000000D&
      Height          =   6795
      Index           =   1
      Left            =   8595
      TabIndex        =   1
      Top             =   0
      Width           =   2355
      Begin VB.CommandButton cmdBack 
         Caption         =   "-"
         Height          =   285
         Left            =   90
         TabIndex        =   4
         Top             =   6420
         Width           =   420
      End
      Begin VB.CommandButton cmdForward 
         Caption         =   "+"
         Height          =   285
         Left            =   1845
         TabIndex        =   3
         Top             =   6420
         Width           =   420
      End
      Begin VB.FileListBox FileBox 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   5970
         Left            =   90
         Pattern         =   "*.x"
         TabIndex        =   2
         Top             =   405
         Width           =   2175
      End
      Begin VB.Label Labels 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Fractal Depth"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Index           =   4
         Left            =   750
         TabIndex        =   22
         Top             =   6480
         Width           =   855
      End
      Begin VB.Label Labels 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Click File to Load"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Index           =   8
         Left            =   630
         TabIndex        =   5
         Top             =   210
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   9270
      TabIndex        =   21
      Top             =   8145
      Width           =   1005
   End
   Begin VB.Frame Frames 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Fractal Parameters"
      ForeColor       =   &H8000000D&
      Height          =   3975
      Index           =   0
      Left            =   8595
      TabIndex        =   6
      Top             =   4095
      Width           =   2355
      Begin VB.ListBox lstRules 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   960
         Left            =   90
         TabIndex        =   8
         Top             =   450
         Width           =   2175
      End
      Begin VB.ListBox lstSymbols 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   690
         Left            =   90
         TabIndex        =   7
         Top             =   1890
         Width           =   2175
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Recurse Depth"
         ForeColor       =   &H00808080&
         Height          =   195
         Index           =   0
         Left            =   90
         TabIndex        =   20
         Top             =   2970
         Width           =   1140
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Rotation Angle"
         ForeColor       =   &H00808080&
         Height          =   195
         Index           =   1
         Left            =   90
         TabIndex        =   19
         Top             =   3195
         Width           =   1140
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Turtle Length"
         ForeColor       =   &H00808080&
         Height          =   195
         Index           =   3
         Left            =   90
         TabIndex        =   18
         Top             =   3420
         Width           =   1140
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Scaling Factor"
         ForeColor       =   &H00808080&
         Height          =   195
         Index           =   5
         Left            =   90
         TabIndex        =   17
         Top             =   3645
         Width           =   1140
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Axiom"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   180
         Index           =   7
         Left            =   90
         TabIndex        =   16
         Top             =   2745
         Width           =   525
      End
      Begin VB.Label lblRecurseDepth 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   1305
         TabIndex        =   15
         Top             =   2970
         Width           =   90
      End
      Begin VB.Label lblAxiom 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "F"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   765
         TabIndex        =   14
         Top             =   2745
         Width           =   105
      End
      Begin VB.Label lblScaling 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   1305
         TabIndex        =   13
         Top             =   3645
         Width           =   90
      End
      Begin VB.Label lblLength 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   1305
         TabIndex        =   12
         Top             =   3420
         Width           =   90
      End
      Begin VB.Label lblRotation 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   1305
         TabIndex        =   11
         Top             =   3195
         Width           =   90
      End
      Begin VB.Label Labels 
         Caption         =   "Rules"
         Height          =   195
         Index           =   2
         Left            =   135
         TabIndex        =   10
         Top             =   225
         Width           =   615
      End
      Begin VB.Label Labels 
         Caption         =   "Symbols"
         Height          =   195
         Index           =   6
         Left            =   135
         TabIndex        =   9
         Top             =   1665
         Width           =   615
      End
   End
   Begin VB.PictureBox picCanvas 
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000008&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   8500
      Left            =   45
      ScaleHeight     =   2000
      ScaleMode       =   0  'User
      ScaleWidth      =   2000
      TabIndex        =   0
      Top             =   45
      Width           =   8500
   End
End
Attribute VB_Name = "frmFractal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private mFSO As Scripting.FileSystemObject
Private mLinDef As LinDef
Private mLinden As Linden

Private mPath As String
Private mIndex As Long

Private mNoEntry As Boolean
Private mInitialising As Boolean

Private Const cLS_FILE As String = ".ldf"
Private Const cLS_PATTERN As String = "*" & cLS_FILE

Implements ICanvas
Public Sub Initialise()

    mInitialising = True
    Show
    DoEvents
    
    Set mFSO = New Scripting.FileSystemObject
    Set mLinden = New Linden
    Set mLinDef = New LinDef
    
    mLinden.SetCanvas CallBackTarget:=Me

    mPath = App.Path & "\"
    With FileBox
        .Path = mPath
        .Pattern = cLS_PATTERN
        If .ListCount > 0 Then .ListIndex = 0
        .SetFocus
    End With

    mInitialising = False
    
End Sub

Private Sub cmdBack_Click()
    MousePointer = vbHourglass
    If mIndex > 1 Then
        mIndex = mIndex - 1
        mLinden.TurtleDraw mIndex
    End If
    MousePointer = vbDefault
End Sub

Private Sub cmdDelete_Click()

    If MsgBox(mPath & FileBox.FileName, vbOKCancel Or vbExclamation, "Confirm Delete") = vbOK Then
        FileDelete
    End If
    
End Sub



Private Sub cmdExit_Click()
    Cleanup
End Sub

Private Sub cmdForward_Click()
    MousePointer = vbHourglass
    If mIndex < mLinden.GetDepth Then
        mIndex = mIndex + 1
        mLinden.TurtleDraw mIndex
    End If
    MousePointer = vbDefault
End Sub


Private Sub FileBox_Click()
    OpenFile FileBox.FileName
    DisplayCurrent
End Sub

Private Sub Form_Load()

    Initialise

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

    If Not mNoEntry Then Cleanup

End Sub


Private Sub ICanvas_Clear()
    picCanvas.Cls
End Sub

Private Sub ICanvas_DrawLine(X1 As Single, Y1 As Single, X2 As Single, Y2 As Single)
       picCanvas.Line (X1, Y1)-(X2, Y2), vbWhite
End Sub


Private Sub ICanvas_PrintText(Text As String)
    picCanvas.Print Text
End Sub


Private Sub lstRules_GotFocus()
    lstSymbols.ListIndex = -1
End Sub


Private Sub lstSymbols_GotFocus()
    lstRules.ListIndex = -1
End Sub

Public Sub Cleanup()
On Local Error Resume Next

    mNoEntry = True

    mLinden.Clear
    Set mLinden = Nothing
    Set mFSO = Nothing
    Set mLinDef = Nothing
    Unload Me

    End

End Sub


Public Sub OpenFile(FileName As String)
    
    MousePointer = vbHourglass
    mIndex = 1
    mLinDef.OpenFile FileName, mPath
    ShowDetails
    MousePointer = vbDefault

End Sub

Public Sub FileDelete()
Dim ListIndex As Long

    With FileBox
        If Not mFSO.FileExists(mPath & .FileName) Then Exit Sub
        ListIndex = .ListIndex
        mFSO.DeleteFile (mPath & .FileName)
        .Refresh
        If .ListCount > ListIndex Then
            .ListIndex = ListIndex
        ElseIf .ListCount > 0 Then
            .ListIndex = .ListCount - 1
        End If
        .SetFocus
    End With
    
End Sub


Public Sub ShowDetails()
Dim Rules As Dictionary, Symbols As Dictionary
Dim Index As Long
    
    With mLinDef
        lblRecurseDepth = .RecurseDepth
        lblRotation = .Rotation
        lblLength = .Length
        lblScaling = .Scaling
        lblAxiom = .Axiom
        Set Rules = .Rules
        Set Symbols = .Symbols
    End With
    
    With lstRules
        .Clear
        For Index = 0 To Rules.Count - 1
            .AddItem Rules.Keys(Index) & "-> " & Rules.Items(Index)
        Next
    End With
    
    With lstSymbols
        .Clear
        For Index = 0 To Symbols.Count - 1
            .AddItem Symbols.Keys(Index) & " = " & Symbols.Items(Index)
        Next
    End With
    If lstSymbols.ListCount = 0 Then lstSymbols.AddItem "<None>"
End Sub

Public Sub DisplayCurrent()

    MousePointer = vbHourglass
    With mLinden
        .SetDefinition mLinDef
        .TurtleDraw mIndex
    End With
    MousePointer = vbDefault
    
End Sub
