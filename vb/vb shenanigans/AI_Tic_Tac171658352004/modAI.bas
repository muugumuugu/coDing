Attribute VB_Name = "modAI"
Option Explicit
Public WinHis1() As String
Public WinHis2() As String

'Process win information
'Check if history already existed, if not, append to file and update experience list
Function ProcessWin()

  Dim tmphistory As String

    tmphistory = frmMain.lblHistory & symbol

    'Player 1 wins Player 2 (AI)
    If currentPlayer = 1 And player(2).isAI Then

        If existHistory(tmphistory, WinHis1) Then
            Exit Function
          Else

            Call writeHistory(tmphistory, frmMain.txtFilename)
            Call LoadCombination(tmphistory, WinHis1)
            Call countHistory

        End If

      'Player 2 wins Player 1 (AI)
      ElseIf currentPlayer = 2 And player(1).isAI Then

        If existHistory(tmphistory, WinHis2) Then
            Exit Function
          Else

            Call writeHistory(tmphistory, frmMain.txtFilename)
            Call LoadCombination(tmphistory, WinHis2)
            Call countHistory

        End If

    End If

End Function

'Load all the other winning step combinations by exploiting Tic Tac Toe's winning symmetries
Function LoadCombination(temp As String, Hist() As String)

  'Exploit symmetries

  Dim temp2 As String

    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = temp

    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = transpose(temp)

    temp2 = rotate(temp)
    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = temp2

    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = transpose(temp2)

    temp2 = rotate(temp2)
    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = temp2

    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = transpose(temp2)

    temp2 = rotate(temp2)
    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = temp2

    ReDim Preserve Hist(UBound(Hist) + 1)
    Hist(UBound(Hist)) = transpose(temp2)

End Function

'Loading AI Experiences from file
Function InitializeAI(Filename As String)

  Dim tmphistory As String
  Dim pcount As Long
  Dim tmpTimer As Variant

    On Error GoTo Error_Handler

    tmpTimer = Timer

    ReDim WinHis1(0)
    ReDim WinHis2(0)

    Open Filename For Input As #1

    Do Until EOF(1)

        Input #1, tmphistory

        If Right(tmphistory, 1) = "O" Then
            Call LoadCombination(tmphistory, WinHis1)
          ElseIf Right(tmphistory, 1) = "X" Then
            Call LoadCombination(tmphistory, WinHis2)
        End If

        pcount = pcount + 1
        DoEvents

    Loop

    frmMain.writeConsole ("Loading AI Experiences took " & Timer - tmpTimer & " seconds")

Error_Handler:
    Close #1

    Call countHistory
    Debug.Print "Records in file = " & pcount

End Function

'Return move decided by AI
Function AIMove() As String

  Dim possiblemoves As String
  Dim move As Integer

    Randomize Timer

    possiblemoves = FindMoves

    'Found a few possible moves? pick one randomly
    move = Int(Mid(possiblemoves, Int(Rnd * Len(possiblemoves) + 1), 1))

    If frmMain.cmdTrain.Caption = "&Training" Then _
       Call frmMain.writeConsole("Possible moves = " & possiblemoves & ", choose = " & move)

    Call playgame(move)

End Function

'Return all possible moves that might win or draw the game
Function FindMoves() As String

  Dim weight(1 To 9) As Long
  Dim i As Integer
  Dim j As Long
  Dim temp As String
  Dim tmp As Integer

    'Move if me next step win
    tmp = NextStepWin(currentPlayer)
    If tmp > 0 Then
        FindMoves = tmp
        Exit Function
    End If

    'Block if opponent next step win
    tmp = NextStepWin(FindOpponent)
    If tmp > 0 Then
        FindMoves = tmp
        Exit Function
    End If

    tmp = 32767

    If currentPlayer = 1 Then
        'Search WinHis2
        For i = 1 To 9
            temp = frmMain.lblHistory & i
            For j = 1 To UBound(WinHis2)
                If left(WinHis2(j), Len(temp)) = temp Then
                    weight(i) = weight(i) + 1
                End If
            Next j

            'Player 1 is AI
            'Find moves that results Player 2 has minimum probability to win
            If weight(i) < tmp And cellempty(i) Then tmp = weight(i)

        Next i

      ElseIf currentPlayer = 2 Then
        'Search WinHis1
        For i = 1 To 9
            temp = frmMain.lblHistory & i
            For j = 1 To UBound(WinHis1)
                If left(WinHis1(j), Len(temp)) = temp Then
                    weight(i) = weight(i) + 1
                End If
            Next j

            'Player 2 is AI
            'Find moves that results Player 1 has minimum probability to win
            If weight(i) < tmp And cellempty(i) Then tmp = weight(i)

        Next i

    End If

    'Return all possible moves
    For i = 1 To 9
        If weight(i) = tmp And cellempty(i) Then FindMoves = FindMoves & i
    Next i

End Function

'Return cell number to win
Function NextStepWin(playerX As Integer) As Integer

  Dim i As Integer

    For i = 1 To 9
        If cellempty(i) Then
            If checkwin(player(playerX).History & i) Then
                NextStepWin = i
                Exit For
            End If
        End If
    Next i

End Function

'Delete AI Experiences
Function cleanAI(Filename As String)

    On Error Resume Next
        Kill Filename
        ReDim WinHis1(0)
        ReDim WinHis2(0)

End Function

'Save history to file
Function writeHistory(tmphistory As String, Filename As String)

    Call frmMain.writeConsole("Writting " & tmphistory & " to " & Filename)

    Open Filename For Append As #1
    Print #1, tmphistory
    Close #1

End Function

'Return true if history already existed
Function existHistory(tmphistory As String, Hist() As String) As Boolean

  Dim i As Long

    For i = 1 To UBound(Hist)
        If Hist(i) = tmphistory Then
            existHistory = True
            Exit For
        End If
    Next i

End Function

'Show AI Experiences accumulated so far
Function countHistory()

    frmMain.lblAIExperience = "AI Player1 Experiences = " & UBound(WinHis1) & vbCrLf _
                              & "AI Player2 Experiences = " & UBound(WinHis2)

End Function

'Matrix manipulation function
'Flip matrixs
Function transpose(str As String) As String

  '123    147
  '456 => 258
  '789    369

  Dim tmpstr As String
  Dim char As String * 1
  Dim i As Byte

    For i = 1 To Len(str)
        char = Mid(str, i, 1)
        Select Case char
          Case "2"
            tmpstr = "4"
          Case "3"
            tmpstr = "7"
          Case "4"
            tmpstr = "2"
          Case "6"
            tmpstr = "8"
          Case "7"
            tmpstr = "3"
          Case "8"
            tmpstr = "6"
          Case Else
            tmpstr = char
        End Select

        transpose = transpose & tmpstr

    Next i

End Function

'Matrix manipulation function
'Rotate matrix 90 degress clockwise
Function rotate(str As String) As String

  '123    741
  '456 => 852
  '789    963

  Dim tmpstr As String
  Dim char As String * 1
  Dim i As Byte

    For i = 1 To Len(str)
        char = Mid(str, i, 1)
        Select Case char
          Case "1"
            tmpstr = "3"
          Case "2"
            tmpstr = "6"
          Case "3"
            tmpstr = "9"
          Case "4"
            tmpstr = "2"
          Case "6"
            tmpstr = "8"
          Case "7"
            tmpstr = "1"
          Case "8"
            tmpstr = "4"
          Case "9"
            tmpstr = "7"
          Case Else
            tmpstr = char
        End Select

        rotate = rotate & tmpstr

    Next i

End Function


