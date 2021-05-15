VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CExpression"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'--------------------------------------------------------------
'  A class for compiling and evaluating expressions
'  Author:  This code was originally obtained from VBPJ Journal
'           from an article written by Fransisco Balena
'           It was adapted and modified by the author to include
'           additional functions, and improved handling of invalid
'           calculations.
'  Kevin Matney
'  Date:        March 18, 1998
'--------------------------------------------------------------

#Const SupportStrings = -1

Option Explicit

Public Enum expErrorCode
    expOK = 0
    expSyntaxError
    expUnknownFunction
    expUnknownOperator
    expWrongNumberOfArguments
    expInvalidInputforFunction
End Enum

Private Enum expOpcodes
    opUnknown               ' used for errors
    opValue                 ' a constant or a variable
    opStart                 ' special opcodes (operands)
    opOpenBracket
    opMinus                 ' unary opcodes
    opNot
    
    opEnd                   ' special opcodes (operators)
    opComma                 ' DO NOT alter this order!
    opCloseBracket
    
    opFirst_BinaryOperator  ' binary opcodes (symbols)
    opPower = opFirst_BinaryOperator
    opMul
    opDiv                   ' IMPORTANT: these opcodes must be in a
    opIntDiv                ' sequence so that no opcode is a prefix
    opAdd                   ' for another opcode that follows it
    opSub                   ' (e.g. "<>" and "<=" must come before "<"
    opEq                    '  and ">=" must come before ">"
    opNe
    opLe
    opLt
    opGe
    opGt
    opMod                   ' binary opcodes (alphabetic)
    opAnd
    opOr
    opXor
#If SupportStrings Then
    opAppend
#End If

    opFirst_Function        ' opcode of first function
    opPi = opFirst_Function ' zero-argument functions
    opDeg
    opRad
    opAbs                   ' one-argument functions
    opInt
    opFix
    opSgn
    opSqr
    opLog
    opLn
    opExp
    opSin
    opAsin
    opCos
    opAcos
    opTan
    opAtn
    opAtan
    opSec
    opCosec
    opCotan  'add new functions here
    opSin_D
    opCos_D
    opTan_D
    
    opPow
    opMin                   ' two-argument functions
    opMax
    opIIf                   ' three-argument functions
    
#If SupportStrings Then
    opLen                   ' one-argument string functions
    opAsc
    opSpace
    opString                ' two-argument string functions
    opLeft
    opRight
    opMid                   ' three-argument string functions
    opInstr
#End If
    
    opDummy
    opLast_Opcode = opDummy - 1 ' last opcode used
End Enum

' max number of pending operators
Const STACK_SIZE = 30
' max number of items in the expression
Const MAX_ITEMS = 200

' the Default value, returned if a runtime occurs
Public DefaultValue As Variant

' if True (default), runtime errors are raised using the Err.Raise VBA method
' if False, errors are notified to the calling program only through
' the Error* properties
Public RaiseErrors As Boolean

' if True (default), variables are created as needed
' if False, an error occurs if a variable is not declared in advance
Public AutoCreateVariables As Boolean

' member variables
Private m_Expression As String
Private m_ErrorCode As expErrorCode
Private m_ErrorDescription As String
Private m_ErrorPos As Long

' the collection of variables
Private m_Variables As Collection

' the collection of roots
Private m_Roots As Collection

' these arrays hold information on all operands and functions
Dim opNames(opLast_Opcode) As String
Dim opPriority(opLast_Opcode) As Byte
Dim opNumArgs(opLast_Opcode) As Integer

' this holds the expression in compiled form
Dim compItems As Long
Dim compValues() As Variant
Dim compOpcodes() As Integer

' the expression to be evaluated

Property Get Expression() As String
    Expression = m_Expression
End Property

Property Let Expression(ByVal newValue As String)
    m_Expression = newValue
    ' compile the expression
    CompileExpression
End Property

' information on the current error code

Property Get ErrorCode() As expErrorCode
    ErrorCode = m_ErrorCode
