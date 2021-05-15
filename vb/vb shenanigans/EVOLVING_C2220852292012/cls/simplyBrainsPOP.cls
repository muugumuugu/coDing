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

    NN()           As New NNparasChopra
    StartGene()    As Long

    nnPiuMeno()    As Double

    GeneToLayer()  As Long

End Type


Private B()        As tBrain
Private NofBIndi   As Long
Private NofCELLsXIndi As Long
Private NofGENEsXIndi As Long



Public Property Get GetNofTotalGenes()
    GetNofTotalGenes = NofGENEsXIndi
End Property

Public Property Get GetNofIndi()
    GetNofIndi = NofBIndi
End Property


Public Property Get GetWeightsExcursion(wCell As Long)
    GetWeightsExcursion = B(1).nnPiuMeno(wCell)

End Property
Public Sub ADDIndi()


    NofBIndi = NofBIndi + 1
    ReDim Preserve B(NofBIndi)
    '    NofGENEsXIndi = 0

    I = NofBIndi
    ReDim Preserve B(I).NN(NofCELLsXIndi)
    ReDim Preserve B(I).StartGene(NofCELLsXIndi)
    ReDim Preserve B(I).nnPiuMeno(NofCELLsXIndi)


    B(I) = B(I - 1)



End Sub
Public Sub KillIndi(wI As Long)
    Dim I          As Long
    For I = wI To NofBIndi - 1
        B(I) = B(I + 1)
    Next
    NofBIndi = NofBIndi - 1
    ReDim Preserve B(NofBIndi)
End Sub
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

Public Sub InitBrainCell(wCell, ArrayOFlyers As Variant, BiasAndWeightExcursion As Double, ByRef PIC As PictureBox, Optional Lrate As Double = 1.5)
    ' call this sub from lowest wCell to highest wCell Order

    For I = 1 To NofBIndi
        B(I).NN(wCell).CreateNet Lrate, ArrayOFlyers, PIC
        B(I).StartGene(wCell) = NofGENEsXIndi + 1
        '       Stop

        'B(I).nnPiuMeno(wCell) = BiasAndWeightExcursion
        'To make Excursion Inv. proportional to AVG number of input sinapses x Neuron
        B(I).nnPiuMeno(wCell) = (BiasAndWeightExcursion / B(I).NN(wCell).AVGInputSinapsesXNeuron)

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

    Dim V          As Double

    V = (Value - MinF) / (MaxF - MinF)
    V = V * (MaxT - MinT) + MinT

    StretchValue = V

End Function

Public Sub TransferGAGenesToBrain(GGAA As SimplyGA2, INDI As Long)
    Dim G          As Long
    Dim L
    Dim N
    Dim S
    Dim gFr        As Long
    Dim gTo        As Long
    Dim gVal       As Double      'Long
    Dim vMinG
    Dim vMaxG
    Dim noN        As Long
    Dim noS        As Long
    Dim CellStartGene
    vMinG = GGAA.GeneValuesMin
    vMaxG = GGAA.GeneValuesMax
    Dim PiuMeno    As Double


    For wCell = 1 To NofCELLsXIndi

        CellStartGene = B(INDI).StartGene(wCell)

        PiuMeno = B(INDI).nnPiuMeno(wCell)

        noN = B(INDI).NN(wCell).GetTotalNofNeurons
        noS = B(INDI).NN(wCell).GetTotalNofSinaps

        'Transer GA genes to Neuron Bias

        gFr = CellStartGene       '1 'B(INDI).StartGene(wCell)
        gTo = gFr + noN - 1

        For G = gFr To gTo

            gVal = GGAA.GeneValue(INDI, G)
            If Int(gVal) <> gVal Then Stop

            B(INDI).NN(wCell).MY_SETneuronBIAS(G - CellStartGene + 1) = _
            StretchValue(vMinG, vMaxG, -PiuMeno, PiuMeno, gVal)

        Next G

        'Transer GA genes to Sinap Weights
        gFr = gTo + 1
        gTo = gFr + noS - 1

        For G = gFr To gTo
            gVal = GGAA.GeneValue(INDI, G)
            B(INDI).NN(wCell).MY_SETSinapsWEIGHT(G - noN - CellStartGene + 1) = _
            StretchValue(vMinG, vMaxG, -PiuMeno, PiuMeno, gVal)
        Next

    Next wCell




End Sub


Public Sub DRAW(INDI, Cell)
    'After this call must be called PIC.REFRESH

    B(INDI).NN(Cell).DRAW

End Sub

