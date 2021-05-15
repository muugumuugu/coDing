VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Baddie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'This is the Baddie class used to handle
'a single Baddie. The collection of Baddies
'(see mdlMain) has a collection of this
'class.
'there is a new pathfinding technique,
'improved for compensating for the walls
'and doors, and making the Baddie favor moving,
'even if it's away from Q-Bert (this allows the
'player to see which baddies are enabled)

'the positioning of the Baddie (x,y)
Private Baddie As ScreenObject
'Is the Baddie allowed to move?
Private IsEnabled As Integer
'''''''''''''''''''''''''''''''''''''''''''''
'        Property Let CurrentX(X As Integer)'
'        Puts the Baddie's X in the         '
'        class module                       '
'''''''''''''''''''''''''''''''''''''''''''''
Property Let CurrentX(X As Integer)
Baddie.X = X
End Property

'''''''''''''''''''''''''''''''''''''''''''''
'        Property Get CurrentX() As Integer '
'        Gets the X of the Baddie from the  '
'        class module                       '
'''''''''''''''''''''''''''''''''''''''''''''
Property Get CurrentX() As Integer
CurrentX = Baddie.X
End Property
'''''''''''''''''''''''''''''''''''''''''''''
'         Property Let Enabled(X As Integer)'
'         Put the Enabled Boolean in the    '
'         class module                      '
'''''''''''''''''''''''''''''''''''''''''''''
Property Let Enabled(X As Integer)
IsEnabled = X
End Property

'''''''''''''''''''''''''''''''''''''''''''''
'         Property Get Enabled() As Integer '
'         Get the Boolean from the          '
'         class module.                     '
'''''''''''''''''''''''''''''''''''''''''''''
Property Get Enabled() As Integer
Enabled = IsEnabled
End Property
'''''''''''''''''''''''''''''''''''''''''''''
'        Property Let CurrentY(Y As Integer)'
'        Puts the Baddie's Y in the         '
'        class module                       '
'''''''''''''''''''''''''''''''''''''''''''''
Property Let CurrentY(Y As Integer)
Baddie.Y = Y
End Property
'''''''''''''''''''''''''''''''''''''''''''''
'        Property Get CurrentY() As Integer '
'        Gets the Y of the Baddie from the  '
'        class module                       '
'''''''''''''''''''''''''''''''''''''''''''''
Property Get CurrentY() As Integer
CurrentY = Baddie.Y
End Property

'''''''''''''''''''''''''''''''''''''''''''''
'           Public Sub Move()               '
'           This is the biggest thing in the'
'           Baddie Class Module. It         '
'           where the baddie can and want to'
'           move to and moves it accordingly'
'''''''''''''''''''''''''''''''''''''''''''''
Public Sub Move()
'the moves it can't make
Dim DisabledMoves(4) As Boolean
'can it move at all?
Dim AllDisabled As Boolean
'where it is now
Dim CurX As Integer
Dim CurY As Integer
'where it want to go to (Q-Bert's X & Y)
Dim AimX As Integer
Dim AimY As Integer
'a counter
Dim CounterX As Integer
'where does it want to go to, in order of
'favor
Dim BestMove(4) As Integer

'set these variables
CurX = Baddie.X
CurY = Baddie.Y
AimX = QBertChar.CurrentX
AimY = QBertChar.CurrentY

'this section is repeated 4 times.
'Only the first is commented, but look at
'the first to see commenting

'if it's all the way to the right, it can't move right
If CurX >= 10 Then
    DisabledMoves(RIGHT) = True
'or there's a wall, door, or other baddie
'blocking it's way, it can't move right
ElseIf GameBoard(CurX, CurY, RIGHTWALL) = YES _
Or GameBoard(CurX, CurY, RIGHTDOORTYPE) <> NO _
Or GameBoard(CurX + 1, CurY, BLOCKTYPE) = TRANSPORTER _
Or GameBoard(CurX + 1, CurY, BADDIETHERE) = YES Then
    DisabledMoves(RIGHT) = True
End If

If CurY >= 10 Then
    DisabledMoves(DOWN) = True
ElseIf GameBoard(CurX, CurY, DOWNWALL) = YES _
Or GameBoard(CurX, CurY, DOWNDOORTYPE) <> NO _
Or GameBoard(CurX, CurY + 1, BLOCKTYPE) = TRANSPORTER _
Or GameBoard(CurX, CurY + 1, BADDIETHERE) = YES Then
    DisabledMoves(DOWN) = True
End If

If CurX <= 1 Then
    DisabledMoves(LEFT) = True
ElseIf GameBoard(CurX, CurY, LEFTWALL) = YES _
Or GameBoard(CurX, CurY, LEFTDOORTYPE) <> NO _
Or GameBoard(CurX - 1, CurY, BLOCKTYPE) = TRANSPORTER _
Or GameBoard(CurX - 1, CurY, BADDIETHERE) = YES Then
    DisabledMoves(LEFT) = True
End If

If CurY <= 1 Then
    DisabledMoves(UP) = True
