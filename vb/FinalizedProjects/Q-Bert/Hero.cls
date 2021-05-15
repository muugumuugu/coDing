VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Hero"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'This is the Hero class module, used for the
'player.

'the positioning of Q-Bert (x,y)
Private Hero As ScreenObject
'''''''''''''''''''''''''''''''''''''''''''''
'    Property Let CurrentX(GiveX As Integer)'
'    Puts the Hero's X in the               '
'    class module                           '
'''''''''''''''''''''''''''''''''''''''''''''
Property Let CurrentX(GiveX As Integer)
Hero.X = GiveX
End Property

'''''''''''''''''''''''''''''''''''''''''''''
'        Property Get CurrentX() As Integer '
'        Gets the X of the hero from the    '
'        class module                       '
'''''''''''''''''''''''''''''''''''''''''''''
Property Get CurrentX() As Integer
CurrentX = Hero.X
End Property

'''''''''''''''''''''''''''''''''''''''''''''
'    Property Let CurrentY(GiveY As Integer)'
'    Puts the Hero's Y in the               '
'    class module                           '
'''''''''''''''''''''''''''''''''''''''''''''
Property Let CurrentY(GiveY As Integer)
Hero.Y = GiveY
End Property

'''''''''''''''''''''''''''''''''''''''''''''
'        Property Get CurrentY() As Integer '
'        Gets the Y of the Hero   from the  '
'        class module                       '
'''''''''''''''''''''''''''''''''''''''''''''
Property Get CurrentY() As Integer
CurrentY = Hero.Y
End Property


'''''''''''''''''''''''''''''''''''''''''''''
'      Public Sub Move(Direction As Integer)'
'      Move Q-Bert after user presses arrow '
'      key                                  '
'''''''''''''''''''''''''''''''''''''''''''''
Public Sub Move(Direction As Integer)
'just in case
On Error GoTo errhandler
Dim OldX As Integer, OldY As Integer
Dim AllJumped As Boolean
Dim CountX As Integer, CountY As Integer

'set these variables to where Q-Bert
'is before moving
OldX = Hero.X
OldY = Hero.Y

'this If is the same thing repeate 4 times.
'What each does is it checkes if there is:
'-a door
'-a wall
'-the edge of the screen
'where Q-Bert wants to go. If any one is true,
'then keep Q-Bert where he is.
'If not, move him one place in the direction he
'wants to go
If Direction = RIGHT Then
    If Hero.X = 10 Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, RIGHTWALL) = YES Or GameBoard(Hero.X + 1, Hero.Y, LEFTWALL) = YES Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) <> NO Or GameBoard(Hero.X + 1, Hero.Y, LEFTDOORTYPE) <> NO Then
        GoTo MoveQBert
    End If
    Hero.X = Hero.X + 1
ElseIf Direction = DOWN Then
    If Hero.Y = 10 Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, DOWNWALL) = YES Or GameBoard(Hero.X, Hero.Y + 1, UPWALL) = YES Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) <> NO Or GameBoard(Hero.X, Hero.Y + 1, UPDOORTYPE) <> NO Then
        GoTo MoveQBert
    End If
    Hero.Y = Hero.Y + 1
ElseIf Direction = LEFT Then
    If Hero.X = 1 Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, LEFTWALL) = YES Or GameBoard(Hero.X - 1, Hero.Y, RIGHTWALL) = YES Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) <> NO Or GameBoard(Hero.X - 1, Hero.Y, RIGHTDOORTYPE) <> NO Then
        GoTo MoveQBert
    End If
    Hero.X = Hero.X - 1
ElseIf Direction = UP Then
    If Hero.Y = 1 Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, UPWALL) = YES Or GameBoard(Hero.X, Hero.Y - 1, DOWNWALL) = YES Then
        GoTo MoveQBert
    End If
    If GameBoard(Hero.X, Hero.Y, UPDOORTYPE) <> NO Or GameBoard(Hero.X, Hero.Y - 1, DOWNDOORTYPE) <> NO Then
        GoTo MoveQBert
    End If
    Hero.Y = Hero.Y - 1
