VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Train NN with GA for XOR function"
   ClientHeight    =   7290
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9780
   LinkTopic       =   "Form1"
   ScaleHeight     =   7290
   ScaleWidth      =   9780
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      Height          =   1575
      Left            =   4440
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   16
      Text            =   "XOR.frx":0000
      Top             =   120
      Width           =   2655
   End
   Begin VB.TextBox GEN 
      Height          =   285
      Left            =   8520
      TabIndex        =   9
      Text            =   "G"
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox ACC 
      Height          =   285
      Left            =   8520
      TabIndex        =   8
      Text            =   "Acc"
      Top             =   480
      Width           =   1095
   End
   Begin VB.TextBox MUT 
      Height          =   285
      Left            =   8520
      TabIndex        =   7
      Text            =   "mut"
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox NEWr 
      Height          =   285
      Left            =   8520
      TabIndex        =   6
      Text            =   "NEWrandom"
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox BFIT 
      BackColor       =   &H0000FF00&
      Height          =   285
      Left            =   8520
      TabIndex        =   5
      Text            =   "Gen Bestift"
      Top             =   1920
      Width           =   1095
   End
   Begin VB.TextBox gAVG 
      BackColor       =   &H00C0C000&
      Height          =   285
      Left            =   8520
      Locked          =   -1  'True
      TabIndex        =   4
      Text            =   "Gen AVG"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "TEST"
      Height          =   735
      Left            =   5640
      TabIndex        =   3
      Top             =   3240
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "STOP"
      Height          =   855
      Left            =   6360
      TabIndex        =   2
      Top             =   1920
      Width           =   735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "RUN"
      Height          =   855
      Left            =   4440
      TabIndex        =   1
      Top             =   1920
      Width           =   1815
   End
   Begin VB.TextBox INFO 
      Height          =   1335
      Left            =   143
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   5760
      Width           =   9375
   End
   Begin VB.Label Label7 
      Caption         =   "Generation"
      Height          =   255
      Left            =   7440
      TabIndex        =   15
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "G Avg Fit"
      Height          =   255
      Left            =   7440
      TabIndex        =   14
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Reproductions"
      Height          =   255
      Left            =   7440
      TabIndex        =   13
      Top             =   480
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "Mutations"
      Height          =   255
      Left            =   7440
      TabIndex        =   12
      Top             =   840
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "New Random"
      Height          =   255
      Left            =   7440
      TabIndex        =   11
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label4 
      Caption         =   "G Best Fit"
      Height          =   255
      Left            =   7440
      TabIndex        =   10
      Top             =   1920
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
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
Option Base 1
Dim NN As New NNparasChopra
Dim BrainPOP As New simplyBrainsPOP
Dim GA As New SimplyGA

Dim I As Long
Dim G As Long
Dim O As Variant
Dim ciclo
Dim Best As Long



Private Sub Command1_Click()
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
For ciclo = 1 To 10000
    For I = 1 To GA.NumberOfIndivid
        
        If GA.IsIndiChanged(I) Then
            BrainPOP.TransferGAGenesToBrain GA, I
            
            f = 0
            
            For I1 = 0 To 1
                For I2 = 0 To 1
                    
                    O = BrainPOP.RUN(I, 1, Array(I1, I2))
                    f = f + Abs(O(1) - (I1 Xor I2))
                                    
                    
                Next
            Next
            
            GA.IndiFitness(I) = f
            
        End If
        
    Next I
    
    GA.COMPUTEGENES
    
    GEN.Text = GA.StatGeneration
    ACC.Text = GA.StatAccop
    MUT.Text = GA.StatMutations
    NEWr.Text = GA.StatNEWs
    BFIT.Text = GA.GeneratBestFit
    gAVG.Text = GA.GenerationAvgFit
    
    DoEvents
    
Next

End Sub

Private Sub Command2_Click()
ciclo = 99999999999999#
Me.Cls


End Sub

Private Sub Command3_Click()
Best = GA.GeneratINDEXBestFit
BrainPOP.TransferGAGenesToBrain GA, Best

I1 = Int(Rnd * 2)
I2 = Int(Rnd * 2)



O = BrainPOP.RUN(Best, 1, Array(I1, I2))
Print "  " & I1 & "  XOR  " & I2 & "  =  " & O(1)


End Sub

Private Sub Form_Load()

BrainPOP.InitBrains 50, 1
BrainPOP.InitBrainCell 1, Array(2, 5, 1), 10 '2 inputs '5 hidden '1 output
'BrainPOP.InitBrainCell 2, Array(2, 5, 1), 10
'BrainPOP.InitBrainCell 3, Array(2, 5, 1), 10

'Stop

GA.INIT BrainPOP.GetNofIndi, BrainPOP.GetNofTotalGenes, 0, 10000, 0.02, 1, enWheel, _
        0.02, False, SonToWorst, SwapG, INFO, 1000



End Sub

