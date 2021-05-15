Attribute VB_Name = "Module1"
Declare Function timeGetTime Lib "winmm.dll" () As Long
Declare Function SetTextCharacterExtra Lib "gdi32" (ByVal hdc As Long, ByVal _
nCharExtra As Long) As Long
Public Type RECT
Left As Long
Top As Long
Right As Long
Bottom As Long
End Type
Declare Function OffsetRect Lib "user32" (lpRect As RECT, ByVal x As Long, _
ByVal y As Long) As Long
Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor _
As Long) As Long
Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal _
hBrush As Long) As Long
Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Public Const COLOR_BTNFACE = 15
Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As _
Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal _
lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Public Const DT_BOTTOM = &H8
Public Const DT_CALCRECT = &H400
Public Const DT_CENTER = &H1
Public Const DT_CHARSTREAM = 4
Public Const DT_DISPFILE = 6
Public Const DT_EXPANDTABS = &H40
Public Const DT_EXTERNALLEADING = &H200
Public Const DT_INTERNAL = &H1000
Public Const DT_LEFT = &H0
Public Const DT_METAFILE = 5
Public Const DT_NOCLIP = &H100
Public Const DT_NOPREFIX = &H800
Public Const DT_PLOTTER = 0
Public Const DT_RASCAMERA = 3
Public Const DT_RASDISPLAY = 1
Public Const DT_RASPRINTER = 2
Public Const DT_RIGHT = &H2
Public Const DT_SINGLELINE = &H20
Public Const DT_TABSTOP = &H80
Public Const DT_TOP = &H0
Public Const DT_VCENTER = &H4
Public Const DT_WORDBREAK = &H10
Declare Function OleTranslateColor Lib "olepro32.dll" (ByVal OLE_COLOR As Long, _
ByVal hPalette As Long, pccolorref As Long) As Long
Public Const CLR_INVALID = -1