End If
MoveQBert:
'where Q-Bert was, is now a jumped-on cube
GameBoard(OldX, OldY, BLOCKTYPE) = YESJUMP
'where he's going is now jumped on, too
GameBoard(Hero.X, Hero.Y, JUMPED) = YES
'If Q-bert jumped on a cube with a baddie,
'kill off Q-BErt and end the game
If GameBoard(Hero.X, Hero.Y, BADDIETHERE) = YES Then
    GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = QBERTDEAD
    frmGame.UpdateBoard
    GameStatus = DEAD
    CheckHighScores (Score)
    Exit Sub
End If
'if it's a transporter, start the next level
'and add some score
If GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = TRANSPORTER Then
    Score = Score + 100
    frmGame.UpdateBoard
    frmGame.InitLevel CurrentLevel + 1
End If
'if it was a plain cube that wasn't jumped on
'yet, add some score
If GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = NOJUMP Then
    Score = Score + 20
    GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = QBERT
    frmGame.UpdateBoard
End If
'if it was a jumped on cube, do nothing (special)
If GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = YESJUMP Then
    GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = QBERT
    frmGame.UpdateBoard
End If
'if it was a key or gun, add points and add it
'to the player's inventory
If GameBoard(Hero.X, Hero.Y, BLOCKTYPE) >= BLUEKEY And GameBoard(Hero.X, Hero.Y, BLOCKTYPE) <= GREENKEY Then
    Inventory(GameBoard(Hero.X, Hero.Y, BLOCKTYPE) - 4) = YES
    frmGame.picInventory(GameBoard(Hero.X, Hero.Y, BLOCKTYPE) - 4).Visible = True
    GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = QBERT
    Score = Score + 70
End If
If GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = GUN Then
    Inventory(INVENTORYGUN) = YES
    frmGame.picInventory(INVENTORYGUN).Visible = True
    frmGame.lblBullets = 8
    frmGame.lblBullets.Visible = True
    GameBoard(Hero.X, Hero.Y, BLOCKTYPE) = QBERT
    Score = Score + 80
End If
'if it was marked trapblock, release some
'baddies
If GameBoard(Hero.X, Hero.Y, TRAPBLOCK) = YES Then
    GameBoard(Hero.X, Hero.Y, TRAPBLOCK) = NO
    frmGame.ReleaseBaddies
End If

'update the label with the score
frmGame.lblScore = Score

'now check if all the cubes have been jumped on
'If they have, get rid of the walls around the
'transporter
AllJumped = True
For CountX = 1 To 10
    For CountY = 1 To 10
        If GameBoard(CountX, CountY, JUMPED) = NO Then
            AllJumped = False
            Exit For
        End If
    Next CountY
Next CountX
If AllJumped = True Then
    For CountX = 1 To 10
        For CountY = 1 To 10
            If TransporterHere(CountX, CountY) = YES Then
                GameBoard(CountX, CountY, LEFTWALL) = NO
                GameBoard(CountX, CountY, RIGHTWALL) = NO
                GameBoard(CountX, CountY, UPWALL) = NO
                GameBoard(CountX, CountY, DOWNWALL) = NO
                If Not (CountX = 1) Then
                    GameBoard(CountX - 1, CountY, RIGHTWALL) = NO
                    frmGame.picBoard(CountX - 1 & CountY).Cls
                End If
                If Not (CountX = 10) Then
                    GameBoard(CountX + 1, CountY, LEFTWALL) = NO
                    frmGame.picBoard(CountX + 1 & CountY).Cls
                End If
                If Not (CountY = 1) Then
                    GameBoard(CountX, CountY - 1, DOWNWALL) = NO
                    frmGame.picBoard(CountX & CountY - 1).Cls
                End If
                If Not (CountY = 10) Then
                    GameBoard(CountX, CountY + 1, UPWALL) = NO
                    frmGame.picBoard(CountX & CountY + 1).Cls
                End If
                frmGame.picBoard(CountX & CountY).Cls
                Exit For
            End If
        Next CountY
    Next CountX
