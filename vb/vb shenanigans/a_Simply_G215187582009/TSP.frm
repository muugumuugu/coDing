VERSION 5.00
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form TSP 
   Caption         =   "Travel Salesman Problem Solver  with  GeneticAlgorithm"
   ClientHeight    =   9900
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11850
   LinkTopic       =   "Form1"
   ScaleHeight     =   660
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   790
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "Start Find Road"
      Height          =   855
      Left            =   120
      TabIndex        =   13
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox INFO 
      Height          =   855
      Left            =   818
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   12
      Text            =   "TSP.frx":0000
      Top             =   8760
      Width           =   10215
   End
   Begin VB.TextBox gAVG 
      BackColor       =   &H00C0C000&
      Height          =   285
      Left            =   10320
      Locked          =   -1  'True
      TabIndex        =   11
      Text            =   "Gen AVG"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.TextBox BFIT 
      BackColor       =   &H0000FF00&
      Height          =   285
      Left            =   10320
      TabIndex        =   10
      Text            =   "Gen Bestift"
      Top             =   1920
      Width           =   1095
   End
   Begin VB.TextBox NEWr 
      Height          =   285
      Left            =   10320
      TabIndex        =   9
      Text            =   "NEWrandom"
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox MUT 
      Height          =   285
      Left            =   10320
      TabIndex        =   8
      Text            =   "mut"
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox ACC 
      Height          =   285
      Left            =   10320
      TabIndex        =   7
      Text            =   "Acc"
      Top             =   480
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "STOP"
      Height          =   855
      Left            =   1680
      TabIndex        =   6
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox txtCICL 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   3360
      TabIndex        =   5
      Text            =   "10000"
      ToolTipText     =   "Generations Limit"
      Top             =   360
      Width           =   1335
   End
   Begin VB.TextBox txtNP 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Text            =   "30"
      ToolTipText     =   "Number of Cities to Visit (=Number of Genes x Individ)"
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox txtNI 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   1800
      TabIndex        =   3
      Text            =   "250"
      ToolTipText     =   "Individs"
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox GEN 
      Height          =   285
      Left            =   10320
      TabIndex        =   2
      Text            =   "G"
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      Height          =   1215
      Left            =   5040
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "TSP.frx":0007
      Top             =   120
      Width           =   3855
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Generate Points"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   1920
      Width           =   1335
   End
   Begin MSChart20Lib.MSChart MSChart 
      Height          =   5655
      Left            =   5400
      OleObjectBlob   =   "TSP.frx":00CC
      TabIndex        =   14
      Top             =   3000
      Width           =   6615
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   "Generations Limit"
      Height          =   255
      Left            =   3360
      TabIndex        =   23
      ToolTipText     =   "Generations Limit"
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "Number of Individuals in GA Population"
      Height          =   375
      Left            =   1680
      TabIndex        =   22
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Number of Cities"
      Height          =   255
      Left            =   240
      TabIndex        =   21
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "G Best Fit"
      Height          =   255
      Left            =   9240
      TabIndex        =   20
      Top             =   1920
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "New Random"
      Height          =   255
      Left            =   9240
      TabIndex        =   19
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "Mutations"
      Height          =   255
      Left            =   9240
      TabIndex        =   18
      Top             =   840
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Reproductions"
      Height          =   255
      Left            =   9240
      TabIndex        =   17
      Top             =   480
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "G Avg Fit"
      Height          =   255
      Left            =   9240
      TabIndex        =   16
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label Label7 
      Caption         =   "Generation"
      Height          =   255
      Left            =   9240
      TabIndex        =   15
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "TSP"
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
'

Dim OLDbestI As Long

Dim GA As New SimplyGA

Dim NumberOfGenes As Long
Dim CICLES As Long
Dim P() As tPoint

Dim I As Long
Dim G As Long

Private Sub Command1_Click()
Dim GAgeneration As Long
Dim ChartX
Dim Cities As String
Dim QueryAddress As String

Dim S As String
Dim S2() As String
Dim KM As Single
Dim Tempo As String
Dim TS() As String
Dim ValTempo As Single



Init_GA



Dim NOI
Dim NOG As Long

Dim BesT As Long
OLDbestI = 1

ChartX = 0


'Stop

NOI = GA.NumberOfIndivid
NOG = GA.NumberOfGenes(1)

For CICLES = 1 To Val(txtCICL)

    
    For I = 1 To NOI
        
        If GA.IsIndiChanged(I) Then
            
            D = 0
            For G = 1 To NOG - 1
                D = D + Distance(P(GA.getGENE(I, G)), P(GA.getGENE(I, G + 1)))
            Next G
            D = D + Distance(P(GA.getGENE(I, 1)), P(GA.getGENE(I, NOG)))
            
            GA.IndiFitness(I) = D
            
        End If
        
        
        
    Next I
    
   
    GA.COMPUTEGENES
    
    GEN.Text = GA.StatGeneration
    ACC.Text = GA.StatAccop
    MUT.Text = GA.StatMutations
    NEWr.Text = GA.StatNEWs
    BFIT.Text = GA.GeneratBestFit
    gAVG.Text = GA.GenerationAvgFit
    
    ' GA.Save_POP
    
    
    BesT = GA.GeneratINDEXBestFit
    
    
    If OLDbestI <> BesT Then
        Me.Cls
        
        
        For G = 1 To NOG - 1
            P1 = GA.getGENE(BesT, G)
            P2 = GA.getGENE(BesT, G + 1)
            Me.Line (P(P1).x, P(P1).Y)-(P(P2).x, P(P2).Y), vbBlack
            Me.Circle (P(P1).x, P(P1).Y), 4, vbBlue
            ' Me.Print P1
        Next G
        P1 = GA.getGENE(BesT, 1)
        P2 = GA.getGENE(BesT, NOG)
        Me.Line (P(P1).x, P(P1).Y)-(P(P2).x, P(P2).Y), vbBlack
        '---------------------------------
        Me.Circle (P(P2).x, P(P2).Y), 4, vbBlue
        
        
        
        OLDbestI = BesT
    End If
    
    GAgeneration = GA.StatGeneration
    
    If (GAgeneration Mod 50) = 0 Then
        ChartX = ChartX + 1
        MSChart.RowCount = ChartX 'GaGeneration
        MSChart.DataGrid.SetData ChartX, 1, GA.GeneratBestFit, Flag
        MSChart.DataGrid.SetData ChartX, 2, GA.GenerationAvgFit, Flag
        
    End If
    
    If (GAgeneration Mod 100) = 0 Then DoEvents
Next CICLES


End Sub

Private Sub Command2_Click()
CICLES = Val(txtCICL)
End Sub

Private Sub Command3_Click()
InitLocations
End Sub

Private Sub Form_Load()

Randomize Timer

MSChart.ColumnCount = 2
MSChart.RowCount = 0

InitLocations

End Sub


Public Sub InitLocations()


Me.Cls


ReDim P(Val(txtNP))

For ip = 1 To UBound(P)
    P(ip).x = 20 + Rnd * 320
    P(ip).Y = 160 + Rnd * 350
    Me.Circle (P(ip).x, P(ip).Y), 4, vbBlue
Next


End Sub

Sub Init_GA()
NumberOfGenes = UBound(P)

'txtNI = NumberOfGenes * 5
'txtNI = "30"

'NumberOfGenes * NumberOfGenes / 2
GA.INIT Val(txtNI), NumberOfGenes, 1, NumberOfGenes, _
        0.01, 0.1, enRank, 0.01, False, SonToWorst, TSProblem, INFO, 1000 ' 250


End Sub


