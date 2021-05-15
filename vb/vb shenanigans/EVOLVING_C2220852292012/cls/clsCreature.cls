VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsCreature"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public NP          As Long
Public InvNP       As Single

Private P()        As tPoint

Public NL          As Long
Private L()        As tLink

Public NM          As Long
Private M()        As tMuscle


Public LinkLeft    As Long
Public LinkRight   As Long


Public CurrCenX    As Single
Public CurrCenY    As Single
Public CurrVX      As Single
Public CurrVY      As Single
Public CurrDX      As Single
Public CurrDY      As Single
Public CurrHeightfromGround As Single

Public InvSIZE     As Single

Private Const BrainedLinkMAXExcursion As Single = 0.8    '.6  '1=from 50% to 150%
Private Const BrainedMuscleMAXExcursion As Single = PIh * 1.3 '* 0.5    '0.8    '.6  '1=from 50% to 150%


Public TaskWalk    As Single
Public TaskAVGheight As Single
Public TaskMAXHeight As Single
Public TaskDontJUMP As Single
Public TaskVerticality As Single
Public TaskHorizontality As Single
Public TaskShape As Single


Private Const Walk_Mult As Single = 0.01
Private Const AVGH_Mult As Single = 0.14
Private Const MaxH_Mult As Single = 0.05
Private Const DontJump_Mult As Single = 1
Private Const Orient_Mult As Single = 20
Private Const Shape_Mult As Single = 15


Public DrawOffset  As Long
Public CurrANG     As Single
Public OLDAng      As Single
Public RotVEL      As Single

Public MyIDX       As Long
Public PenalizationSUM As Single


'Public Property Get GetPenalization() As Single
'Dim I As Long
'GetPenalization = 0
'For I = 1 To NP
'GetPenalization = GetPenalization + P(I).Penalization
'Next
'End Property

Public Property Get IsPenalized(wP As Long) As Boolean
IsPenalized = P(wP).Penalize
End Property
Public Property Get getpointX(wP As Long) As Single
    getpointX = P(wP).X
End Property
Public Property Get getpointY(wP As Long) As Single
    getpointY = P(wP).Y
End Property

Public Property Let AdjAddedBrainLenToReach(wL As Long, Value As Single)
    'Value Must be between -0.5 and 0.5
    L(wL).AddedBrainLenToReach = L(wL).MainLen * Value * BrainedLinkMAXExcursion
End Property
Public Property Let AdjAddedBrainANGToReach(Wm As Long, Value As Single)


    'Value Must be between -0.5 and 0.5
    '    M(wM).AddedANGToReach = M(wM).A * Value * BrainedMuscleMAXExcursion
    M(Wm).AddedANGToReach = Value * BrainedMuscleMAXExcursion

End Property


Public Property Get GetLinkP1(wL As Long) As Long
    GetLinkP1 = L(wL).P1
End Property

Public Property Get GetMuscleP0(Wm As Long) As Long
    GetMuscleP0 = M(Wm).P0
End Property
Public Property Get GetMuscleP1(Wm As Long) As Long
    GetMuscleP1 = M(Wm).P1
End Property
Public Property Get GetMuscleP2(Wm As Long) As Long
    GetMuscleP2 = M(Wm).P2
End Property

Public Property Get GetLinkP2(wL As Long) As Long
    GetLinkP2 = L(wL).P2
End Property
Public Property Get GetLinkTension(wL As Long) As Single
    GetLinkTension = L(wL).TENSION
End Property
Public Property Get GetLinkMainL(wL As Long) As Single
    GetLinkMainL = L(wL).MainLen
End Property
Public Property Get GetMuscleMainA(Wm As Long) As Single
    GetMuscleMainA = M(Wm).A
End Property

Public Property Get GetCurrAddedBrainLen(wL As Long) As Single
    GetCurrAddedBrainLen = L(wL).CurrAddedBrainLen
End Property
Public Property Get GetCurrAddedBrainANG(Wm As Long) As Single
    GetCurrAddedBrainANG = M(Wm).CurrAddedANG
End Property
Public Property Get GetTouchGround(wP As Long) As Single
    GetTouchGround = P(wP).IsOnGround
End Property
Public Property Get GetSpeedYTouchGround(wP As Long) As Single
    GetSpeedYTouchGround = P(wP).SpeedYTouch
End Property

Public Property Get GetSpeedLeftTouch(wP As Long) As Single
    GetSpeedLeftTouch = P(wP).SpeedLeftTouch
End Property
Public Property Get GetSpeedRightTouch(wP As Long) As Single
    GetSpeedRightTouch = P(wP).SpeedRightTouch
End Property
Public Property Get IsLinkDynamic(wL As Long) As Boolean
    IsLinkDynamic = L(wL).Dynamic
End Property

Public Property Let IsLinkDynamic(wL As Long, V As Boolean)
    L(wL).Dynamic = V
End Property

'Public Property Get GetDX() As Single
'    'GetDX = (P(NP).X - P(1).X)
'    GetDX = 0.5 * (P(L(NL).P1).X + P(L(NL).P2).X - P(L(1).P1).X - P(L(1).P2).X)
'End Property
'Public Property Get GetDY() As Single
'    'Getdy = (P(NP).y - P(1).y)
'    GetDY = 0.5 * (P(L(NL).P1).Y + P(L(NL).P2).Y - P(L(1).P1).Y - P(L(1).P2).Y)
'End Property
'Public Property Get GetPOS() As Single
'    GetPOS = (P(1).X + P(NP).X) * 0.5
'End Property
'Public Property Get GetHeightAVG() As Single
'    Dim I          As Long
'    For I = 1 To NP Step 1        '3
'        GetHeightAVG = GetHeightAVG + P(I).Y
'    Next
'    GetHeightAVG = GetHeightAVG / (NP)
'End Property
'Public Property Get GetHeightfromGround() As Single
'    Dim I          As Long
'    Dim Max        As Single
'    Max = 0
'    For I = 1 To NP
'        If (MaxY - P(I).Y) > Max Then Max = MaxY - P(I).Y
'        GetHeightfromGround = Max
'    Next
'End Property
'Public Property Get GetVY() As Single
'    Dim I          As Long
'    For I = 1 To NP
'        GetVY = GetVY + P(I).vY
'    Next
'    GetVY = GetVY / NP
'End Property
Public Sub ADDpoint(X As Single, Y As Single, cPenalize)
    NP = NP + 1
    ReDim Preserve P(NP)
    With P(NP)
        .X = X
        .Y = Y
        .OldX = X
        .OldY = Y
        .vX = 0
        .vY = 0
        .IvX = 0
        .IvY = 0

        .IsOnGround = 0
        .SpeedYTouch = 0
        .SpeedLeftTouch = 0
        .SpeedRightTouch = 0
        
        .Penalize = cPenalize
        .Penalization = 0
    End With
    InvNP = 1 / NP
