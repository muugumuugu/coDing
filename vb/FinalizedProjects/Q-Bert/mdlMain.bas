Attribute VB_Name = "mdlMain"
Option Explicit
'This is The Module of Q-Bert II.
'This contains LOT'S of constants,
'variables, etc.

'This is the type the classmodules use
'for baddie and hero, I think. It may be updated,
'and now useless, but better safe then sorry
Public Type ScreenObject
    X As Integer
    Y As Integer
End Type

'type for high scores
Public Type HighScoreRecord
    Name As String * 15
    Score As String * 10
End Type

'flags for sndPlaySound uFlags parameter
'used about once. For the splash screen.
Public Const SND_SYNC = &H0
Public Const SND_ASYNC = &H1
Public Const SND_NODEFAULT = &H2
Public Const SND_MEMORY = &H4
Public Const SND_LOOP = &H8
Public Const SND_NOSTOP = &H10

'sound consts
Public Const INTROBANG = "intro.wav"
Public Const INTRODRUM = "intro2.wav"

'cube consts (used in updateboard calculate
'walls and doors
Public Const CUBEHEIGHT = 735
Public Const CUBEWIDTH = 735

'all the things that can be with a block
'all are in GameBoard collection
'however, some are only nessecary in other
'functions (ex: BADDIETHERE)
Public Const BLOCKTYPE = 1
Public Const LEFTWALL = 2
Public Const RIGHTWALL = 3
Public Const UPWALL = 4
Public Const DOWNWALL = 5
Public Const LEFTDOORTYPE = 6
Public Const RIGHTDOORTYPE = 7
Public Const UPDOORTYPE = 8
Public Const DOWNDOORTYPE = 9
Public Const TRAPBLOCK = 10
Public Const JUMPED = 11
Public Const BADDIETHERE = 12
Public Const MAXNEEDEDDIMENSIONS = 12

'all the possible BLOCKTYPEs
Public Const NOJUMP = 1
Public Const YESJUMP = 2
Public Const BADDIENOJUMP = 3
Public Const BADDIEYESJUMP = 4
Public Const BLUEKEY = 5
Public Const YELLOWKEY = 6
Public Const REDKEY = 7
Public Const GREENKEY = 8
Public Const BADDIEBLUEKEY = 9
Public Const BADDIEYELLOWKEY = 10
Public Const BADDIEREDKEY = 11
Public Const BADDIEGREENKEY = 12
Public Const GUN = 13
Public Const BADDIEGUN = 14
'I had a BADDIENOEND, a baddie that
'couldn't be killed, but it was impractical to
'keep it after coding the whole gaming while not
'paying atention to it. Implementation now would
'mean serious redoing.
Public Const BADDIENOEND = 15
Public Const TRANSPORTER = 16
Public Const QBERT = 17
Public Const QBERTDEAD = 18

'General things. Used everywhere. Didn't want to
'use True and False because I didn't feel like it.
Public Const YES = 1
Public Const NO = 0

'all the possible DOORs
Public Const DOOROPEN = vbWhite
Public Const DOORBLUE = vbBlue
Public Const DOORYELLOW = vbYellow
Public Const DOORRED = vbRed
Public Const DOORGREEN = vbGreen

'All the INVENTORY items
Public Const INVENTORYKEYBLUE = 1
Public Const INVENTORYKEYYELLOW = 2
Public Const INVENTORYKEYRED = 3
Public Const INVENTORYKEYGREEN = 4
Public Const INVENTORYGUN = 5

'Directions. Used in Move functions of both Hero
'and Baddie
Public Const RIGHT = 1
Public Const DOWN = 2
Public Const LEFT = 3
Public Const UP = 4

'States for Baddie
Public Const DISABLED = 0
'const dead is already declared down below in the
'game states!!! No need for
'second declaration!!!
Public Const ACTIVE = 2

