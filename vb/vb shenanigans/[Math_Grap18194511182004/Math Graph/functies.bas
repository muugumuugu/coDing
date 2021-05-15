Attribute VB_Name = "arrENstr"
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

Public Sub aAdd(aDynamicArray As Variant, Optional vWhatToAdd As Variant)

On Error Resume Next
Dim lUpperBound As Long
Dim vTmp As Variant

lUpperBound = UBound(aDynamicArray) + 1

ReDim Preserve aDynamicArray(lUpperBound) As Variant
aDynamicArray(lUpperBound) = IIf(IsMissing(vWhatToAdd), vTmp, vWhatToAdd)

End Sub


'Sub aDel Delete items out of an Array
'aDel array, 1, 3   delete items 1 2 en 3
'aDel array, 1      delete item 1

Public Sub aDel(aDynamicArray As Variant, ByVal lBegin As Long, _
                Optional lHowManyToDelete As Long = 1)

On Error GoTo ExitThisSub

Dim lLoopCounter As Long
Dim lUpperBound As Long

lUpperBound = UBound(aDynamicArray)

For lLoopCounter = lBegin + lHowManyToDelete To lUpperBound
   aDynamicArray(lBegin) = aDynamicArray(lLoopCounter)
   lBegin = lBegin + 1
Next

ReDim Preserve aDynamicArray(LBound(aDynamicArray) To lUpperBound - lHowManyToDelete)

ExitThisSub:

End Sub


Function FixSize(ByVal sString As String, lNewLen As Long, Optional sAppendChr As String = " ") As String
'fix any string to specified length with optional character
'Debug.Print FixSize("abcde", -2)      ->"abc"
'Debug.Print FixSize("abcde", 10)      ->"abcde     "
'Debug.Print FixSize("abcde", 10, "x") ->"abcdexxxxx"
Dim lFixLen As Long
Dim lLenStr As Long
lLenStr = Len(sString)
lFixLen = lNewLen - lLenStr      'Max(0, lNewLen - lLenStr)
If lFixLen < 0 Then lFixLen = 0  'error in string < 0
If lNewLen < 0 Then lNewLen = lNewLen + lLenStr 'Max(0, lNewLen + lLenStr)
If lNewLen > 0 Then
   FixSize = Mid(sString, 1, lNewLen) & String(lFixLen, sAppendChr)
End If
'Dit is de minst elegante oplossing maar wel de snelste
End Function


'Token a string delimited by optional chars and optional startposition
'Debug.Print Token("EEN^TWEE^DRIE", 1)        ->"TWEE"
'Debug.Print Token("EEN@TWEE@DRIE", 2, "@")   ->"DRIE"
'Debug.Print Token("EENcTWEEcDRIE", 0, "c")   ->"EEN"
'Debug.Print Token("EENcTWEEcDRIE", 1, "c", 5)->"DRIE
'OR
'Dim lNext As Long '(lNext BYREF will be the value of lT)
'Debug.Print Token("EENccTWEEccDRIEccVIER", 1, "cc", lNext)
'->"TWEE" and lNext = 12
'Debug.Print Token("EENccTWEEccDRIEccVIER", 1, "cc", lNext)
'->"VIER" and lNext = 22 (len(sString) = 21)
'OR
'Dim sTxt As String
'Dim lStartPos As integer
'Open "C:\progcode\leestxt\prlijst.txt" For Input As #1
'sTxt = Input(LOF(1), #1)
'Close #1
'do while istartpos <= len(sTxt)
'   Debug.Print Token(sTxt, 0, Chr(13) & Chr(10), lStartPos)
'loop
'It will display all lines of text in sTxt
Public Function Token(sSearchString As String, iFirstDeliInStr As Integer, Optional sDelimiters As String = "^", Optional lStartPos As Integer) As String
Dim lLoopTeller As Integer
Dim lDelimiterTeller As Integer
Dim sTmpChr As String
Dim iLenDelimiter As Integer
iLenDelimiter = Len(sDelimiters)
If lStartPos < 1 Then lStartPos = 1
For lLoopTeller = lStartPos To Len(sSearchString)
   sTmpChr = Mid(sSearchString, lLoopTeller, iLenDelimiter)
   If lDelimiterTeller > iFirstDeliInStr Then
      Exit For
   ElseIf sTmpChr = sDelimiters Then
      lDelimiterTeller = lDelimiterTeller + 1
      lLoopTeller = lLoopTeller + iLenDelimiter - 1
   ElseIf lDelimiterTeller = iFirstDeliInStr Then
      Token = Token & Mid(sSearchString, lLoopTeller, 1)
   End If
Next
lStartPos = lLoopTeller
End Function


Public Function CountChr(sStr2Count As String, sChrs As String, Optional lStartPos As Long = 1) As Long
'counts characters in a string from optional starting position
'Debug.Print CountChr("ABcbCcPp", "c")    ->2
'Debug.Print CountChr("ABcbCcPp", "c",4)  ->1
'Debug.Print CountChr("ABcbCcPp", "C")    ->1
'Debug.Print CountChr("ABcbCcPp", "@")    ->0
'Debug.Print CountChr("ABcbCcccPp", "ccc")->1
'Debug.Print CountChr("ABCDxxxabcdxxx", "xxx", 6) ->1
'Debug.Print CountChr("ABCDxxxabcdxxx", "xxx", 5) ->2

Dim lT As Long
Dim iLenChrs As Integer
iLenChrs = Len(sChrs)
If lStartPos < 1 Then lStartPos = 1
For lT = lStartPos To Len(sStr2Count)
   If Mid(sStr2Count, lT, iLenChrs) = sChrs Then
      CountChr = CountChr + 1
      lT = lT + iLenChrs - 1
   End If
Next
End Function

Public Function aFind(aArray As Variant, x As Variant) As Long
On Error GoTo Fout
aFind = -1
Dim iTeller As Long
For iTeller = 0 To UBound(aArray)
   If aArray(iTeller) = x Then
      aFind = iTeller
      Exit For
   End If
Next
Fout:
End Function

Public Function tUbound(aArr As Variant)
tUbound = -1
On Error GoTo Fout
tUbound = UBound(aArr)
Exit Function
Fout:
End Function

Public Function InLine(x, y) As Variant
x = y
InLine = y
End Function