End Sub

Public Sub AddLink(P1 As Long, P2 As Long, ByVal Stren As Single, Optional IsDynamic As Boolean = False)
    Dim Xmax       As Single
    Dim Xmin       As Single
    Dim Ymax       As Single
    Dim Ymin       As Single

    Dim X          As Single
    Dim Y          As Single
    Dim I          As Long
    Dim V          As Single
    Dim lTOP       As Long
    Dim lBOTTOM    As Long

    'If IsDynamic Then Stren = Stren * 0.75


    NL = NL + 1
    ReDim Preserve L(NL)
    With L(NL)
        .P1 = P1
        .P2 = P2
        .Dynamic = IsDynamic
        .MainLen = PointDist(P(P1), P(P2))
        .InvMainLen = 1 / .MainLen
        .Stren = Stren

        .AddedBrainLenToReach = 0
        .CurrAddedBrainLen = 0

        .TENSION = 0

    End With

    Xmax = -999999999
    Xmin = 99999999999#
    Ymax = -999999999
    Ymin = 99999999999#


    For I = 1 To NL
        X = (P(L(I).P1).X + P(L(I).P2).X) * 0.5
        If X > Xmax Then Xmax = X: LinkRight = I
        If X < Xmin Then Xmin = X: LinkLeft = I
        Y = (P(L(I).P1).Y + P(L(I).P2).Y) * 0.5
        If Y > Ymax Then Ymax = Y: lBOTTOM = I
        If Y < Ymin Then Ymin = Y: lTOP = I
    Next


    If Xmax - Xmin > Ymax - Ymin Then
        V = (P(L(LinkRight).P1).X + P(L(LinkRight).P2).X) * 0.5 - _
            (P(L(LinkLeft).P1).X + P(L(LinkLeft).P2).X) * 0.5
    Else
        V = (P(L(lBOTTOM).P1).Y + P(L(lBOTTOM).P2).Y) * 0.5 - _
            (P(L(lTOP).P1).Y + P(L(lTOP).P2).Y) * 0.5
    End If

    If V <> 0 Then InvSIZE = 1 / V

End Sub
Public Function ADDMuscle(L1, L2) As Boolean

    NM = NM + 1
    ReDim Preserve M(NM)

    ADDMuscle = False

    With M(NM)
        .L1 = L1
        .L2 = L2
        .AddedANGToReach = 0
        .CurrAddedANG = 0

        If L(L1).P1 = L(L2).P1 Then
            .P0 = L(L1).P1
            .P1 = L(L1).P2
            .P2 = L(L2).P2
            ADDMuscle = True
        End If

        If L(L1).P1 = L(L2).P2 Then
            .P0 = L(L1).P1
            .P1 = L(L1).P2
            .P2 = L(L2).P1
            ADDMuscle = True
        End If

        If L(L1).P2 = L(L2).P1 Then
            .P0 = L(L1).P2
            .P1 = L(L1).P1
            .P2 = L(L2).P2
            ADDMuscle = True
        End If

        If L(L1).P2 = L(L2).P2 Then
            .P0 = L(L1).P2
            .P1 = L(L1).P1
            .P2 = L(L2).P1
            ADDMuscle = True
        End If
        'Stop

    End With

    If L1 = L2 Then ADDMuscle = False
    If ADDMuscle = False Then
        NM = NM - 1
        ReDim Preserve M(NM)
        Exit Function
    End If



    With M(NM)

        .A = AngleDIFF(Atan2(P(.P1).X - P(.P0).X, P(.P1).Y - P(.P0).Y), _
                       Atan2(P(.P2).X - P(.P0).X, P(.P2).Y - P(.P0).Y))
    End With


End Function
Public Sub ClearAll()
    NP = 0
    NL = 0
    NM = 0

    CurrCenX = 0
    CurrCenY = 0
    CurrVX = 0
    CurrVY = 0
    CurrDX = 0
    CurrDY = 0
    CurrHeightfromGround = 0

    CurrANG = 0
    OLDAng = 0
    RotVEL = 0

    PenalizationSUM = 0
    
    ResetTaskValues

End Sub
Public Sub ResetTaskValues()
    TaskWalk = 40                 ' 30
    TaskAVGheight = 0
    TaskMAXHeight = 1E+17
    TaskDontJUMP = 0
    TaskVerticality = 0
    TaskHorizontality = 0
    TaskShape = 0
