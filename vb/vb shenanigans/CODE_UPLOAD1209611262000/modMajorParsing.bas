Attribute VB_Name = "modMajorParsing"
Option Explicit

Public Function GetE()
On Error GoTo ErrorHandler

    '**********************************
    '* PARSING ROUTINE (Expression E) *
    '* E ::= T + T | T - T | T        *
    '**********************************

    'Get the lower value (T)
    Value = GetT()

    'Exit function if error or help call returned
    If InError Or Help Then
        Exit Function
    End If

    'User set a value to a variable
    If SetVariable Then
        GetE = Value
        Exit Function
    End If

    'Allow for multiple operators of the same precedence
    'level occuring immediately after each other
    While OutputString = "+" Or OutputString = "-"

        Select Case OutputString
    
            'Addition operator
            Case "+"
                ExtractToken
                Value = Value + GetT()
    
            'Subraction operator
            Case "-"
                ExtractToken
                Value = Value - GetT()

        End Select

    Wend

    'Return value for E
    GetE = Value

    'Exit function before error handler
    Exit Function

ErrorHandler:

    'Trap errors
    TrapErrors Err.Number

End Function

Public Function GetT()
On Error GoTo ErrorHandler
Dim Exponent As Double

    '****************************
    '* PARSING ROUTINE (Term T) *
    '* T ::= F * F | F / F | F  *
    '****************************

    'Get the lower value (F)
    Value = GetF

    'Exit function if error or help call returned
    If InError Or Help Then
        Exit Function
    End If

    'User set a value to a variable
    If SetVariable Then
        GetT = Value
        Exit Function
    End If

    'Allow for multiple operators of the same precedence
    'level occuring immediately after each other
    While OutputString = "*" Or OutputString = "/"

        Select Case OutputString
    
            'Multiplication operator
            Case "*"
                ExtractToken
                Value = Value * GetF()
    
            'Division operator
            Case "/"
                ExtractToken
                Value = Value / GetF()
    
        End Select

    Wend

    'Return value for T
    GetT = Value

    'Exit function before error handler
    Exit Function

ErrorHandler:

    'Trap errors
    TrapErrors Err.Number

End Function

