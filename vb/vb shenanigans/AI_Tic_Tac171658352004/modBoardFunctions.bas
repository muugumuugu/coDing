Attribute VB_Name = "modBoardFunctions"
Option Explicit
Public currentPlayer As Integer
Public NumCellFilled As Integer
Public MarkSuccessful As Boolean

'Reset game board
Public Function newgame()

    Call clearboard
    Call clearhistory

    GameEnd = False
    NumCellFilled = 0
    currentPlayer = 1
    MarkSuccessful = True

End Function

'Clear player's history steps
Private Function clearhistory()

    frmMain.lblPly1Steps = ""
    frmMain.lblPly2Steps = ""
    frmMain.lblHistory = ""
    player(1).History = ""
    player(2).History = ""

End Function

'Show player's history steps
Private Function printhistory(cell As Integer)

    frmMain.lblHistory = frmMain.lblHistory & cell

    Select Case currentPlayer
      Case 1
        player(1).History = player(1).History & cell
        frmMain.lblPly1Steps = player(1).History
      Case 2
        player(2).History = player(2).History & cell
        frmMain.lblPly2Steps = player(2).History
    End Select

End Function

'Clear all symbols from game board
Private Function clearboard()

  Dim i As Byte

    For i = 1 To 9
        frmMain.lblBoard(i) = ""
    Next i

    frmMain.lnWIN.Visible = False

    clearboard = True

End Function

'Return true if cell is empty and being marked sucessfully
Public Function markboard(cell As Integer) As Boolean

    If cellempty(cell) Then
        frmMain.lblBoard(cell) = symbol()
        Call printhistory(cell)
        markboard = True
    End If

End Function

'Return either symbol "X" or "O"
Public Function symbol() As String

    Select Case currentPlayer
      Case 1
        symbol = "O"
      Case 2
        symbol = "X"
    End Select

End Function

'Draw win line
Public Function drawwinline(a As Integer, b As Integer, c As Integer)

  Dim x1 As Integer
  Dim x2 As Integer
  Dim y1 As Integer
  Dim y2 As Integer

    If a = 1 And b = 2 And c = 3 Then
        x1 = 240
        x2 = 3480
        y1 = 960
        y2 = 960
        Call line(x1, x2, y1, y2)
      ElseIf a = 4 And b = 5 And c = 6 Then
        x1 = 240
        x2 = 3480
        y1 = 2040
        y2 = 2040
        Call line(x1, x2, y1, y2)
      ElseIf a = 7 And b = 8 And c = 9 Then
        x1 = 240
        x2 = 3480
        y1 = 3120
        y2 = 3120
        Call line(x1, x2, y1, y2)
      ElseIf a = 1 And b = 4 And c = 7 Then
        x1 = 780
        x2 = 780
        y1 = 360
        y2 = 3600
        Call line(x1, x2, y1, y2)
      ElseIf a = 2 And b = 5 And c = 8 Then
        x1 = 1860
        x2 = 1860
        y1 = 360
        y2 = 3600
        Call line(x1, x2, y1, y2)
      ElseIf a = 3 And b = 6 And c = 9 Then
        x1 = 2940
        x2 = 2940
        y1 = 360
        y2 = 3600
        Call line(x1, x2, y1, y2)
      ElseIf a = 1 And b = 5 And c = 9 Then
        x1 = 240
        x2 = 3480
        y1 = 360
        y2 = 3600
        Call line(x1, x2, y1, y2)
      ElseIf a = 3 And b = 5 And c = 7 Then
        x1 = 240
        x2 = 3480
        y1 = 3600
        y2 = 360
        Call line(x1, x2, y1, y2)
    End If

    frmMain.lnWIN.Visible = True

End Function

'sub function for drawwinline
Private Function line(x1 As Integer, x2 As Integer, y1 As Integer, y2 As Integer)

    frmMain.lnWIN.x1 = x1
    frmMain.lnWIN.x2 = x2
    frmMain.lnWIN.y1 = y1
    frmMain.lnWIN.y2 = y2

End Function

'Return a cell which is empty randomly
Public Function randommark() As Integer

    Randomize Timer

    Do
        randommark = Int(Rnd * 9) + 1
    Loop Until cellempty(randommark)

End Function

'Return true if cell is empty
Public Function cellempty(cell As Integer) As Boolean

    If frmMain.lblBoard(cell) = "" Then cellempty = True

End Function

'Return opponent ID of the current player
Public Function FindOpponent() As Integer

    Select Case currentPlayer
      Case 1
        FindOpponent = 2
      Case 2
        FindOpponent = 1
    End Select

End Function