End Sub
Public Sub DRAW(hdc As Long, ByVal drPANX As Long, Optional DrawPts As Boolean = False, Optional Antialias As Boolean = False)
    Dim x1         As Long
    Dim y1         As Long
    Dim x2         As Long
    Dim y2         As Long

    Dim I          As Long

    Dim C          As Long
    Dim C1         As Long
    Dim C2         As Long

    Dim V          As Single

    Dim A1         As Single
    Dim A2         As Single
    Dim A          As Single
    Dim Adi        As Single
    Dim P0         As Long
    Dim P1         As Long
    Dim P2         As Long

    Dim IsBest     As Boolean

    IsBest = (MyIDX = CurBEST)

    'Draw Muscles
    For I = 1 To NM
        P0 = M(I).P0
        P1 = M(I).P1
        P2 = M(I).P2

        x1 = (P(P0).X + P(P1).X) * 0.5 - drPANX + DrawOffset
        y1 = (P(P0).Y + P(P1).Y) * 0.5
        x2 = (P(P0).X + P(P2).X) * 0.5 - drPANX + DrawOffset
        y2 = (P(P0).Y + P(P2).Y) * 0.5

        If Antialias Then
            AAA.LineDIB x1, y1, x2, y2, vbCyan, IIf(IsBest, 255, 128)
        Else
            '  A1 = GetFutureLinkANG(P0, M(I).P1)
            '  A2 = GetFutureLinkANG(P0, M(I).P2)
            '  Adi = AngleDIFF(A1, A2)
            '  Adi = Adi * 0.125
            '  If Sgn(A2 - A1) = Sgn(Adi) Then
            '      For A = A1 To A2 Step Adi
            '          x1 = P(P0).X + 20 * Cos(A) - drPANX + DrawOffset
            '          y1 = P(P0).Y + 20 * Sin(A)
            '          SetPixel hdc, x1, y1, vbYellow
            '      Next
            '  Else
            '      Adi = (A1 - A2 + Pi) * 0.125
            '      For A = A2 To A1 Step Adi
            '          x1 = P(P0).X + 20 * Cos(A) - drPANX + DrawOffset
            '          y1 = P(P0).Y + 20 * Sin(A)
            '          SetPixel hdc, x1, y1, vbYellow
            '      Next
            '  End If

            FastLine hdc, x1, y1, x2, y2, 1, vbYellow
        End If
    Next


    For I = 1 To NL
        With L(I)
            x1 = P(.P1).X - drPANX + DrawOffset
            y1 = P(.P1).Y
            x2 = P(.P2).X - drPANX + DrawOffset
            y2 = P(.P2).Y

            C1 = .TENSION * 255
            If Abs(C1) > 255 Then C1 = Sgn(C1) * 255

            If Antialias Then
                If .Dynamic Then
                    C = GradDynamic2.GetGrad(C1)
                Else
                    C = GradStatic2.GetGrad(C1)
                End If

                AAA.LineDIB x1, y1, x2, y2, C, IIf(IsBest, 255, 128)
            Else
                If .Dynamic Then
                    C = GradDynamic1.GetGrad(C1)
                Else
                    C = GradStatic1.GetGrad(C1)
                End If
                FastLine hdc, x1, y1, x2, y2, 2, C
            End If
        End With


        'Y1 = CurrCenY \ 1
        'X1 = CurrCenX \ 1
        'Y2 = Y1 + CurrVY * 100
        'X2 = X1 + CurrVX * 100
        'FastLine HDC, X1, Y1, X2, Y2, 2, vbRed
        '
        'X2 = X1 + (CurrDX * 0.5) \ 1
        'Y2 = Y1 + (CurrDY * 0.5) \ 1
        'FastLine HDC, X1, Y1, X2, Y2, 2, vbGreen
    Next

    'If DrawPts Then
    '    For I = 1 To NP
    '        C = P(I).IsOnGround * 510 - 255
    '        If Antialias Then
    '            C = GradGround2.GetGrad(C)
    '            'AAA.CircleDIB P(I).X \ 1 - drPANX + DrawOffset, P(I).Y \ 1, 1, 1, C, IIf(isbest, 255, 90), Thick
    '            AAA.CircleDIB P(I).X \ 1 - drPANX + DrawOffset, P(I).Y \ 1, 2, 2, C, IIf(IsBest, 255, 90), Thick
    '
    '            Else
    '                C = GradGround1.GetGrad(C)
    '                MyCircle hdc, P(I).X \ 1 - drPANX + DrawOffset, P(I).Y \ 1, 3, 2, C
    '            End If
    '        Next
    '    End If

    If Antialias Then
                For I = 1 To NP
                If P(I).Penalize Then
                    C = 510
                Else
                    C = P(I).IsOnGround * 510 - 255
                    C = GradGround2.GetGrad(C)
                End If
                AAA.CircleDIB P(I).X \ 1 - drPANX + DrawOffset, P(I).Y \ 1, 2, 2, C, IIf(IsBest, 255, 90), Thick
    

            Next
    Else
        If DrawPts Then
            For I = 1 To NP
                If P(I).Penalize Then
                    C = 510
                Else
                    C = P(I).IsOnGround * 510 - 255
                    C = GradGround1.GetGrad(C)
                End If
                MyCircle hdc, P(I).X \ 1 - drPANX + DrawOffset, P(I).Y \ 1, 3, 2, C

            Next
        Else
            For I = 1 To NP
                If P(I).Penalize Then
                    C = 510
                MyCircle hdc, P(I).X \ 1 - drPANX + DrawOffset, P(I).Y \ 1, 2, 2, C
                End If
            Next
        End If
    End If





End Sub