'Variable for gamestatus (is the game on?
'Is Q-Bert still alive, etc.
Public GameStatus As Integer

'msgbox return
Public Response

'Player's score
Public Score As Long

'the level the player's on
Public CurrentLevel As Integer
Public TimerCounter As Integer

'this is the most important variable of the game.
'the first two dimensions are the gameboard, x and
'y respectively. The second is everything you
'need to know about the blocks
Public GameBoard(10, 10, MAXNEEDEDDIMENSIONS) As Double

'Do you have an item or not
Public Inventory(5) As Integer

'this is used in the UpdateBoard section to check
'if it needs to put a different picture in the box
'I put it here for some reason
Public LastUpdated(10, 10) As Double

'Where is the transporter block? Important for
'getting rid of the walls around it
Public TransporterHere(10, 10) As Integer

'how many baddies have been activated in the
'beginning of the level?
Public HowManyBaddies As Integer

'I didn't get around to putting sounds in. Sorry!
Public Declare Function sndPlaySound Lib "winmm" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer

'some constants that are used in places
Public Const gProgramVersion = "2.00.0000"
Public Const MsgBoxTitle = "Q-Bert II"

'these constants are used to see what has happened
Public Const DEAD = 1
Public Const NOTGAME = 2
Public Const PAUSEGAME = 3
Public Const YESGAME = 4
Public Const WIN = 5

'here's where the baddie's and QBert gets defined.
Public QBertChar As New Hero
'unknown amount of Baddies: every level a different
'amount
Public Baddies() As New Baddie
'''''''''''''''''''''''''''''''''''''''''''''
'           Sub ErrHandlerr()               '
'           Another remnant of the original '
'           Q-Bert.                         '
'''''''''''''''''''''''''''''''''''''''''''''
Sub ErrHandlerr()
'in case something bad happens
Response = MsgBox("Error " & Err & " occurred" & (Chr(13)) & Error$, vbCritical, MsgBoxTitle)
End
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Sub ErrHandlerr2()              '
'           Usually happens when someone    '
'           tampers with Q-Bert II files    '
'''''''''''''''''''''''''''''''''''''''''''''
Sub ErrHandlerr2()
'in case sopmething real bad happens
Response = MsgBox("Abnormal error", vbCritical, MsgBoxTitle)
End
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'           Sub Main()                      '
'           Here's where it all begins!     '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Sub Main()
'show the first form to start Q-Bert II!
frmSplash.Show
End Sub
'''''''''''''''''''''''''''''''''''''''''''''
'  Public Sub PlaySound(SoundName As String)'
'  to play sounds.                          '
'  Not used much.                            '
'''''''''''''''''''''''''''''''''''''''''''''
Public Sub PlaySound(SoundName As String)
On Error GoTo errhandler 'just in case
Dim X As Long
X = sndPlaySound(SoundName, SND_ASYNC + SND_NODEFAULT)
Exit Sub
errhandler:
Response = MsgBox("Error during music startup. Check files.", vbCritical, MsgBoxTitle)
End
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''
' Public Sub CheckHighScores(HighScore As Integer)'
' See if there's a new high score and write it    '
' accordingly.                                    '
'''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub CheckHighScores(HighScore As Long)
On Error GoTo errhandler 'just in case
Dim FileName As String
Dim HighScores(10) As HighScoreRecord
Dim iFileNum As Integer
Dim RecordNumber As Integer
Dim ToSet As Integer

'open the highscores file:
FileName = App.Path & "\HighScores.dat"
iFileNum = FreeFile
Open FileName For Random As iFileNum

'if the file doesn't exist, write the defaults in
If LOF(iFileNum) = 0 Then
    HighScores(1).Name = "Nobody"
    HighScores(1).Score = 500
    For RecordNumber = 1 To 10
        Put iFileNum, RecordNumber, HighScores(1)
    Next RecordNumber
End If

