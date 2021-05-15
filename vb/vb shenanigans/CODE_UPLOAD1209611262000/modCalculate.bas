Attribute VB_Name = "modCalculate"
Option Explicit

Public Sub CalculateEntry()
'On Error GoTo ErrorHandler:
Dim Answer As String
Dim BinAnswer As String
Dim DecimalCheck As Long
Dim i As Integer
Dim LenAfterDecimal As Long
Dim NumOfDecimals As Integer
Dim Remainder As String
Dim Tag As String

    'Set default values
    CurrentEntryIndex = 1
    Help = False
    InError = False
    InputString = frmCalcSolver.txtEntry.Text
    PrevEntry = frmCalcSolver.txtEntry.Text
    SetVariable = False

    'Extract the first token
    ExtractToken

    'Evaluate the entire expression
    Answer = CStr(GetE)

    'Open Syntax help
    If Help Then
        frmCalcSolver.mnuHelpSyntax_Click
        Exit Sub
    End If

    'If we "finished" the evaluation prematurely, an
    'error occured
    If Not InError And OutputString <> "EOS" Then
        TrapErrors 0
    End If

    'Set error message if error occurred
    If InError Then
        Answer = ">> " + ErrorMessage + vbNewLine + frmCalcSolver.txtAnswer.Text

    Else

        'Set previous answer
        PrevAnswer = Answer
        Tag = ""
        If frmCalcSolver.optBaseMode(1).Value = True Then

            'Convert to binary if necessary
            If CDbl(Answer) <= 32767 Then
                BinAnswer = ""
                DecimalCheck = InStr(1, CStr(Answer), ".")
                If DecimalCheck <> 0 Then
                    If CInt(Mid(CStr(Answer), DecimalCheck + 1, 1)) < 5 Then
                        Answer = CDbl(Left(Answer, DecimalCheck - 1))
                    Else
                        Answer = CDbl(Left(Answer, DecimalCheck - 1)) + 1
                    End If
                End If
                Do
                    Answer = Answer / 2
                    DecimalCheck = InStr(1, CStr(Answer), ".")
                    If DecimalCheck = 0 Then
                        Remainder = "0"
                    Else
                        Answer = CDbl(Left(Answer, DecimalCheck - 1))
                        Remainder = "1"
                    End If
                    BinAnswer = Remainder + BinAnswer
                Loop Until Answer < 1
                Answer = CDbl(BinAnswer)
                Tag = " (bin)"
            End If
        ElseIf frmCalcSolver.optBaseMode(2).Value = True Then

            'Convert to hexadecimal if necessary
            Answer = Hex(Answer)
            Tag = " (hex)"
        ElseIf frmCalcSolver.optBaseMode(3).Value = True Then

            'Convert to octadecimal if necessary
            Answer = Oct(Answer)
            Tag = " (oct)"
        Else

            'If in decimal mode, convert to set
            'number of decimal places
            If frmCalcSolver.txtDecimal.Text <> "F" Then

                'Check for decimal
                NumOfDecimals = Val(frmCalcSolver.txtDecimal.Text)
                DecimalCheck = InStr(1, CStr(Answer), ".")

                'If decimal does not exist, tag on the number
                'of zeroes that the user specified
                If DecimalCheck = 0 Then
                    If NumOfDecimals <> "0" Then
                        Answer = Answer + "."
                        For i = 1 To NumOfDecimals
                            Answer = Answer + "0"
                        Next i
                    End If

                'If decimal does exist, adjust the answer to
                'the number of decimal places that the user
                'specified
                Else
                    LenAfterDecimal = Len(Answer) - DecimalCheck
                    If LenAfterDecimal > NumOfDecimals Then
                        If NumOfDecimals = "0" Then
                            DecimalCheck = DecimalCheck - 1
                        End If
                        Answer = Mid(Answer, 1, DecimalCheck + NumOfDecimals)
                    Else
                        For i = 1 To (NumOfDecimals - LenAfterDecimal)
                            Answer = Answer + "0"
                        Next i
                    End If
                End If
            End If
        End If
        Answer = ">> " + Answer + Tag + vbNewLine + frmCalcSolver.txtAnswer.Text
    End If

    'Display final answer
    frmCalcSolver.txtAnswer.Text = Answer

    Exit Sub

ErrorHandler:

    'Trap errors
    TrapErrors Err.Number

End Sub
