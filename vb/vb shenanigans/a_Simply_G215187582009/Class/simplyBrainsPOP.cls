VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "simplyBrainsPOP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
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
'This Class joint SimplyGA (a population for Genetic Algorithm)
'and NNParasChopra (a Neural Net)
'
'
'BrainPOP.InitBrains HowManyIndivids,HowManyBrainCellxIndi
'
'BrainPOP.InitBrainCell 1, Array(2, 5, 1), 10
'BrainPOP.InitBrainCell 2, Array(2, 3, 1), 10
'
'Dim Ga as new simplyGA
'GA.INIT HowManyIndivids, BrainPOP.GetNofTotalGenes+OtherEventualNotBrainGenes ,.......
'
'every time and Indi Of GA is Changed (mutated or son) do
'BrainPOP.TransferGAGenesToBrain GA, changedIndivid
'

Private Type tBrain
    
    NN() As New NNparasChopra
    StartGene() As Long
    
    nnPiuMeno() As Double
    
End Type


Private B() As tBrain
Private NofBIndi As Long
Private NofCELLsXIndi As Long
Private NofGENEsXIndi As Long

Public Property Get GetNofTotalGenes()
GetNofTotalGenes = NofGENEsXIndi
End Property

Public Property Get GetNofIndi()
GetNofIndi = NofBIndi
End Property

Public Sub InitBrains(HowManyIndivids, NofBrainCellXIndivid)

NofBIndi = HowManyIndivids
NofCELLsXIndi = NofBrainCellXIndivid
ReDim B(NofBIndi)
NofGENEsXIndi = 0

For I = 1 To NofBIndi
    ReDim Preserve B(I).NN(NofCELLsXIndi)
    ReDim Preserve B(I).StartGene(NofCELLsXIndi)
    ReDim Preserve B(I).nnPiuMeno(NofCELLsXIndi)
Next I

End Sub

Public Sub InitBrainCell(wCell, ArrayOFlyers As Variant, BiasAndWeightEscursion As Double, Optional Lrate As Double = 1.5)
' call this sub from lowest wCell to highest wCell Order

For I = 1 To NofBIndi
    B(I).NN(wCell).CreateNet Lrate, ArrayOFlyers
    B(I).StartGene(wCell) = NofGENEsXIndi + 1
    B(I).nnPiuMeno(wCell) = BiasAndWeightEscursion
Next


NofGENEsXIndi = NofGENEsXIndi + _
        B(1).NN(wCell).GetTotalNofNeurons + B(1).NN(wCell).GetTotalNofSinaps



End Sub

Public Function RUN(wIndivid, wBrainCell, ArrayOfInputs As Variant) As Variant

RUN = B(wIndivid).NN(wBrainCell).RUN(ArrayOfInputs)

End Function

Public Function GetNofInputs(wCell)
GetNofInputs = B(1).NN(wCell).NofInputs
End Function
Public Function GetNofOutputs(wCell)
GetNofOutputs = B(1).NN(wCell).NofOutputs
End Function
Private Function StretchValue(MinF, MaxF, MinT As Double, MaxT As Double, Value) As Double

Dim V As Double

V = (Value - MinF) / (MaxF - MinF)
V = V * (MaxT - MinT) + MinT

StretchValue = V

End Function

Public Sub TransferGAGenesToBrain(GGAA As SimplyGA, INDI As Long)
Dim G As Long
Dim L
Dim N
Dim S
Dim gFr
Dim gTo
Dim gVal As Long
Dim vMinG
Dim vMaxG
Dim noN
Dim noS
Dim CellStartGene
vMinG = GGAA.Get_gValueMin
vMaxG = GGAA.Get_gValueMax
Dim PiuMeno As Double



For wCell = 1 To NofCELLsXIndi
    
    CellStartGene = B(INDI).StartGene(wCell)
    
    PiuMeno = B(INDI).nnPiuMeno(wCell)
    
    noN = B(INDI).NN(wCell).GetTotalNofNeurons
    noS = B(INDI).NN(wCell).GetTotalNofSinaps
    
    'Transer GA genes to Neuron Bias
    
    gFr = CellStartGene '1 'B(INDI).StartGene(wCell)
    gTo = gFr + noN - 1
    
    For G = gFr To gTo
        
        gVal = GGAA.getGENE(INDI, G)
        B(INDI).NN(wCell).MY_SETneuronBIAS(G - CellStartGene + 1) = _
                StretchValue(vMinG, vMaxG, -PiuMeno, PiuMeno, gVal)
        
    Next G
    
    'Transer GA genes to Sinap Weights
    gFr = gTo + 1
    gTo = gFr + noS - 1
    
    For G = gFr To gTo
        gVal = GGAA.getGENE(INDI, G)
        B(INDI).NN(wCell).MY_SETSinapsWEIGHT(G - noN - CellStartGene + 1) = _
                StretchValue(vMinG, vMaxG, -PiuMeno, PiuMeno, gVal)
    Next
    
Next wCell



End Sub
