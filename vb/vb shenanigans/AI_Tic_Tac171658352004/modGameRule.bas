Attribute VB_Name = "modGameRule"
Option Explicit

Private Type player
    isAI As Boolean
    History As String
    win As Long
    Lose As Long
    Draw As Long
End Type

Public player(1 To 2) As player

Public GameEnd As Boolean

'Return true if cell is being mark successfully
Function playgame(cell As Integer) As Boolean

    MarkSuccessful = False

    DoEvents

    'If game already ends
    If GameEnd Then
        Call frmMain.writeConsole("Game Over")
        GoTo exiting

      'Mark cell
      ElseIf markboard(cell) Then

        NumCellFilled = NumCellFilled + 1

        'If someone wins, update players' game statistics and call AI to process data
        If checkwin(player(currentPlayer).History, True) Then
            GameEnd = True

            'Update players' game statistics
            player(currentPlayer).win = player(currentPlayer).win + 1
            player(FindOpponent).Lose = player(FindOpponent).Lose + 1

            Call frmMain.writeConsole("Player " & currentPlayer & " win = " & frmMain.lblHistory)

            frmMain.lblPly1WLD = "Win=" & player(1).win & " Lose=" & player(1).Lose & " Draw=" & player(1).Draw
            frmMain.lblPly2WLD = "Win=" & player(2).win & " Lose=" & player(2).Lose & " Draw=" & player(2).Draw

            'Call AI to process data
            Call ProcessWin

          'Check if is 'draw'
          ElseIf NumCellFilled = 9 Then
            GameEnd = True
            player(1).Draw = player(1).Draw + 1
            player(2).Draw = player(2).Draw + 1

            frmMain.lblPly1WLD = "Win=" & player(1).win & " Lose=" & player(1).Lose & " Draw=" & player(1).Draw
            frmMain.lblPly2WLD = "Win=" & player(2).win & " Lose=" & player(2).Lose & " Draw=" & player(2).Draw

            Call frmMain.writeConsole("Draw")

          Else
            currentPlayer = FindOpponent()
            
            'If player is AI, ask AI to make move
            If player(currentPlayer).isAI Then Call AIMove

        End If

      'If cell already occupied
      ElseIf Not markboard(cell) Then
        Call frmMain.writeConsole("Cell " & cell & " already taken")

    End If

exiting:
    MarkSuccessful = True
    playgame = True

End Function

'Return true if someone wins
Function checkwin(tmphistory As String, Optional drawline As Boolean) As Boolean

    checkwin = True

    If win(1, 2, 3, tmphistory, drawline) Then
      ElseIf win(4, 5, 6, tmphistory, drawline) Then
      ElseIf win(7, 8, 9, tmphistory, drawline) Then
      ElseIf win(1, 4, 7, tmphistory, drawline) Then
      ElseIf win(2, 5, 8, tmphistory, drawline) Then
      ElseIf win(3, 6, 9, tmphistory, drawline) Then
      ElseIf win(1, 5, 9, tmphistory, drawline) Then
      ElseIf win(3, 5, 7, tmphistory, drawline) Then
      Else
        checkwin = False
    End If

End Function

'Sub function for checkwin
Function win(a As Integer, b As Integer, c As Integer, tmphistory As String, Optional drawline As Boolean) As Boolean

    If InStr(tmphistory, a) > 0 And InStr(tmphistory, b) > 0 And InStr(tmphistory, c) > 0 Then
        If drawline Then Call drawwinline(a, b, c)
        win = True
    End If

End Function

'Clear player's game statistics
Function clearPlayer()

  Dim i As Byte

    For i = 1 To 2
        player(i).win = 0
        player(i).Lose = 0
        player(i).Draw = 0
    Next i

End Function

