Attribute VB_Name = "ModMain"
Public pTop As Double, pBottom As Double, pLeft As Double, pRight As Double
Public backstyle As String, backcolour As Long, backpic As String
Public evaluate As New eval, math As New MathFunctions
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
DrawWhat As String
End Type

Public AllFunctions(500) As FUNCTION_INFO, numfunctions As Integer
Public zoom As Double
Public selfunc As Integer
Public curscript As Integer
Public quality As Double, qualitylevel As Integer
Public zoomfactor As Integer
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
frmMain.Picgraph.Cls
background
frmMain.createcoordinates
For i = 1 To numfunctions
halltime = estTime(1, numfunctions)
time1 = estTime(0, i - 1)
time2 = estTime(0, i)
Call frmMain.DrawFunction(i, time1 / halltime * 100, time2 / halltime * 100)
Next

End Sub

Public Sub RefreshAll()
Dim i As Integer
frmMain.Picgraph.Cls
background
frmMain.ListView1.ListItems.Clear
frmMain.createcoordinates
For i = 1 To numfunctions
halltime = estTime(1, numfunctions)
time1 = estTime(0, i - 1)
time2 = estTime(0, i)
Call frmMain.DrawFunction(i, time1 / halltime * 100, time2 / halltime * 100)
Call frmMain.AddToList(i)
Next

End Sub
Private Function estTime(begin As Integer, finish As Integer) As Long
estTime = 0
For i = begin To finish
Select Case AllFunctions(i).Type
Case "normal"
estTime = estTime + 1
Case "parametric"
estTime = estTime + 2
Case "polar"
estTime = estTime + 1
Case "implict"
estTime = estTime + 40
End Select
Next

End Function
Public Function SlopeCalc(xpoint As Double) As Double
Dim x1 As Double, y1 As Double, x2 As Double, y2 As Double
x1 = xpoint - 0.000001
x2 = xpoint + 0.000001
y1 = GetVal(x1, 0)
y2 = GetVal(x2, 0)
SlopeCalc = (y2 - y1) / (x2 - x1)
End Function
Public Function DerivativeCalc(xpoint As Double, DerivativeNum) As Double
Dim x1 As Double, y1 As Double, x2 As Double, y2 As Double
If DerivativeNum = 0 Then
    DerivativeCalc = GetVal(xpoint, 0)
    Exit Function
End If
x1 = xpoint - 0.000001
x2 = xpoint + 0.000001
y1 = DerivativeCalc(x1, DerivativeNum - 1)
y2 = DerivativeCalc(x2, DerivativeNum - 1)
DerivativeCalc = (y2 - y1) / (x2 - x1)
End Function

Public Function Stringval(expression As String) As Double
On Error Resume Next
expression1 = EditedEqu(expression)
frmMain.ScriptControl3.ExecuteStatement "on error resume next"
Stringval = frmMain.ScriptControl3.eval(expression1)
End Function
Public Function GetVal(x As Double, y As Double) As Double
Dim a As Double
If curscript = 1 Then
a = frmMain.ScriptControl1.Run("RunThis", x, y)
    If a = 0 Then
        a = evaluate.EvalExpr(frmMain.ScriptControl1.Tag, "x", x, "y", y)
        If evaluate.Error = True Then math.Error = True
    End If
Else
GetVal = frmMain.ScriptControl2.Run("RunThis", x, y)
End If
GetVal = a
End Function
Public Sub AddFunction(TheFunction As FUNCTION_INFO)
numfunctions = numfunctions + 1
AllFunctions(numfunctions) = TheFunction
frmMain.AddToList (numfunctions)
End Sub


Public Function isletter(chr As String) As Boolean
Select Case chr
Case "a" To "z"
isletter = True
Case Else
isletter = False
End Select
End Function
Private Function Isnumber(char As String) As Boolean
If char = "1" Or char = "2" Or char = "3" Or char = "4" Or char = "5" Or char = "6" Or char = "7" Or char = "8" Or char = "9" Or char = "0" Or char = "." Then
Isnumber = True
Else
Isnumber = False
End If
End Function
Private Function myreplace(expression As String, afterwhat As Integer, length As Integer, replacement As String) As String
myreplace = Mid(expression, 1, afterwhat) & replacement & Mid(expression, afterwhat + length + 1, Len(expression) - afterwhat - length)
End Function
Public Function EditedEqu(expression As String) As String
Dim expression1 As String, i As Integer
expression1 = expression
expression1 = LCase(expression1)

If InStr(1, expression1, "pi") <> 0 Then
expression1 = Replace(expression1, "pi", "(" & Str(Pi) & ")")
End If

'a = InStr(1, expression1, "e")
'If a <> 0 Then
'If isletter(Mid(exptession1, a + 1, 1)) = False Then
'expression1 = Replace(expression1, "e", "(" & Str(e) & ")")
'End If
'End If



restart:
For i = 2 To Len(expression1)

If Mid(expression1, i, 1) = "-" And Mid(expression1, i - 1, 1) <> "e" And Mid(expression1, i + 1, 1) <> "1" Then
expression1 = myreplace(expression1, i - 1, 1, "+(-1)*")
GoTo restart
Exit For
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


Next
If Mid(expression1, 1, 1) = "-" Then
expression1 = myreplace(expression1, 0, 1, "(-1)*")
End If
EditedEqu = expression1
End Function
Public Function ReplaceVar(expression As String, ToFind As String, replacement As String)
Dim factor1 As Boolean, factor2 As Boolean, expression1 As String
expression1 = LCase(expression)
factor1 = False
factor2 = False
For i = 1 To Len(expression1)
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


