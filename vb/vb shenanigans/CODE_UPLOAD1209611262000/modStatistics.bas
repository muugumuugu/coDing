Attribute VB_Name = "modStatistics"
Option Explicit

Dim DeviationArray() As Long
Dim i As Long
Public InOrder()

Public Function Mean()

    'Get the mean of the values
    Mean = SumX / SS

End Function

Public Function Mode()
Dim Count() As Long
Dim Found As Boolean
Dim j As Long
Dim ModeString As String
Dim MultipleModes()
Dim Num() As Double
Dim Temp As String
Dim UpperIndex As Long
Dim UpperValue As Long

    'Set the basic dimensions and variables
    ReDim Count(0)
    ReDim Num(0)
    Num(0) = MainArray(0)
    Count(0) = 1

    'Analyse the data to load the numbers and their
    'amount of occurences into arrays
    For i = 1 To UBound(MainArray)
        Found = False
        For j = 0 To UBound(Num)
            If MainArray(i) = Num(j) Then
                Count(j) = Count(j) + 1
                Found = True
                Exit For
            End If
        Next j
        If Found = False Then
            ReDim Preserve Num(UBound(Num) + 1)
            ReDim Preserve Count(UBound(Count) + 1)
            Num(UBound(Num)) = MainArray(i)
            Count(UBound(Count)) = 1
        End If
    Next i

    'Find the most common number
    UpperValue = Count(0)
    For i = 1 To UBound(Count)
        If Count(i) > UpperValue Then
            UpperIndex = i
            UpperValue = Count(i)
        End If
    Next i

    'Check to see if there is only one
    'occurence of each number.  If so, no mode
    'exists
    If Count(UpperIndex) = 1 Then
        Mode = "N/A"
    Else
        ReDim MultipleModes(0)
        For i = 0 To UBound(Count)
            If Count(i) = UpperValue Then
                ReDim Preserve MultipleModes(UBound(MultipleModes) + 1)
                MultipleModes(UBound(MultipleModes)) = Num(i)
            End If
        Next i
        If UBound(MultipleModes) > 1 Then
            ModeString = ""
            For i = 1 To UBound(MultipleModes)
                If i = UBound(MultipleModes) Then
                    ModeString = ModeString + CStr(MultipleModes(i))
                Else
                    ModeString = ModeString + CStr(MultipleModes(i)) + ", "
                End If
            Next i
            Mode = ModeString
        Else
            Mode = Num(UpperIndex)
        End If
    End If

End Function

Public Function SumX()

    'Get the sum of each of the values
    Value = 0
    For i = 0 To UBound(MainArray)
        Value = Value + MainArray(i)
    Next i
    SumX = Value

End Function

Public Function SumX2()

    'Get the sum of each of the values squared
    Value = 0
    For i = 0 To UBound(MainArray)
        Value = Value + (MainArray(i) ^ 2)
    Next i
    SumX2 = Value

End Function

Public Function SS()

    'Get sample size
    SS = UBound(MainArray) + 1

End Function

Public Function Range()

    'Get range
    Range = maxX - minX

End Function

Public Function Variance()
Dim Temp As String

    'Get variance
    Temp = Deviations
    Value = 0
    For i = 0 To UBound(DeviationArray)
        Value = Value + (DeviationArray(i) ^ 2)
    Next i
    Variance = Value / SS

End Function

Public Function SD()

    'Get standard deviation
    SD = Sqr(Variance)

End Function

Public Function SE()

    'Get standard error
    SE = SD / Sqr(SS)

End Function

Public Function minX()
Dim LowerValue As Double

    'Prevent error if only one value
    If UBound(MainArray) = 0 Then
        minX = MainArray(0)
        Exit Function
    End If

    'Find lowest value
    LowerValue = MainArray(0)
    For i = 1 To UBound(MainArray)
        If MainArray(i) < LowerValue Then
            LowerValue = MainArray(i)
        End If
    Next i
    minX = LowerValue

End Function

Public Function Q1()
Dim NumToQ As Double
Dim Temp As Double

    'Get first quartile
    NumToQ = ((Fix((SS + 1) / 2)) + 1) / 2
    Temp = Median
    Q1 = InOrder(NumToQ)

End Function

Public Function Median()
Dim j As Long
Dim LowerIndex As Long
Dim LowerValue As Double
Dim TempArray()
Dim TempArray2()
Dim UpperBound As Long

    'Set basic dimensions and variables
    ReDim InOrder(0)
    ReDim TempArray(UBound(MainArray))
    ReDim TempArray2(UBound(MainArray))
    For i = 0 To UBound(MainArray)
        TempArray(i) = MainArray(i)
    Next i

    'Three steps to sorting the array
    For j = 0 To UBound(MainArray)

        'Find the lowest value in the array
        LowerIndex = 0
        LowerValue = TempArray(0)
        If UBound(TempArray) <> 0 Then
            For i = 1 To UBound(TempArray)
                If TempArray(i) < LowerValue Then
                    LowerIndex = i
                    LowerValue = TempArray(i)
                End If
            Next i
        End If

        'Add the lowest value into a new array
        ReDim Preserve InOrder(UBound(InOrder) + 1)
        InOrder(UBound(InOrder)) = LowerValue
        If UBound(TempArray) = 0 Then
            Exit For
        End If

        'Delete the value from the old array
        For i = 0 To UBound(TempArray)
            If i < LowerIndex Then
                TempArray2(i) = TempArray(i)
            ElseIf i > LowerIndex Then
                TempArray2(i - 1) = TempArray(i)
            End If
        Next i
        ReDim TempArray(UBound(TempArray2) - 1)
        For i = 0 To (UBound(TempArray2) - 1)
            TempArray(i) = TempArray2(i)
        Next i
        ReDim TempArray2(UBound(TempArray2) - 1)
    Next j

    UpperBound = UBound(InOrder)

    'Even number of values
    If (UpperBound / 2) = CLng(UpperBound / 2) Then
        Median = InOrder(UpperBound / 2) + ((InOrder((UpperBound + 2) / 2) - InOrder(UpperBound / 2)) / 2)

    'Odd number of values
    Else
        Median = InOrder((UpperBound + 1) / 2)
    End If

End Function

Public Function Q3()
Dim NumToQ As Double
Dim Temp As Double

    'Get second quartile
    NumToQ = ((Fix((SS + 1) / 2)) + 1) / 2
    Temp = Median
    Q3 = InOrder(UBound(InOrder) - NumToQ + 1)

End Function

Public Function maxX()
Dim UpperValue As Double

    'Prevent error if only one value
    If UBound(MainArray) = 0 Then
        maxX = MainArray(0)
        Exit Function
    End If

    'Find greatest value
    UpperValue = MainArray(0)
    For i = 1 To UBound(MainArray)
        If MainArray(i) > UpperValue Then
            UpperValue = MainArray(i)
        End If
    Next i
    maxX = UpperValue

End Function

Public Function IR()

    'Find interquartile range
    IR = Q3 - Q1

End Function

Public Function Deviations()
Dim DevString As String
Dim j As Long
Dim MeanVar As Double

    'Store the deviations in an array
    MeanVar = Mean
    ReDim DeviationArray(UBound(MainArray))
    For j = 0 To UBound(DeviationArray)
        DeviationArray(j) = MainArray(j) - Mean
    Next j

    'Set string for display in text box
    DevString = ""
    For i = 0 To UBound(DeviationArray)
        If i = UBound(DeviationArray) Then
            DevString = DevString + CStr(DeviationArray(i))
        Else
            DevString = DevString + CStr(DeviationArray(i)) + ", "
        End If
    Next i
    Deviations = DevString

End Function
