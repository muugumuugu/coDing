VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   6255
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7080
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   Picture         =   "frmMain.frx":08CA
   ScaleHeight     =   6255
   ScaleWidth      =   7080
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picProgress 
      Appearance      =   0  'Flat
      BackColor       =   &H80000003&
      CausesValidation=   0   'False
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   4440
      ScaleHeight     =   225
      ScaleWidth      =   2505
      TabIndex        =   38
      Top             =   4080
      Visible         =   0   'False
      Width           =   2535
      Begin VB.Label lblCount 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "0%"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   240
         Left            =   0
         TabIndex        =   39
         Top             =   0
         Width           =   2520
      End
      Begin VB.Label lblProgress 
         BackColor       =   &H00000000&
         Height          =   255
         Left            =   0
         TabIndex        =   40
         Top             =   0
         UseMnemonic     =   0   'False
         Width           =   375
      End
   End
   Begin VB.CommandButton cmdCleanAI 
      Caption         =   "&Clean AI Experiences"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4440
      TabIndex        =   4
      Top             =   5640
      Width           =   2535
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      TabIndex        =   3
      Top             =   5160
      Width           =   1335
   End
   Begin VB.CommandButton cmdViewAI 
      Caption         =   "&View AI File"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4440
      TabIndex        =   2
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton cmdTrain 
      Caption         =   "&Training"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      TabIndex        =   1
      Top             =   4680
      Width           =   1335
   End
   Begin VB.Frame FrameGameType 
      Caption         =   "Frame2"
      Height          =   1455
      Left            =   4440
      TabIndex        =   33
      Top             =   2040
      Width           =   2535
      Begin VB.OptionButton optGame 
         Caption         =   "A&I vs. AI"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   7
         Top             =   1080
         Width           =   2175
      End
      Begin VB.OptionButton optGame 
         Caption         =   "&AI vs. Human"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   6
         Top             =   720
         Width           =   2175
      End
      Begin VB.OptionButton optGame 
         Caption         =   "&Human vs. AI"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "GAME TYPE"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   0
         TabIndex        =   34
         Top             =   0
         Width           =   2535
      End
   End
   Begin VB.CommandButton cmdNewgame 
      Caption         =   "&New Game"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4440
      TabIndex        =   0
      Top             =   4680
      Width           =   1215
   End
   Begin VB.TextBox txtFilename 
      BackColor       =   &H80000001&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0FFFF&
      Height          =   285
      Left            =   1200
      TabIndex        =   8
      Top             =   4080
      Width           =   2775
   End
   Begin VB.CommandButton cmdFilename 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   310
      Left            =   3960
      Picture         =   "frmMain.frx":23E5
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   4080
      Width           =   375
   End
   Begin VB.TextBox txtConsole 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   600
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   10
      Top             =   4680
      Width           =   3735
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3855
      Left            =   600
      TabIndex        =   11
      Top             =   120
      Width           =   3735
      Begin VB.Line lnWIN 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   3
         X1              =   240
         X2              =   3480
         Y1              =   3600
         Y2              =   360
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "GAME BOARD"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   0
         TabIndex        =   27
         Top             =   0
         Width           =   3735
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   9
         Left            =   2520
         TabIndex        =   26
         Top             =   2640
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   8
         Left            =   1440
         TabIndex        =   25
         Top             =   2640
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   7
         Left            =   360
         TabIndex        =   24
         Top             =   2640
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   6
         Left            =   2520
         TabIndex        =   23
         Top             =   1560
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   5
         Left            =   1440
         TabIndex        =   22
         Top             =   1560
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   4
         Left            =   360
         TabIndex        =   21
         Top             =   1560
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   3
         Left            =   2520
         TabIndex        =   20
         Top             =   480
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   2
         Left            =   1440
         TabIndex        =   19
         Top             =   480
         Width           =   855
      End
      Begin VB.Label lblBoard 
         Alignment       =   2  'Center
         Caption         =   "O"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   36
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Index           =   1
         Left            =   360
         TabIndex        =   18
         Top             =   480
         Width           =   855
      End
      Begin VB.Line Line4 
         BorderColor     =   &H00C0FFFF&
         BorderWidth     =   2
         X1              =   2400
         X2              =   2400
         Y1              =   360
         Y2              =   3600
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00C0FFFF&
         BorderWidth     =   2
         X1              =   1320
         X2              =   1320
         Y1              =   360
         Y2              =   3600
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00C0FFFF&
         BorderWidth     =   2
         X1              =   240
         X2              =   3480
         Y1              =   2520
         Y2              =   2520
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0FFFF&
         BorderWidth     =   2
         X1              =   240
         X2              =   3480
         Y1              =   1440
         Y2              =   1440
      End
   End
   Begin VB.Label lblPly2WLD 
      AutoSize        =   -1  'True
      Caption         =   "                  "
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
      Left            =   4440
      TabIndex        =   37
      Top             =   1680
      Width           =   810
   End
   Begin VB.Label lblPly1WLD 
      AutoSize        =   -1  'True
      Caption         =   "                  "
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
      Left            =   4440
      TabIndex        =   36
      Top             =   840
      Width           =   810
   End
   Begin VB.Label lblAIExperience 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4440
      TabIndex        =   35
      Top             =   3600
      Width           =   2535
   End
   Begin VB.Label lblHistory 
      Caption         =   "34534"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4440
      TabIndex        =   32
      Top             =   120
      Width           =   1935
   End
   Begin VB.Label Label7 
      Caption         =   "AI File: "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   600
      TabIndex        =   31
      Top             =   4080
      Width           =   735
   End
   Begin VB.Label lblConsole 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "CONSOLE"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   600
      TabIndex        =   30
      Top             =   4440
      Width           =   3735
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Steps:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   4440
      TabIndex        =   29
      Top             =   1440
      Width           =   525
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Steps:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   4440
      TabIndex        =   28
      Top             =   600
      Width           =   525
   End
   Begin VB.Label lblPly2Steps 
      AutoSize        =   -1  'True
      Caption         =   "                  "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   5040
      TabIndex        =   17
      Top             =   1440
      Width           =   810
   End
   Begin VB.Label lblPly1Steps 
      AutoSize        =   -1  'True
      Caption         =   "                  "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   195
      Left            =   5040
      TabIndex        =   16
      Top             =   600
      Width           =   810
   End
   Begin VB.Label lblPlayer2 
      AutoSize        =   -1  'True
      Caption         =   "Human"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   5280
      TabIndex        =   15
      Top             =   1200
      Width           =   600
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Player 2:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   4440
      TabIndex        =   14
      Top             =   1200
      Width           =   735
   End
   Begin VB.Label lblPlayer1 
      AutoSize        =   -1  'True
      Caption         =   "AI"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   5280
      TabIndex        =   13
      Top             =   360
      Width           =   195
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Player 1:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   4440
      TabIndex        =   12
      Top             =   360
      Width           =   735
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'AI Tic Tac Toe (unbeatable true learning AI) by Lee Wen Ying, using experiences learning alogrithm
'based on JengHowe's work
'
'This is an advanced version of "Tic Tac Toe that learns (True AI)" submitted by JengHowe
'which is further improved and optimized for a 'perfectly unbeatable' Artificial Intelligence
'in Tic Tac Toe games. Bug from AI coded by JengHowe was eliminated in this version (whereby
'his AI still suffer from loosing when AI is asked to move first)
'
'It keeps a record (experience) of all the game that it has lost (both AI move first and move
'second) and compute the best possible move in order win or draw its opponent. The record file
'"TTT.ai" contains all the possible vital winning steps for player 1 (when AI move first) and
'player 2 (when AI move second).
'
'With a few training sessions until AI Player1 Experiences reaches 744 and AI Player2 Experiences
'of 448, it will become unbeatable since then.
'To make it dumb again, just click "Clean AI Experiences" or delete the AI file, "TTT.ai".
'