Public Sub DoPhysicsV4(ByVal MyIDX As Long)
    ' No Muscles
    Dim dx         As Single
    Dim dy         As Single
    Dim ndx        As Single
    Dim ndy        As Single
    Dim D          As Single
    Dim I          As Long
    Dim resF       As Single
    Dim vX         As Single
    Dim vY         As Single
    Dim CX         As Single
    Dim CY         As Single
    Dim DDD        As Single

    Dim A          As Single
    Dim vx1        As Single
    Dim vy1        As Single
    Dim vx2        As Single
    Dim vy2        As Single
    Dim MAG        As Single


    For I = 1 To NL
        With L(I)

            dx = P(.P2).X - P(.P1).X
            dy = P(.P2).Y - P(.P1).Y
            dx = dx + (P(.P2).vX - P(.P1).vX) * 10
            dy = dy + (P(.P2).vY - P(.P1).vY) * 10

            D = Sqr(dx * dx + dy * dy)
            If D <> 0 Then
                ndx = dx / D
                ndy = dy / D
            End If

            'Update3:
            .CurrAddedBrainLen = .CurrAddedBrainLen * 0.98 + .AddedBrainLenToReach * 0.02
            'smooth

            If .Dynamic Then
                resF = (.MainLen - D + .CurrAddedBrainLen)
                .TENSION = 3 * resF / (.MainLen + .CurrAddedBrainLen)
                resF = resF * .Stren
            Else
                resF = (.MainLen - D)
                .TENSION = 3 * resF * .InvMainLen
                resF = resF * .Stren
            End If
            resF = resF * 0.01    '0.01   ' 0.012

            dx = ndx * resF
            dy = ndy * resF

            If Abs(.TENSION) > 1 Then .TENSION = Sgn(.TENSION)

            P(.P1).IvX = P(.P1).IvX - dx
            P(.P1).IvY = P(.P1).IvY - dy
            P(.P2).IvX = P(.P2).IvX + dx
            P(.P2).IvY = P(.P2).IvY + dy
        End With
    Next


    CurrHeightfromGround = 9999999
    For I = 1 To NP
        With P(I)
            .IsOnGround = .IsOnGround * 0.985
            .SpeedYTouch = .SpeedYTouch * 0.985    '* 0.982
            .SpeedLeftTouch = .SpeedLeftTouch * 0.985    '0.982
            .SpeedRightTouch = .SpeedRightTouch * 0.985    '* 0.982


            .vX = .vX + .IvX: .IvX = 0
            .vY = .vY + .IvY: .IvY = 0

            .vY = .vY + GravityY
            .vX = .vX * AirResistence

            .X = .X + .vX
            .Y = .Y + .vY

            If .Y > MaxY Then
                ' Update2: smoothed touch ground sensor (Sort of Pressure) ---------------
                .IsOnGround = .IsOnGround + .vY * 15    ' 100 * Sqr(.vY * .vY + .vX * .vX)
                If .IsOnGround > 1 Then .IsOnGround = 1
                '----------------------------------------
                .SpeedYTouch = .vY * 5    '+ .SpeedYTouch * 0.7
                If .SpeedYTouch > 1 Then .SpeedYTouch = 1

                If .vX > 0 Then
                    .SpeedRightTouch = .vX * 5    '+ .SpeedRightTouch * 0.7
                    '.SpeedLeftTouch = 0 'Remove to have a sort of memory
                    If .SpeedRightTouch > 1 Then .SpeedRightTouch = 1
                Else
                    .SpeedLeftTouch = -.vX * 5    '+ .SpeedLeftTouch * 0.7
                    '.SpeedRightTouch = 0 'Remove to have a sort of memory
                    If .SpeedLeftTouch > 1 Then .SpeedLeftTouch = 1
                End If





                If MyIDX = CurBEST Then

                    A = Atan2(.vX, -.vY)
                    MAG = Sqr(.vX * .vX + .vY * .vY)    '* 1.1
                    If MAG > 0.02 Then
                        vx1 = Cos(A + 0.25) * MAG
                        vy1 = Sin(A + 0.25) * MAG
                        vx2 = Cos(A - 0.25) * MAG
                        vy2 = Sin(A - 0.25) * MAG
                        AddParticle .X + DrawOffset, .Y - 1, .vX * 1.1, -.vY * 1.1 - 0.01
                        AddParticle .X + DrawOffset, .Y - 1, vx1, vy1 - 0.01
                        AddParticle .X + DrawOffset, .Y - 1, vx2, vy2 - 0.01
                    End If

                End If

                '.Y = MaxY
                'Taken from V5
                .Y = MaxY - (.Y - MaxY)

                .vY = -.vY * Bounce
                .vX = .vX * Friction


            End If

            CX = CX + .X
            CY = CY + .Y
            vX = vX + .vX
            vY = vY + .vY
            If (MaxY - .Y) < CurrHeightfromGround Then CurrHeightfromGround = MaxY - .Y
        End With
    Next

    CurrCenX = CX * InvNP
    CurrCenY = CY * InvNP
    CurrVY = vY * InvNP
    CurrVX = vX * InvNP
    CurrDX = (P(L(LinkRight).P1).X + P(L(LinkRight).P2).X - P(L(LinkLeft).P1).X - P(L(LinkLeft).P2).X)    '*.5
    CurrDY = (P(L(LinkRight).P1).Y + P(L(LinkRight).P2).Y - P(L(LinkLeft).P1).Y - P(L(LinkLeft).P2).Y)    '*.5

    OLDAng = CurrANG
    CurrANG = Atan2(CurrDX, CurrDY)
    RotVEL = -75 * AngleDIFF(OLDAng, CurrANG)    '100 (u3)
    If RotVEL > 1 Then
        RotVEL = 1
    ElseIf RotVEL < -1 Then RotVEL = -1
    End If

    DDD = Sqr(CurrDX * CurrDX + CurrDY * CurrDY)
    If DDD <> 0 Then CurrDX = CurrDX / DDD: CurrDY = CurrDY / DDD

    TaskWalk = TaskWalk - (CurrVX) * Walk_Mult
    TaskAVGheight = TaskAVGheight + CurrCenY * AVGH_Mult
    If CurrCenY < TaskMAXHeight Then TaskMAXHeight = CurrCenY * MaxH_Mult
    TaskDontJUMP = TaskDontJUMP + CurrHeightfromGround * DontJump_Mult
    TaskVerticality = TaskVerticality + Abs(CurrDX) * Orient_Mult
    TaskHorizontality = TaskHorizontality + Abs(CurrDY) * Orient_Mult



