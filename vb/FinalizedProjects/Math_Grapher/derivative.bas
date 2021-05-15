Attribute VB_Name = "ModDerivative"
Option Explicit
Public Function GetDerivative(func As String) As String
Dim i As Byte
GetDerivative = Derivative(EditedEqu(func, True))
GetDerivative = Replace(GetDerivative, " ", "")
For i = 1 To 10
GetDerivative = Replace(GetDerivative, "++", "+")
GetDerivative = Replace(GetDerivative, "--", "+")
GetDerivative = Replace(GetDerivative, "+-", "-")
GetDerivative = Replace(GetDerivative, "-+", "-")
Next
End Function

Public Function Derivative(func As String, Optional InBrackets As Boolean = False) As String
On Error Resume Next
Dim depth As Integer, depth1 As Integer, i As Long, j As Long, EndOfFirstPart As Long
If func = "x" Then Derivative = "1": Exit Function
If InStr(1, func, "x") = 0 Then Derivative = "0": Exit Function

Dim FirstF As String, SecondF As String, InsideF As String
depth = 0
For i = 1 To Len(func)
    If Mid(func, i, 1) = "(" Then depth = depth + 1
    If Mid(func, i, 1) = ")" Then depth = depth - 1
    If depth = 0 Then
        FirstF = Mid(func, 1, i - 1)
        SecondF = Mid(func, i + 1, Len(func) - i)
        If Mid(func, i, 1) = "+" Then
            If InStr(1, FirstF, "x") <> 0 Then Derivative = Derivative(FirstF)
            If InStr(1, FirstF, "x") <> 0 And InStr(1, SecondF, "x") <> 0 Then Derivative = Derivative + "+"
            If InStr(1, SecondF, "x") <> 0 Then Derivative = Derivative + Derivative(SecondF)
            If Derivative = "" Then Derivative = "0"
            If InStr(1, Derivative, "x") = 0 Then Derivative = Str(Stringval(Derivative))
            Exit Function
        End If
        
        If Mid(func, i, 1) = "-" Then
            depth1 = 0
            EndOfFirstPart = Len(func)
            If Not (Mid(func, i + 1, 1) = "+" Or Mid(func, i + 1, 1) = "-") Then
            For j = i + 1 To Len(func)
            If Mid(func, j, 1) = "(" Then depth1 = depth1 + 1
            If Mid(func, j, 1) = ")" Then depth1 = depth1 - 1
            If depth1 = 0 And (Mid(func, j, 1) = "+" Or Mid(func, j, 1) = "-") Then EndOfFirstPart = j - 1
            Next
            End If
            If InStr(1, FirstF, "x") <> 0 Then Derivative = Derivative(FirstF)
            If InStr(1, Mid(func, i + 1, EndOfFirstPart - i), "x") <> 0 Then
                If IsInZeroDepth(SecondF, "+") = False And IsInZeroDepth(SecondF, "-") = False Then
                    Derivative = Derivative + "-" + PutBracketsPlusMinus(Derivative(SecondF))
                Else
                    Derivative = Derivative + "-" + Derivative(SecondF)
                End If
            ElseIf EndOfFirstPart <> Len(func) Then
                If Derivative <> "" Then Derivative = Derivative + "+"
                Derivative = Derivative + Derivative(Mid(func, EndOfFirstPart + 1, Len(func) - EndOfFirstPart))
            End If
            If Derivative = "" Then Derivative = "0"
            If InStr(1, Derivative, "x") = 0 Then Derivative = Str(Stringval(Derivative))
            Exit Function
        End If
    End If
Next

