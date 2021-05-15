Attribute VB_Name = "ModMain"
Option Explicit
Public Declare Function GetTickCount Lib "kernel32" () As Long

Public pTop As Double, pBottom As Double, pLeft As Double, pRight As Double
Public backstyle As String, backcolour As Long, backpic As String
Public math As New MathFunctions
Public Type XY
x As Double
y As Double
End Type

Public Type FUNCTION_INFO
Type As String
expression1 As String
expression2 As String
color As Long
HasPeriod As Boolean
start As Double
end As Double
Shown As Boolean
CenterSign As String
End Type

Public Type FontDescription
FontBold As Boolean
FontItalic As Boolean
FontUnderline As Boolean
FontStrikeThru As Boolean
FontName As String
FontSize As Single
End Type

Public AllFunctions(500) As FUNCTION_INFO, numfunctions As Integer, NumInequalities As Integer
Public zoom As Double
Public selfunc As Integer
Public quality As Double, qualitylevel As Integer
Public zoomfactor As Integer
Public AutoRandomize As Boolean
Public AxisColor As Long, TicksColor As Long, MarksColor As Long, MajorGridColor As Long, MinorGridColor As Long
Public AxisLineStyle As Byte, GridLineStyle As Byte
Public AxisLineWidth As Byte
Public GridType As Byte
Public ShowMajorGrid As Boolean, ShowMinorGrid As Boolean
Public MarksFont As FontDescription
Public TrigX As Boolean, TrigY As Boolean

Private Sub background()
Select Case backstyle
Case "color"
frmMain.Picgraph.BackColor = backcolour
Case "picture"
frmMain.Picgraph.PaintPicture LoadPicture(backpic), 0, 0, frmMain.Picgraph.ScaleWidth, frmMain.Picgraph.ScaleHeight
End Select
End Sub
Public Sub ReDraw()
Dim i As Integer
Dim halltime As Integer, time1 As Integer, time2 As Integer
frmMain.Picgraph.Cls
background
frmMain.createcoordinates
For i = 1 To numfunctions
halltime = estTime(1, numfunctions)
time1 = estTime(0, i - 1)
time2 = estTime(0, i)
If AllFunctions(i).Shown = True Then Call frmMain.DrawFunction(i, time1 / halltime * 100, time2 / halltime * 100)
Next

End Sub

Public Sub RefreshAll()
Dim i As Integer
Dim halltime As Integer, time1 As Integer, time2 As Integer
frmMain.Picgraph.Cls
background
frmMain.ListView1.ListItems.Clear
frmMain.createcoordinates
NumInequalities = 0
For i = 1 To numfunctions
halltime = estTime(1, numfunctions)
time1 = estTime(0, i - 1)
time2 = estTime(0, i)
If AllFunctions(i).Shown = True Then Call frmMain.DrawFunction(i, time1 / halltime * 100, time2 / halltime * 100)
Call frmMain.AddToList(i)
Next

End Sub
Private Function estTime(begin As Integer, finish As Integer) As Long
Dim i As Integer
estTime = 0
For i = begin To finish
If AllFunctions(i).Shown = True Then
Select Case AllFunctions(i).Type
Case "normal", "inverse"
estTime = estTime + 1
Case "parametric"
estTime = estTime + 2
Case "polar"
estTime = estTime + 2
Case "implicit"
estTime = estTime + 40
End Select
End If
Next

End Function
Public Function SlopeCalc(xpoint As Double, Optional Index As Byte = 0) As Double
Dim x1 As Double, y1 As Double, x2 As Double, y2 As Double
x1 = xpoint - 0.000001
x2 = xpoint + 0.000001
y1 = GetVal(x1, 0, 0, Index)
y2 = GetVal(x2, 0, 0, Index)
SlopeCalc = (y2 - y1) / (x2 - x1)
End Function
Public Function DerivativeCalc(xpoint As Double, DerivativeNum) As Double
Dim x1 As Double, y1 As Double, x2 As Double, y2 As Double
If DerivativeNum = 0 Then
    DerivativeCalc = GetVal(xpoint, 0, 0, 0)
    Exit Function
