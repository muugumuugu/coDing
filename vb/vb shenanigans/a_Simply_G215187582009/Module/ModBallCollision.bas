Attribute VB_Name = "ModBALL"
'This module contains all the important momemtum and forces stuff
'You may use any part of the code here in your own program
'Contact me at nirpaudyal@hotmail.com if you don't understand any part
'Include me in the about box if you felt that i have helped you!


'Option Explicit


Const Gravity = -1.8
Const GravityY = 0 '0.02

Public Const Mu = 0.0225 '0.025 '0.0035 '0.01      'coefficent of friction

Public Const CollLostEnergy = 0.95
Public Const CollLostEnergySponda = 0.9
Public AllStop As Boolean
'this structure holds the information about the balls
Type tBALL
    RADIUS As Single
    x As Single 'the current X position
    y As Single 'the current Y position
    Vx As Single 'X velocity
    Vy As Single 'Y velocity
    Mass As Single
    FILLcolor As Long
    V As Single
    Enabled As Boolean
    
End Type

Type PointSng
    x As Single
    y As Single
End Type


Type tLINE
    P1 As PointSng
    P2 As PointSng
End Type

Public B() As tBALL 'this holds the ball information for 31 balls

Public WWspo
Public WWhole


Public RADIUS As Integer



'This sub deals with collision dection and bouncing of balls
'I have assumed that the balls all have the same mass
Public Sub ChangeVelocities(A As tBALL, B As tBALL)
Dim X1 As Single, Y1 As Single
Dim X2 As Single, Y2 As Single
X1 = A.x
Y1 = A.y
X2 = B.x
Y2 = B.y
'Get the distance between the two balls
dis = Sqr((X1 - X2) ^ 2 + (Y1 - Y2) ^ 2)
'check to see if a collision has occured
If dis > A.RADIUS + B.RADIUS Then Exit Sub
'if collision occurs then seperate the balls
SeperateBalls A, B
'get the angle between the positions of the balls
'    angle = Atn((Y2 - Y1) / (X2 - X1))
If (X2 - X1) <> 0 Then angle = Atn((Y2 - Y1) / (X2 - X1)) Else angle = PI / 2



hX1 = A.Vx
hY1 = A.Vy
hX2 = B.Vx
hY2 = B.Vy
'resolve the velocitis such that they are along the line of collision
X1 = hX1 * Cos(-angle) - hY1 * Sin(-angle)
Y1 = hX1 * Sin(-angle) + hY1 * Cos(-angle)
X2 = hX2 * Cos(-angle) - hY2 * Sin(-angle)
Y2 = hX2 * Sin(-angle) + hY2 * Cos(-angle)
'swap the horizontal components of the velocities
'(do any momemtum calculations here)
hX1 = (X1 * (A.Mass - B.Mass) + (X2 * 2 * B.Mass)) / (A.Mass + B.Mass)
hX2 = ((X1 * 2 * A.Mass) + X2 * (A.Mass - B.Mass)) / (A.Mass + B.Mass)
'keep the vertical component the same
hY1 = Y1
hY2 = Y2
'resolve back the velocities to their normal coordinates
X1 = hX1 * Cos(angle) - hY1 * Sin(angle)
Y1 = hX1 * Sin(angle) + hY1 * Cos(angle)
X2 = hX2 * Cos(angle) - hY2 * Sin(angle)
Y2 = hX2 * Sin(angle) + hY2 * Cos(angle)
'set the velocities of the ball
A.Vx = X1
A.Vy = Y1
B.Vx = X2
B.Vy = Y2

A.Vx = A.Vx * CollLostEnergy
A.Vy = A.Vy * CollLostEnergy
B.Vx = B.Vx * CollLostEnergy
B.Vy = B.Vy * CollLostEnergy

Dim AB As tBALL
AB.Vx = Abs(A.Vx) + Abs(B.Vx)
AB.Vy = Abs(A.Vy) + Abs(B.Vy)

V = Sqr(AB.Vx * AB.Vx + AB.Vy * AB.Vy)

'Stop
'PlayHitSound CSng(V / 2)





End Sub
Public Sub SeperateBalls(A As tBALL, B As tBALL)
'reset the position of the balls so that they dont overlap
'this process is achieved using similar triangles
Dx = (B.x - A.x)
Dy = (B.y - A.y)
L = Sqr(Dx * Dx + Dy * Dy)
G = (A.RADIUS + B.RADIUS) - L
DeltaX = (G / L) * Dx
DeltaY = (G / L) * Dy
B.x = B.x + DeltaX
B.y = B.y + DeltaY
End Sub
Public Sub HandleFriction(P As tBALL)
'get the speed of the ball
V = Sqr(P.Vx * P.Vx + P.Vy * P.Vy)
P.V = V



''friction doesn't act while ball is not in motion
'If V < 0 Then Exit Sub

'if speed is really low then set it to zero
If V < 0.01 Then '001
    P.Vx = 0
    P.Vy = 0
    P.V = 0
    
    Exit Sub
End If
Dim fx As Single
Dim fy As Single




'calculate the friction
Friction = Mu * P.Mass * Abs(Gravity)
If P.Vx = 0 Then ANg = 0 Else ANg = Atn(P.Vy / P.Vx)
'get the components of frictions in the two directions
fx = Abs(Friction * Cos(ANg))
fy = Abs(Friction * Sin(ANg))
'ensure that the friction is opposing the direction of motion
If P.Vx > 0 Then fx = -fx
If P.Vy > 0 Then fy = -fy
'apply the force
ApplyForce P, fx, fy, 0.1

P.Vy = P.Vy + GravityY

End Sub
Sub ApplyForce(P As tBALL, ForceX As Single, ForceY As Single, Time_Of_Force As Single)
'Use F= (mv-mu)/t to find v, the new velocity of the ball once the force is applied



P.Vx = P.Vx + (ForceX * Time_Of_Force / P.Mass)
P.Vy = P.Vy + (ForceY * Time_Of_Force / P.Mass)

End Sub


Public Function GetAngle(POS As tFlyer, CenterPos As tFlyer) As Double 'I borrowed this function from someone.
'Returns the angle between two points in
'     degrees
Dim intA As Double 'Integer
Dim intB As Double 'Integer
Dim intC As Double 'Integer
Dim PI As Double

PI = Atn(1) * 4
intB = Abs(CenterPos.POS.x - POS.POS.x) 'distance is always positive-->abs()
intC = Abs(CenterPos.POS.y - POS.POS.y)

If intB <> 0 Then 'don't divide by zero ...
    GetAngle = Atn(intC / intB) * 180 / PI
End If

If POS.POS.x < CenterPos.POS.x Then
    'the point is at the left of CenterPos
    If POS.POS.y = CenterPos.POS.y Then GetAngle = 180
    
    If POS.POS.y < CenterPos.POS.y Then
        GetAngle = 180 - GetAngle
    End If
    
    If POS.POS.y > CenterPos.POS.y Then
        GetAngle = 180 + GetAngle
    End If
End If

If POS.POS.x > CenterPos.POS.x Then
    'the point is at the right of CenterPos
    If POS.POS.y > CenterPos.POS.y Then
        GetAngle = 360 - GetAngle
    End If
End If

If POS.POS.x = CenterPos.POS.x Then
    
    If POS.POS.y < CenterPos.POS.y Then
        GetAngle = 90
    End If
    
    If POS.POS.y > CenterPos.POS.y Then
        GetAngle = 270
    End If
End If
'be sure the GetAngle is between [0,360]
GetAngle = Abs(GetAngle Mod 360)

GetAngle = (GetAngle / 180) * (PI)





End Function