End Sub
Public Sub DoPhysicsV5(ByVal MyIDX As Long)
    Dim dx         As Single
    Dim dy         As Single
    Dim ndx        As Single
    Dim ndy        As Single
    Dim D          As Single
    Dim I          As Long
    Dim resF       As Single
    Dim vX         As Single
    Dim vY         As Single
    Dim CX         As Single
    Dim CY         As Single
    Dim DDD        As Single

    Dim A          As Single
    Dim vx1        As Single
    Dim vy1        As Single
    Dim vx2        As Single
    Dim vy2        As Single
    Dim MAG        As Single

    Dim K          As Single
    Dim DAMP       As Single
    Dim DAMPing    As Single

    Dim Rest_Length As Single
    Dim LENG       As Single
    Dim InvLeng    As Single
    Dim dVX        As Single
    Dim dVY        As Single

    Dim tP1        As tPoint
    Dim tP2        As tPoint
    Dim FF         As Single
    Dim FX         As Single
    Dim FY         As Single
    Dim VX_old     As Single
    Dim VY_old     As Single

    'zero out the accelerations and any artificial friction
    For I = 1 To NP
        P(I).Ax = 0
        P(I).Ay = GravityY

    Next

    K = 0.005                     ' spring constant for this segment
    DAMP = 0.02                   ' spring damping value for segment
    'calculate forces due to segments (springs)
    For I = 1 To NL
        With L(I)

            ' calculate rest length of spring, which may vary sinusoidally with time
            .CurrAddedBrainLen = .CurrAddedBrainLen * 0.98 + .AddedBrainLenToReach * 0.02
            Rest_Length = .MainLen + .CurrAddedBrainLen

            tP1 = P(.P1)
            tP2 = P(.P2)
            dx = tP1.X - tP2.X
            dy = tP1.Y - tP2.Y

            LENG = Sqr(dx * dx + dy * dy)
            'If leng > 0 Then
            InvLeng = 1 / LENG
            'Else
            '    dx = RndM - 0.5: dy = RndM - 0.5
            '    leng = Sqr(dx * dx + dy * dy)
            '    INVLeng = 1 / leng
            'End If

            ' equation of motion for a damped spring
            dVX = tP1.vX - tP2.vX
            dVY = tP1.vY - tP2.vY
            DAMPing = DAMP * (dx * dVX + dy * dVY) * InvLeng    '/ leng
            'fx = -(K * (leng - Rest_Length) + Damping) * Dx * INVLeng '/ leng
            'fy = -(K * (leng - Rest_Length) + Damping) * Dy * INVLeng '/ leng

            FF = -(K * (LENG - Rest_Length) + DAMPing) * InvLeng
            FX = FF * dx
            FY = FF * dy

            .TENSION = FF * 50
            If Abs(.TENSION) > 1 Then .TENSION = Sgn(.TENSION)

            ' add appropriate forces to each point
            tP1.Ax = tP1.Ax + FX
            tP1.Ay = tP1.Ay + FY
            tP2.Ax = tP2.Ax - FX
            tP2.Ay = tP2.Ay - FY
            'Foot_Amp = Foot_Amp - 0.25

            P(.P1) = tP1
            P(.P2) = tP2

        End With
    Next

    '    For I = 1 To NP
    '        ' regular viscous damping '[Sort of air denisty]
    '        P(I).Ax = P(I).Ax - 0.0001 * P(I).vX
    '        P(I).Ay = P(I).Ay - 0.0001 * P(I).vY
    '        P(i).ax=p(i).ax/mass
    '        P(i).ay=p(i).ay/mass
    '    Next

    CX = 0
    CY = 0
    vX = 0
    vY = 0

    CurrHeightfromGround = 9999999
    'perform modified Euler simulation step
    For I = 1 To NP
        With P(I)

            '            Stop

            .IsOnGround = .IsOnGround * 0.985
            .SpeedYTouch = .SpeedYTouch * 0.985    '* 0.982
            .SpeedLeftTouch = .SpeedLeftTouch * 0.985    '0.982
            .SpeedRightTouch = .SpeedRightTouch * 0.985    '* 0.982

            .OldX = .X
            .OldY = .Y

            VX_old = .vX
            VY_old = .vY

            .vX = .vX + dT * .Ax
            .vY = .vY + dT * .Ay

            .vX = .vX * AirResistence

            .IvX = dT * (.vX + VX_old) * 0.5
            .IvY = dT * (.vY + VY_old) * 0.5

            .X = .X + .IvX
            .Y = .Y + .IvY

            .IsOnGround = .IsOnGround * 0.985
            .SpeedYTouch = .SpeedYTouch * 0.985    '* 0.982
            .SpeedLeftTouch = .SpeedLeftTouch * 0.985    '0.982
            .SpeedRightTouch = .SpeedRightTouch * 0.985    '* 0.982


            If .Y > MaxY Then


                ' Update2: smoothed touch ground sensor (Sort of Pressure) ---------------
                .IsOnGround = .IsOnGround + .IvY * 15    ' 100 * Sqr(.vY * .vY + .vX * .vX)
                If .IsOnGround > 1 Then .IsOnGround = 1
                '----------------------------------------
                .SpeedYTouch = .IvY * 5    '+ .SpeedYTouch * 0.7
                If .SpeedYTouch > 1 Then .SpeedYTouch = 1

                If .vX > 0 Then
                    .SpeedRightTouch = .IvX * 5    '+ .SpeedRightTouch * 0.7
                    '.SpeedLeftTouch = 0 'Remove to have a sort of memory
                    If .SpeedRightTouch > 1 Then .SpeedRightTouch = 1
                Else
                    .SpeedLeftTouch = -.IvX * 5    '+ .SpeedLeftTouch * 0.7
                    '.SpeedRightTouch = 0 'Remove to have a sort of memory
                    If .SpeedLeftTouch > 1 Then .SpeedLeftTouch = 1
                End If

                If MyIDX = CurBEST Then
                    '                Stop

                    A = Atan2(.IvX, -.IvY)
                    MAG = Sqr(.IvX * .IvX + .IvY * .IvY)    '* 1.1
                    If MAG > 0.02 Then

                        vx1 = Cos(A + 0.25) * MAG
                        vy1 = Sin(A + 0.25) * MAG
                        vx2 = Cos(A - 0.25) * MAG
                        vy2 = Sin(A - 0.25) * MAG
                        AddParticle .X + DrawOffset, .Y - 1, .IvX * 1.1, -.IvY * 1.1 - 0.01
                        AddParticle .X + DrawOffset, .Y - 1, vx1, vy1 - 0.01
                        AddParticle .X + DrawOffset, .Y - 1, vx2, vy2 - 0.01
                    End If
                End If
                '
                '\
                ' \
                '  \ /
                '--------------------------------------------------
                '    \
                '
                '.Y = MaxY - (.IvY - (MaxY - .oldY))
                .Y = MaxY - (.Y - MaxY)

                '.Y = MaxY

                .vY = -.vY * Bounce
                .vX = .vX * Friction

            End If

            CX = CX + .X
            CY = CY + .Y
            vX = vX + .vX * dT
            vY = vY + .vY * dT
            If (MaxY - .Y) < CurrHeightfromGround Then CurrHeightfromGround = MaxY - .Y
        End With
    Next

    CurrCenX = CX * InvNP
    CurrCenY = CY * InvNP
    CurrVY = vY * InvNP
    CurrVX = vX * InvNP
    CurrDX = (P(L(LinkRight).P1).X + P(L(LinkRight).P2).X - P(L(LinkLeft).P1).X - P(L(LinkLeft).P2).X)    '*.5
    CurrDY = (P(L(LinkRight).P1).Y + P(L(LinkRight).P2).Y - P(L(LinkLeft).P1).Y - P(L(LinkLeft).P2).Y)    '*.5

    OLDAng = CurrANG
    CurrANG = Atan2(CurrDX, CurrDY)
    RotVEL = -75 * AngleDIFF(OLDAng, CurrANG)    '100 (u3)
    If RotVEL > 1 Then
        RotVEL = 1
    ElseIf RotVEL < -1 Then RotVEL = -1
    End If

    DDD = Sqr(CurrDX * CurrDX + CurrDY * CurrDY)
    If DDD <> 0 Then CurrDX = CurrDX / DDD: CurrDY = CurrDY / DDD

    TaskWalk = TaskWalk - (CurrVX) * Walk_Mult
    TaskAVGheight = TaskAVGheight + CurrCenY * AVGH_Mult
    If CurrCenY < TaskMAXHeight Then TaskMAXHeight = CurrCenY * MaxH_Mult
    TaskDontJUMP = TaskDontJUMP + CurrHeightfromGround * DontJump_Mult
    TaskVerticality = TaskVerticality + Abs(CurrDX) * Orient_Mult
    TaskHorizontality = TaskHorizontality + Abs(CurrDY) * Orient_Mult



