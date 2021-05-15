Attribute VB_Name = "modParticles"
Option Explicit

Private Type tParticle
    X              As Single
    Y              As Single
    vX             As Single
    vY             As Single
    OldX As Single
    OldY As Single
End Type



Public PA()        As tParticle
Public NPA         As Long
Public MaxNpa      As Long

Public Sub AddParticle(ByVal X As Single, ByVal Y As Single, ByVal vX As Single, ByVal vY As Single)
    NPA = NPA + 1
    If NPA > MaxNpa Then MaxNpa = NPA: ReDim Preserve PA(1 To NPA)
    With PA(NPA)
        .X = X
        .Y = Y
        .vX = vX
        .vY = vY
        .OldX = X
        .OldY = Y
    End With
End Sub

Public Sub KillParticle(wP As Long)
    Dim I          As Long
    For I = wP To NPA - 1
        PA(I) = PA(I + 1)
    Next
    NPA = NPA - 1
End Sub

Public Sub DoPhysicParticles(ComputeOld As Boolean)
    Dim I          As Long
    
    
    If ComputeOld Then
    For I = 1 To NPA
        With PA(I)
            .OldX = .X
            .OldY = .Y
        End With
    Next
    End If
    
    For I = 1 To NPA
        With PA(I)

            .vX = .vX * AirResistence
            .vY = .vY + GravityY
            .X = .X + .vX
            .Y = .Y + .vY
            If .Y > MaxY Then
                .Y = MaxY: .vX = .vX * Friction
                .vY = -.vY * 0.5


                If .vY > -0.01 Then KillParticle (I)
            End If
        End With
    Next
End Sub

Public Sub DrawParticles(hdc As Long, ByVal PanX As Long, Antialias As Boolean)
    Dim X          As Long
    Dim Y          As Long
    Dim x2          As Long
    Dim y2          As Long
    
    Dim I          As Long
    Const C1 As Long = 3302450 'RGB(50, 100, 50)
    Const C2 As Long = 13158580 '180 200 200 5931610  'RGB(90, 130, 90)
    If Antialias Then
        For I = 1 To NPA
            X = PA(I).X - PanX
            Y = PA(I).Y
            x2 = PA(I).OldX - PanX
            y2 = PA(I).OldY
            AAA.LineDIB X, Y, x2, y2, C2, 255
            AAA.CircleDIB X, Y, 1, 1, C1, 255
        Next
    Else
        For I = 1 To NPA
            X = PA(I).X - PanX
            Y = PA(I).Y
            SetPixel hdc, X, Y, vbGreen
        Next


    End If

End Sub
