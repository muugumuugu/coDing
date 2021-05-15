Attribute VB_Name = "mdlMain"
Option Explicit
'used in UpdateBoard procedure
Public Const CUBEHEIGHT = 735
Public Const CUBEWIDTH = 735

'used in LastUpdated and GameBoard collections
'used to store everything about a block
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
'yesjump not used in level editor
Public Const BADDIENOJUMP = 3
'baddieyesjump not used in level editor
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
'I originally had an unkillable baddie,
'but I figured out that it would be rather
'impossible to implement it.
'I kept it here because I might use it in
'future versions.
Public Const BADDIENOEND = 15
Public Const TRANSPORTER = 16
Public Const QBERT = 17
'qbertdead not used in level editor

'wall tools
Public Const LEFTWALLTOOL = 19
Public Const RIGHTWALLTOOL = 20
Public Const UPWALLTOOL = 21
Public Const DOWNWALLTOOL = 22

'door tools
Public Const LEFTDOORTOOL = 23
Public Const RIGHTDOORTOOL = 24
Public Const UPDOORTOOL = 25
Public Const DOWNDOORTOOL = 26

'tool to clear walls, doors and trapblocks
Public Const CLEARTOOL = 27

'tool to set trapblock
Public Const TRAPBLOCKSETTER = 28

'General things. Used everywhere. Didn't want to
'use True and False because it might have
'unknown effects
Public Const YES = 1
Public Const NO = 0

'all the possible DOORs
Public Const DOOROPEN = vbWhite
Public Const DOORBLUE = vbBlue
Public Const DOORYELLOW = vbYellow
Public Const DOORRED = vbRed
Public Const DOORGREEN = vbGreen

'Used to hold all info about the board:
'the first ten is the X axis, the second 10 is
'the Y axis and MAXNEEDEDDIMENSIONS is all the
'info needed about the block
'Notice: I had this set to a Single before I
'noticed that a open door (white door) showed
'up as a black wall. This was due to the fact
'that a Single isn't precise enough for the colors
'that it was handling; this was the main reason
'of Q-Bert II's late release (it was planned for
'January 1st)
Public GameBoard(10, 10, MAXNEEDEDDIMENSIONS) As Double

'for the UpdateBoard procedure: checks to see
'if screen needs updating
'I had originally used this for every dimension
'now I only use it for the blocktype but I'm too
'lazy to change it
Public LastUpdated(10, 10, MAXNEEDEDDIMENSIONS) As Double

'Is there a transporter here or not?
'I could make this a extra dimension on
'the GameBoard, but when I realized that, it
'was too late because I had used it countless
'times and I wasn't about to go change them all.
Public TransporterHere(10, 10) As Integer
'What is the current selected tool
Public CurrentTool As Integer

'The current Color of the doors
Public LeftDoorColor As Single
Public RightDoorColor As Single
Public UpDoorColor As Single
Public DownDoorColor As Single

'The file currently being edited
Public CurrentFileName As String