depth = 0
For i = Len(func) To 1 Step -1
    If Mid(func, i, 1) = "(" Then depth = depth + 1
    If Mid(func, i, 1) = ")" Then depth = depth - 1
    If depth = 0 Then
        FirstF = Mid(func, 1, i - 1)
        SecondF = Mid(func, i + 1, Len(func) - i)
        If Mid(func, i, 1) = "*" Then
            If FirstF <> "0" And InStr(1, SecondF, "x") <> 0 Then Derivative = Delete1(FirstF + "*" + PutBracketsPlusMinus(Derivative(SecondF)))
            If Derivative <> "" And SecondF <> "0" And InStr(1, FirstF, "x") <> 0 Then Derivative = Derivative + "+"
            If SecondF <> "0" And InStr(1, FirstF, "x") <> 0 Then Derivative = Derivative + Delete1(SecondF + "*" + PutBracketsPlusMinus(Derivative(FirstF)))
            If Derivative = "" Then Derivative = "0"
            If InStr(1, Derivative, "x") = 0 Then Derivative = Str(Stringval(Derivative))
            Exit Function
        End If
        If Mid(func, i, 1) = "/" Then
            If SecondF <> "0" And InStr(1, FirstF, "x") <> 0 Then Derivative = Delete1(SecondF + "*" + PutBrackets(Derivative(FirstF)))
            If FirstF <> "0" And InStr(1, SecondF, "x") <> 0 Then Derivative = Derivative + "-" + Delete1(FirstF + "*" + PutBrackets(Derivative(SecondF)))
            If Derivative <> "" Then Derivative = PutBrackets(Derivative) + "/" + SecondF + "^2"
            If Derivative = "" Then Derivative = "0"
            If InStr(1, Derivative, "x") = 0 Then Derivative = Str(Stringval(Derivative))
            Exit Function
        End If
    End If
Next

depth = 0
For i = Len(func) To 1 Step -1
    If Mid(func, i, 1) = "(" Then depth = depth + 1
    If Mid(func, i, 1) = ")" Then depth = depth - 1
    If depth = 0 Then
        FirstF = Mid(func, 1, i - 1)
        SecondF = Mid(func, i + 1, Len(func) - i)
        If Mid(func, i, 1) = "^" And InStr(1, SecondF, "x") = 0 Then Derivative = PutBracketsPlusMinus(Str(Stringval(SecondF))) + "*" + FirstF + DeletePower("^" + PutBracketsPlusMinus(Str(Stringval(SecondF) - 1))) + Delete1("*" + Derivative(FirstF)): Exit Function
        If Mid(func, i, 1) = "^" Then
            Derivative = func + "*(" + Delete1(Derivative(SecondF) + "*ln(" + FirstF + ")") '+ "+(" + SecondF + ")*(" + Derivative(FirstF) + ")/(" + FirstF + "))": Exit Function
            If Derivative(FirstF) <> 0 Then Derivative = Derivative + "+" + Delete1(SecondF + "*" + Derivative(FirstF)) + "/" + FirstF
            Derivative = Derivative + ")"
            If InStr(1, Derivative, "x") = 0 Then Derivative = Str(Stringval(Derivative))
            Exit Function
        End If
    End If
Next
Dim InsDer As String, InsideF2 As String

