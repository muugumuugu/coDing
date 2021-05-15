VERSION 5.00
Begin VB.Form frmGRID 
   Caption         =   "Fill the Grid"
   ClientHeight    =   5745
   ClientLeft      =   975
   ClientTop       =   1800
   ClientWidth     =   13125
   LinkTopic       =   "Form1"
   ScaleHeight     =   5745
   ScaleWidth      =   13125
   Begin VB.CommandButton Command1 
      Caption         =   "END"
      Height          =   375
      Left            =   8520
      TabIndex        =   26
      Top             =   3720
      Width           =   1575
   End
   Begin VB.CheckBox chDIFFERENT 
      Caption         =   "Deny same number to appear multiple times"
      Height          =   495
      Left            =   8400
      TabIndex        =   20
      Top             =   2040
      Value           =   1  'Checked
      Width           =   1935
   End
   Begin VB.TextBox vTO 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   9480
      TabIndex        =   18
      Text            =   "300"
      Top             =   1080
      Width           =   735
   End
   Begin VB.TextBox vFROM 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   8520
      TabIndex        =   17
      Text            =   "1"
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox Target 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   9480
      TabIndex        =   16
      Text            =   "500"
      Top             =   1440
      Width           =   735
   End
   Begin VB.CommandButton cmdTRAIN 
      Caption         =   "RUN"
      Height          =   615
      Left            =   8400
      TabIndex        =   15
      Top             =   2640
      Width           =   1815
   End
   Begin VB.TextBox LC 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   8880
      TabIndex        =   14
      Text            =   "4"
      Top             =   600
      Width           =   735
   End
   Begin VB.TextBox INFO 
      Height          =   735
      Left            =   982
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Top             =   4800
      Width           =   11160
   End
   Begin VB.TextBox gAVG 
      BackColor       =   &H00C0C000&
      Height          =   285
      Left            =   11895
      Locked          =   -1  'True
      TabIndex        =   5
      Text            =   "Gen AVG"
      Top             =   1560
      Width           =   1095
   End
   Begin VB.TextBox BFIT 
      BackColor       =   &H0000FF00&
      Height          =   285
      Left            =   11895
      TabIndex        =   4
      Text            =   "Gen Bestift"
      Top             =   1920
      Width           =   1095
   End
   Begin VB.TextBox NEWr 
      Height          =   285
      Left            =   11895
      TabIndex        =   3
      Text            =   "NEWrandom"
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox MUT 
      Height          =   285
      Left            =   11895
      TabIndex        =   2
      Text            =   "mut"
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox ACC 
      Height          =   285
      Left            =   11895
      TabIndex        =   1
      Text            =   "Acc"
      Top             =   480
      Width           =   1095
   End
   Begin VB.TextBox GEN 
      Height          =   285
      Left            =   11895
      TabIndex        =   0
      Text            =   "G"
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label Label12 
      Caption         =   ", find integers "
      Height          =   375
      Left            =   9600
      TabIndex        =   25
      Top             =   600
      Width           =   975
   End
   Begin VB.Label Label11 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      Caption         =   "In a Grid of side"
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   7920
      TabIndex        =   24
      Top             =   600
      Width           =   855
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      Caption         =   "to"
      Height          =   255
      Left            =   9120
      TabIndex        =   23
      Top             =   1080
      Width           =   375
   End
   Begin VB.Label Label9 
      Alignment       =   1  'Right Justify
      Caption         =   "between"
      Height          =   255
      Left            =   7560
      TabIndex        =   22
      Top             =   1080
      Width           =   855
   End
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      Caption         =   "so that the sums of each row and each column is equal to"
      Height          =   495
      Left            =   7320
      TabIndex        =   21
      Top             =   1440
      Width           =   2055
   End
   Begin VB.Label lOUT 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H0000C000&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   360
      TabIndex        =   19
      Top             =   840
      Width           =   615
   End
   Begin VB.Label lGRID 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   360
      TabIndex        =   13
      Top             =   480
      Width           =   615
   End
   Begin VB.Label Label4 
      Caption         =   "G Best Fit"
      Height          =   255
      Left            =   10815
      TabIndex        =   12
      Top             =   1920
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "New Random"
      Height          =   255
      Left            =   10815
      TabIndex        =   11
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "Mutations"
      Height          =   255
      Left            =   10815
      TabIndex        =   10
      Top             =   840
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Reproductions"
      Height          =   255
      Left            =   10815
      TabIndex        =   9
      Top             =   480
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "G Avg Fit"
      Height          =   255
      Left            =   10815
      TabIndex        =   8
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label Label7 
      Caption         =   "Generation"
      Height          =   255
      Left            =   10815
      TabIndex        =   7
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "frmGRID"
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

Dim GA As New SimplyGA
Dim NN As Integer
Dim D As Integer
Dim I As Long
Dim G As Long