ElseIf GameBoard(CurX, CurY, UPWALL) = YES _
Or GameBoard(CurX, CurY, UPDOORTYPE) <> NO _
Or GameBoard(CurX, CurY - 1, BLOCKTYPE) = TRANSPORTER _
Or GameBoard(CurX, CurY - 1, BADDIETHERE) = YES Then
    DisabledMoves(UP) = True
End If

'now to see if the baddie is trapped on all sides
AllDisabled = True
For CounterX = 1 To 4
    If Not (DisabledMoves(CounterX) = True) Then
        AllDisabled = False
        Exit For
    End If
Next CounterX
If AllDisabled = True Then
'if he can't move anywhere, no use in going on
    Exit Sub
End If

'following is the algorithm used to move the
'baddie. If anyone has a better way of
'doing this, meaning a way to do it that
'it doesn't take all this repeated code
'please mail it to me at:
'drmayerson@tiscalinet.be
'this algorithm has been optimized to the point
'where there just can't be any mistakes in it.
'I'll try to explain everything

'CurX < AimX means: baddie is left of Q-Bert
'CurY < AimY means: baddie is above Q-Bert
'CurX > AimX means: baddie is right of Q-Bert
'CurY > AimY means: baddie is under Q-Bert
'now, as you can see in the section here,
'we check to see if the baddie is to Q-Bert's
'left, if it is, see if the baddie is under
'Q-Bert.
'AimX-CurX means: the difference between the X
'of the baddie and the X of Q-Bert
'If this difference is greater then the
'difference between the Y's, the baddie's
'most favorable move is right, second
'down, and left and up as the last choices.
'Why move him at all, if it's only going to
'make him go away from Q-Bert? Well, the player
'has to be able to know which baddies are enabled
'and which are. This is another recognition
'method. Of course, if the baddie can't move
'anywhere, you won't see it moving!
'the rest of the Algorithm (lots of If's inside
'one big one!) is just the same, except for the
'important If AimX - Curx > Aimy - CurY Then
'has lot's of variations.
'If this wasn't clear, feel free to ask me any
'questions by sending a mail to:
'drmayerson@tiscalinet.be
If CurX < AimX Then
    If CurY < AimY Then
        If AimX - CurX > AimY - CurY Then
            BestMove(1) = RIGHT
            BestMove(2) = DOWN
            BestMove(3) = LEFT
            BestMove(4) = UP
        ElseIf AimX - CurX < AimY - CurY Then
            BestMove(1) = DOWN
            BestMove(2) = RIGHT
            BestMove(3) = UP
            BestMove(4) = LEFT
        Else
            BestMove(1) = (Rnd * 2) + 1
            If BestMove(1) = 1 Then
                BestMove(1) = RIGHT
                BestMove(2) = DOWN
                BestMove(3) = LEFT
                BestMove(4) = UP
            Else
                BestMove(1) = DOWN
                BestMove(2) = RIGHT
                BestMove(3) = UP
                BestMove(4) = LEFT
            End If
        End If
    ElseIf CurY > AimY Then
        If AimX - CurX > CurY - AimY Then
            BestMove(1) = RIGHT
            BestMove(2) = UP
            BestMove(3) = LEFT
            BestMove(4) = DOWN
        ElseIf AimX - CurX < CurY - AimY Then
            BestMove(1) = UP
            BestMove(2) = RIGHT
            BestMove(3) = DOWN
            BestMove(4) = LEFT
        Else
            BestMove(1) = (Rnd * 2) + 1
            If BestMove(1) = 1 Then
                BestMove(1) = RIGHT
                BestMove(2) = UP
                BestMove(3) = LEFT
                BestMove(4) = DOWN
            Else
                BestMove(1) = UP
                BestMove(2) = RIGHT
                BestMove(3) = DOWN
                BestMove(4) = LEFT
            End If
        End If
    Else
        BestMove(1) = RIGHT
        BestMove(2) = LEFT
        BestMove(3) = (Rnd * 2) + 1
        If BestMove(3) = 1 Then
            BestMove(3) = UP
            BestMove(4) = DOWN
        Else
            BestMove(3) = DOWN
            BestMove(4) = UP
        End If
    End If