End If
x1 = xpoint - 0.000001
x2 = xpoint + 0.000001
y1 = DerivativeCalc(x1, DerivativeNum - 1)
y2 = DerivativeCalc(x2, DerivativeNum - 1)
DerivativeCalc = (y2 - y1) / (x2 - x1)
End Function
Public Function OnPicture(x As Double, y As Double) As XY
Dim xx As Double, yy As Double
xx = ((x - pLeft) / (pRight - pLeft)) * frmMain.Picgraph.ScaleWidth
yy = (1 - ((y - pBottom) / (pTop - pBottom))) * frmMain.Picgraph.ScaleHeight
OnPicture.x = xx
OnPicture.y = yy
End Function
Public Function OnPictureXYXY(point As XY) As XY
Dim xx As Double, yy As Double
xx = ((point.x - pLeft) / (pRight - pLeft)) * frmMain.Picgraph.ScaleWidth
yy = (1 - ((point.y - pBottom) / (pTop - pBottom))) * frmMain.Picgraph.ScaleHeight
OnPictureXYXY.x = xx
OnPictureXYXY.y = yy
End Function

Public Function Stringval(expression As String) As Double
'On Error Resume Next
'expression1 = EditedEqu(expression)
'frmMain.ScriptControl2.ExecuteStatement "on error resume next"
'Stringval = frmMain.ScriptControl2.eval(expression1)
Dim edited As String
edited = EditedEqu(expression)
If IsValid(edited, False, False, False) = False Then Stringval = Val(edited): Exit Function
Call frmMain.Init(edited, 4)
Stringval = GetVal(0, 0, 0, 4)
End Function
Public Function GetVal(x As Double, y As Double, t As Double, Index As Byte, Optional Implicit As Boolean = False) As Double
Dim a As Double
If Implicit = False Then
    a = frmMain.ScriptControl1(Index).Run("RunThis", x, y, t)
    If a = 987654321.020507 Then math.Error = True: Exit Function
    GetVal = a
Else
    a = frmMain.ScriptControl1(Index).Run("RunThis1", x, y, t)
    If a = 0 Then a = frmMain.ScriptControl1(Index).Run("RunThis", x, y, t)
    GetVal = a
End If
End Function
Public Function StrGetVal(x As Double, y As Double, t As Double, Index As Byte) As String
math.Error = False
Dim u As Double
u = GetVal(x, y, t, Index)
If math.Error = True Then StrGetVal = "Error" Else StrGetVal = Str(Round(u, 12))
End Function
Public Function GetLimit(func As String, x As Double) As String
Dim expression As String, Der As String
Dim MaxDiff As Double
expression = EditedEqu(func)
Call frmMain.Init(expression, 2)
Call frmMain.Init(EditedEqu(GetDerivative(func)), 3)
math.Error = False
Dim y As Double, x1 As Double, x2 As Double, y1 As Double, y2 As Double
x1 = x - 0.000000000000001
x2 = x + 0.000000000000001
y1 = GetVal(x1, 0, 0, 2)
y2 = GetVal(x2, 0, 0, 2)
Der = Larger(Abs(GetVal(x1, 0, 0, 3)), Abs(GetVal(x2, 0, 0, 3)))
MaxDiff = 0.000000000000004 * Der
If MaxDiff < 0.000000000000001 Then MaxDiff = 0.000000000000001
If MaxDiff > 1 Then MaxDiff = 1
If Abs(y1 - y2) <= MaxDiff Then
GetLimit = Trim(Str(Round((y1 + y2) / 2, 6)))
If StrGetVal(x, 0, 0, 2) <> "Error" Then GetLimit = StrGetVal(x, 0, 0, 2)
Else
GetLimit = "Does not exist"
End If
If StrGetVal(x1, 0, 0, 2) = "Error" Or StrGetVal(x2, 0, 0, 2) = "Error" Then GetLimit = "Does not exist"
End Function

Public Sub AddFunction(TheFunction As FUNCTION_INFO)
numfunctions = numfunctions + 1
AllFunctions(numfunctions) = TheFunction
frmMain.AddToList (numfunctions)
If AutoRandomize = True Then
    Randomize
    frmMain.PicColor.BackColor = RGB(Rnd * 200, Rnd * 200, Rnd * 200)
End If
End Sub
Public Function Larger(x1, x2)
If x1 > x2 Then Larger = x1 Else Larger = x2
End Function