Private Sub cmdTRAIN_Click()
Randomize Timer

cmdTRAIN.Enabled = False
Dim CIC As Long
Dim NOG As Long
Dim NOI As Long
Dim GR() As Long
Dim GR2() As Long
Dim Res() As Single
Dim FIT As Single
Dim BEST As Long
Dim W
BEST = 99999

W = Val(LC)

NN = W * W
BuildGrid

ReDim GR(W, W)
ReDim GR2(W * W)
ReDim Res(W * 2)

GA.INIT 200, NN, vFROM, vTO, 0.01, 0.25, enRank, 0.01, False, SonToWorst, SwapG, INFO, 1000

NOG = GA.NumberOfGenes(1)
NOI = GA.NumberOfIndivid

For CIC = 1 To 10000000
    '---------------------------------------------------------------------
    
    
    
    
    For I = 1 To NOI
        
        If GA.IsIndiChanged(I) Then
            
            
            R = 1
            C = 0
            
            For G = 1 To NOG
                C = C + 1: If C > W Then C = 1: R = R + 1
                GR(C, R) = GA.getGENE(I, G)
                GR2(G) = GR(C, R)
                'lGRID(G - 1).Caption = GR(C, R)
            Next G
            
            
            For R = 1 To W
                S = 0
                For C = 1 To W
                    S = S + GR(C, R)
                Next C
                Res(R) = S
                'lOUT(R - 1) = S
            Next R
            
            For C = 1 To W
                S = 0
                For R = 1 To W
                    S = S + GR(C, R)
                Next R
                Res(C + W) = S
                'lOUT(C + W - 1) = S
            Next C
            
            FIT = 0
            For O = 1 To W * 2
                FIT = FIT + Abs(Res(O) - Val(Target))
            Next
            
            GA.IndiFitness(I) = FIT
            
            If chDIFFERENT.Value = Checked Then
                For r1 = 1 To W * W - 1
                    For r2 = r1 + 1 To W * W
                        If GR2(r1) = GR2(r2) Then GA.IndiFitness(I) = GA.IndiFitness(I) + 99999
                    Next
                Next
                
                
            End If
            
            
        End If
        
    Next I
    
    GA.COMPUTEGENES
    
    GEN.Text = GA.StatGeneration
    ACC.Text = GA.StatAccop
    MUT.Text = GA.StatMutations
    NEWr.Text = GA.StatNEWs
    BFIT.Text = GA.GeneratBestFit
    gAVG.Text = GA.GenerationAvgFit
    
    
    
    If BEST <> GA.GeneratINDEXBestFit Then
        BEST = GA.GeneratINDEXBestFit
        GoSub PrintGrid
    End If
    
    
    
    DoEvents
    
    
    '--------------------------------------------------------------------------
    DoEvents
    
Next CIC

Exit Sub

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

PrintGrid:
R = 1
C = 0
For G = 1 To NOG
    C = C + 1: If C > W Then C = 1: R = R + 1
    GR(C, R) = GA.getGENE(BEST, G)
    lGRID(G - 1).Caption = GR(C, R)
Next G


For R = 1 To W
    S = 0
    For C = 1 To W
        S = S + GR(C, R)
    Next C
    lOUT(R - 1) = S
    lOUT(R - 1).BackColor = IIf(lOUT(R - 1) = Target, vbGreen, vbRed)
Next R

For C = 1 To W
    S = 0
    For R = 1 To W
        S = S + GR(C, R)
    Next R
    lOUT(C + W - 1) = S
    lOUT(C + W - 1).BackColor = IIf(lOUT(C + W - 1) = Target, vbGreen, vbRed)
    
Next C

DoEvents


Return



End Sub

Sub BuildGrid()
Dim G
D = Val(LC)

For I = 1 To NN - 1
    Load lGRID(I)
Next
For I = 1 To D * 2
    Load lOUT(I)
Next


G = -1
For y = 1 To D
    For x = 1 To D
        G = G + 1
        lGRID(G).Left = x * lGRID(0).Width
        lGRID(G).Top = y * lGRID(0).Height
        lGRID(G).Visible = True
        lGRID(G).Caption = G
    Next x
Next y


For G = 0 To D - 1
    lOUT(G).Left = lGRID(D - 1).Left + lGRID(1).Width
    lOUT(G).Top = lGRID(G * D).Top
    lOUT(G).Visible = True
    lOUT(G).Caption = G
Next


For G = D To D * 2 - 1
    lOUT(G).Left = lGRID(G - D).Left
    lOUT(G).Top = lGRID(NN - 1).Top + lGRID(1).Height
    lOUT(G).Visible = True
    lOUT(G).Caption = G
Next


End Sub

Private Sub Command1_Click()
End

End Sub

