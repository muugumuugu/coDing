VERSION 5.00
Begin VB.Form frmFLYERS 
   Caption         =   "Neural Net TRAINED BY Genetic Algotihm (flying objects)"
   ClientHeight    =   9150
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10860
   LinkTopic       =   "Form1"
   ScaleHeight     =   610
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   724
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chMOVEt 
      Caption         =   "Moving Target"
      Height          =   195
      Left            =   9480
      TabIndex        =   23
      Top             =   4560
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "EXIT"
      Height          =   495
      Left            =   9600
      TabIndex        =   22
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Before Training, Load:"
      Height          =   1455
      Left            =   8040
      TabIndex        =   18
      Top             =   2280
      Width           =   2295
      Begin VB.OptionButton oAT 
         Caption         =   "Already Trained"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   960
         Width           =   1575
      End
      Begin VB.OptionButton oNEW 
         Caption         =   "New Dumb Population"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   1935
      End
      Begin VB.OptionButton oPP 
         Caption         =   "Last Trained Population"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   600
         Value           =   -1  'True
         Width           =   2055
      End
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      Height          =   3975
      Left            =   7800
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   17
      Text            =   "frmFLYERS.frx":0000
      Top             =   5040
      Width           =   3015
   End
   Begin VB.CheckBox chCOLLISION 
      Caption         =   "Objects Collide?"
      Height          =   375
      Left            =   8040
      TabIndex        =   16
      Top             =   4680
      Width           =   1455
   End
   Begin VB.CheckBox chDRAW 
      Caption         =   "DRAW"
      Height          =   375
      Left            =   8040
      TabIndex        =   15
      Top             =   4440
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CommandButton cmdTRAIN 
      Caption         =   "TRAIN"
      Height          =   495
      Left            =   8040
      TabIndex        =   14
      Top             =   3840
      Width           =   1455
   End
   Begin VB.TextBox GEN 
      Height          =   285
      Left            =   9502
      TabIndex        =   7
      Text            =   "G"
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox ACC 
      Height          =   285
      Left            =   9502
      TabIndex        =   6
      Text            =   "Acc"
      Top             =   480
      Width           =   1095
   End
   Begin VB.TextBox MUT 
      Height          =   285
      Left            =   9502
      TabIndex        =   5
      Text            =   "mut"
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox NEWr 
      Height          =   285
      Left            =   9502
      TabIndex        =   4
      Text            =   "NEWrandom"
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox BFIT 
      BackColor       =   &H0000FF00&
      Height          =   285
      Left            =   9502
      TabIndex        =   3
      Text            =   "Gen Bestift"
      Top             =   1920
      Width           =   1095
   End
   Begin VB.TextBox gAVG 
      BackColor       =   &H00C0C000&
      Height          =   285
      Left            =   9502
      Locked          =   -1  'True
      TabIndex        =   2
      Text            =   "Gen AVG"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.TextBox INFO 
      Height          =   615
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   7920
      Width           =   7095
   End
   Begin VB.PictureBox PIC 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      FillColor       =   &H0000C000&
      FillStyle       =   0  'Solid
      ForeColor       =   &H0000FF00&
      Height          =   7575
      Left            =   120
      ScaleHeight     =   503
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   503
      TabIndex        =   0
      Top             =   120
      Width           =   7575
   End
   Begin VB.Label Label7 
      Caption         =   "Generation"
      Height          =   255
      Left            =   8415
      TabIndex        =   13
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "G Avg Fit"
      Height          =   255
      Left            =   8415
      TabIndex        =   12
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Reproductions"
      Height          =   255
      Left            =   8415
      TabIndex        =   11
      Top             =   480
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "Mutations"
      Height          =   255
      Left            =   8415
      TabIndex        =   10
      Top             =   840
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "New Random"
      Height          =   255
      Left            =   8415
      TabIndex        =   9
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label4 
      Caption         =   "G Best Fit"
      Height          =   255
      Left            =   8415
      TabIndex        =   8
      Top             =   1920
      Width           =   975
   End
End
Attribute VB_Name = "frmFLYERS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author : Creator Roberto Mior
'     reexre@gmail.com
'
'If you use source code or part of it please cite the author
'You can use this code however you like providing the above credits remain intact
'
'
'
'------------------------------------------------------------------------


Option Base 1



Dim GA As New SimplyGA
Dim BPOP As New simplyBrainsPOP
Dim NumberofFlyers As Long
Dim I As Long






Private Sub Command1_Click()
End

End Sub

Private Sub Form_Load()
Randomize Timer

PI = Atn(1) * 4
PI2 = Atn(1) * 8

PolyColor = -1