End If
frmGame.UpdateBoard
Exit Sub
'just in case
errhandler:
ErrHandlerr
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Public Sub OpenDoors()          '
'           Occurs when user presses the    '
'           spacebar. Opens all doors the   '
'           player has access to (open doors'
'           doors player has keys to)       '
'''''''''''''''''''''''''''''''''''''''''''''
Public Sub OpenDoors()
Dim SomethingHappened As Boolean

'nothing happened yet, no need to updateboard
'will get set to true if a door is opened
SomethingHappened = False

'the rest of the sub is just a lot of the same
'with minor changes like BLUE into RED and things
'like that. I'm only going to comment the first
'one.

'if there is a open door to be opened to Q-Bert's
'right, get rid of it, and the left door next to
'the right door (which there should) delete that,
'too. Then clear those two pictureboxes and make
'sure UpdateBoard is called to update changes
'(this is done with the SomeThingHappened bool.
If GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = DOOROPEN Then
    GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 10) Then
        GameBoard(Hero.X + 1, Hero.Y, LEFTDOORTYPE) = NO
        frmGame.picBoard(Hero.X + 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = DOOROPEN Then
    GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 1) Then
        GameBoard(Hero.X - 1, Hero.Y, RIGHTDOORTYPE) = NO
        frmGame.picBoard(Hero.X - 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = DOOROPEN Then
    GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 1) Then
        GameBoard(Hero.X, Hero.Y - 1, DOWNDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y - 1).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = DOOROPEN Then
    GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 10) Then
        GameBoard(Hero.X, Hero.Y + 1, UPDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y + 1).Cls
    End If
    SomethingHappened = True
End If

If GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = DOORBLUE And Inventory(INVENTORYKEYBLUE) = YES Then
    GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 10) Then
        GameBoard(Hero.X + 1, Hero.Y, LEFTDOORTYPE) = NO
        frmGame.picBoard(Hero.X + 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = DOORBLUE And Inventory(INVENTORYKEYBLUE) = YES Then
    GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 1) Then
        GameBoard(Hero.X - 1, Hero.Y, RIGHTDOORTYPE) = NO
        frmGame.picBoard(Hero.X - 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = DOORBLUE And Inventory(INVENTORYKEYBLUE) = YES Then
    GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 1) Then
        GameBoard(Hero.X, Hero.Y - 1, DOWNDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y - 1).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = DOORBLUE And Inventory(INVENTORYKEYBLUE) = YES Then
    GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 10) Then
        GameBoard(Hero.X, Hero.Y + 1, UPDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y + 1).Cls
    End If
    SomethingHappened = True
End If

If GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = DOORRED And Inventory(INVENTORYKEYRED) = YES Then
    GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 10) Then
        GameBoard(Hero.X + 1, Hero.Y, LEFTDOORTYPE) = NO
        frmGame.picBoard(Hero.X + 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = DOORRED And Inventory(INVENTORYKEYRED) = YES Then
    GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 1) Then
        GameBoard(Hero.X - 1, Hero.Y, RIGHTDOORTYPE) = NO
        frmGame.picBoard(Hero.X - 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = DOORRED And Inventory(INVENTORYKEYRED) = YES Then
    GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 1) Then
        GameBoard(Hero.X, Hero.Y - 1, DOWNDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y - 1).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = DOORRED And Inventory(INVENTORYKEYRED) = YES Then
    GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 10) Then
        GameBoard(Hero.X, Hero.Y + 1, UPDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y + 1).Cls
    End If
    SomethingHappened = True
End If

If GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = DOORGREEN And Inventory(INVENTORYKEYGREEN) = YES Then
    GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 10) Then
        GameBoard(Hero.X + 1, Hero.Y, LEFTDOORTYPE) = NO
        frmGame.picBoard(Hero.X + 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = DOORGREEN And Inventory(INVENTORYKEYGREEN) = YES Then
    GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 1) Then
        GameBoard(Hero.X - 1, Hero.Y, RIGHTDOORTYPE) = NO
        frmGame.picBoard(Hero.X - 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = DOORGREEN And Inventory(INVENTORYKEYGREEN) = YES Then
    GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 1) Then
        GameBoard(Hero.X, Hero.Y - 1, DOWNDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y - 1).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = DOORGREEN And Inventory(INVENTORYKEYGREEN) = YES Then
    GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 10) Then
        GameBoard(Hero.X, Hero.Y + 1, UPDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y + 1).Cls
    End If
    SomethingHappened = True
End If

If GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = DOORYELLOW And Inventory(INVENTORYKEYYELLOW) = YES Then
    GameBoard(Hero.X, Hero.Y, RIGHTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 10) Then
        GameBoard(Hero.X + 1, Hero.Y, LEFTDOORTYPE) = NO
        frmGame.picBoard(Hero.X + 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = DOORYELLOW And Inventory(INVENTORYKEYYELLOW) = YES Then
    GameBoard(Hero.X, Hero.Y, LEFTDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.X = 1) Then
        GameBoard(Hero.X - 1, Hero.Y, RIGHTDOORTYPE) = NO
        frmGame.picBoard(Hero.X - 1 & Hero.Y).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = DOORYELLOW And Inventory(INVENTORYKEYYELLOW) = YES Then
    GameBoard(Hero.X, Hero.Y, UPDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 1) Then
        GameBoard(Hero.X, Hero.Y - 1, DOWNDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y - 1).Cls
    End If
    SomethingHappened = True
End If
If GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = DOORYELLOW And Inventory(INVENTORYKEYYELLOW) = YES Then
    GameBoard(Hero.X, Hero.Y, DOWNDOORTYPE) = NO
    frmGame.picBoard(Hero.X & Hero.Y).Cls
    If Not (Hero.Y = 10) Then
        GameBoard(Hero.X, Hero.Y + 1, UPDOORTYPE) = NO
        frmGame.picBoard(Hero.X & Hero.Y + 1).Cls
    End If
    SomethingHappened = True
End If

'if a door was opened, update the board.
If SomethingHappened = True Then
    frmGame.UpdateBoard
End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Public Sub Shoot()              '
'           Shoot baddie if user has gun    '
'           after user presses CTRL         '
'''''''''''''''''''''''''''''''''''''''''''''
Public Sub Shoot()
Dim CountX1 As Integer, CountY1 As Integer
Dim CountX2 As Integer, CountY2 As Integer
Dim AimX As Integer, AimY As Integer
Dim AimerX As Integer, AimerY As Integer