End Sub
Public Function GetFutureLinkANG(P0, P1) As Single
    Dim dx         As Single
    Dim dy         As Single

    dx = P(P1).X - P(P0).X + (P(P1).vX - P(P0).vX) * 30 '
    dy = P(P1).Y - P(P0).Y + (P(P1).vY - P(P0).vY) * 30
    GetFutureLinkANG = Atan2(dx, dy)

End Function
Public Sub DoPhysicsV6(ByVal MyIDX As Long)
    ' V4 + muscles
    Dim dx         As Single
    Dim dy         As Single
    Dim ndx        As Single
    Dim ndy        As Single
    Dim D          As Single
    Dim I          As Long
    Dim resF       As Single
    Dim vX         As Single
    Dim vY         As Single
    Dim CX         As Single
    Dim CY         As Single
    Dim DDD        As Single

    Dim A          As Single

    Dim vx1        As Single
    Dim vy1        As Single
    Dim vx2        As Single
    Dim vy2        As Single
    Dim MAG        As Single

    Dim A1         As Single
    Dim A2         As Single


    Dim Mx1        As Single
    Dim My1        As Single
    Dim Mx2        As Single
    Dim My2        As Single
    Dim F1         As Single
    Dim F2         As Single

    Dim len1       As Single
    Dim len2       As Single

    Dim L1L2       As Single
    Dim TP         As tPoint

    Dim NLinkMuscleShape As Long
    Dim tmpTaskShape As Single


    'GoTo doMuscles2
    For I = 1 To NM
        With M(I)

            A2 = GetFutureLinkANG(.P0, .P2)
            A1 = GetFutureLinkANG(.P0, .P1)

            A = AngleDIFF(A1, A2)

            .CurrAddedANG = .CurrAddedANG * 0.98 + .AddedANGToReach * 0.02

            resF = AngleDIFF(A, .A + .CurrAddedANG) * 0.07    ' 0.1

            A1 = A1 - PIh
            A2 = A2 + PIh

            len1 = L(.L1).MainLen + L(.L1).CurrAddedBrainLen
            len2 = L(.L2).MainLen + L(.L2).CurrAddedBrainLen

            L1L2 = len1 + len2
            L1L2 = 1 / L1L2

            F1 = resF * len2 * (L1L2) ' (Ok) Shorter Link Moves Faster
            F2 = resF * len1 * (L1L2)

            Mx1 = Cos(A1) * F1
            My1 = Sin(A1) * F1
            Mx2 = Cos(A2) * F2
            My2 = Sin(A2) * F2

            P(.P1).IvX = P(.P1).IvX + Mx1
            P(.P1).IvY = P(.P1).IvY + My1
            P(.P2).IvX = P(.P2).IvX + Mx2
            P(.P2).IvY = P(.P2).IvY + My2

            P(.P0).IvX = P(.P0).IvX - Mx1 - Mx2
            P(.P0).IvY = P(.P0).IvY - My1 - My2

        End With
    Next