Public Function Smaller(x1, x2)
If x1 < x2 Then Smaller = x1 Else Smaller = x2
End Function

Public Function IsValid(expression As String, IsvalidX As Boolean, IsValidY As Boolean, IsValidT As Boolean) As Boolean
IsValid = True
Dim ExpArray() As String, NumElements As Integer
ReDim ExpArray(Len(expression)) As String
Dim NumLB As Integer, NumRB As Integer, i As Integer, j As Integer
NumElements = 0
NumLB = 0: NumRB = 0
i = 1
Do Until i > Len(expression)
If Mid(expression, i, 1) = "(" Then NumElements = NumElements + 1: ExpArray(NumElements) = "(": NumLB = NumLB + 1: i = i + 1: GoTo skip
If Mid(expression, i, 1) = ")" Then
    NumElements = NumElements + 1: ExpArray(NumElements) = ")": NumRB = NumRB + 1
    If (NumLB - NumRB) < 0 Then IsValid = False: Exit Function
    i = i + 1: GoTo skip
End If

If Isnumber(Mid(expression, i, 1)) = True Then
    j = i
    Do
        If Isnumber(Mid(expression, j, 1)) = True Then
            j = j + 1
        Else
            Exit Do
        End If
    Loop
    NumElements = NumElements + 1
    ExpArray(NumElements) = "num"
    i = j: GoTo skip
End If
If IsOper(Mid(expression, i, 1)) = True Then NumElements = NumElements + 1: ExpArray(NumElements) = "oper": i = i + 1: GoTo skip
For j = 2 To 5
If IsFunc(Mid(expression, i, j)) = True And Mid(expression, i + j, 1) = "(" Then
NumElements = NumElements + 1
ExpArray(NumElements) = "func"
i = i + j
GoTo skip: Exit For
End If
Next
If ((Mid(expression, i, 1) = "x" And IsvalidX = True) Or (Mid(expression, i, 1) = "y" And IsValidY = True) Or (Mid(expression, i, 1) = "t" And IsValidT = True)) And (i = Len(expression) Or (i < Len(expression) And isletter(Mid(expression, i + 1, 1)) = False)) Then
NumElements = NumElements + 1
ExpArray(NumElements) = "num": i = i + 1: GoTo skip ' a variable is like a number
End If
If (Mid(expression, i, 1) = "e") And (i = Len(expression) Or (i < Len(expression) And isletter(Mid(expression, i + 1, 1)) = False)) Then
NumElements = NumElements + 1
ExpArray(NumElements) = "num": i = i + 1: GoTo skip ' a variable is like a number
End If
IsValid = False: Exit Function
skip:
Loop
If NumElements = 0 Then IsValid = False: Exit Function
If NumLB <> NumRB Then IsValid = False: Exit Function

For i = 1 To NumElements
Select Case ExpArray(i)
Case "num"
If i > 1 Then
    If ExpArray(i - 1) = ")" Or ExpArray(i - 1) = "func" Then IsValid = False: Exit Function
End If
If i < NumElements Then
    If ExpArray(i + 1) = "(" Or ExpArray(i + 1) = "func" Or ExpArray(i + 1) = "num" Then IsValid = False: Exit Function
End If

Case "func"
If i > 1 Then
    If ExpArray(i - 1) = ")" Or ExpArray(i - 1) = "func" Or ExpArray(i - 1) = "num" Then IsValid = False: Exit Function
End If
If i < NumElements Then
    If ExpArray(i + 1) = "num" Or ExpArray(i + 1) = "oper" Or ExpArray(i + 1) = "func" Or ExpArray(i + 1) = ")" Then IsValid = False: Exit Function
End If
If i = NumElements Then IsValid = False: Exit Function

Case "oper"
If i > 1 Then
    If ExpArray(i - 1) = "func" Then IsValid = False: Exit Function
End If
If i < NumElements Then
    If ExpArray(i + 1) = ")" Then IsValid = False: Exit Function
End If
If i = NumElements Then IsValid = False: Exit Function

Case "("
If i > 1 Then
    If ExpArray(i - 1) = ")" Or ExpArray(i - 1) = "num" Then IsValid = False: Exit Function
End If
If i < NumElements Then
    If ExpArray(i + 1) = ")" Then IsValid = False: Exit Function