End Property

Property Get ErrorDescription() As String
    ErrorDescription = m_ErrorDescription
End Property

Property Get ErrorPos() As Long
    ErrorPos = m_ErrorPos
End Property

' clear the error code

Sub ClearError()
    m_ErrorCode = expOK
    m_ErrorDescription = ""
    m_ErrorPos = 0
End Sub

' access to the variables

Function Variable(varName As Variant, Optional createIfNeeded As Boolean) As CVariable
    On Error Resume Next
    If IsNumeric(varName) Then
        Set Variable = m_Variables(varName)
    Else
        Set Variable = m_Variables(UCase$(varName))
        If Err > 0 And createIfNeeded Then
            Err = 0
            ' if it doesn't exist, create it if requested
            Dim newVar As New CVariable
            newVar.Name = varName
            ' add to the collection of variables
            AddVariable newVar
            Set Variable = newVar
        End If
    End If
End Function

Function AddVariable(newVar As CVariable) As Long
    ' add a new variable to the collection of variables
    ' recognized by this function, returns its index in the collection
    Dim ucaseName As String
    Dim Index As Integer
    
    On Error Resume Next

    ucaseName = UCase$(newVar.Name)
    
    ' add to the collection of variables
    ' this collection is always sorted on variable name
    m_Variables.Remove ucaseName
    Err = 0
    
    For Index = 1 To m_Variables.Count
        If UCase$(m_Variables(Index).Name) > ucaseName Then
            m_Variables.Add newVar, ucaseName, Index
            AddVariable = Index
            Exit Function
        End If
    Next
            
    ' add to the end of the collection
    m_Variables.Add newVar, ucaseName
    AddVariable = m_Variables.Count
            
End Function


Function VariablesCount() As Long
    VariablesCount = m_Variables.Count
End Function





' compile the expression (private)

Private Sub CompileExpression()
    Dim expr As String
    Dim Index As Long
    Dim sp As Integer
    Dim opSp As Integer
    Dim argSp As Integer
    Dim waitForOperator As Boolean
    Dim temp As Variant
    Dim opcode As Integer
    Dim newVar As CVariable
    
    ' reset the compiled expression and the roots
    compItems = 0
    ReDim compOpcodes(MAX_ITEMS) As Integer
    ReDim compValues(MAX_ITEMS) As Variant
    Set m_Roots = New Collection
    
    ' these are the temporary stacks used for parsing
    Dim opStack(STACK_SIZE) As Integer
    Dim argStack(STACK_SIZE) As Integer
    
    ' reset error codes
    m_ErrorCode = expOK
    m_ErrorDescription = ""

    ' add a trailing char to avoid errors and signal the expression end
    expr = m_Expression + opNames(opEnd)
    ' start with the highest priority
    opcode = opStart
    GoSub CompileExprPushOpcode
    Index = 1

    ' main compilation loop

    Do
        SkipBlanks expr, Index
        m_ErrorPos = Index
    
        If waitForOperator = False Then
    
            Select Case Mid$(expr, Index, 1)
            Case "0" To "9", "."
                ' found a numeric constant
                temp = GetNumber(expr, Index)
                If opStack(opSp) = opMinus Then
                    ' if there is an unary minus on the operator stack
                    ' this is a negative number
                    temp = -temp
                    opSp = opSp - 1
                End If
                AppendToCompiled opValue, temp
                sp = sp + 1
                waitForOperator = True
    
