Attribute VB_Name = "modLineLine"
Public Function SegmentsIntersect(ByVal X1 As Single, ByVal Y1 As Single, ByVal X2 As Single, ByVal Y2 As Single, ByVal A1 As Single, ByVal B1 As Single, ByVal A2 As Single, ByVal B2 As Single, RetX, RetY) As Boolean
Dim dx As Single
Dim dy As Single
Dim da As Single
Dim db As Single
Dim t As Single
Dim s As Single

dx = X2 - X1
dy = Y2 - Y1
da = A2 - A1
db = B2 - B1
If (da * dy - db * dx) = 0 Then
    ' The segments are parallel.
    SegmentsIntersect = False
    Exit Function
End If

s = (dx * (B1 - Y1) + dy * (X1 - A1)) / (da * dy - db * dx)
t = (da * (Y1 - B1) + db * (A1 - X1)) / (db * dx - da * dy)
SegmentsIntersect = (s >= 0# And s <= 1# And _
        t >= 0# And t <= 1#)

' If it exists, the point of intersection is:
' (x1 + t * dx, y1 + t * dy)
RetX = X1 + t * dx
RetY = Y1 + t * dy
End Function