'if the user doesn't have a gun or doesn't have
'any more bullets, the user can't shoot.
If frmGame.lblBullets = 0 Or frmGame.lblBullets.Visible = False Then
    Exit Sub
End If

AimY = Hero.Y
AimX = Hero.X

'this For sees where the nearest baddie is to
'Q-Bert's right; it stops looking after the
'edge of the screen or after a wall.
For CountX1 = AimX To 10 Step 1
    If GameBoard(CountX1, AimY, BADDIETHERE) = YES Then
        Exit For
    End If
    If GameBoard(CountX1, AimY, RIGHTWALL) = YES Then
        CountX1 = 11
        Exit For
    End If
Next CountX1

'this For sees where the nearest baddie is to
'Q-Bert's left; it stops looking after the
'edge of the screen or after a wall.
For CountX2 = AimX To 1 Step -1
    If GameBoard(CountX2, AimY, BADDIETHERE) = YES Then
        Exit For
    End If
    If GameBoard(CountX2, AimY, LEFTWALL) = YES Then
        CountX2 = 0
        Exit For
    End If
Next CountX2

'this For sees where the nearest baddie is under
'Q-Bert; it stops looking after the
'edge of the screen or after a wall.
For CountY1 = AimY To 10 Step 1
    If GameBoard(AimX, CountY1, BADDIETHERE) = YES Then
        Exit For
    End If
    If GameBoard(AimX, CountY1, DOWNWALL) = YES Then
        CountY1 = 11
        Exit For
    End If
Next CountY1

'this For sees where the nearest baddie is above
'Q-Bert; it stops looking after the
'edge of the screen or after a wall.
For CountY2 = AimY To 1 Step -1
    If GameBoard(AimX, CountY2, BADDIETHERE) = YES Then
        Exit For
    End If
    If GameBoard(AimX, CountY2, UPWALL) = YES Then
        CountY2 = 0
        Exit For
    End If
Next CountY2

'now we see if one of the X shooting (shooting
'left or right) doesn't shoot anything
'(CountX1=11? & CountX2=0?) and if they are,
'set AimerX accordingly.
'AimerX=0 means: no left or right shooting
'AimerX=1 means: shoot right (CountX1)
'AimerX=2 means: shoot left (CountX2)
If CountX1 = 11 And CountX2 = 0 Then
    AimerX = 0