For i = 5 To 2 Step -1
If IsFunc(Mid(func, 1, i)) Then
    InsideF = Mid(func, i + 1, Len(func) - i)
    InsideF2 = PutBrackets(Mid(InsideF, 2, Len(InsideF) - 2))
    InsDer = Derivative(Mid(InsideF, 2, Len(InsideF) - 2))
    Select Case Mid(func, 1, i)
    Case "sin"
    Derivative = "cos" + InsideF
    Case "cos"
    Derivative = "-sin" + InsideF
    Case "tan"
    Derivative = "sec" + InsideF + "^2"
    Case "cot"
    Derivative = "-csc" + InsideF + "^2"
    Case "sec"
    Derivative = "sec" + InsideF + "*tan" + InsideF
    Case "csc"
    Derivative = "-csc" + InsideF + "*cot" + InsideF
    Case "asin"
    Derivative = "1/sqr(1-" + InsideF2 + "^2)"
    Case "acos"
    Derivative = "-1/sqr(1-" + InsideF2 + "^2)"
    Case "atan"
    Derivative = "1/(1+" + InsideF2 + "^2)"
    Case "asec"
    Derivative = "1/(abs" + InsideF + "*sqr(" + InsideF2 + "^2-1))"
    Case "acsc"
    Derivative = "-1/(abs" + InsideF + "*sqr(" + InsideF2 + "^2-1))"
    Case "acot"
    Derivative = "-1/(1+" + InsideF2 + "^2)"
    Case "sinh"
    Derivative = "cosh" + InsideF
    Case "cosh"
    Derivative = "sinh" + InsideF
    Case "tanh"
    Derivative = "1/cosh" + InsideF + "^2"
    Case "sech"
    Derivative = "-sech" + InsideF + "*tanh" + InsideF
    Case "csch"
    Derivative = "-csch" + InsideF + "*coth" + InsideF
    Case "coth"
    Derivative = "-csch" + InsideF + "^2"
    Case "asinh"
    Derivative = "1/sqr(" + InsideF2 + "+1)"
    Case "acosh"
    Derivative = "1/sqr(" + InsideF2 + "-1)"
    Case "atanh"
    Derivative = "1/(1-" + InsideF2 + "^2)"
    Case "asech"
    Derivative = "-1/(abs" + InsideF + "*sqr(1-" + InsideF2 + "^2))"
    Case "acsch"
    Derivative = "-1/(abs" + InsideF + "*sqr(1+" + InsideF2 + "^2))"
    Case "acoth"
    Derivative = "1/(1-" + InsideF2 + "^2)"
   
    Case "log", "ln"
    Derivative = "1/" + InsideF2
    Case "lg"
    Derivative = "1/(" + InsideF2 + "*ln(10))"
    Case "abs"
    Derivative = "sgn" + InsideF
    Case "sgn", "int"
    Derivative = "0"
    Case "sqr"
    Derivative = "0.5*" + InsideF + "^(-0.5)" '"1/(2*sqr" + InsideF + ")"
    End Select
    
    If InsDer <> "1" And InsDer <> "0" And Derivative <> "0" Then Derivative = Derivative + "*" + PutBrackets(InsDer)
    If Derivative = "" Then Derivative = "0"
    Exit Function
End If
Next

If Mid(func, 1, 1) = "(" And Mid(func, Len(func), 1) = ")" Then
    If InBrackets = False Then Derivative = "("
    Derivative = Derivative + Derivative(Mid(func, 2, Len(func) - 2), True)
    If InBrackets = False Then Derivative = Derivative + ")"
End If


End Function
Private Function PutBrackets(func As String) As String
Dim start As Byte, i As Byte, depth As Integer, NeedBrck As Boolean
start = 1
For i = 2 To 5
If IsFunc(Mid(func, 1, i)) = True And Len(func) >= i + 2 Then start = i + 1
Next

If Mid(func, start, 1) = "(" And Mid(func, Len(func), 1) = ")" Then
depth = 0
NeedBrck = False
For i = start + 1 To Len(func) - 1
If Mid(func, i, 1) = "(" Then depth = depth + 1
If Mid(func, i, 1) = ")" Then depth = depth - 1
If depth < 0 Then NeedBrck = True: Exit For
Next
If NeedBrck = False Then PutBrackets = func: Exit Function
End If

If (IsNumeric(func) And Val(func) >= 0) Or func = "x" Then
PutBrackets = func
Else
PutBrackets = "(" + func + ")"
End If
End Function
Private Function PutBracketsPlusMinus(func As String) As String
Dim start As Byte, i As Byte, depth As Integer, NeedBrck As Boolean
start = 1
For i = 2 To 5
If IsFunc(Mid(func, 1, i)) = True And Len(func) >= i + 2 Then start = i + 1
Next

If Mid(func, start, 1) = "(" And Mid(func, Len(func), 1) = ")" Then
depth = 0
NeedBrck = False
For i = start + 1 To Len(func) - 1
If Mid(func, i, 1) = "(" Then depth = depth + 1
If Mid(func, i, 1) = ")" Then depth = depth - 1
If depth < 0 Then NeedBrck = True: Exit For
Next
If NeedBrck = False Then PutBracketsPlusMinus = func: Exit Function
End If

If (IsNumeric(func) And Val(func) >= 0) Or func = "x" Or (IsInZeroDepth(func, "+") = False And IsInZeroDepth(func, "-") = False) Then
PutBracketsPlusMinus = func
Else
PutBracketsPlusMinus = "(" + func + ")"
End If
End Function