doMuscles2:                       'More Precise but slower (2 SQR)
GoTo continuelinks
    For I = 1 To NM
        With M(I)

            A2 = GetFutureLinkANG(.P0, .P2)
            A1 = GetFutureLinkANG(.P0, .P1)

            A = AngleDIFF(A1, A2)

            .CurrAddedANG = .CurrAddedANG * 0.98 + .AddedANGToReach * 0.02

            resF = AngleDIFF(A, .A + .CurrAddedANG) * 0.0005

            len1 = L(.L1).MainLen + L(.L1).CurrAddedBrainLen
            len2 = L(.L2).MainLen + L(.L2).CurrAddedBrainLen

            L1L2 = len1 + len2
            L1L2 = 1 / L1L2

            F1 = -resF * len2 * (L1L2)   ' (Ok) Shorter Link Moves Faster
            F2 = resF * len1 * (L1L2)    '


            dx = P(.P1).X - P(.P0).X '+ P(.P1).IvX - P(.P0).IvX
            dy = P(.P1).Y - P(.P0).Y '+ P(.P1).IvY - P(.P0).IvY
            D = Sqr(dx * dx + dy * dy)
            A1 = Atan2(dx, dy) + F1
            Mx1 = -dx + Cos(A1) * D
            My1 = -dy + Sin(A1) * D

            dx = P(.P2).X - P(.P0).X '+ P(.P2).IvX - P(.P0).IvX
            dy = P(.P2).Y - P(.P0).Y '+ P(.P2).IvY - P(.P0).IvY
            D = Sqr(dx * dx + dy * dy)
            A2 = Atan2(dx, dy) + F2
            Mx2 = -dx + Cos(A2) * D
            My2 = -dy + Sin(A2) * D

            P(.P1).IvX = P(.P1).IvX + Mx1
            P(.P1).IvY = P(.P1).IvY + My1
            P(.P2).IvX = P(.P2).IvX + Mx2
            P(.P2).IvY = P(.P2).IvY + My2

            P(.P0).IvX = P(.P0).IvX - Mx1 - Mx2
            P(.P0).IvY = P(.P0).IvY - My1 - My2


        End With
    Next
continuelinks:


    For I = 1 To NL
        With L(I)

            dx = P(.P2).X - P(.P1).X
            dy = P(.P2).Y - P(.P1).Y
            dx = dx + (P(.P2).vX - P(.P1).vX) * 10    '* 10 '(v4)
            dy = dy + (P(.P2).vY - P(.P1).vY) * 10    '* 10

            D = Sqr(dx * dx + dy * dy)
            If D <> 0 Then
                ndx = dx / D
                ndy = dy / D
            End If

            'Update3:
            .CurrAddedBrainLen = .CurrAddedBrainLen * 0.98 + .AddedBrainLenToReach * 0.02
            'smooth

            If .Dynamic Then
                resF = (.MainLen - D + .CurrAddedBrainLen)
                .TENSION = 3 * resF / (.MainLen + .CurrAddedBrainLen)
                resF = resF * .Stren
            Else
                resF = (.MainLen - D)
                .TENSION = 3 * resF * .InvMainLen
                resF = resF * .Stren
            End If
            resF = resF * 0.01    '0.01      ' 0.012

            dx = ndx * resF
            dy = ndy * resF

            If Abs(.TENSION) > 1 Then .TENSION = Sgn(.TENSION)

            P(.P1).IvX = P(.P1).IvX - dx
            P(.P1).IvY = P(.P1).IvY - dy
            P(.P2).IvX = P(.P2).IvX + dx
            P(.P2).IvY = P(.P2).IvY + dy
        End With
    Next


    CurrHeightfromGround = 9999999
    
    PenalizationSUM = 0
    
    For I = 1 To NP
        With P(I)
            .IsOnGround = .IsOnGround * 0.985
            .SpeedYTouch = .SpeedYTouch * 0.985    '* 0.982
            .SpeedLeftTouch = .SpeedLeftTouch * 0.985    '0.982
            .SpeedRightTouch = .SpeedRightTouch * 0.985    '* 0.982


            .vX = .vX + .IvX: .IvX = 0
            .vY = .vY + .IvY: .IvY = 0

            .vY = .vY + GravityY
            .vX = .vX * AirResistence

            .X = .X + .vX
            .Y = .Y + .vY

            If .Y > MaxY Then
                ' Update2: smoothed touch ground sensor (Sort of Pressure) ---------------
                .IsOnGround = .IsOnGround + .vY * 15    ' 100 * Sqr(.vY * .vY + .vX * .vX)
                If .IsOnGround > 1 Then .IsOnGround = 1
                '----------------------------------------
                .SpeedYTouch = .vY * 5    '+ .SpeedYTouch * 0.7
                If .SpeedYTouch > 1 Then .SpeedYTouch = 1

                If .vX > 0 Then
                    .SpeedRightTouch = .vX * 5    '+ .SpeedRightTouch * 0.7
                    '.SpeedLeftTouch = 0 'Remove to have a sort of memory
                    If .SpeedRightTouch > 1 Then .SpeedRightTouch = 1
                Else
                    .SpeedLeftTouch = -.vX * 5    '+ .SpeedLeftTouch * 0.7
                    '.SpeedRightTouch = 0 'Remove to have a sort of memory
                    If .SpeedLeftTouch > 1 Then .SpeedLeftTouch = 1
                End If