#If SupportStrings Then
            Case """", "'"
                ' a string constant
                temp = GetString(expr, Index)
                If m_ErrorCode = expSyntaxError Then GoTo CompileExprSyntaxError
                AppendToCompiled opValue, temp
                sp = sp + 1
                waitForOperator = True
#End If
            Case "+"
                ' unary plus - it is simply skipped over
                Index = Index + 1
    
            Case "-"
                ' unary minus
                opcode = opMinus
                GoSub CompileExprPushOpcode
                Index = Index + 1
    
            Case "("
                opcode = opOpenBracket
                GoSub CompileExprPushOpcode
                Index = Index + 1
    
            Case "A" To "Z", "a" To "z"
                ' this can be the NOT operator, a function name or a variable name
                temp = GetName(expr, Index)
                opcode = FunctionOpcode(UCase$(temp))
                
                If opcode = opNot Then
                    GoSub CompileExprPushOpcode
                ElseIf opcode <> opUnknown Then
                    ' we have found the name of a function
                    If opNumArgs(opcode) = 0 Then
                        ' zero-arg function are very like variables
                        AppendToCompiled opcode
                        sp = sp + 1
                        waitForOperator = True
                        ' zero-arg function may be followed by empty brackets
                        If Mid$(expr, Index, 2) = "()" Then
                            Index = Index + 2
                        End If
                    ElseIf Mid$(expr, Index, 1) = "(" Then
                        ' push the function opcode onto the stack
                        GoSub CompileExprPushOpcode
                        ' push the open bracket onto the stack ...
                        opcode = opOpenBracket
                        GoSub CompileExprPushOpcode
                        Index = Index + 1
                        ' ... but discard the new item added to argStack
                        argSp = argSp - 1
                    Else
                        ' all other functions must be followed by "("
                        m_ErrorDescription = ": missing brackets"
                        GoTo CompileExprSyntaxError
                    End If
                Else
                    ' it must be the name of a variable
                    Set newVar = Variable(temp, AutoCreateVariables)
                    If newVar Is Nothing Then
                        m_ErrorDescription = temp
                        GoTo CompileExprUnknownFunction
                    End If
                    AppendToCompiled opValue, newVar
                    sp = sp + 1
                    waitForOperator = True
                End If
                            
            Case Else
                ' any other character is a syntax error
                If Mid$(expr, Index, 1) = opNames(opEnd) Then
                    m_ErrorDescription = ": unexpected end of expression"
                Else
                    m_ErrorDescription = ": unknown symbol"
                End If
                GoTo CompileExprSyntaxError
    
            End Select
    
        Else
    
            ' we are expecting an operator
    
            ' remember which character comes before this one
            temp = Mid$(expr$, Index - 1, 1)
            ' search the opcode
            opcode = OperatorOpcode(expr, Index)
            If opcode = opUnknown Then GoTo CompileExprUnknownOperator
            
            If opcode = opAnd Or opcode = opOr Or opcode = opXor Or opcode = opMod Then
                ' a few binary operators must be preceeded by a space or a ")"
                ' and must be followed by a space or a "("
                If InStr(" )", temp) = 0 Then
                    GoTo CompileExprSyntaxError
                ElseIf InStr(" (", Mid$(expr$, Index, 1)) = 0 Then
                    GoTo CompileExprSyntaxError
                End If
            End If
    
            ' if it was not a ")" we must prepare to get an operand
            If opcode <> opCloseBracket Then waitForOperator = False
    
            '---------------------------------------------------------------------
            ' this portion of the routine compares the priority of the
            ' operator just parsed with the priority of other operators
            ' pending in opStack()
            ' As long as the priority of current operator or function is
            ' greater than the priority of the operator/function on top of
            ' opStack(), the latter must be popped off the stack and executed
            ' 255 is the highest priority, assigned to the "(" and the
            ' "start-of-expression" state; the test in the DO WHILE command
            ' prevents from popping too many items off the OPstack
            '---------------------------------------------------------------------
            
            Do While opPriority(opcode) <= opPriority(opStack(opSp)) And opPriority(opStack(opSp)) <> 255
                AppendToCompiled opStack(opSp)
                ' adjust the stack pointer
                If opNumArgs(opStack(opSp)) > 0 Then
                    ' this is a function
                    sp = sp - opNumArgs(opStack(opSp)) + 1
                ElseIf opStack(opSp) >= opFirst_BinaryOperator Then
                    ' this is a binary operator
                    sp = sp - 1
                End If
                ' pop the operator off the stack
                opSp = opSp - 1
                ' check that the expression is well-balanced
                If opSp < 0 Or sp <= 0 Then GoTo CompileExprSyntaxError
            Loop
    
            ' if the opcode terminates an operand
            If opNumArgs(opcode) = -1 Then
                argStack(argSp) = argStack(argSp) - 1
                If argStack(argSp) < 0 Then GoTo CompileExprWrongArgs
            End If
            
            ' A few opcodes need special treatment
                 
            Select Case opcode
                Case opEnd
                    If opSp <> 1 Then GoTo CompileExprSyntaxError
                    If argStack(argSp) <> 0 Then GoTo CompileExprWrongArgs
                    ReDim Preserve compOpcodes(compItems)
                    ReDim Preserve compValues(compItems)
                    m_ErrorPos = 0
                    Exit Sub
                Case opCloseBracket
                    If opStack(opSp) <> opOpenBracket Then GoTo CompileExprSyntaxError
                    If argStack(argSp) <> 0 Then GoTo CompileExprWrongArgs
                    ' pop the "(" off the stack
                    opSp = opSp - 1
                    argSp = argSp - 1
                Case opComma
                    If argStack(argSp) = 0 Then GoTo CompileExprWrongArgs
                    waitForOperator = False
                Case Else
                    ' all other opcodes must be pushed onto opStack ()
                    GoSub CompileExprPushOpcode
            End Select
        End If
    
    Loop
    
    ' this line is never executed ...

    '---------------------------------------------------------------------
    '   Subroutines
    '---------------------------------------------------------------------
                    
CompileExprPushOpcode:
    opSp = opSp + 1
    opStack(opSp) = opcode
    If opNumArgs(opcode) > 0 Then
        argSp = argSp + 1
        argStack(argSp) = opNumArgs(opcode)
        waitForOperator = False
    End If
    Return

CompileExprSyntaxError:
    m_ErrorCode = expSyntaxError
    m_ErrorDescription = "Syntax Error" & m_ErrorDescription
    Exit Sub

CompileExprUnknownFunction:
    m_ErrorCode = expUnknownFunction
    m_ErrorDescription = "Unknown function" & m_ErrorDescription
    Exit Sub

CompileExprWrongArgs:
    m_ErrorCode = expWrongNumberOfArguments
    m_ErrorDescription = "Wrong number of arguments for " & opNames(opStack(opSp - 1))
    Exit Sub

CompileExprUnknownOperator:
    m_ErrorCode = expUnknownOperator
    m_ErrorDescription = "Unknown operator" & m_ErrorDescription
    Exit Sub
    
End Sub

' append to the compiled expression
' (support routine for CompileExpression)

Private Sub AppendToCompiled(ByVal opcode As Integer, Optional Value As Variant)
    compItems = compItems + 1
    compOpcodes(compItems) = opcode
    If IsMissing(Value) Then
        ' do nothing
    ElseIf IsObject(Value) Then
        Set compValues(compItems) = Value
    Else
        compValues(compItems) = Value
    End If
End Sub

' move index past all blanks
' (support routine for CompileExpression)

Private Sub SkipBlanks(expr As String, Index As Long)
    Do While Asc(Mid$(expr, Index, 1)) = 32
        Index = Index + 1
    Loop
End Sub

' move index past a number and return the value
' (support routine for CompileExpression)

Private Function GetNumber(expr As String, Index As Long) As Variant
    Dim startIndex As Long, isDecimal As Boolean, number As String
    Dim digits As String
    
    digits = "0123456789"
    startIndex = Index
    
    ' this extracts the integer part
    Do While InStr(digits, Mid$(expr, Index, 1))
        Index = Index + 1
    Loop
    ' skip past the decimal part, if any
    If Mid$(expr$, Index, 1) = "." Then
        isDecimal = True
        Do
            Index = Index + 1
        Loop While InStr(digits, Mid$(expr, Index, 1))
    End If
    ' skip the exponent, if any
    If InStr("EeDd", Mid$(expr$, Index, 1)) Then
        Index = Index + 1
        If InStr("+-", Mid$(expr$, Index, 1)) Then Index = Index + 1
        Do While InStr(digits, Mid$(expr, Index, 1))
            Index = Index + 1
        Loop
    End If
    
    number = Mid$(expr, startIndex, Index - startIndex)
    If isDecimal Then
        GetNumber = Val(number)
    Else
        GetNumber = CLng(number)
    End If
End Function

' move index past an alphanumerical string and return the value
' (support routine for CompileExpression)

Private Function GetName(expr As String, Index As Long) As String
    Dim startIndex As Long, acode As Integer
    
    startIndex = Index
    Index = Index - 1
    Do
        Index = Index + 1
        acode = Asc(Mid$(expr, Index, 1))
        ' skip over digits, underscore, upper & lower characters
    Loop While (acode >= 48 And acode <= 57) Or (acode >= 65 And acode <= 90) Or (acode >= 97 And acode <= 122) Or acode = 95
        
    GetName = Mid$(expr, startIndex, Index - startIndex)
    SkipBlanks expr, Index
End Function

#If SupportStrings Then
' move index past a string constant and return the value
' (support routine for CompileExpression)

Private Function GetString(expr As String, Index As Long) As String
    Dim startIndex As Long
    Dim exprLen As Long
    Dim delimiter As Integer
    Dim mustFilter As Boolean
    Dim result As String
    Dim i As Long
    
    startIndex = Index
    delimiter = Asc(Mid$(expr, Index, 1))
    exprLen = Len(expr)
    
    Do
        Index = Index + 1
        If Index = exprLen Then
            ' exit if delimiter not found
            m_ErrorCode = expSyntaxError
            m_ErrorDescription = ": missing string delimiter"
            Exit Function
        ElseIf Asc(Mid$(expr, Index, 1)) = delimiter Then
            Index = Index + 1
            If Asc(Mid$(expr, Index, 1)) <> delimiter Then Exit Do
            mustFilter = True
        End If
    Loop

    result = Mid$(expr, startIndex + 1, Index - startIndex - 2)
    
    If mustFilter Then
        i = InStr(result, Chr$(delimiter))
        Do While i <> 0
            result = Left$(result, i) & Mid$(result, i + 2)
            i = InStr(i + 1, result, Chr$(delimiter))
        Loop
    End If
    
    GetString = result
End Function
#End If

' return the opcode of a function, or opUnknown if not a valid name
' (support routine for CompileExpression)

Private Function FunctionOpcode(funName As String) As expOpcodes
    Dim i As Long
    
    For i = opFirst_Function To opLast_Opcode
        If funName = opNames(i) Then
            FunctionOpcode = i
            Exit Function
        End If
    Next
    ' if the above search failed
    If funName = "NOT" Then
        FunctionOpcode = opNot
    Else
        FunctionOpcode = opUnknown
    End If
End Function

' return the opcode of an operator, or opUnknown if not a valid name
' (support routine for CompileExpression)

Private Function OperatorOpcode(expr As String, Index As Long) As expOpcodes
    Dim i As Long
    
    For i = opEnd To opFirst_Function - 1
        If InStr(Index, expr, opNames(i), vbTextCompare) = Index Then
            OperatorOpcode = i
            Index = Index + Len(opNames(i))
            Exit Function
        End If
    Next
    
    OperatorOpcode = opUnknown
    
End Function

' evaluate the expression using its compiled form
' it is possible to pass the value of all or part of the variables
Function Value(ParamArray vars() As Variant) As Variant
    On Error Resume Next
    Dim Index As Long, sp As Integer
    Dim Tos As Variant
    Dim stak(1 To STACK_SIZE) As Variant

    ' don't evaluate empty or uncorrect expressions
    If m_Expression = "" Or m_ErrorCode Then Exit Function
    
    ' assign values to variables
    For Index = LBound(vars) To UBound(vars)
        If Index >= m_Variables.Count Then Exit For
        m_Variables(Index + 1).Value = vars(Index)
    Next

    ' to raise errors in the calling application
    ' we just need not to trap errors in this function
    If Not RaiseErrors Then
        On Error GoTo ValueError
    End If
    
    ' prepare the default value, in case an error occurs
    Value = DefaultValue

    For Index = 1 To compItems
        Select Case compOpcodes(Index)
            Case opValue
                ' is a value
                ' (if it is a variable, its value is used automatically)
                sp = sp + 1
                stak(sp) = Tos
                Tos = compValues(Index)
            Case opPower
                Tos = stak(sp) ^ Tos
                sp = sp - 1
            Case opMul
                Tos = stak(sp) * Tos
                sp = sp - 1
            Case opDiv
                If Tos <> 0 Then
                  Tos = stak(sp) / Tos
                  sp = sp - 1
                Else
                  Value = DefaultValue
                  m_ErrorCode = expInvalidInputforFunction
                  m_ErrorDescription = "Division by zero"
                End If
            Case opIntDiv
                Tos = stak(sp) \ Tos
                sp = sp - 1
            Case opMod
                Tos = stak(sp) Mod Tos
                sp = sp - 1
            Case opAdd
                Tos = stak(sp) + Tos
                sp = sp - 1
            Case opSub
                Tos = stak(sp) - Tos
                sp = sp - 1
            Case opEq
                Tos = stak(sp) = Tos
                sp = sp - 1
            Case opLt
                Tos = stak(sp) < Tos
                sp = sp - 1
            Case opLe
                Tos = stak(sp) <= Tos
                sp = sp - 1
            Case opGt
                Tos = stak(sp) > Tos
                sp = sp - 1
            Case opGe
                Tos = stak(sp) >= Tos
                sp = sp - 1
            Case opNe
                Tos = stak(sp) <> Tos
                sp = sp - 1
            Case opMinus
                Tos = -Tos
            Case opNot
                Tos = Not Tos
            Case opAnd
                Tos = stak(sp) And Tos
                sp = sp - 1
            Case opOr
                Tos = stak(sp) Or Tos
                sp = sp - 1
            Case opXor
                Tos = stak(sp) Xor Tos
                sp = sp - 1
            Case opPi
                sp = sp + 1
                stak(sp) = Tos
                Tos = 3.14159265358979
            Case opDeg
                sp = sp + 1
                stak(sp) = Tos
                Tos = Atn(1) / 45
            Case opRad
                 sp = sp + 1
                stak(sp) = Tos
                Tos = 45 / Atn(1)
            Case opAbs
                Tos = Abs(Tos)
            Case opInt
                Tos = Int(Tos)
            Case opFix
                Tos = Fix(Tos)
            Case opSgn
                Tos = Sgn(Tos)
            Case opSqr
                Tos = Sqr(Tos)
            Case opLn
                If Tos > 0 Then
                  Tos = Log(Tos)
                Else
                   Value = DefaultValue
                   m_ErrorCode = expInvalidInputforFunction
                   m_ErrorDescription = "Cannot take Natural Log of a negative number"
                End If
            Case opLog
                 If Tos > 0 Then
                   Tos = Log(Tos) / Log(10)
                 Else
                   Value = DefaultValue
                   m_ErrorCode = expInvalidInputforFunction
                   m_ErrorDescription = "Cannot take LOG of a negative number"
                 End If
            Case opExp
                Tos = Exp(Tos)
            Case opSin
                Tos = Sin(Tos)
            Case opAsin
                If Tos >= -1 And Tos <= 1 Then
                  Tos = Atn(Tos / Sqr(-Tos * Tos + 1))
                Else
                  Value = DefaultValue
                  m_ErrorCode = expInvalidInputforFunction
                  m_ErrorDescription = "Invalid Input for ASIN"
                End If
            Case opCos
                Tos = Cos(Tos)
            Case opAcos
                If Tos >= -1 And Tos <= 1 Then
                  Tos = Atn(-Tos / Sqr(-Tos * Tos + 1)) + 2 * Atn(1)
                Else
                  Value = DefaultValue
                  m_ErrorCode = expInvalidInputforFunction
                  m_ErrorDescription = "Invalid Input for ACOS"
                End If
            Case opTan
                Tos = Tan(Tos)
            Case opAtn
                Tos = Atn(Tos)
            Case opAtan
                Tos = Atn(Tos)
            Case opSec
                Tos = 1 / Cos(Tos)
            Case opCosec
                Tos = 1 / Sin(Tos)
            Case opCotan
                Tos = 1 / Tan(Tos)
            Case opSin_D  'Sine in Degrees
                Tos = Sin(Tos * Atn(1) / 45)
            Case opCos_D  'Cos in Degrees
                Tos = Cos(Tos * Atn(1) / 45)
            Case opTan_D  'Tan in Degrees
                Tos = Tan(Tos * Atn(1) / 45)
            
            Case opPow
                Tos = stak(sp) ^ Tos
                sp = sp - 1
            
            Case opMin
                If stak(sp) < Tos Then Tos = stak(sp)
                sp = sp - 1
            Case opMax
                If stak(sp) > Tos Then Tos = stak(sp)
                sp = sp - 1
            Case opIIf
                If stak(sp - 1) Then Tos = stak(sp)
                sp = sp - 2
#If SupportStrings Then
            Case opAppend
                Tos = stak(sp) & Tos
                sp = sp - 1
            Case opLen
                Tos = Len(Tos)
            Case opAsc
                Tos = Asc(Tos)
            Case opSpace
                Tos = Space$(Tos)
            Case opString
                Tos = String$(stak(sp), Tos)
                sp = sp - 1
            Case opLeft
                Tos = Left$(stak(sp), Tos)
                sp = sp - 1
            Case opRight
                Tos = Right$(stak(sp), Tos)
                sp = sp - 1
            Case opMid
                Tos = Mid$(stak(sp - 1), stak(sp), Tos)
                sp = sp - 2
            Case opInstr
                Tos = InStr(stak(sp - 1), stak(sp), Tos)
                sp = sp - 2
#End If
                
            Case Else
                ' this should never occur
                Err.Raise 999, "CExpression", "Internal Error"
        End Select
    Next
    
    Value = Tos
    Exit Function
    
ValueError:
    ' exit with information in the Err object
    ' but without raising an error
    
End Function

' assign an expression and evaluate it in one single operation
Function Evaluate(expr As String, ParamArray vars() As Variant) As Variant
    ' if the value of variables is specified,
    ' they must appear in alphabetical order
    Dim i As Integer
    
    Expression = expr
    If m_Expression = "" Or m_ErrorCode Then Exit Function
    
    ' assign values to variables
    For i = LBound(vars) To UBound(vars)
        If i >= m_Variables.Count Then Exit For
        m_Variables(i + 1).Value = vars(i)
    Next
    
    ' evaluate it
    Evaluate = Value
End Function

' the expression in RPN format (read-only)

Property Get RPNExpression() As String
    Dim Index As Long, result As String
    Dim currItem As Variant
    Dim i As Long, char As String

    ' don't evaluate missing or uncorrect expressions
    If m_Expression = "" Or m_ErrorCode Then Exit Property

    For Index = 1 To compItems
                
        If compOpcodes(Index) = opValue Then
            ' it's an operand
            If IsObject(compValues(Index)) Then
                ' it's a variable
                result = result & " " & compValues(Index).Name
#If SupportStrings Then
            ElseIf VarType(compValues(Index)) = vbString Then
                ' it's a string constant
                currItem = compValues(Index)
                If InStr(currItem, """") = 0 Then
                    result = result & " """ & currItem & """"
                ElseIf InStr(currItem, "'") = 0 Then
                    result = result & " '" & currItem & "'"
                Else
                    result = result & " """
                    For i = 1 To Len(currItem)
                        char = Mid$(currItem, i, 1)
                        If char <> """" Then
                            result = result & char
                        Else
                            result = result & """"""
                        End If
                    Next
                    result = result & """"
                End If
