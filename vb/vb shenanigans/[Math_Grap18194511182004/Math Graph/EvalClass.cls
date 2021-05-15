VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "eval"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'Developed by Ted Schopenhouer   ted.schopenhouer@12Move.nl

'with ideas and suggestions from Hans Scholten Wonen@Wonen.com
'                           and  Douwe Konings dkonings@xs4all.nl

'This sources may be used freely without the intention of commercial distribution.
'For ALL other use of this control YOU MUST HAVE PERMISSION of the developer.

'In other words, when you are developing a program for yourself or for
'a company without selling this product to thirt party's it's allowed to
'use this source code. When you, or the company you work for, sells the
'program then permission is needed!!!!!

Private bRetBool As Boolean      '(result <> 0)
Private berror As Boolean        'boolean TRUE if error
Private sError As String         'string error message
Private SepChr As String * 1     'international setting (. of ,)
                                 'const tbv vars
Private Const varOPS As String = "+=-=*=/=\=^=:=&="
                                 'data types of functions without args
Private Const cntFunc As String = "TRUE  FALSE NOW   DATE  TIME  CURDIR"
Private aDecFunc() As Variant    'function tabel

Public Function EvalExpr(sExpression As String, ParamArray aParArr()) As Variant

On Error GoTo ErrorAfhandeling

Dim sPlusMin As String
Dim sVarName As String
Dim vVarValue As Variant
Dim iTmp As Integer
Dim iLenExpr As Integer
Dim iCounter As Integer
Dim c As String * 1
Dim sTmp As String
Dim aArr() As Variant
Dim bNegative  As Boolean
Dim iHoHs As Integer
Dim iFirst As Integer
Dim iPriority As Integer
Dim vBeforeOP As Variant
Dim vAfterOP As Variant
Dim vResult As Variant
Dim sFunc As String
Dim sFlags As String
Dim vTmp As Variant
Dim bRetBln As Boolean

berror = False 'reset errorflag
sError = ""    'reset errortxt

sExpression = Trim(sExpression)
iLenExpr = Len(sExpression)
If iLenExpr = 0 Then Exit Function
If UBound(aParArr) > 0 Then VAV aParArr

sFlags = "NAfQHZp"

Do While iCounter < iLenExpr
   sTmp = ""
   Do While iCounter <= iLenExpr
      iCounter = iCounter + 1
      c = UCase(Mid(sExpression, iCounter, 1))
      If c <> " " Then Exit Do
   Loop
   If c = ";" Then
      vTmp = EvalExpr(Mid(sExpression, 1, iCounter - 1))
      sExpression = Mid(sExpression, iCounter + 1)
      iLenExpr = Len(sExpression)
      iCounter = 0
      sFlags = "NAfQHZp"
      Erase aArr
  ElseIf InStr("0123456789.,", c) > 0 And InStr(sFlags, "N") > 0 Then
      Do While InStr("0123456789.,", c)
         If c = "." Or c = "," Then c = SepChr
         sTmp = sTmp & c
         iCounter = iCounter + 1
         c = Mid(sExpression, iCounter, 1)
      Loop
      aAdd aArr, CDbl(IIf(bNegative, "-" & sTmp, sTmp))
      bNegative = False
      If iCounter <= iLenExpr Then iCounter = iCounter - 1
      sFlags = "AvZoX"
   ElseIf (isAlfa(c) Or InStr("<=>", c) > 0) And InStr(sFlags, "A") > 0 Then
      Do While InStr("<=>", c) > 0 And InStr(sFlags, "v") > 0
         sTmp = sTmp & UCase(c)
         iCounter = iCounter + 1
         c = UCase(Mid(sExpression, iCounter, 1))
      Loop
      If sTmp = "" Then
         Do While isAlfa(c) Or (sTmp > "" And IsNumeric(c))
            sTmp = sTmp & UCase(c)
            iCounter = iCounter + 1
            c = UCase(Mid(sExpression, iCounter, 1))
         Loop
      End If
      If iCounter <= iLenExpr Then
         iCounter = iCounter - 1
      End If
      If sTmp <> "" Then
         iTmp = InStr("=   MOD OR  AND <>  <=  >=  <   >   XOR IMP EQV ", Mid(sTmp & "    ", 1, 4))
         If iTmp > 0 Then
            If InStr(sFlags, "v") = 0 Then Err.Raise 1, , "No comparison Operand expected" & vbLf & sTmp
            iTmp = Int(iTmp * 0.25) + 1
            aAdd aArr, Mid("=~$@%{;<>#[]", iTmp, 1)
            If iTmp <> 2 Then bRetBln = True
            sFlags = "ZpAfNHQ"
         Else
            If InStr(sFlags, "f") = 0 Then Err.Raise 1, , "No Function Or MemVar Expected" & vbLf & sTmp
            If sTmp = "NOT" Then
               vTmp = Not EvalExpr(Mid(sExpression, iCounter + 1))
               aAdd aArr, vTmp
               sFlags = "X"
               iCounter = iLenExpr
               bRetBln = True
               
            ElseIf InStr(cntFunc, Mid(sTmp & "      ", 1, 6)) Then
                If sTmp = "TRUE" Then
                  vTmp = True
               ElseIf sTmp = "FALSE" Then
                  vTmp = False
               Else
                  vTmp = ExecFnc("", sTmp)
                  If IsNumeric(vTmp) Then
                     vTmp = CDbl(IIf(bNegative, IIf(vTmp < 0, "", "-") & Abs(vTmp), vTmp))
                   End If
               End If
               aAdd aArr, vTmp
               bNegative = False
               sFlags = "AovX"
            ElseIf aFind(aDecFunc, sTmp) > -1 Then
               sFunc = sTmp
               sFlags = "H"
            ElseIf (InStr(sFlags, "R") = 0 And Not IsEmpty(VarGet("~" & sTmp))) _
                  Or InStr(varOPS, Mid(Mid(Trim(Mid(sExpression, iCounter + 1)), 1, 2) & "  ", 1, 2)) > 0 Then
                              
               aAdd aArr, "~" & sTmp & sPlusMin
               If sPlusMin > "" Then
                  sPlusMin = ""
                  sFlags = "ZoAvfRX"
               Else
                  sFlags = "ZpoAfvRX"
               End If
            Else
               Err.Raise 1, , "Function Or Memvar NOT declared" & vbLf & "( " & sTmp & " )"
            End If
         End If
      Else
         Err.Raise 1, , c & "   NOT Expected!!"
      End If
   
   ElseIf InStr("+-:=*\/^&", c) > 0 And InStr(sFlags, "Z") > 0 And iCounter < iLenExpr Then
      Do While InStr("+-:=*\/^&", c) > 0 And iCounter <= iLenExpr And Len(sTmp) < 2
         sTmp = sTmp & c
         iCounter = iCounter + 1
         c = Mid(sExpression, iCounter, 1)
      Loop
      If sTmp = "+-" Or sTmp = "-+" Then
         sTmp = Left(sTmp, 1)
         iCounter = iCounter - 1
      End If
      If InStr("++ -- ", Mid(sTmp & "   ", 1, 3)) > 0 And InStr(sFlags, "p") > 0 Then
         If InLine(vTmp, tUbound(aArr)) > -1 Then
            If Left(aArr(vTmp), 1) = "~" Then
               aArr(vTmp) = aArr(vTmp) & "~" & sTmp
               sFlags = "ZoXAvX"
            Else
               sPlusMin = "~" & Left(sTmp, 1) & "!"
               sFlags = "Af"
            End If
         Else
             sPlusMin = "~" & Left(sTmp, 1) & "!"
             sFlags = "Af"
         End If
      ElseIf sTmp = "--" And Not bNegative And iCounter <= iLenExpr Then
         bNegative = True
         iCounter = iCounter - 1
      ElseIf iCounter <= iLenExpr And InStr(varOPS, Mid(sTmp & "  ", 1, 2)) > 0 Then
         aAdd aArr, sTmp
         sFlags = "AfNHQ"
      ElseIf Len(sTmp) = 1 And InStr(sFlags, "o") > 0 Then
         aAdd aArr, sTmp
         sFlags = "AfNHQ" & IIf(InStr("+-", sTmp) > 0, "Zp", "")
      ElseIf sTmp = "-" And Not bNegative And iCounter <= iLenExpr Then
         bNegative = True
      Else
         Err.Raise 1, , sTmp & " NOT Expected!!"
      End If
      If iCounter <= iLenExpr Then iCounter = iCounter - 1
   ElseIf c = chr(34) And InStr(sFlags, "Q") > 0 Then
      For iCounter = iCounter + 1 To iLenExpr + 1
         c = Mid(sExpression, iCounter, 1)
         If c = chr(34) Then Exit For
         sTmp = sTmp & c
      Next
      If c <> chr(34) Then Err.Raise 1, , "String Not Completed!" & vbLf & "( " & chr(34) & " ) Verwacht"
      aAdd aArr, sTmp
      sFlags = "ZoAvX"
   ElseIf c = "#" And InStr(sFlags, "Q") > 0 Then
      For iCounter = iCounter + 1 To iLenExpr + 1
         c = Mid(sExpression, iCounter, 1)
         If c = "#" Then Exit For
         sTmp = sTmp & c
      Next
      If c <> "#" Then Err.Raise 1, , "String Not Completed!" & vbLf & "( # ) Verwacht"
      aAdd aArr, CDate(sTmp)
      sFlags = "ZoAvX"
   ElseIf c = "(" And InStr(sFlags, "H") Then
      iHoHs = 1
      For iCounter = iCounter + 1 To iLenExpr + 1
         c = Mid(sExpression, iCounter, 1)
         If c = ")" Then
            iHoHs = iHoHs - 1
            If iHoHs = 0 Then Exit For
         ElseIf c = "(" Then
            iHoHs = iHoHs + 1
         End If
         sTmp = sTmp & c
      Next
      If iHoHs <> 0 Then   'error
         Err.Raise 1, , "Differend  Number of Bracket"
      End If
      'Recursion Brackets if needed
      If sFunc <> "" Then
         vTmp = ExecFnc(sTmp, sFunc)
         sFunc = ""
      Else
         vTmp = EvalExpr(sTmp)
      End If
      If IsNumeric(vTmp) Then
         vTmp = CDbl(IIf(bNegative, IIf(vTmp < 0, "", "-") & Abs(vTmp), vTmp))
      End If
      aAdd aArr, vTmp
      bNegative = False
      sFlags = "AvXZo"
   ElseIf sFlags = "H" Then 'error
      Err.Raise 1, , "brackets expected"
   ElseIf c = "'" Then  'ignore rest string
      iCounter = iLenExpr
   ElseIf Not bNegative And c = "-" Then
      bNegative = True
   Else 'error
     Err.Raise 1, , c & "   Not Expected"
   End If
Loop

'If not X: Fault, Expresion may not be evaluated
If InStr(sFlags, "X") = 0 Then Err.Raise 1, , "Geen Einde Expressie Verwacht"

If UBound(aArr) = 0 Then
   aAdd aArr, "XX"
   aAdd aArr, ""
End If

Do While UBound(aArr) > 0
   iFirst = 1              'Brackets and NOT in recursion
   iPriority = 1
   For iCounter = 1 To UBound(aArr) Step 2
      'or,and,<=,>=,>,<,<>,=,[imp,]eqv,#xor,$or,@and,?not
      iTmp = InStr("[]#$@?;{><%=:&+-~\*/|^", Left(aArr(iCounter), 1))
      If Len(aArr(iCounter)) = 2 And iPriority < iTmp Then
         iPriority = 13
         iFirst = iCounter
      ElseIf (iTmp = 16 And iPriority = 15) Or (iTmp = 20 And iPriority = 19) Then
         iPriority = iTmp 'equal treatment */ en +-
      ElseIf iPriority < iTmp Then
         iPriority = iTmp
         iFirst = iCounter
      End If
   Next
   
   If Left(aArr(iFirst + 1), 1) = "~" Then
      sVarName = "~" & Token((aArr(iFirst + 1)), 1, "~")
      vVarValue = VarGet(sVarName)
      sTmp = Right(aArr(iFirst + 1), 3)
      If InStr("~++~+!", sTmp) > 0 Then
         VarPut sVarName, vVarValue + 1
      ElseIf InStr("~--~-!", sTmp) > 0 Then
         VarPut sVarName, vVarValue - 1
      End If
      If InStr("~+!~-!", sTmp) > 0 Then vVarValue = VarGet(sVarName)
      
      If IsEmpty(vVarValue) Then
         VarPut sVarName, 0
         vAfterOP = MakeSameType(MakeSameType(IIf(Left(aArr(iFirst - 1), 1) = "~", VarGet(aArr(iFirst - 1)), aArr(iFirst - 1))))
      Else
         vAfterOP = vVarValue
      End If
   Else
      vAfterOP = aArr(iFirst + 1)
   End If
   
   
   If Left(aArr(iFirst - 1), 1) = "~" Then
      sVarName = "~" & Token((aArr(iFirst - 1)), 1, "~")
      vVarValue = VarGet(sVarName)
      sTmp = Right(aArr(iFirst - 1), 3)
      If InStr("~++~+!", sTmp) > 0 Then
         VarPut sVarName, vVarValue + 1
      ElseIf InStr("~--~-!", sTmp) > 0 Then
         VarPut sVarName, vVarValue - 1
      End If
      If InStr("~+!~-!", sTmp) > 0 Then vVarValue = VarGet(sVarName)
      
      If IsEmpty(vVarValue) Then
         VarPut sVarName, 0
         vBeforeOP = MakeSameType(IIf(Left(aArr(iFirst + 1), 1) = "~", VarGet(aArr(iFirst + 1)), aArr(iFirst + 1)))
      Else
         vBeforeOP = vVarValue
      End If
   Else
      vBeforeOP = aArr(iFirst - 1)
   End If
   
      
   Select Case Left(aArr(iFirst), 1)
      Case ":"
         VarPut sVarName, vAfterOP
         vResult = vAfterOP
      Case "+"
         vResult = vBeforeOP + vAfterOP
      Case "-"
         vResult = vBeforeOP - vAfterOP
      Case "*"
         vResult = vBeforeOP * vAfterOP
      Case "/"
         vResult = vBeforeOP / vAfterOP
      Case "\"
         vResult = vBeforeOP \ vAfterOP
      Case "^"
         vResult = vBeforeOP ^ vAfterOP
      Case "&"
         vResult = vBeforeOP & vAfterOP
      Case "~"
         vResult = vBeforeOP Mod vAfterOP
      Case ">"
         vResult = vBeforeOP > vAfterOP
      Case "<"
         vResult = vBeforeOP < vAfterOP
      Case ";"
         vResult = vBeforeOP >= vAfterOP
      Case "{"
         vResult = vBeforeOP <= vAfterOP
      Case "%"
          vResult = vBeforeOP <> vAfterOP
      Case "@"
         vResult = vBeforeOP And vAfterOP
      Case "$"
         vResult = vBeforeOP Or vAfterOP
      Case "="
         vResult = vBeforeOP = vAfterOP
      Case "#"
         vResult = vBeforeOP Xor vAfterOP
      Case "["
         vResult = vBeforeOP Imp vAfterOP
      Case "]"
         vResult = vBeforeOP Eqv vAfterOP
      Case Else
         vResult = vBeforeOP
   End Select
   If InStr("+= -= *= /= \= ^= &= ", Mid(aArr(iFirst) & "   ", 1, 3)) > 0 And sVarName > "" Then
      VarPut sVarName, vResult
   End If
   aArr(iFirst - 1) = vResult
   aDel aArr, iFirst, 2
Loop

If bRetBln And bRetBool Then
   If Left(aArr(0), 1) = "~" Then
      EvalExpr = VarGet(Token((aArr(0)), 1, "~"))
   Else
      EvalExpr = aArr(0) <> 0
   End If
Else
   If Left(aArr(0), 1) = "~" Then
      EvalExpr = VarGet(Token((aArr(0)), 1, "~"))
   Else
      EvalExpr = aArr(0)
   End If
End If

If berror Then Err.Raise 1, , "Error In Expression"
Exit Function
ErrorAfhandeling:
sError = Err.Description
berror = True
End Function


Private Function ExecFnc(sTmp As String, sFunc As String) As Variant
Select Case sFunc
   Case "INT"        'add here SelfDefined functions
      ExecFnc = Int(EvalExpr(sTmp))
   Case "FIX"
      ExecFnc = Fix(EvalExpr(sTmp))
   Case "ABS"
      ExecFnc = Abs(EvalExpr(sTmp))
   Case "ATN"
      ExecFnc = Atn(EvalExpr(sTmp))
   Case "COS"
      ExecFnc = Cos(EvalExpr(sTmp))
   Case "EXP"
      ExecFnc = Exp(EvalExpr(sTmp))
   Case "LOG"
      ExecFnc = Log(EvalExpr(sTmp))
   Case "RND"
      ExecFnc = Rnd(EvalExpr(sTmp))
   Case "SGN"
      ExecFnc = Sgn(EvalExpr(sTmp))
   Case "SIN"
      ExecFnc = Sin(EvalExpr(sTmp))
   Case "SQR"
      ExecFnc = Sqr(EvalExpr(sTmp))
   Case "TAN"
      ExecFnc = Tan(EvalExpr(sTmp))
   Case "CHR"
      ExecFnc = chr(EvalExpr(sTmp))
   Case "VAL"
      ExecFnc = Val(EvalExpr(sTmp))
   Case "LEN"
      ExecFnc = Len(EvalExpr(sTmp))
   Case "DATE"
      ExecFnc = Date
   Case "NOW"
      ExecFnc = Now
   Case "TIME"
      ExecFnc = Time
   Case "CURDIR"
      ExecFnc = CurDir
   Case "STR"
      ExecFnc = Str(EvalExpr(sTmp))
   Case "FORMAT"
      ExecFnc = Format(EvalExpr(GetValidToken(sTmp, 1, True, sFunc)), StripQ(GetValidToken(sTmp, 2, False, sFunc)))
   Case "INSTR"
      ExecFnc = InStr(EvalExpr(GetValidToken(sTmp, 1, True, sFunc)), EvalExpr(GetValidToken(sTmp, 2, True, sFunc)))
   Case "STRING"
      ExecFnc = String(EvalExpr(GetValidToken(sTmp, 1, True, sFunc)), EvalExpr(GetValidToken(sTmp, 2, True, sFunc)))
   Case "COUNTCHR"
      ExecFnc = CountChr(EvalExpr(GetValidToken(sTmp, 1, True, sFunc)), EvalExpr(GetValidToken(sTmp, 2, True, sFunc)))
   Case "IIF"
      ExecFnc = EvalExpr(GetValidToken(sTmp, IIf(EvalExpr(GetValidToken(sTmp, 1, True, sFunc)), 2, 3), , sFunc))
   Case "ASC"
      ExecFnc = Asc(EvalExpr(sTmp))
   Case "RUP"  'Round Up  example
               'Rup(10.1) >> 11
      ExecFnc = EvalExpr(sTmp)
      ExecFnc = Int(ExecFnc) + IIf(InStr(Str(ExecFnc), "."), 1, 0)
   Case "CDATE"
      ExecFnc = CDate(sTmp)
   Case "CSTR"
      ExecFnc = CStr(EvalExpr(sTmp))
   Case Else
      Err.Raise 1, , "Function " & sFunc & "  Is NOT Supported!"
      berror = True
End Select
   ExecFnc = ExecFnc
End Function

Private Function isAlfa(c As String) As Boolean
isAlfa = UCase(c) >= "A" And UCase(c) <= "Z"
End Function


Private Function GetValidToken(sStr As String, iStart As Integer, Optional NotEmpty As Boolean, Optional sFunc As String) As String
Dim iTokenCnt As Integer
Dim sPartOfToken As String
Dim iLastPos As Integer
Dim iLen As Integer
iLen = Len(sStr)
Do While iTokenCnt < iStart And iLastPos <= iLen
   sPartOfToken = sPartOfToken & Token(sStr, 0, ",", iLastPos)
   If CountChr(sPartOfToken, "(") <> CountChr(sPartOfToken, ")") Or _
      InStr(Str(CountChr(sPartOfToken, chr(34)) * 0.5), ".") <> 0 Then
      sPartOfToken = sPartOfToken & ","
   Else
      iTokenCnt = iTokenCnt + 1
      If iTokenCnt < iStart Then sPartOfToken = ""
   End If
Loop
If iTokenCnt = iStart Then GetValidToken = sPartOfToken
If (sPartOfToken > "" And iTokenCnt <> iStart) Then
   Err.Raise 1, , sFunc & "  Ongelijk aantal Haakjes of ( " & chr(34) & " ) in Argument ( " & iTokenCnt & " )"
ElseIf (NotEmpty And GetValidToken = "") Then
   Err.Raise 1, , sFunc & " Argument ( " & iTokenCnt & " ) Niet Gegeven"
End If
End Function

Private Function StripQ(sStr As String) As String
StripQ = FixSize(Mid(Trim(sStr), 2), -1)
End Function

Private Function VarN(VarName As String, Optional Value As Variant) As Variant
On Error Resume Next

Static aVarName() As Variant
Static aVarValue() As Variant
Dim iFound As Integer
If IsMissing(Value) Then
   iFound = aFind(aVarName, VarName)
   If iFound > -1 Then
      VarN = aVarValue(iFound)
   End If
ElseIf Left(VarName, 1) <> "~" Then
   If VarName = "A" Then
      VarN = aVarName
   ElseIf VarName = "B" Then
      VarN = aVarValue
   ElseIf VarName = "C" Then 'clear memvars
      Erase aVarName
      Erase aVarValue
   End If
Else
   iFound = aFind(aVarName, VarName)
   If iFound = -1 Then
      aAdd aVarName, VarName
      aAdd aVarValue, Value
   Else
      aVarName(iFound) = VarName
      aVarValue(iFound) = Value
   End If
End If
End Function

Private Function VarPut(sVarName As String, vValue As Variant)
VarN sVarName, vValue
End Function

Private Function VarGet(ByVal sVarName As String) As Variant
VarGet = VarN(sVarName)
End Function

Public Sub ClearMemVars()
VarN "C", 1
End Sub

Private Function MakeSameType(x As Variant) As Variant
Select Case VarType(x)
   Case 3, 4, 5, 6
      MakeSameType = CDbl(0)
   Case 7
      MakeSameType = CDate("0:00:00")
   Case 8
      MakeSameType = ""
   Case 11
      MakeSameType = False
   Case Else
      MakeSameType = CVar("0")
End Select
End Function

Private Sub Class_Initialize()
Dim sDefineFunctions As String
Dim iStart As Integer

SepChr = Mid(CStr(1.5), 2, 1)

'All Functions that are in use, declare here your new added functions
sDefineFunctions = "INT^FIX^ABS^ATN^COS^EXP^LOG^RND^SGN^SIN^SQR^TAN^CHR^VAL^LEN^" & _
     "DATE^NOW^TIME^CURDIR^STR^FORMAT^INSTR^STRING^COUNTCHR^IIF^ASC^RUP^CDATE^CSTR"
Do While iStart < Len(sDefineFunctions)
   aAdd aDecFunc, Token(sDefineFunctions, 0, "^", iStart)
Loop
End Sub

Public Property Let ReturnBoolean(ByVal bBoolean As Boolean)
bRetBool = bBoolean
End Property

Public Property Get Error() As Boolean
Error = berror
End Property

Public Property Get ErrDescription() As String
ErrDescription = sError
End Property

Public Property Let VarNamesAndValues(aArray As Variant)
'Declare the memvars names and values inside the class (2 dimentions)
On Error Resume Next
Dim i As Integer
For i = 0 To UBound(aArray)
   VarPut "~" & UCase(aArray(i, 0)), aArray(i, 1)
Next
End Property

Public Property Get VarNamesAndValues() As Variant
On Error Resume Next
Dim aArr() As Variant
Dim aArr1 As Variant
Dim aArr2 As Variant
Dim i As Integer
Dim t As Integer

aArr1 = VarN("A", 1)
aArr2 = VarN("B", 1)
i = UBound(aArr1)
ReDim aArr(i, 2)
For t = 0 To i
   aArr(t, 0) = Mid(aArr1(t), 2)
   aArr(t, 1) = aArr2(t)
Next
VarNamesAndValues = aArr
End Property

Public Property Get VarValues()
VarValues = VarN("B", 1)
End Property

Public Property Get VarNames()
Dim i As Integer
Dim aArr As Variant
aArr = VarN("A", 1)
For i = 0 To UBound(aArr)
   aArr(i) = Mid(aArr(i), 2)
Next
VarNames = aArr
End Property

Public Property Let VarAndVal1D(aArray As Variant)
VAV aArray
End Property

Public Property Get VarAndVal1D()
On Error Resume Next
Dim aArr() As Variant
Dim aArr1 As Variant
Dim aArr2 As Variant
Dim i As Integer
Dim t As Integer

aArr1 = VarN("A", 1)
aArr2 = VarN("B", 1)
i = UBound(aArr1)
ReDim aArr(i * 2 + 1)
For t = 0 To i
   aArr(t * 2) = Mid(aArr1(t), 2)
   aArr(t * 2 + 1) = aArr2(t)
Next
VarAndVal1D = aArr
End Property


Private Function VAV(ByVal aArray As Variant)
Dim i As Integer
Do While i <= UBound(aArray)
   If VarType(aArray(i)) > vbArray Then
      VAV aArray(i) 'array recursief
      i = i + 1
   Else
      VarPut "~" & UCase(aArray(i)), aArray(i + 1)
      i = i + 2
   End If
Loop
End Function