If Dir(App.Path & "\POP.txt") = "POP.txt" Then oPP = True Else oNEW = True

'ReDim RoadP(4)
'RoadP(1).x = 5
'RoadP(1).y = 5
'RoadP(2).x = 495
'RoadP(2).y = 5
'RoadP(3).x = 495
'RoadP(3).y = 495
'RoadP(4).x = 5
'RoadP(4).y = 495


'ReDim RoadL(4)

'RoadL(1).P1 = 1
'RoadL(1).P2 = 2
'RoadL(2).P1 = 2
'RoadL(2).P2 = 3
'RoadL(3).P1 = 3
'RoadL(3).P2 = 4
'RoadL(4).P1 = 4
'RoadL(4).P2 = 1

End Sub


Sub DrawRoad()
Dim P1 As Integer
Dim P2 As Integer

For I = 1 To UBound(RoadL)
    P1 = RoadL(I).P1
    P2 = RoadL(I).P2
    
    PIC.Line (RoadP(P1).x, RoadP(P1).y)- _
            (RoadP(P2).x, RoadP(P2).y), RGB(0, 200, 0)
    
Next


End Sub

Sub DrawFlyers()
Dim X1 As Integer
Dim Y1 As Integer
Dim X2 As Integer
Dim Y2 As Integer
Dim X3 As Integer
Dim Y3 As Integer
Dim C As Long

For I = 1 To NumberofFlyers
    
    If chCOLLISION.Value = Checked Then
        PIC.Circle (Flyer(I).POS.x, Flyer(I).POS.y), B(I).RADIUS, IIf(I <> BEST, RGB(0, 150, 0), RGB(255, 255, 255))
    Else
        DrawPoly PIC, I
    End If
    
    
Next



End Sub

Private Sub cmdTRAIN_Click()
Dim NNoutputs As Variant
Dim TargetX As Single
Dim TargetY As Single
Dim TTT
Dim tmpFlyer As tFlyer
Dim CICLO
Dim Trainer
Dim Dleft As Single
Dim Dright As Single
Dim xr As Single
Dim Yr As Single
Dim RR As PointAPI

Dim TvX As Single
Dim TvY As Single


TTT = 280

InitFlyerS