'The following are numbering of the game board
' 1 2 3
' 4 5 6
' 7 8 9

Option Explicit

'Execute when program starts, initialize settings and load AI Experiences if available
Private Sub Form_Load()

    If App.PrevInstance Then End

    Me.Caption = App.Title & " v" & App.Major & "." & App.Minor & " Build " & App.Revision

    If Right(App.Path, 1) = "\" Then
        txtFilename = App.Path & "TTT.ai"
      Else
        txtFilename = App.Path & "\TTT.ai"
    End If

    Call clearConsole
    Call writeConsole(Me.Caption)
    Call InitializeProgressBar

    Call optGame_Click(1)
    Call InitializeAI(txtFilename.Text)

End Sub

'Exit program
Private Sub cmdExit_Click()

    End

End Sub

'Open/Save Dialog box
Private Sub cmdFilename_Click()

  Dim strFilter As String
  Dim temp As String

    strFilter = "AI Experiences (*.ai)" & Chr$(0) & "*.ai" & Chr$(0) & "All Files (*.*)" & Chr$(0) & "*.*"
    temp = Open_Save(strFilter)
    If Len(temp) > 0 Then
        If LCase(Right(temp, 3)) <> ".ai" Then temp = temp & ".ai"
        txtFilename.Text = temp
    End If

    Call InitializeAI(txtFilename)
    Me.SetFocus