'Put the scores all in to the variable
'for easy checking
For RecordNumber = 1 To 10
    Get iFileNum, RecordNumber, HighScores(RecordNumber)
Next RecordNumber
'if the score of the player is smaller then the
'smallest score on the high scores,
'don't put it there
If Score <= HighScores(10).Score Then
    Close iFileNum
    Exit Sub
End If
'then scheck where that the highscore has to be
'placed
If HighScore > HighScores(1).Score Then
    ToSet = 1
ElseIf HighScore > HighScores(2).Score Then
    ToSet = 2
ElseIf HighScore > HighScores(3).Score Then
    ToSet = 3
ElseIf HighScore > HighScores(4).Score Then
    ToSet = 4
ElseIf HighScore > HighScores(5).Score Then
    ToSet = 5
ElseIf HighScore > HighScores(6).Score Then
    ToSet = 6
ElseIf HighScore > HighScores(7).Score Then
    ToSet = 7
ElseIf HighScore > HighScores(8).Score Then
    ToSet = 8
ElseIf HighScore > HighScores(9).Score Then
    ToSet = 9
Else
    ToSet = 10
End If
'if ToSet is 10, no moving is needed, otherwise,
'it is. ex: the player's score is 50. The
'current entries are 40 and 60. The 60 stays on
'place 1, but 50 comes in at place 2 and 40 is
'moved down to place 3
If ToSet < 10 Then
    For RecordNumber = 10 To ToSet Step -1
        HighScores(RecordNumber) = HighScores(RecordNumber - 1)
    Next RecordNumber
End If
'Get the player's name
Again:
Response = InputBox("Congratulations! You have a high score! Please enter your name. (15 characters max.)", "High Score")
If Response = "" Then
    GoTo Again
End If
'and finally write all records in the file
HighScores(ToSet).Name = Response
HighScores(ToSet).Score = HighScore
For RecordNumber = 1 To 10
    Put iFileNum, RecordNumber, HighScores(RecordNumber)
Next RecordNumber
Close iFileNum

'then view the high scores on the form
ViewHighScores

Exit Sub
errhandler:
Response = MsgBox("Error " & Err & " occurred when opening high scores file:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbCritical + vbYesNo, "Q-bert II")
If Response = vbNo Then
    End
Else
    Resume Next
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Public Sub ViewHighScores()     '
'           View the High Scores form       '
'                                           '
'''''''''''''''''''''''''''''''''''''''''''''
Public Sub ViewHighScores()
On Error GoTo errhandler 'just in case
Dim FileName As String
Dim HighScores(10) As HighScoreRecord
Dim iFileNum As Integer
Dim RecordNumber As Integer

'open the highscores file:
iFileNum = FreeFile
FileName = App.Path & "\highscores.dat"
Open FileName For Random As iFileNum

'if the file doesn't exist, write the defaults in

If LOF(iFileNum) = 0 Then
    HighScores(1).Name = "Nobody"
    HighScores(1).Score = 500
    For RecordNumber = 1 To 10
        Put iFileNum, RecordNumber, HighScores(1)
    Next RecordNumber
End If

'Put all high scores in the variable,
'and write the variable data onto the form.
For RecordNumber = 1 To 10
    Get iFileNum, RecordNumber, HighScores(RecordNumber)
    frmHighScores.lblName(RecordNumber) = HighScores(RecordNumber).Name
    frmHighScores.lblScore(RecordNumber) = HighScores(RecordNumber).Score
Next RecordNumber

Close iFileNum 'clean up

'show the form!
frmHighScores.Show vbModal, frmGame

Exit Sub
errhandler:
'display the error, and see if the user wants to
'continue running the program
Response = MsgBox("Error " & Err & " occurred when opening high scores file:" & vbNewLine & Error$ & vbNewLine & "Continue with program?", vbCritical + vbYesNo, "Q-bert II")
If Response = vbNo Then
    End
Else
    Resume Next
End If
End Sub
