Attribute VB_Name = "types"
Public Type tPoint
    x As Single
    Y As Single
End Type

Public Function Distance(P1 As tPoint, P2 As tPoint) As Single
Dim dX As Single
Dim dY As Single
dX = P1.x - P2.x
dY = P1.Y - P2.Y
Distance = Sqr(dX * dX + dY * dY)
End Function