End Sub

'Sub function for Open/Save Dialog box
Private Function Open_Save(strFilter As String) As String

  Dim sSave As SelectedFile
  Dim Count As Integer
  Dim FileList As String

    On Error GoTo e_Trap

    FileDialog.sFilter = strFilter

    ' See Standard CommonDialog Flags for all options
    FileDialog.flags = OFN_HIDEREADONLY
    FileDialog.sDlgTitle = "Save"
    FileDialog.sInitDir = App.Path & "\"
    sSave = ShowSave(Me.hWnd)
    If Err.Number <> 32755 And sSave.bCanceled = False Then
        FileList = sSave.sLastDirectory
        For Count = 1 To sSave.nFilesSelected
            FileList = FileList & sSave.sFiles(Count)
        Next Count
        Open_Save = FileList
    End If

Exit Function

e_Trap:

Exit Function

    Resume

End Function

'Delte all AI previous experience, make it dumb
Private Sub cmdCleanAI_Click()

  Dim Msg, Style, Title, Response

    Msg = "Are you sure you want to continue ?"
    Style = vbYesNo + vbCritical + vbDefaultButton2
    Title = "Clean AI Experiences"

    Response = MsgBox(Msg, Style, Title)
    If Response = vbYes Then
        Call cleanAI(txtFilename)
        Call countHistory
    End If

End Sub

'New game
Private Sub cmdNewgame_Click()

  Dim i As Integer

    For i = 1 To 3
        If optGame(i).Value Then Call optGame_Click(i)
    Next i

End Sub

'Training which allows AI to learn faster
Private Sub cmdTrain_Click()

  Dim train As Long
  Dim opt As Integer
  Dim tmp1 As Integer
  Dim tmp2 As Integer
  Dim pcount As Long
  Dim tmpTimer As Variant

    If cmdTrain.Caption = "&Training" Then
        cmdTrain.Caption = "Stop &Training"
        Call controlenable(False)
      Else
        cmdTrain.Caption = "&Training"
        Exit Sub
    End If

    train = Val(InputBox("How many games to you want to train?", "Train AI", 1500))

    'If train less than 1
    If train < 1 Then GoTo exiting

    opt = Val(InputBox("Plase enter training options," & vbCrLf & _
          "1 = Human vs. AI  - To Gain Player1 Experiences" & vbCrLf & _
          "2 = AI vs. Human  - To Gain Player2 Experiences" & vbCrLf & _
          "3 = AI vs. AI          - For Experiment", "Train AI", 1))

    'If opt is not a valid options
    If opt < 1 Or opt > 3 Then GoTo exiting

    'For timing purpose
    tmpTimer = Timer

    'Clear all player statistics
    Call clearPlayer

    'Set game type
    optGame(opt).Value = True

    'Set progress bar max value
    Call SetMax(CLng(train))

    'Run Training until pcount=train OR button cmdTrain pressed
    Do Until pcount = train Or cmdTrain.Caption = "&Training"
        If opt <> 3 And MarkSuccessful Then

            tmp1 = NextStepWin(currentPlayer)
            tmp2 = NextStepWin(FindOpponent)

            If tmp1 > 0 Then
                'Move if me next step win
                Call playgame(tmp1)
              ElseIf tmp2 > 0 Then
                'Block if opponent next step win
                Call playgame(tmp2)
              Else
                'Move randomly
                Call playgame(randommark)
            End If

        End If

        'Game ends
        If GameEnd Then

            'Increase pcount
            pcount = pcount + 1

            'Set game type
            Call optGame_Click(opt)

            'Set progress bar value
            Call SetValue(pcount)
            'Set progress bar caption
            Call SetCaption("Training..." & Format(pcount / train, "0.0%"))

        End If

    Loop

    'Display training time
    Call writeConsole("Training " & train & " finished in " & Timer - tmpTimer & " seconds")

exiting:
    Call controlenable(True)
    Call InitializeProgressBar
    cmdTrain.Caption = "&Training"

End Sub

'View AI file
Private Sub cmdViewAI_Click()

    Shell "notepad " & txtFilename, vbNormalFocus