For CICLO = 1 To 100000000000#
    
    
    TvX = Rnd * 3 - 1.5
    TvY = Rnd * 3 - 1.5
    
    
    For I = 1 To NumberofFlyers
        Flyer(I).ERRORS = 0
        'Flyer(I).POS.x = 250 + Rnd * 200 - 100
        'Flyer(I).POS.y = 250 + Rnd * 200 - 100
        'Flyer(I).Vel = 0
        Flyer(I).Steer = 0
        Flyer(I).ACC = 0
        Flyer(I).Vel = Flyer(I).Vel * 0.75
        
        
        
        GA.IndiFitness(I) = 0
        
        'The Genes of GA are Transfer to Population of NNs
        BPOP.TransferGAGenesToBrain GA, I
        
        
    Next
    
    TargetX = 15 + Rnd * 470 ' 25 + Rnd * 450
    TargetY = 15 + Rnd * 470 ' 25 + Rnd * 450
    
    
    For Trainer = 1 To TTT
        
        
        If chMOVEt.Value = Checked Then
        TargetX = TargetX + TvX
        TargetY = TargetY + TvY
        If TargetX < 10 Then TargetX = 10: TvX = -TvX
        If TargetY < 10 Then TargetY = 10: TvY = -TvY
        If TargetX > 495 Then TargetX = 495: TvX = -TvX
        If TargetY > 495 Then TargetY = 495: TvY = -TvY
                
        
        
        End If
        
        
        
        
        For I = 1 To NumberofFlyers
            With Flyer(I)
                
                '  Dleft = GetEYE(I, -0.2)
                '  Dright = GetEYE(I, 0.2)
                
                px1 = .POS.x + Cos(.ANg - PI / 2) * 20 'left point
                py1 = .POS.y + Sin(.ANg - PI / 2) * 20
                px2 = .POS.x + Cos(.ANg + PI / 2) * 20 'Right Point
                py2 = .POS.y + Sin(.ANg + PI / 2) * 20
                
                d1 = Distance(TargetX, TargetY, px1, py1) 'Distance from Left
                d2 = Distance(TargetX, TargetY, px2, py2) 'Distance from Right
                
                dTargLR = d1 - d2
                dTargLR = (dTargLR + 41) / 82 '0=Right 1=left
                
                px1 = .POS.x + Cos(.ANg) * 20 ' Front Point
                py1 = .POS.y + Sin(.ANg) * 20
                px2 = .POS.x - Cos(.ANg) * 20 'Back Point
                py2 = .POS.y - Sin(.ANg) * 20
                
                d1 = Distance(TargetX, TargetY, px1, py1)
                d2 = Distance(TargetX, TargetY, px2, py2)
                
                dTargFrontBack = d1 - d2
                dTargFrontBack = (dTargFrontBack + 41) / 82 '0=Back 1=Front
                
                d = Distance(TargetX, TargetY, .POS.x, .POS.y)
                d = d / 500
                
                If .ANg < 0 Then .ANg = .ANg + PI2
                If .ANg > PI2 Then .ANg = .ANg - PI2
                
                'Run NN 1 of Individ I and get Outputs
                NNoutputs = BPOP.RUN(I, 1, Array(dTargLR, dTargFrontBack, d))
                
                'DLeft, DRight
                
                '.Steer = .Steer + NNoutputs(1) / 100 - NNoutputs(2) / 100
                .Steer = .Steer + (NNoutputs(1) - 0.5) / 100
                '.015
                If Abs(.Steer) > 0.2 Then .Steer = Sgn(.Steer) * 0.2
                
                .ACC = .ACC + (NNoutputs(2) - 0.5) / 100
                If Abs(.ACC) > 0.1 Then .ACC = Sgn(.ACC) * 0.1
                
                
                
                .ANg = .ANg + .Steer
                
                .Vel = .Vel + .ACC
                
                If .Vel > .MaxVel Then .Vel = .MaxVel
                If .Vel < 0 Then .Vel = 0.001
                
                
                .Steer = .Steer * 0.95
                .Vel = .Vel * 0.999
                
                .POS.x = .POS.x + .Vel * Cos(.ANg)
                .POS.y = .POS.y + .Vel * Sin(.ANg)
                
                'Perform Fitenss calculation (nearest to 0=best fit)
                GA.IndiFitness(I) = GA.IndiFitness(I) + _
                        Distance(.POS.x, .POS.y, TargetX, TargetY) / TTT
                
                
                B(I).x = .POS.x
                B(I).y = .POS.y
                B(I).Vx = .Vel * Cos(.ANg)
                B(I).Vy = .Vel * Sin(.ANg)
                
                
                
            End With
            
        Next I
        
        
        For I = 1 To NumberofFlyers
            If IsTouchingWall(B(I).x, B(I).y, B(I).RADIUS, xr, Yr) Then
                'Backtrack to find actual point of collision
                GoBackWALL RR, B(I)
                'Change the speed of the ball
                ChangeVelocitiesWALL B(I), RR.x, RR.y
                '  If Abs(B(i).Vx) > 0.02 Or Abs(B(i).Vy) > 0.02 Then
                B(I).Vx = B(I).Vx * CollLostEnergySponda
                B(I).Vy = B(I).Vy * CollLostEnergySponda
                V = Sqr(B(I).Vx * B(I).Vx + B(I).Vy * B(I).Vy)
                Flyer(I).ERRORS = Flyer(I).ERRORS + 1
                '  End If
            End If
        Next I
        
        
        If chCOLLISION.Value = Checked Then
            'collision BALL BALL
            For I = 1 To NumberofFlyers
                For j = 1 To NumberofFlyers
                    If I <> j Then ChangeVelocities B(I), B(j)
                Next j
            Next I
        End If
        
        
        
        
        For I = 1 To NumberofFlyers
            
            tmpFlyer.POS.x = Flyer(I).POS.x - B(I).Vx  'minus work fine dont know why
            tmpFlyer.POS.y = Flyer(I).POS.y + B(I).Vy
            Flyer(I).ANg = GetAngle(Flyer(I), tmpFlyer)
            Flyer(I).Vel = Distance(0, 0, B(I).Vx, B(I).Vy)
            
            Flyer(I).POS.x = B(I).x
            Flyer(I).POS.y = B(I).y
            
        Next I
        
        BEST = GA.GeneratINDEXBestFit
        
        
        If chDRAW.Value = Checked Then
            PIC.Cls
            PIC.FILLcolor = RGB(0, 220, 0)
            ' DrawRoad
            DrawFlyers
            PIC.FILLcolor = RGB(250, 0, 0)
            PIC.Circle (TargetX, TargetY), 9
            DoEvents
        End If
        
        
        
        
    Next Trainer
    DoEvents
    For I = 1 To NumberofFlyers
        
        GA.IndiFitness(I) = GA.IndiFitness(I) + _
                IIf(Flyer(I).Vel < 0.05, 500, 0) ' + Flyer(I).ERRORS * 25
        
        
    Next I
     
    'Perfrom Genetic Algorithm Computation (Reproductions and Mutations)
    GA.COMPUTEGENES
    
    GEN.Text = GA.StatGeneration
    ACC.Text = GA.StatAccop
    MUT.Text = GA.StatMutations
    NEWr.Text = GA.StatNEWs
    BFIT.Text = GA.GeneratBestFit
    gAVG.Text = GA.GenerationAvgFit
    DoEvents
    
    GA.Save_POP
    
