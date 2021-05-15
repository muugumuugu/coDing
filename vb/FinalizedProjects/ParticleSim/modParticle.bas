Attribute VB_Name = "modParticle"
Option Explicit

Type PARTICLE

    X As Double                 'x position
    Y As Double                 'y position
    XMov As Double              'X axis Movement
    YMov As Double              'Y axis Movement
    XGrav As Double             'Gravitation x axis
    YGrav As Double             'Gravitation y axis
    LifeTime As Double          'lifetime
    
    ySwitch As Boolean          'needed for ground detection
    
End Type

'This settings can be modified during runtime by sliders etc.
Public STOPvar As Boolean       'if set to true our animation stops
Public XPos As Double           'the orign (x)
Public YPos As Double           'the orign (y)
Public Power As Double          'energy
Public XGrav As Double          'Gravity x axis
Public YGrav As Double          'Gravity y axis
Public GroundCol As Boolean     'do particles change their direction when they touch the ground ?
Public ParticleType As Integer  'what kind of particles should be used ?
Public ParticleNum As Integer   'how many particles are used ?

Public Particles(999) As PARTICLE  'array of particles

'picturebox settings
Public Sub PrepareOutBox(OutBox As PictureBox)

    OutBox.ScaleMode = 3        'set scalemode to pixel
    OutBox.FillStyle = 0        'painted objects are filled solid
    
End Sub

'Draws a single particle into a picturebox
Public Sub DrawParticle(OutBox As PictureBox, XPos As Double, YPos As Double, Size As Integer, Colorsteps As Integer, Power As Double)
  
    Dim looop As Integer
    Dim iGrey As Integer
    Dim iSteps As Integer
    Dim iColorDiff As Integer
    Dim iStepWidth As Integer
       
    iSteps = Colorsteps             'how many rings are used to draw one particle ?
    iColorDiff = Int(200 / iSteps)  'colordifference between two steps
    iStepWidth = Size / iSteps      'how many pixels is one 'ring' thig ?
       
    For looop = 0 To (iSteps - 1)
    
        iGrey = Int((Power / 100) * (255 - iSteps * iColorDiff + looop * iColorDiff))
        OutBox.FillColor = RGB(iGrey, iGrey, iGrey)
        OutBox.Circle (XPos, OutBox.ScaleHeight - YPos), iSteps * iStepWidth - looop * iStepWidth, RGB(iGrey, iGrey, iGrey)
    
    Next looop

End Sub

Public Sub DrawParticleAlternative(OutBox As PictureBox, XPos As Double, YPos As Double, Power As Double)
  
    Dim iGrey As Integer
    
    iGrey = Int((Power / 100) * 255)
    OutBox.PSet (XPos, OutBox.ScaleHeight - YPos), RGB(iGrey, iGrey, iGrey)


End Sub


'setting each particles startingpoint, movement ...
Public Sub CreateParticles(OutBox As PictureBox)
    
    Randomize Timer
    
    Dim i As Integer
    
    For i = 1 To ParticleNum
        
        Particles(i).X = XPos
        Particles(i).Y = YPos
        Particles(i).XMov = -Power + Round(Rnd * 2 * Power, 2)
        Particles(i).YMov = -Power + Round(Rnd * 2 * Power, 2)
        Particles(i).LifeTime = 70 - Int(Rnd * 69)
                
    Next i
    
End Sub

'central function
Public Sub Animation(OutBox As PictureBox)

    Randomize Timer

    Dim i As Integer           'loop variable

    STOPvar = False
    CreateParticles OutBox

    'main loop
    Do
        
        OutBox.Cls              'clearing the picturebox for the next frame
    
        For i = 1 To ParticleNum
        
            'draw one particle
            If ParticleType = 1 Then
                DrawParticleAlternative OutBox, Particles(i).X, Particles(i).Y, Particles(i).LifeTime
            ElseIf ParticleType = 2 Then
                DrawParticle OutBox, Particles(i).X, Particles(i).Y, 5, 4, Particles(i).LifeTime
            End If
            
            Particles(i).X = Particles(i).X + Particles(i).XMov         'apply movement to current particle
            Particles(i).X = Particles(i).X + Particles(i).XGrav        'apply gravitation
            
            Particles(i).XGrav = Particles(i).XGrav + XGrav             'increase gravitation strength (x)
            
            'hitting the ground or not ?
            If Particles(i).ySwitch = False Then
            
                Particles(i).Y = Particles(i).Y + Particles(i).YMov     'apply movement to current particle
                Particles(i).Y = Particles(i).Y + Particles(i).YGrav    'apply gravitation

                Particles(i).YGrav = Particles(i).YGrav + YGrav         'increase gravitation strength (y)
                
            Else
            
                Particles(i).Y = Particles(i).Y - Particles(i).YMov     'apply movement to current particle
                Particles(i).Y = Particles(i).Y - Particles(i).YGrav    'apply gravitation

                Particles(i).YGrav = Particles(i).YGrav - YGrav * 1.5   'decrease gravitation strength (y)
            
            End If
            
            'particle did hit the ground -> upward movement next time
            If Particles(i).Y < 0 And GroundCol = True Then Particles(i).ySwitch = True
            
            
            If Particles(i).LifeTime > 0 Then
                
                Particles(i).LifeTime = Particles(i).LifeTime - 0.5
                
            Else    'particle died and is reseted to the orign
            
                Particles(i).X = XPos
                Particles(i).Y = YPos
                Particles(i).XMov = -Power + Round(Rnd * 2 * Power, 2)
                Particles(i).YMov = -Power + Round(Rnd * 2 * Power, 2)
                Particles(i).XGrav = 0
                Particles(i).YGrav = 0
                Particles(i).LifeTime = 100 - Int(Rnd * 30)
                Particles(i).ySwitch = False
                            
            End If
        
        Next i
        
        DoEvents
    
    Loop Until STOPvar = True

End Sub