End Sub

'Write txtConsole with text
Public Function writeConsole(message As String)

    txtConsole = txtConsole & message & vbCrLf

End Function

'Clear txtConsole
Function clearConsole()

    txtConsole = ""

End Function

'Clear txtConsole
Private Sub lblConsole_DblClick()

    Call clearConsole

End Sub

'Assign board symbols with different colors
Private Sub lblBoard_Change(Index As Integer)

    If lblBoard(Index) = "X" Then
        lblBoard(Index).ForeColor = vbBlack
      Else
        lblBoard(Index).ForeColor = vbRed
    End If

End Sub

'Mark board
Private Sub lblBoard_Click(Index As Integer)

    If MarkSuccessful Then Call playgame(Index)

End Sub

'Set game type
Private Sub optGame_Click(Index As Integer)

  'Reset game board

    Call newgame

    If Index = 1 Then
        'Human vs AI
        player(1).isAI = False
        player(2).isAI = True
        lblPlayer1 = "Human"
        lblPlayer2 = "AI"

      ElseIf Index = 2 Then
        'AI vs Human
        player(1).isAI = True
        player(2).isAI = False
        lblPlayer1 = "AI"
        lblPlayer2 = "Human"
        Call playgame(randommark)
        'Call AIMove()

      ElseIf Index = 3 Then
        'AI vs AI
        player(1).isAI = True
        player(2).isAI = True
        lblPlayer1 = "AI"
        lblPlayer2 = "AI"
        Call playgame(randommark)
        'Call AIMove()

    End If

End Sub

'Auto scroll down txtConsole and clear txtConsole
'when content is over 1000 characters to avoid overflow
Private Sub txtConsole_Change()

    With txtConsole
        If Len(txtConsole.Text) > 10000 Then txtConsole.Text = ""
        .SelStart = Len(.Text)
    End With

End Sub

'Enable/Disable the following buttons during Training events
Private Function controlenable(enable As Boolean)

    optGame(1).Enabled = enable
    optGame(2).Enabled = enable
    optGame(3).Enabled = enable
    cmdNewgame.Enabled = enable
    Label7.Enabled = enable
    txtFilename.Enabled = enable
    cmdFilename.Enabled = enable
    Frame1.Enabled = enable
    cmdCleanAI.Enabled = enable
    picProgress.Visible = Not enable

End Function

'Keyboard control function which allows playing the game using keypad numbers
Private Function KeyBoardControl(KeyAscii As Integer)

    If Val(Chr(KeyAscii)) > 0 And Val(Chr(KeyAscii)) < 10 Then _
       Call lblBoard_Click(Int(Chr(KeyAscii)))

End Function

'Enable keyboard control when optGame is in focus
Private Sub optGame_KeyPress(Index As Integer, KeyAscii As Integer)

    Call KeyBoardControl(KeyAscii)

End Sub

'Enable keyboard control when optGame is in focus
Private Sub txtConsole_KeyPress(KeyAscii As Integer)

    Call KeyBoardControl(KeyAscii)

End Sub

'Enable keyboard control when cmdNewgame is in focus
Private Sub cmdNewgame_KeyPress(KeyAscii As Integer)

    Call KeyBoardControl(KeyAscii)

End Sub

'Enable keyboard control when cmdViewAI is in focus
Private Sub cmdViewAI_KeyPress(KeyAscii As Integer)

    Call KeyBoardControl(KeyAscii)

End Sub

'Enable keyboard control when cmdViewAI is in focus
Private Sub cmdCleanAI_KeyPress(KeyAscii As Integer)

    Call KeyBoardControl(KeyAscii)

End Sub

'Progress bar functions
'Reset progress bar
Private Function InitializeProgressBar()

    Call SetMax(0)
    Call SetValue(1)
    Call SetCaption("Training")

End Function

'Set maximum value of progress bar
Private Function SetMax(ByVal lngValue As Long)

    If lngValue < 1 Then lngValue = 1
    picProgress.ScaleWidth = lngValue

End Function

'Set value of progress bar
Private Function SetValue(ByVal lngValue As Long)

    If lngValue < 1 Then lngValue = 0

    lblProgress.Width = lngValue
    lblProgress.Visible = CBool(lngValue)
    If (lngValue Mod 10) = 0 Then DoEvents

End Function

'Set caption of progress bar
Private Function SetCaption(ByVal strCaption As String)

    lblCount.Caption = strCaption

End Function
