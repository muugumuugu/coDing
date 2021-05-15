Attribute VB_Name = "modWallBounce"
'think this is made by nirpaudyal@hotmail.com (not Sure)

'Public Type PointAPI
'    X As Long
'    Y As Long
'End Type
Public Type PointAPI
    x As Single
    y As Single
End Type

Public PolyColor As Long


Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Public Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long



Public Function IsTouchingWall(BX As Single, by As Single, BRadius As Single, ByRef rx As Single, ByRef ry As Single) As Boolean
'IsToughingWall(X position of the ball,Y position of the ball,Radius of the ball, return the X point of contact with wall, return the Y point of contact with wall)
'This sub is used to identify if the ball has crashed with the wall
'It will fo through every point at the radius of the ball and compare the color of
'those points to the color on the picture box, form1.pic
'if the color is not 0 (black), the ball must have crashed with the wall at that point
'For this reason, the walls must be of color other than 0
'Note that the sub will automatically detect outside the picture box because the color there is set to -1 by windows

'If you want to speed this sub up then i suggest you use dibs to find the pixel color at the point
'I use Point because it makes the whole thing 'easier' to understand
Dim x As Long, y As Long
Dim C As Long, br As Long

Dim hdc As Long

hdc = frmFLYERS.PIC.hdc
'Stop


br = BRadius * BRadius 'The hypotnuse^2 of the circle of the ball

For x = 0 To BRadius
    y = Sqr(br - x * x)
    'C = Form1.PIC.Point(BX + x, by + y)
    C = GetPixel(hdc, CLng(BX + x), CLng(by + y))
    If (C = PolyColor) Then
        rx = BX + x: ry = by + y
        IsTouchingWall = True
        Exit Function
    End If
    'C = Form1.PIC.Point(BX + x, by - y)
    C = GetPixel(hdc, CLng(BX + x), CLng(by - y))
    If (C = PolyColor) Then
        rx = BX + x: ry = by - y
        IsTouchingWall = True
        Exit Function
    End If
    '        C = Form1.PIC.Point(BX - x, by + y)
    C = GetPixel(hdc, CLng(BX - x), CLng(by + y))
    If (C = PolyColor) Then
        rx = BX - x: ry = by + y
        IsTouchingWall = True
        Exit Function
    End If
    '        C = Form1.PIC.Point(BX - x, by - y)
    C = GetPixel(hdc, CLng(BX - x), CLng(by - y))
    If (C = PolyColor) Then
        rx = BX - x: ry = by - y
        IsTouchingWall = True
        Exit Function
    End If
Next x

For y = 0 To BRadius
    x = Sqr(br - y * y)
    'C = Form1.PIC.Point(BX + x, by + y)
    C = GetPixel(hdc, CLng(BX + x), CLng(by + y))
    If (C = PolyColor) Then
        rx = BX + x: ry = by + y
        IsTouchingWall = True
        Exit Function
    End If
    '        C = Form1.PIC.Point(BX + x, by - y)
    C = GetPixel(hdc, CLng(BX + x), CLng(by - y))
    If (C = PolyColor) Then
        rx = BX + x: ry = by - y
        IsTouchingWall = True
        Exit Function
    End If
    '        C = Form1.PIC.Point(BX - x, by + y)
    C = GetPixel(hdc, CLng(BX - x), CLng(by + y))
    If (C = PolyColor) Then
        rx = BX - x: ry = by + y
        IsTouchingWall = True
        Exit Function
    End If
    '        C = Form1.PIC.Point(BX - x, by - y)
    C = GetPixel(hdc, CLng(BX - x), CLng(by - y))
    If (C = PolyColor) Then
        rx = BX - x: ry = by - y
        IsTouchingWall = True
        Exit Function
    End If
Next y
End Function


Public Sub GoBackWALL(R As PointAPI, ByRef B As tBALL)
'GoBack(Returen R is the point at which the actual collision occured)
'This sub is called when there is a collision
'If there is no collision and this sub is called, then there there will be problems!
'The purpose of this sub is the seperate the ball from the wall.
'if the ball is travelling at high speed, the ball will go into the wall, this
'Will cause problems when doing the momemtum calculations as the ball will tend to slide along the wall rather than bounce
'In order to solve this problem, 2 things have to be done
'1) ball needs to be backtracked to find when its actual point of contact with the wall was
'2) ball needs to be seperated from the wall
'To achieve this, we go from the current point of the ball, backwards along the path it came
'and location at which it no longer collides. The point just before this location is the point of contact!
Dim LastIntersect As PointAPI
Dim CurrentPoint As PointAPI