End If
If i = NumElements Then IsValid = False: Exit Function

Case ")"
If i > 1 Then
    If ExpArray(i - 1) = "(" Or ExpArray(i - 1) = "func" Or ExpArray(i - 1) = "oper" Then IsValid = False: Exit Function
End If
If i = 1 Then IsValid = False: Exit Function
If i < NumElements Then
    If ExpArray(i + 1) = "num" Or ExpArray(i + 1) = "(" Or ExpArray(i + 1) = "func" Then IsValid = False: Exit Function
End If
End Select
Next

If InStr(1, expression, "**") <> 0 Or InStr(1, expression, "//") <> 0 Or InStr(1, expression, "^^") <> 0 Or InStr(1, expression, "/*") <> 0 Or InStr(1, expression, "*/") <> 0 Or InStr(1, expression, "/^") <> 0 Or InStr(1, expression, "^/") <> 0 Or InStr(1, expression, "*^") <> 0 Or InStr(1, expression, "^*") <> 0 Or InStr(1, expression, "^^") <> 0 Or InStr(1, expression, "+*") <> 0 Or InStr(1, expression, "+/") <> 0 Or InStr(1, expression, "-*") <> 0 Or InStr(1, expression, "-/") <> 0 Or InStr(1, expression, "+^") <> 0 Or InStr(1, expression, "-^") <> 0 Or InStr(1, expression, "(*") <> 0 Or InStr(1, expression, "(/") <> 0 Or InStr(1, expression, "(^") <> 0 Or InStr(1, expression, "^+") <> 0 Or InStr(1, expression, "^-") <> 0 Or InStr(1, expression, "*+") <> 0 Or InStr(1, expression, "*-") <> 0 Or InStr(1, expression, "/+") <> 0 Or InStr(1, expression, "/-") <> 0 Then IsValid = False: Exit Function
If Mid(expression, 1, 1) = "*" Or Mid(expression, 1, 1) = "/" Or Mid(expression, 1, 1) = "^" Then IsValid = False: Exit Function
End Function

Public Function isletter(chr As String) As Boolean
Select Case chr
Case "a" To "z"
isletter = True
Case Else
isletter = False
End Select
End Function
Public Function Isnumber(char As String) As Boolean
If char = "1" Or char = "2" Or char = "3" Or char = "4" Or char = "5" Or char = "6" Or char = "7" Or char = "8" Or char = "9" Or char = "0" Or char = "." Then
Isnumber = True
Else
Isnumber = False
End If
End Function
Public Function IsOper(char As String) As Boolean
If char = "+" Or char = "-" Or char = "*" Or char = "/" Or char = "^" Then IsOper = True Else IsOper = False
End Function
Public Function myreplace(expression As String, afterwhat As Integer, length As Integer, replacement As String) As String
myreplace = Mid(expression, 1, afterwhat) & replacement & Mid(expression, afterwhat + length + 1, Len(expression) - afterwhat - length)
End Function
Public Function MyRound(num As Double, Decimals As Integer)
Dim num1 As Double, num2 As Double
num1 = num * 10 ^ Decimals
num2 = Int(num1)
If num1 - num2 >= 0.5 Then num2 = num2 + 1
MyRound = num2 / 10 ^ Decimals
End Function
Public Function EditedEqu(expression As String, Optional ToDerive As Boolean = False) As String
Dim expression1 As String, i As Integer
expression1 = expression
expression1 = LCase(expression1)

If InStr(1, expression1, "pi") <> 0 Then
expression1 = Replace(expression1, "pi", "(" & Str(Pi) & ")")
End If

'If InStr(1, expression1, "log(") <> 0 Then
'expression1 = Replace(expression1, "log(", "lg(")
'End If

'If InStr(1, expression1, "ln(") <> 0 Then
'expression1 = Replace(expression1, "ln(", "log(")
'End If

If InStr(1, expression1, "sqrt(") <> 0 Then
expression1 = Replace(expression1, "sqrt(", "sqr(")
End If

If InStr(1, expression1, "atn(") <> 0 Then
expression1 = Replace(expression1, "atn(", "atan(")
End If