#End If
            Else
                result = result & " " & Format$(compValues(Index))
            End If
        
        Else
            ' it is an operator
            result = result & " " & opNames(compOpcodes(Index))
        End If
    Next
    
    RPNExpression = result

End Property


Private Sub Class_Initialize()
    ' initialize all arrays
    AddOpcode opStart, "", 255, 1
    AddOpcode opOpenBracket, "(", 255, 1
    AddOpcode opMinus, "-", 18
    AddOpcode opNot, "NOT", 8
    
    AddOpcode opEnd, vbNullChar, 0, -1
    AddOpcode opComma, ",", 0, -1
    AddOpcode opCloseBracket, ")", 0, -1
    
    AddOpcode opPower, "^", 20
    AddOpcode opMul, "*", 17
    AddOpcode opDiv, "/", 17
    AddOpcode opIntDiv, "\", 16
    AddOpcode opMod, "MOD", 15
    AddOpcode opAdd, "+", 14
    AddOpcode opSub, "-", 14
    AddOpcode opEq, "=", 10
    AddOpcode opLt, "<", 10
    AddOpcode opLe, "<=", 10
    AddOpcode opGt, ">", 10
    AddOpcode opGe, ">=", 10
    AddOpcode opNe, "<>", 10
    AddOpcode opAnd, "AND", 7
    AddOpcode opOr, "OR", 6
    AddOpcode opXor, "XOR", 6
    
    AddOpcode opPi, "PI"
    AddOpcode opDeg, "DEG"
    AddOpcode opRad, "RAD"
    AddOpcode opAbs, "ABS", 30, 1
    AddOpcode opInt, "INT", 30, 1
    AddOpcode opFix, "FIX", 30, 1
    AddOpcode opSgn, "SGN", 30, 1
    AddOpcode opSqr, "SQR", 30, 1
    AddOpcode opLog, "LOG", 30, 1
    AddOpcode opLn, "LN", 30, 1
    AddOpcode opExp, "EXP", 30, 1
    AddOpcode opSin, "SIN", 30, 1
    AddOpcode opAsin, "ASIN", 30, 1
    AddOpcode opCos, "COS", 30, 1
    AddOpcode opAcos, "ACOS", 30, 1
    AddOpcode opTan, "TAN", 30, 1
    AddOpcode opAtn, "ATN", 30, 1
    AddOpcode opAtan, "ATAN", 30, 1
    AddOpcode opSec, "SEC", 30, 1
    AddOpcode opCosec, "CSC", 30, 1
    AddOpcode opCotan, "COT", 30, 1
    AddOpcode opSin_D, "SIN_D", 30, 1
    AddOpcode opCos_D, "COS_D", 30, 1
    AddOpcode opTan_D, "TAN_D", 30, 1
    
    AddOpcode opPow, "POW", 30, 2
    AddOpcode opMin, "MIN", 30, 2
    AddOpcode opMax, "MAX", 30, 2
    AddOpcode opIIf, "IIF", 30, 3
    
   
#If SupportStrings Then
    AddOpcode opAppend, "&", 4
    AddOpcode opLen, "LEN", 30, 1
    AddOpcode opAsc, "ASC", 30, 1
    AddOpcode opSpace, "SPACE", 30, 1
    AddOpcode opString, "STRING", 30, 2
    AddOpcode opLeft, "LEFT", 30, 2
    AddOpcode opRight, "RIGHT", 30, 2
    AddOpcode opMid, "MID", 30, 3
    AddOpcode opInstr, "INSTR", 30, 3
#End If
   
    RaiseErrors = True
    AutoCreateVariables = True
    Set m_Variables = New Collection
    Set m_Roots = New Collection
   
End Sub

' support routine used within Class_Initialize

Private Sub AddOpcode(opcode As Integer, opcodeName As String, Optional priority As Integer, Optional numArgs As Integer)
    opNames(opcode) = opcodeName
    opPriority(opcode) = priority
    opNumArgs(opcode) = numArgs
End Sub