ElseIf CountX1 = 11 Then
    AimerX = 2
ElseIf CountX2 = 0 Then
    AimerX = 1
ElseIf CountX1 - AimX < AimX - CountX2 Then
    AimerX = 1
ElseIf CountX1 - AimX > AimX - CountX2 Then
    AimerX = 2
Else
    Randomize
    AimerX = (Rnd * 2) + 1
End If

'now we do the same thing as above, only with
'up and down this time
If CountY1 = 11 And CountY2 = 0 Then
    AimerY = 0
ElseIf CountY1 = 11 Then
    AimerY = 2
ElseIf CountY2 = 0 Then
    AimerY = 1
ElseIf CountY1 - AimY < AimY - CountY2 Then
    AimerY = 1
ElseIf CountY1 - AimY > AimY - CountY2 Then
    AimerY = 2
Else
    Randomize
    AimerY = (Rnd * 2) + 1
End If

'now we check if it was a worthless bullet and
'needs no further calculations (meaning it
'didn't hit anyone)
If AimerX = 0 And AimerY = 0 Then
    frmGame.lblBullets = Int(frmGame.lblBullets) - 1
    Exit Sub
End If

'now, another one of those huge If statements.
'It sees which X & Y's to take (If AimerX=1,...)
'and it sees which is the closest to Q-Bert,
'and obviously the most dangerous baddie.
'When it has determined that, it shoots that
'baddie by calling the ShootBaddie sub.
If AimerX = 1 Then
    If AimerY = 1 Then
        If CountX1 - AimX > CountY1 - AimY Then
            ShootBaddie AimX, CountY1
        Else
            ShootBaddie CountX1, AimY
        End If
    ElseIf AimerY = 2 Then
        If CountX1 - AimX > AimY - CountY2 Then
            ShootBaddie AimX, CountY2
        Else
            ShootBaddie CountX1, AimY
        End If
    Else
        ShootBaddie CountX1, AimY
    End If
ElseIf AimerX = 2 Then
    If AimerY = 1 Then
        If AimX - CountX2 > CountY1 - AimY Then
            ShootBaddie AimX, CountY1
        Else
            ShootBaddie CountX2, AimY
        End If
    ElseIf AimerY = 2 Then
        If AimX - CountX2 > AimY - CountY2 Then
            ShootBaddie AimX, CountY2
        Else
            ShootBaddie CountX2, AimY
        End If
    Else
        ShootBaddie CountX2, AimY
    End If
Else
    If AimerY = 1 Then
        ShootBaddie AimX, CountY1
    Else
        ShootBaddie AimX, CountY2
    End If
End If

'now subtract a bullet
frmGame.lblBullets = Int(frmGame.lblBullets) - 1
'and update changes
frmGame.UpdateBoard
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Public Sub ShootBaddie(WhichX As Integer, WhichY As Integer)'
'Shoot baddie if user has gun                                '
'after user presses CTRL                                     '
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub ShootBaddie(WhichX As Integer, WhichY As Integer)
Dim CountX As Integer

'where Q-Bert's shooting, there's no Baddie
'anymore
GameBoard(WhichX, WhichY, BADDIETHERE) = NO

'now we set the block to be a block without the
'baddie
If GameBoard(WhichX, WhichY, BLOCKTYPE) < 5 Then
    GameBoard(WhichX, WhichY, BLOCKTYPE) = GameBoard(WhichX, WhichY, BLOCKTYPE) - 2
ElseIf GameBoard(WhichX, WhichY, BLOCKTYPE) < 13 Then
    GameBoard(WhichX, WhichY, BLOCKTYPE) = GameBoard(WhichX, WhichY, BLOCKTYPE) - 4
ElseIf GameBoard(WhichX, WhichY, BLOCKTYPE) = BADDIEGUN Then
    GameBoard(WhichX, WhichY, BLOCKTYPE) = GUN
End If
'then we see which one of the baddies just got
'shot and disable him from doing anything
For CountX = 1 To HowManyBaddies
    If Baddies(CountX).CurrentX = WhichX And Baddies(CountX).CurrentY = WhichY Then
        Baddies(CountX).Enabled = DEAD
    End If
Next CountX
End Sub

