Attribute VB_Name = "modConvertandErrors"
Option Explicit

Public Sub TrapErrors(ErrNumber As Long)

    'Set trapped error message
    If ErrNumber = -10 Then

        'Reserved keyword
        ErrorMessage = "Error: Reserved Keyword"

    ElseIf ErrNumber = 6 Then

        'Overflow
        ErrorMessage = "Error: Overflow"

    ElseIf ErrNumber = 11 Then

        'Division By Zero
        ErrorMessage = "Error: Division By Zero"

    Else

        'Unknown error
        ErrorMessage = "Calculation Error"

    End If

    'Set return values
    InError = True
    OutputString = "TError"

End Sub

Public Sub ConvertToDegrees()

    'Convert to degrees
    If frmCalcSolver.optAngMode(0).Value = True Then
        Value = Value * (180 / Pi)
    End If

End Sub

Public Sub ConvertToRadians()

    'Convert to radians
    If frmCalcSolver.optAngMode(0).Value = True Then
        Value = Value * (Pi / 180)
    End If

End Sub