ElseIf CurX > AimX Then
    If CurY < AimY Then
        If CurX - AimX > AimY - CurY Then
            BestMove(1) = LEFT
            BestMove(2) = DOWN
            BestMove(3) = RIGHT
            BestMove(4) = UP
        ElseIf CurX - AimX < AimY - CurY Then
            BestMove(1) = DOWN
            BestMove(2) = LEFT
            BestMove(3) = UP
            BestMove(4) = RIGHT
        Else
            BestMove(1) = (Rnd * 2) + 1
            If BestMove(1) = 1 Then
                BestMove(1) = LEFT
                BestMove(2) = DOWN
                BestMove(3) = RIGHT
                BestMove(4) = UP
            Else
                BestMove(1) = DOWN
                BestMove(2) = LEFT
                BestMove(3) = UP
                BestMove(4) = RIGHT
            End If
        End If
    ElseIf CurY > AimY Then
        If CurX - AimX > CurY - AimY Then
            BestMove(1) = LEFT
            BestMove(2) = UP
            BestMove(3) = RIGHT
            BestMove(4) = DOWN
        ElseIf CurX - AimX < CurY - AimY Then
            BestMove(1) = UP
            BestMove(2) = LEFT
            BestMove(3) = DOWN
            BestMove(4) = RIGHT
        Else
            BestMove(1) = (Rnd * 2) + 1
            If BestMove(1) = 1 Then
                BestMove(1) = LEFT
                BestMove(2) = UP
                BestMove(3) = RIGHT
                BestMove(4) = DOWN
            Else
                BestMove(1) = UP
                BestMove(2) = LEFT
                BestMove(3) = DOWN
                BestMove(4) = RIGHT
            End If
        End If
    Else
        BestMove(1) = LEFT
        BestMove(2) = RIGHT
        BestMove(3) = (Rnd * 2) + 1
        If BestMove(3) = 1 Then
            BestMove(3) = UP
            BestMove(4) = DOWN
        Else
            BestMove(3) = DOWN
            BestMove(4) = UP
        End If
    End If
Else
    If CurY < AimY Then
        BestMove(1) = DOWN
        BestMove(2) = UP
        BestMove(3) = (Rnd * 2) + 1
        If BestMove(3) = 1 Then
            BestMove(3) = LEFT
            BestMove(4) = RIGHT
        Else
            BestMove(3) = RIGHT
            BestMove(4) = LEFT
        End If
    ElseIf CurY > AimY Then
        BestMove(1) = UP
        BestMove(2) = DOWN
        BestMove(3) = (Rnd * 2) + 1
        If BestMove(3) = 1 Then
            BestMove(3) = LEFT
            BestMove(4) = RIGHT
        Else
            BestMove(3) = RIGHT
            BestMove(4) = LEFT
        End If
    End If
End If


'now we compare the moves the baddie wants to
'do to the ones it can't
'we check them, one by one, until one is found
'that it can move. Then it calles the MoveB
'sub to do the actual moving.
If DisabledMoves(BestMove(1)) = True Then
    If DisabledMoves(BestMove(2)) = True Then
        If DisabledMoves(BestMove(3)) = True Then
            MoveB BestMove(4)
        Else
            MoveB BestMove(3)
        End If
    Else
        MoveB BestMove(2)
    End If
Else
    MoveB BestMove(1)
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'    Private Sub MoveB(Direction As Integer)'
'    Called by the Move sub: it moves the   '
'    baddie on the screen                   '
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub MoveB(Direction As Integer)

Dim OldX As Integer, OldY As Integer

'where the baddie is before moving
OldX = Baddie.X
OldY = Baddie.Y

'now set the new X & Y for the baddie
If Direction = RIGHT Then
    Baddie.X = Baddie.X + 1
ElseIf Direction = DOWN Then
    Baddie.Y = Baddie.Y + 1
ElseIf Direction = LEFT Then
    Baddie.X = Baddie.X - 1
ElseIf Direction = UP Then
    Baddie.Y = Baddie.Y - 1
End If

'there isn't a baddie on the old field anymore
'(two baddies aren't allowed to be on the same
'field
GameBoard(OldX, OldY, BADDIETHERE) = NO
'see if the baddie had a key, gun or nothing on
'it's field and set it''s picture accordingly
If GameBoard(OldX, OldY, BLOCKTYPE) < 5 Then
    GameBoard(OldX, OldY, BLOCKTYPE) = GameBoard(OldX, OldY, BLOCKTYPE) - 2
ElseIf GameBoard(OldX, OldY, BLOCKTYPE) < 13 Then
    GameBoard(OldX, OldY, BLOCKTYPE) = GameBoard(OldX, OldY, BLOCKTYPE) - 4
ElseIf GameBoard(OldX, OldY, BLOCKTYPE) = BADDIEGUN Then
    GameBoard(OldX, OldY, BLOCKTYPE) = GUN
End If

'there is a baddie on this field now
GameBoard(Baddie.X, Baddie.Y, BADDIETHERE) = YES
'see if the baddie moved on a gun, key or nothing
'and set the picture accordingly
'if the baddie landed on Q-Bert,
'kill him and end the game.
'and then update the board, so the player can
'see everything that happpened
If GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) < 3 Then
    GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) = GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) + 2
    frmGame.UpdateBoard
ElseIf GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) < 9 Then
    GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) = GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) + 4
    frmGame.UpdateBoard
ElseIf GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) = GUN Then
    GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) = BADDIEGUN
    frmGame.UpdateBoard
ElseIf GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) = QBERT Then
    GameBoard(Baddie.X, Baddie.Y, BLOCKTYPE) = QBERTDEAD
    frmGame.UpdateBoard
    GameStatus = DEAD
    CheckHighScores (Score)
End If
End Sub


