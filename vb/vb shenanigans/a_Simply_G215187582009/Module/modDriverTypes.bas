Attribute VB_Name = "modDriverTypes"
Public Type tPoint
    x As Single
    y As Single
End Type

Public Type tLink
    P1 As Integer
    P2 As Integer
End Type

Public Type tFlyer
    POS As tPoint
    ANg As Single
    Steer As Single
    Vel As Single
    ACC As Single
    MaxVel As Single
    ERRORS As Long
    
End Type


Public RoadL() As tLink
Public RoadP() As tPoint

Public PI As Double

Public PI2 As Double


Public Flyer() As tFlyer

Public BEST As Long


' The Polygon function draws a polygon consisting of two or more vertices connected by straight lines. The polygon is outlined by using the current pen and filled by using the current brush and polygon fill mode.
Public Type POINT_TYPE
    x As Long
    y As Long
End Type
Public Declare Function Polygon Lib "gdi32.dll" (ByVal hdc As Long, lpPoint As POINT_TYPE, ByVal nCount As Long) As Long



Public Function Distance(X1, Y1, X2, Y2) As Single
Dim Dx As Single
Dim Dy As Single

Dx = X2 - X1
Dy = Y2 - Y1

Distance = Sqr(Dx * Dx + Dy * Dy)


End Function
Public Sub DrawPoly(ByRef pPIC As PictureBox, II)
Dim RR As Integer


Dim V
Dim Vert() As POINT_TYPE
ReDim Vert(4)
RR = 8

With Flyer(II)
    
    
    Vert(1).x = .POS.x + Cos(.ANg) * RR
    Vert(1).y = .POS.y + Sin(.ANg) * RR
    
    Vert(2).x = .POS.x + Cos(.ANg - 2.4) * RR
    Vert(2).y = .POS.y + Sin(.ANg - 2.4) * RR
    Vert(3).x = .POS.x + Cos(.ANg + 2.4) * RR
    Vert(3).y = .POS.y + Sin(.ANg + 2.4) * RR
    Vert(0) = Vert(3)
    
    pPIC.FILLcolor = IIf(II = BEST, RGB(255, 255, 255), RGB(50, 250, 50))
    Polygon pPIC.hdc, Vert(0), 4
End With

End Sub