Public Function GetF()
On Error GoTo ErrorHandler
Dim ArrayIndex As Long
Dim ArrayItemExists As Boolean
Dim ArrayString As String
Dim ArrayValue As Double
Dim Base As Double
Dim Constant As Double
Dim ConstantExists As Boolean
Dim FileNumber As Long
Dim LogBase As String
Dim LogIndex As Long
Dim i As Long
Dim Temp As String
Dim Temp2 As String

    '******************************
    '* PARSING ROUTINE (Factor F) *
    '* F ::= Number | ( E )       *
    '******************************

    'Handle the low level calculations
    Select Case OutputString

        '***************
        'Basic Functions
        '***************

        'Number
        Case "Number"
            Value = OutputValue
            ExtractToken
            GetF = PostToken

        'Negative
        Case "-"
            ExtractToken
            GetF = -(GetF())

        'Random number
        Case "rnd"
            Randomize
            Value = Rnd
            ExtractToken
            GetF = PostToken

        'Parenthesis
        Case "("
            ExtractToken
            Value = GetE
            If OutputString <> ")" And OutputString <> "EOS" Then
                TrapErrors 0
                Exit Function
            End If
            If OutputString = "EOS" Then
                GetF = Value
            Else
                ExtractToken
                GetF = PostToken
            End If

        'Previous answer
        Case "ans"
            Value = PrevAnswer
            ExtractToken
            GetF = PostToken

        '*************
        'Miscellaneous
        '*************

        'Absolute value
        Case "abs"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                GetF = Abs(Value)
            End If

        'Help
        Case "help"
            Help = True

        'Square Root
        Case "sr"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                GetF = Sqr(Value)
            End If

        '**********
        'Logarithms
        '**********

        'Logarithm (to a base)
        Case "log"

            'Get logarithm base
            LogBase = frmCalcSolver.txtLogBase.Text

            'If the box is empty, set it with the default 10
            If LogBase = "" Then
                frmCalcSolver.txtLogBase.Text = "10"
                Base = 10

            'Retrieve logarithm base
            Else
                Base = Val(LogBase)
            End If

            'Get number
            ExtractToken
            GetF = Log(GetF()) / Log(Base)

        'Natural logarithm
        Case "ln"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                GetF = Log(Value)
            End If

        '***********************
        'Trigonometric Functions
        '***********************

        'Cosine
        Case "cos"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = Cos(Value)
            End If

        'Cotangent
        Case "cot"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = 1 / Tan(Value)
            End If

        'Cosecant
        Case "csc"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = 1 / Sin(Value)
            End If

        'Hyperbolic cosecant
        Case "hcsc"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = 2 / (Exp(Value) - Exp(-Value))
            End If
            Exit Function

        'Hyperbolic cosine
        Case "hcos"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = (Exp(Value) + Exp(-Value)) / 2
            End If

        'Hyperbolic cotangent
        Case "hcot"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = (Exp(Value) + Exp(-Value)) / (Exp(Value) - Exp(-Value))
            End If

        'Hyperbolic secant
        Case "hsec"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = 2 / (Exp(Value) + Exp(-Value))
            End If

        'Hyperbolic sine
        Case "hsin"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = (Exp(Value) - Exp(-Value)) / 2
            End If

        'Hyperbolic tangent
        Case "htan"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = (Exp(Value) - Exp(-Value)) / (Exp(Value) + Exp(-Value))
            End If

        'Inverse hyperbolic cosine
        Case "ihcos"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Log(Value + Sqr(Value * Value - 1))
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse hyperbolic cosecant
        Case "ihcsc"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Log((Sgn(Value) * Sqr(Value * Value + 1) + 1) / Value)
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse hyperbolic cotangent
        Case "ihcot"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Log((Value + 1) / (Value - 1)) / 2
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse hyperbolic sine
        Case "ihsin"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Log(Value + Sqr(Value * Value + 1))
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse hyperbolic secant
        Case "ihsec"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Log((Sqr(-Value * Value + 1) + 1) / Value)
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse hyperbolic tangent
        Case "ihtan"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Log((1 + Value) / (1 - Value)) / 2
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse cosecant
        Case "icsc"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Atn(Value / Sqr(Value * Value - 1)) + (Sgn(Value) - 1) * (2 * Atn(1))
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse cosine
        Case "icos"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Atn(-Value / Sqr(-Value * Value + 1)) + 2 * Atn(1)
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse cotangent
        Case "icot"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Atn(Value) + 2 * Atn(1)
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse secant
        Case "isec"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Atn(Value / Sqr(Value * Value - 1)) + Sgn((Value) - 1) * (2 * Atn(1))
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse sine
        Case "isin"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Atn(Value / Sqr(-Value * Value + 1))
                ConvertToDegrees
                GetF = Value
            End If

        'Inverse tangent
        Case "itan"
            ExtractToken
            Value = GetF()
            If InError Then
                Exit Function
            Else
                Value = Atn(Value)
                ConvertToDegrees
                GetF = Value
            End If

        'Secant
        Case "sec"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = 1 / Cos(Value)
            End If

        'Sine
        Case "sin"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = Sin(Value)
            End If

        'Tangent
        Case "tan"
            ExtractToken
            Value = GetF()
            ConvertToRadians
            If InError Then
                Exit Function
            Else
                GetF = Tan(Value)
            End If

        'Equals sign
        Case "="

            'A string that starts with an equals sign is not
            'a reserved keyword
            If CurrentEntryIndex = 2 Then
                TrapErrors 0
            Else
                TrapErrors -10
            End If

        'Check for stored variables or variables that
        'should be stored - anything else is an error
        Case Else

            'Check to see if variable exists with the
            'entered name
            ArrayItemExists = False
            ArrayString = OutputString
            For i = LBound(VariableArray) To UBound(VariableArray)
                If VariableArray(i) = ArrayString Then
                    ArrayItemExists = True
                    ArrayIndex = i
                    Exit For
                End If
            Next i

            'Check to see if variable exists as a constant
            FileNumber = FreeFile
            Open "constants.csd" For Input As #FileNumber
                Do While Not EOF(FileNumber)
                    Input #FileNumber, Temp
                    Input #FileNumber, Temp2
                    If Temp = ArrayString Then
                        ConstantExists = True
                        Constant = Val(Temp2)
                        Exit Do
                    End If
                Loop
            Close #FileNumber

            'Check to see if the user wishes to store a
            'variable
            ExtractToken
            If OutputString = "=" Then

                'Get the value for the string to be stored
                ExtractToken
                ArrayValue = GetE()
                If InError Then
                    Exit Function
                End If

                If ArrayItemExists Then

                    'Replace the variable's value only,
                    'instead of created a whole new array
                    'item
                    ValueArray(ArrayIndex) = ArrayValue

                Else

                    'User cannot assign a value to a preset
                    'constant value
                    If ConstantExists Then
                        TrapErrors -10
                        Exit Function
                    End If

                    'Give an extra space for the new variable
                    ReDim Preserve ValueArray(UBound(ValueArray) + 1)
                    ReDim Preserve VariableArray(UBound(VariableArray) + 1)

                    'Store the new variable in the array
                    ValueArray(UBound(ValueArray)) = ArrayValue
                    VariableArray(UBound(VariableArray)) = ArrayString

                End If

                'Displayed answer is the stored value
                SetVariable = True
                GetF = ArrayValue
            Else

                'If the user has stored a variable with the
                'entered name, return the stored value
                If ArrayItemExists Then
                    Value = ValueArray(ArrayIndex)
                    GetF = PostToken
                    Exit Function
                End If

                'If the user has stored a constant with the
                'entered name, return the stored value
                If ConstantExists Then
                    Value = Constant
                    GetF = PostToken
                    Exit Function
                End If

                'If variable does not exist, then error
                TrapErrors 0
            End If

    End Select

    'Exit function before error handler
    Exit Function

ErrorHandler:

    'Trap errors
    TrapErrors Err.Number

End Function