Private Function IsInZeroDepth(string1 As String, string2 As String) As Boolean
Dim depth As Integer, i As Integer
IsInZeroDepth = False
depth = 0
For i = 1 To Len(string1)
    If Mid(string1, i, 1) = "(" Then depth = depth + 1
    If Mid(string1, i, 1) = ")" Then depth = depth - 1
    If depth = 0 And Mid(string1, i, 1) = string2 Then IsInZeroDepth = True: Exit Function
Next
End Function
Private Function Delete1(func As String) As String
Dim i As Long, depth As Integer
Dim FirstF1 As String, SecondF1 As String
For i = 1 To Len(func)
    If Mid(func, i, 1) = "(" Then depth = depth + 1
    If Mid(func, i, 1) = ")" Then depth = depth - 1
    If depth = 0 Then
        FirstF1 = Mid(func, 1, i - 1)
        SecondF1 = Mid(func, i + 1, Len(func) - i)
        If Mid(func, i, 1) = "*" Then
            If FirstF1 = "1" Then Delete1 = Mid(func, i + 1, Len(func) - i): Exit Function
            If SecondF1 = "1" Then Delete1 = Mid(func, 1, i - 1): Exit Function
        End If
    End If
Next
Delete1 = func
End Function
Private Function DeletePower(func As String) As String
If func = "^1" Or func = "^ 1" Then DeletePower = "" Else DeletePower = func
End Function
Public Function IsFunc(func As String) As Boolean
If func = "sin" Or func = "cos" Or func = "tan" Or func = "sec" Or func = "csc" Or func = "cot" Or func = "asin" Or func = "acos" Or func = "atan" Or func = "acsc" Or func = "asec" Or func = "acot" Or func = "sinh" Or func = "cosh" Or func = "tanh" Or func = "sech" Or func = "csch" Or func = "coth" Or func = "asinh" Or func = "acosh" Or func = "atanh" Or func = "acsch" Or func = "asech" Or func = "acoth" Or func = "log" Or func = "lg" Or func = "ln" Or func = "abs" Or func = "sgn" Or func = "int" Or func = "sqr" Or func = "exp" Then IsFunc = True Else IsFunc = False
End Function
Public Function nDerivative(func As String, n As Byte) As String
If n = 0 Then
nDerivative = func
Else
nDerivative = GetDerivative(nDerivative(func, n - 1))
End If
End Function
'Public Function EditDerivative(Der As String) As String
'Dim Numbers As Integer, Der1 As String, edited As Boolean
'''On Error Resume Next
'Numbers = 0
'Der1 = Der
'restart:
'For i = 1 To Len(Der1)
'    edited = False
'    If Mid(Der1, i, 1) = " " Then Der1 = myreplace(Der1, i - 1, 1, ""): edited = True: Exit For
'    If Mid(Der1, i, 1) = "(" Then 'Numbers = 0
'        depth = 1
'        For j = i + 1 To Len(Der1)
'            If Mid(Der1, j, 1) = "(" Then depth = depth + 1
'            If Mid(Der1, j, 1) = ")" Then depth = depth - 1
'            If Mid(Der1, j, 1) = "x" Then Exit For
'            If depth = 0 Then Der1 = myreplace(Der1, i - 1, j - i + 1, Str(Stringval(Mid(Der1, i, j - i + 1)))): edited = True: Exit For
'        Next
'    End If
'    If edited = True Then Exit For
'
'    'If Mid(Der1, i, 1) = "0" And Mid(Der1, i + 1, 1) = "*" Then
'    If (Mid(Der1, i, 2) = "1*" And Isnumber(Mid(Der1, i - 1, 1)) = False) Or (Mid(Der1, i, 2) = "*1" And Isnumber(Mid(Der1, i + 2, 1)) = False) Then Der1 = myreplace(Der1, i - 1, 2, ""): edited = True: Exit For
'Next
'If edited = True Then GoTo restart
'If Mid(Der, i + 1, 1) = "-" Then Numbers = 1: i = i + 1
'if isnumber
'EditDerivative = Der1
'End Function