Next

End Sub

'Function GetEYE(ind, ANg)
'Dim eX
'Dim eY
'Dim Xr1
'Dim Yr1
'Dim Xr2
'Dim Yr2
'Dim rx
'Dim ry
'Dim MinD
'Dim D''
'
'MinD = 999999999
'
'eX = Flyer(ind).POS.x + Cos(ANg + Flyer(ind).ANg) * 1000
'eY = Flyer(ind).POS.y + Sin(ANg + Flyer(ind).ANg) * 1000
'
'For R = 1 To UBound(RoadL)
'    Xr1 = RoadP(RoadL(R).P1).x
'    Yr1 = RoadP(RoadL(R).P1).y
'    Xr2 = RoadP(RoadL(R).P2).x
'    Yr2 = RoadP(RoadL(R).P2).y
'
'    If SegmentsIntersect(Flyer(ind).POS.x, Flyer(ind).POS.y, eX, eY, _
'            Xr1, Yr1, Xr2, Yr2, rx, ry) Then
'
'    D = Distance(Flyer(ind).POS.x, Flyer(ind).POS.y, rx, ry)
'
'    If D < MinD Then MinD = D
'
'    End If
'
'Next
'
'GetEYE = D / 1260''
'
'If GetEYE > 1 Then Stop
'
'End Function

'Function Collide(ind) As Boolean
'Dim Xc1
'Dim Yc1
'Dim Xc2
'Dim Yc2'
'
'Dim Xr1
'Dim Yr1
'Dim Xr2
'Dim Yr2'
'
'Dim R1, R2'
'
'Dim C As Boolean
''
'
'
'With Flyer(ind)'
'
'Xc1 = .POS.x + Cos(.ANg) * 20
'Yc1 = .POS.y + Sin(.ANg) * 20
'Xc2 = .POS.x - Cos(.ANg) * 20
'Yc2 = .POS.y - Sin(.ANg) * 20''
'
'For R = 1 To UBound(RoadL)
'    Xr1 = RoadP(RoadL(R).P1).x
'    Yr1 = RoadP(RoadL(R).P1).y
'    Xr2 = RoadP(RoadL(R).P2).x
'    Yr2 = RoadP(RoadL(R).P2).y
'
'    C = SegmentsIntersect(Xc1, Yc1, Xc2, Yc2, Xr1, Yr1, Xr2, Yr2, R1, R2)
'    If C Then Exit For
'Next R''
'
'Collide = C'
''
'
'End With
'End Function


Sub InitFlyerS()

NumberofFlyers = 40 '50 'Number of Flayers


BPOP.InitBrains NumberofFlyers, 1   'Initalize the Population of Neural Networks
                                    'Each individ Can have More than one NN.
                                    'In this Case 1
'good (3,7,2),8
BPOP.InitBrainCell 1, Array(3, 7, 2), 8 'NN is called Brain Cell.
                                        'this Initialize the BrainCell N1
                                        'With 3 Inputs , 7 hidden and 2 output Layers.
                                        'Weights and Biases Ranges from -8 to 8
                                

'Initialize the Population for Genetic algorithm (Look Class simplyGA.Init for explanation)
GA.INIT NumberofFlyers, BPOP.GetNofTotalGenes, 0, 10000, _
        0.02, 0.25, enWheel, 0.04, True, SonToWorst, CrossG, INFO, 50



If oPP Then
    GA.Load_POP
Else
    If oAT Then
        GA.Load_POP "POPtrained.txt"
    Else
        GA.Save_POP 'begin new pop
    End If
    
End If


ReDim Flyer(NumberofFlyers)
ReDim B(NumberofFlyers)

For I = 1 To NumberofFlyers
    With Flyer(I)
        .MaxVel = 4 'Max Speed
        .Vel = 0    'Currnt Speed
        .POS.x = 250 + Rnd * 300 - 150
        .POS.y = 250 + Rnd * 300 - 150
        .ANg = Rnd * PI * 2
        
        
        B(I).RADIUS = 6 ' 8
        
        B(I).Mass = 10 '20 'B(I).RADIUS * B(I).RADIUS * PI
        B(I).x = .POS.x
        B(I).y = .POS.y
        
    End With
Next

End Sub
