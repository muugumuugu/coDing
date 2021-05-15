Attribute VB_Name = "modColour"
'GetPixel:
Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
'SetPixel:
Public Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long


'------------------------------------------
'The folowing three functions will return
'the RED, BLUE and GREEN (RGB) values from
'any color.
'Simply they are the inverse function of RGB

Function RedC(c)
pix& = c
RedC = pix& Mod 256
End Function
Function BlueC(c)
pix& = c
BlueC = (pix& And &HFF0000) / 65536
End Function
Function GreenC(c)
pix& = c
GreenC = ((pix& And &HFF00FF00) / 256&)
End Function
'------------------------------------------

Public Function AverageColours(Colours() As Long) 'ParamArray Colours()) As Long
    Dim i As Long
    
    Dim Red As Long
    Dim Green As Long
    Dim Blue As Long
    Dim hi As Long
    For i = LBound(Colours) To UBound(Colours)
        Red = Red + RedC(Colours(i))
        Green = Green + GreenC(Colours(i))
        Blue = Blue + BlueC(Colours(i))
    Next i
    Red = Red / (UBound(Colours) + 1)
    Green = Green / (UBound(Colours) + 1)
    Blue = Blue / (UBound(Colours) + 1)
    
    AverageColours = RGB(Red, Green, Blue)
End Function

Public Function MakeBAW(Colour As Long) As Long
    Dim Colours(2) As Integer
    Dim Average As Integer
    
    Colours(0) = RedC(CLng(Colour))
    Colours(1) = GreenC(CLng(Colour))
    Colours(2) = BlueC(CLng(Colour))
    
    Average = (Colours(0) + Colours(1) + Colours(2)) / 3
    MakeBAW = RGB(Average, Average, Average)
End Function