'This little If, else is used to find how much a change in  X location of the ball affects the Y location by
If Abs(B.Vy) >= Abs(B.Vx) Then
    vs = 1
    hs = Abs(B.Vx) / Abs(B.Vy + 0.00001)
Else
    hs = 1
    vs = Abs(B.Vy) / Abs(B.Vx + 0.00001)
End If
If B.Vy > 0 Then vs = -vs
If B.Vx > 0 Then hs = -hs

Do
    'Update the position to check for collision by the above factors each time
    CurrentPoint.x = B.x + hs * I
    CurrentPoint.y = B.y + vs * I
    If IsTouchingWall(CurrentPoint.x, CurrentPoint.y, B.RADIUS, LastIntersect.x, LastIntersect.y) Then
        'If there is still collision than update the R value
        R.x = LastIntersect.x
        R.y = LastIntersect.y
    Else
        'If there is no more collisions, the sub must be exited, Remember that the R value will be returend from this procedure
        '  B.x = B.x + hs * (i + 1) 'This is used to reset the position of the ball to a point just after when it would have first made contact
        '  B.y = B.y + vs * (i + 1) 'Just after because sometimes it slides along the wall when it set to a point at which it just made contact!
        
        B.x = B.x + hs * (I + 1) 'This is used to reset the position of the ball to a point just after when it would have first made contact
        B.y = B.y + vs * (I + 1) 'Just after because sometimes it slides along the wall when it set to a point at which it just made contact!
        
        
        Exit Do
    End If
    
    'If after a certain ammount of going back, we cant find the point at which it first made contact, there must have been some error, so just quit the sub
    'otherwise, we get stuck in a loop!
    If I > B.RADIUS * 2 Then
        '        Stop
        
        Exit Sub
    End If
    
    'Update the factor
    I = I + 1.5 '0.5
Loop

End Sub


Public Sub ChangeVelocitiesWALL(B As tBALL, cX As Single, cY As Single)
'ChangeVelocities(the ball in question, X position of contact with the wall, Y position of contact with the wall)
'This sub deals with the bouncing of ball off the wall
'This sub has been taken and modified from my 'bouncing balls' program
'The momemtum conservation is basically the same, however, in this program, walls
'have infinate mass and a velocity of 0, therefor, the wall will not move!
'See my 'bouncing balls' program as this procedure will make more sense then
Dim X1 As Single, Y1 As Single
Dim X2 As Single, Y2 As Single
Dim angle As Single

X1 = B.x 'center X of the ball
Y1 = B.y 'center Y of the ball
X2 = cX 'X point of collision with wall
Y2 = cY 'Y point of collision with wall

'Get the angel between the ball and the wall
If (X2 - X1) <> 0 Then angle = Atn((Y2 - Y1) / (X2 - X1)) Else angle = PI / 2

hX1 = B.Vx
hY1 = B.Vy
hX2 = 0 'This is the velocity of the wall at point of contact, note it is 0! thats because the walls are not moving!
hY2 = 0

'resolve the velocitis such that they are along the line of collision
X1 = hX1 * Cos(-angle) - hY1 * Sin(-angle)
Y1 = hX1 * Sin(-angle) + hY1 * Cos(-angle)
X2 = hX2 * Cos(-angle) - hY2 * Sin(-angle)
'Y2 = hX2 * Sin(-angle) + hY2 * Cos(-angle)     'Left over from the Ball collision program, not needed here

Mass = 1000000000 'This is the mass of the wall, otherewise, the balls energy will be lost to the wall and the ball will lose it velocity 'Try it by setting it to 100!
Mass = 9999999999#

'Momemtum is conserved in the line of collision
hX1 = (X1 * (B.Mass - Mass) + (X2 * 2 * Mass)) / (B.Mass + Mass)
hX2 = ((X1 * 2 * Mass) + X2 * (B.Mass - Mass)) / (B.Mass + Mass)

'keep the vertical component in the line of collision remains the same
hY1 = Y1
'hY2 = Y2   'This is for the wall, so ignore it!

'resolve back the velocities to their normal coordinates
X1 = hX1 * Cos(angle) - hY1 * Sin(angle) 'For the ball
Y1 = hX1 * Sin(angle) + hY1 * Cos(angle)
'X2 = hX2 * Cos(angle) - hY2 * Sin(angle)   'For the wall
'Y2 = hX2 * Sin(angle) + hY2 * Cos(angle)

'set the velocitie of the ball
B.Vx = X1
B.Vy = Y1


B.Vx = B.Vx * CollLostEnergy
B.Vy = B.Vy * CollLostEnergy

End Sub