'If .Penalize Then .Penalization = .Penalization + 1 + .vY * 5
'If .Penalize Then .Penalization = .Penalization + 0.5 + .vY * 70
If .Penalize Then .Penalization = .Penalization + Abs(.vX) * 30 + .vY * 60


                If MyIDX = CurBEST Then

                    A = Atan2(.vX, -.vY)
                    MAG = Sqr(.vX * .vX + .vY * .vY)    '* 1.1
                    If MAG > 0.02 Then
                        vx1 = Cos(A + 0.25) * MAG
                        vy1 = Sin(A + 0.25) * MAG
                        vx2 = Cos(A - 0.25) * MAG
                        vy2 = Sin(A - 0.25) * MAG
                        AddParticle .X + DrawOffset, .Y - 1, .vX * 1.1, -.vY * 1.1 - 0.01
                        AddParticle .X + DrawOffset, .Y - 1, vx1, vy1 - 0.01
                        AddParticle .X + DrawOffset, .Y - 1, vx2, vy2 - 0.01
                    End If

                End If

                '.Y = MaxY
                'Taken from V5
                .Y = MaxY - (.Y - MaxY)

                .vY = -.vY * Bounce
                .vX = .vX * Friction


            End If

            CX = CX + .X
            CY = CY + .Y
            vX = vX + .vX
            vY = vY + .vY
            If (MaxY - .Y) < CurrHeightfromGround Then CurrHeightfromGround = MaxY - .Y
        
        PenalizationSUM = PenalizationSUM + .Penalization
        
        End With
    Next

    CurrCenX = CX * InvNP
    CurrCenY = CY * InvNP
    CurrVY = vY * InvNP
    CurrVX = vX * InvNP
    CurrDX = (P(L(LinkRight).P1).X + P(L(LinkRight).P2).X - P(L(LinkLeft).P1).X - P(L(LinkLeft).P2).X)    '*.5
    CurrDY = (P(L(LinkRight).P1).Y + P(L(LinkRight).P2).Y - P(L(LinkLeft).P1).Y - P(L(LinkLeft).P2).Y)    '*.5

    OLDAng = CurrANG
    CurrANG = Atan2(CurrDX, CurrDY)
    RotVEL = -75 * AngleDIFF(OLDAng, CurrANG)    '100 (u3)
    If RotVEL > 1 Then
        RotVEL = 1
    ElseIf RotVEL < -1 Then RotVEL = -1
    End If

    DDD = Sqr(CurrDX * CurrDX + CurrDY * CurrDY)
    If DDD <> 0 Then CurrDX = CurrDX / DDD: CurrDY = CurrDY / DDD

    TaskWalk = TaskWalk - (CurrVX) * Walk_Mult
    TaskAVGheight = TaskAVGheight + CurrCenY * AVGH_Mult
    If CurrCenY < TaskMAXHeight Then TaskMAXHeight = CurrCenY * MaxH_Mult
    TaskDontJUMP = TaskDontJUMP + CurrHeightfromGround * DontJump_Mult
    TaskVerticality = TaskVerticality + Abs(CurrDX) * Orient_Mult
    TaskHorizontality = TaskHorizontality + Abs(CurrDY) * Orient_Mult



    'shape
    NLinkMuscleShape = 0
    tmpTaskShape = 0
    For I = 1 To NL
        If L(I).Dynamic Then
            tmpTaskShape = tmpTaskShape + Abs(L(I).AddedBrainLenToReach / L(I).MainLen)
            NLinkMuscleShape = NLinkMuscleShape + 1
        End If
    Next
    For I = 1 To NM
        tmpTaskShape = tmpTaskShape + Abs(2 * M(I).AddedANGToReach / BrainedMuscleMAXExcursion)
    Next
    NLinkMuscleShape = NLinkMuscleShape + NM
    If NLinkMuscleShape > 0 Then TaskShape = TaskShape + Shape_Mult * (tmpTaskShape / NLinkMuscleShape)
    '---------------------------------------------

End Sub

Public Sub SaveMe(ByVal filename As String)
    Dim MinX       As Long
    Dim MinY       As Long
    Dim MaxX       As Long
    Dim MaxY       As Long
    Dim I          As Long

    If Right$(filename, 4) <> ".cre" Then filename = filename & ".cre"
    filename = App.Path & "\" & filename


    MaxX = -1
    MaxY = -1
    MinX = 9999999
    MinY = 9999999

    For I = 1 To NP
        If P(I).X > MaxX Then MaxX = P(I).X
        If P(I).Y > MaxY Then MaxY = P(I).Y
        If P(I).X < MinX Then MinX = P(I).X
        If P(I).Y < MinY Then MinY = P(I).Y
    Next


    Open filename For Output As 1
    Print #1, "Points:"
    Print #1, NP
    For I = 1 To NP
        Print #1, P(I).X - MinX
        Print #1, P(I).Y - MaxY
        Print #1, CInt(P(I).Penalize)
    Next
    Print #1, "Links:"
    Print #1, NL
    For I = 1 To NL
        Print #1, L(I).P1
        Print #1, L(I).P2
        Print #1, Replace(L(I).Stren, ",", ".")
        Print #1, CLng(L(I).Dynamic)
    Next

    Print #1, "muscle:"
    Print #1, NM
    For I = 1 To NM
        Print #1, M(I).L1
        Print #1, M(I).L2
    Next
    Close 1

End Sub

Public Sub LoadMe(ByVal filename As String, Left As Long, Bottom As Long)


    Dim I          As Long
    Dim S          As String
    Dim V1         As Long
    Dim V2         As Long
    Dim Stre       As Single
    Dim v4         As Long
    Dim N          As Long
    Dim P As Boolean
    Dim iP As Integer
    

    If Right$(filename, 4) <> ".cre" Then filename = filename & ".cre"
    filename = App.Path & "\" & filename


    ClearAll

    Open filename For Input As 1
    Input #1, S                   '"Points:"
    Input #1, N
    For I = 1 To N
        Input #1, V1
        Input #1, V2
        Input #1, iP
        P = CBool(iP)
        ADDpoint V1 + Left, V2 + Bottom, P
    Next
    Input #1, S                   ' "Links:"
    Input #1, N
    For I = 1 To N
        Input #1, V1
        Input #1, V2
        Input #1, Stre
        Input #1, v4
        AddLink V1, V2, Stre, CBool(v4)
    Next

    If EOF(1) Then GoTo endfile

    Input #1, S                   ' "Muscles:"
    Input #1, N
    For I = 1 To N
        Input #1, V1
        Input #1, V2
        ADDMuscle V1, V2
    Next

endfile:
    Close 1



End Sub