For i = 1 To 10
expression1 = Replace(expression1, "++", "+")
expression1 = Replace(expression1, "--", "+")
expression1 = Replace(expression1, "+-", "-")
expression1 = Replace(expression1, "-+", "-")
Next
'a = InStr(1, expression1, "e")
'If a <> 0 Then
'If isletter(Mid(exptession1, a + 1, 1)) = False Then
'expression1 = Replace(expression1, "e", "(" & Str(e) & ")")
'End If
'End If



restart:
For i = 1 To Len(expression1)

If Mid(expression1, i, 1) = " " Then
expression1 = myreplace(expression1, i - 1, 1, "")
GoTo restart
Exit For
End If

If i > 1 Then
    
    If ToDerive = False Then
        If Mid(expression1, i, 1) = "-" And Mid(expression1, i - 1, 1) <> "e" And Mid(expression1, i - 1, 1) <> "*" And Mid(expression1, i - 1, 1) <> "/" And Mid(expression1, i - 1, 1) <> "^" And Mid(expression1, i + 1, 1) <> "1" Then
        expression1 = myreplace(expression1, i - 1, 1, "+(-1)*")
        GoTo restart
        Exit For
        End If
    End If
    If Mid(expression1, i, 1) = "x" And (Isnumber(Mid(expression1, i - 1, 1)) = True Or Mid(expression1, i - 1, 1) = ")" Or Mid(expression1, i - 1, 1) = "y") Then
    expression1 = myreplace(expression1, i - 1, 0, "*")
    GoTo restart
    Exit For
    End If
    
    
    If Mid(expression1, i, 1) = "y" And (Isnumber(Mid(expression1, i - 1, 1)) = True Or Mid(expression1, i - 1, 1) = ")" Or Mid(expression1, i - 1, 1) = "x") Then
    expression1 = myreplace(expression1, i - 1, 0, "*")
    GoTo restart
    Exit For
    End If
    
    
    
    If isletter(Mid(expression1, i, 1)) = True And (Isnumber(Mid(expression1, i - 1, 1)) = True Or Mid(expression1, i - 1, 1) = ")" Or Mid(expression1, i - 1, 1) = "x" Or Mid(expression1, i - 1, 1) = "y") Then
    If i > 2 Then
    If Mid(expression1, i - 2, 1) = "e" Then GoTo skip
    End If
    expression1 = myreplace(expression1, i - 1, 0, "*")
    GoTo restart
    Exit For
    End If
    
    
    
    If Mid(expression1, i, 1) = "(" And (Isnumber(Mid(expression1, i - 1, 1)) = True Or Mid(expression1, i - 1, 1) = "x" Or Mid(expression1, i - 1, 1) = ")" Or Mid(expression1, i - 1, 1) = "y") Then
    If i > 3 Then
    If Mid(expression1, i - 3, 2) = "fi" Then GoTo skip
    End If
    expression1 = myreplace(expression1, i - 1, 0, "*")
    
    'If Mid(expression1, i, 1) = "-" And Mid(expression1, i - 1, 1) <> "e" Then
    'expression1 = myreplace(expression1, i - 1, 1, "(-1)*")
    'End If
    
    GoTo restart
skip:
    Exit For
    End If


End If 'if i > 1



Next

If ToDerive = False Then
    If Mid(expression1, 1, 1) = "-" Then
    expression1 = myreplace(expression1, 0, 1, "(-1)*")
    End If
End If

EditedEqu = expression1
End Function
Public Function ReplaceVar(expression As String, ToFind As String, replacement As String)
Dim factor1 As Boolean, factor2 As Boolean, expression1 As String
Dim i As Integer
expression1 = LCase(expression)

For i = 1 To Len(expression1)
factor1 = False
factor2 = False
If Mid(expression1, i, 1) = ToFind Then
    If i > 1 Then
        If isletter(Mid(expression1, i - 1, 1)) = False Then factor1 = True
    Else
        factor1 = True
    End If
    If i < Len(expression1) Then
        If isletter(Mid(expression1, i + 1, 1)) = False Then factor2 = True
    Else
        factor2 = True
    End If
    If factor1 = True And factor2 = True Then
        expression1 = myreplace(expression1, i - 1, 1, replacement)
    End If
End If
Next
ReplaceVar = expression1
End Function
Public Function Pi() As Double
Pi = 4 * Atn(1)
End Function
Public Function e() As Double
e = 2.71828182845905
End Function


