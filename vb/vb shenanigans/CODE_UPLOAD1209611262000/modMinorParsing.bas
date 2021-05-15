Attribute VB_Name = "modMinorParsing"
Option Explicit

Public Function PostToken()
On Error GoTo ErrorHandler
Dim Factorial As Double
Dim i As Integer
Dim Value2 As Double

    'Ignore operators, EOS strings, right parentheses, and
    'equals signs
    If OutputString = "+" Or OutputString = "-" Or OutputString = "*" Or OutputString = "/" Or OutputString = "EOS" Or OutputString = ")" Or OutputString = "=" Or OutputString = "," Then
        PostToken = Value

    'Handle special tokens that come after the value
    Else
        Select Case OutputString

            'Factorial
            Case "!"
                If (CDbl(Value) <> CLng(Value)) Or Value < 0 Then
                    TrapErrors 0
                    Exit Function
                End If
                Factorial = 1
                For i = Value To 1 Step -1
                    Factorial = Factorial * i
                Next i
                ExtractToken

                'Ignore operators, EOS strings, right
                'parentheses, and equals signs
                If OutputString = "+" Or OutputString = "-" Or OutputString = "*" Or OutputString = "/" Or OutputString = "EOS" Or OutputString = ")" Or OutputString = "=" Then
                    PostToken = Factorial
                    ExtractToken

                'Handle special tokens that come after a
                'factorial
                Else

                    Select Case OutputString

                        'Factorial
                        Case "!"
                            TrapErrors 0
                            Exit Function

                        'Exponent
                        Case "^"
                            ExtractToken
                            PostToken = Factorial ^ GetF

                        'Other "post" tokens multiply
                        Case Else
                            PostToken = Factorial * GetF
                    End Select
                End If

            'Exponent
            Case "^"
                ExtractToken
                PostToken = Value ^ GetF

            'Left parenthesis
            Case "("
                PostToken = Value * GetF

            'Other "post" tokens multiply
            Case Else
                PostToken = Value * GetF
        End Select
    End If

    Exit Function

ErrorHandler:

    TrapErrors Err.Number

End Function
