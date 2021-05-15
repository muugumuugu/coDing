Attribute VB_Name = "modScanning"
Option Explicit

Public Sub ExtractToken()
Dim i As Integer

    '********************
    '* SCANNING ROUTINE *
    '********************

    'Set default values
    OutputString = ""
    OutputValue = 0
    ValueString = ""

    'If at the end of string, return EOS
    If CurrentEntryIndex > Len(InputString) Then
        OutputString = "EOS"
        Exit Sub
    End If

    'Get character to be examined
    Char = Mid(InputString, CurrentEntryIndex, 1)

    'Space
    If Char = " " Then
        CurrentEntryIndex = CurrentEntryIndex + 1
        ExtractToken
        Exit Sub
    End If

    'Operator or parenthesis
    If Char = "+" Or Char = "-" Or Char = "*" Or Char = "/" Or Char = "^" Or Char = "(" Or Char = ")" Or Char = "!" Or Char = "=" Then
        CurrentEntryIndex = CurrentEntryIndex + 1

        'Set return value
        OutputString = Char
        Exit Sub
    End If

    'Number
    If (Char >= "0" And Char <= "9") Or Char = "." Then

        'Digits before decimal
        While Char >= "0" And Char <= "9"
            ValueString = ValueString + Char
            CurrentEntryIndex = CurrentEntryIndex + 1
            If CurrentEntryIndex <= Len(InputString) Then
                Char = Mid(InputString, CurrentEntryIndex, 1)
            Else
                Char = ""
            End If
        Wend

        'Decimal
        While Char = "."
            ValueString = ValueString + Char
            CurrentEntryIndex = CurrentEntryIndex + 1
            If CurrentEntryIndex <= Len(InputString) Then
                Char = Mid(InputString, CurrentEntryIndex, 1)
            Else
                Char = ""
            End If
        Wend

        'Digits after decimal
        While Char >= "0" And Char <= "9"
            ValueString = ValueString + Char
            CurrentEntryIndex = CurrentEntryIndex + 1
            If CurrentEntryIndex <= Len(InputString) Then
                Char = Mid(InputString, CurrentEntryIndex, 1)
            Else
                Char = ""
            End If
        Wend

        'Set return values
        OutputString = "Number"
        OutputValue = CDbl(ValueString)
        Exit Sub
    End If

    'Return text language identifiers
    If LCase(Char) >= "a" And LCase(Char) <= "z" Then
        While (LCase(Char) >= "a" And LCase(Char) <= "z")
            ValueString = ValueString + Char
            CurrentEntryIndex = CurrentEntryIndex + 1
            If CurrentEntryIndex <= Len(InputString) Then
                Char = Mid(InputString, CurrentEntryIndex, 1)
            Else
                Char = ""
            End If
        Wend

        'Pi or e
        If LCase(ValueString) = "pi" Or LCase(ValueString) = "e" Then
            OutputString = "Number"
            If LCase(ValueString) = "pi" Then
                OutputValue = Pi
            Else
                OutputValue = Exp(1)
            End If
            Exit Sub
        End If

        'Set return value
        OutputString = LCase(ValueString)
        Exit Sub
    End If

End Sub

