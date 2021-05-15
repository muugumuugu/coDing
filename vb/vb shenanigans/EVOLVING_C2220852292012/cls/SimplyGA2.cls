VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SimplyGA2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

'
'***********************************************************************
'***********************************************************************
'***                                                                 ***
'***   simplyGA2.cls                                                 ***
'***                                                                 ***
'***   Genetic Algorithm Class                                       ***
'***                                                                 ***
'***   Author: Roberto Mior (reexre@gmail.com)                       ***
'***                                                                 ***
'***   This is a Rewrite of simplyGA.cls on my old PSC submission    ***
'***   about genetic algorithm                                       ***
'***                                                                 ***
'***                                                                 ***
'***   CopyRights:                                                   ***
'***   Don't use for commercial pourpose                             ***
'***                                                                 ***
'***                                                                 ***
'***********************************************************************
'***********************************************************************
'


'***********************************************************************
'USAGE:
'***********************************************************************

'Dim GA As SimplyGA2        |\ or only Dim GA As New SimplyGA2
'Set GA = New SimplyGA2     |/
'GA.INIT1_
'GA.INIT2_
'-----------------------------------
'start cycle
'
'  for individual =1 to GA.NOI
'
'    if GA.IsIndiChanged(Individual)  Then 'update fitness of  individual
'
'      perform function fitness Based on Genes Values
'
'      GA.GeneValue (Individual, WhichGene)
'      GA.IndiFitness(Individual)=  ....
'        eg: F=GA.GeneValue(n,1)+GA.GeneValue(n,2)  'Some function that evaluate population
'            GA.IndiFitness(n)=F
'    End If
'  Next individual
'  GA.EVOLVE
'end cycle
'----------------------------------
'Look [INIT Subs] for parameters description
'***********************************************************************


Option Explicit


#If False Then                    'if you type the Enum value in the wrong case, Visual Basic corrects it so it matches the hidden variable declarations.
Dim SelRand
Dim SelWheel
Dim SelWheelSQ
Dim SelRank
Dim SonToWorst
Dim SonToNewINDI
Dim SonToRndINDI
Dim SonToParent
Dim CrossBySwap
Dim CrossBy1Point
Dim CrossBy2Point
Dim CrossforTSP
Dim MutAll
Dim MutOnlySons
Dim TDbyIdenticalIndi
Dim TDbySameFitness
Dim TDActionRandomize
Dim TDActionMutate
#End If

Public Enum eMutateMode
    MutateAll
    MutateOnlySons
End Enum
Private Const sMutMode As String = "MutateAll MutateOnlySons"

Public Enum eSelectionMode
    SelRand
    SelWheel
    SelRank
    SelWheelSQ
End Enum
Private Const sSelMode As String = "SelRand SelWheel SelRank SelWheelSQ"

Public Enum eReproductMode
    SonToRndINDI                  'New son replace a random individ
    SonToWorst                    'New son replace worst individ
    SonToParent                   'New son replace one of 2 parents
    SonToNewINDI                  'New son is a new added individ
End Enum
Private Const sReproductMode As String = "SonToRndINDI SonToWorst SonToParent SonToNewINDI"

Public Enum eCrossMode
    CrossBySwap                   'Uniform Crossover
    CrossBy1Point                 '"split and slice" when parents have diffrents Num of Genes
    CrossBy2Point
    CrossforTSP                   'For Travel Salesman Problem kind
End Enum
Private Const sCrossMode As String = "CrossBySwap CrossBy1Point CrossBy2Point CrossforTSP"

Public Enum eTDMode 'Look for disaster mode
    TDbyIdenticalIndi
    TDbySameFitness
End Enum
Private Const sTDMode As String = "TDbyIdenticalIndi TDbySameFitness"

Public Enum eTDAction 'Action to perform after a Distaster TEST
    TDActionRandomize
    TDActionMutate
End Enum
Private Const sTDAction As String = "TDActionRandomize TDActionMutate"


Private Type tINDI                'Individual type
    NofG           As Long        'Number of genes
    Gene()         As Double      'long
    Fitness        As Double
    Wheel          As Double      'Wheel Values for Selection (if Wheel or Rank Mode Selected)
    FreeForSon     As Boolean     'True=can place here a son, False=Can't place here a son
    IsChanged      As Boolean     'is Changed from pervious generation

    Par1           As Long
    Par2           As Long
    JustMutated    As Boolean

End Type

Private Const MaxSingleValue As Double = 3.4E+38

Public MutMode     As eMutateMode
Public SelectionMode As eSelectionMode
Public ReproductMode As eReproductMode
Public CrossMode   As eCrossMode

Public TDEvery As Long
Public TDMode As eTDMode
Public TDAction As eTDAction

Public MutateBest  As Boolean
Public SonsXGeneration As Long
Private PercSonsXGeneration As Double


Public MutProbMin     As Double      'Min Probability of each Indi to mutate during "EVOLVE". If Same as Max then MutProb don't change
Public MutProbMax     As Double      'Max Probability of each Indi to mutate during "EVOLVE". If Same as Min then MutProb don't change
Public MutProb As Double      'Current Mutation Prob
Public MutProbAdaptive As Boolean 'Does Mutation Prob changes according to Population Diversity?
Public MutRate     As Double      'Amonut of mutation when it occours


Public NofGenesMIN As Long
Public NofGenesMAX As Long

Public GeneValuesMax As Long
Public GeneValuesMin As Long


Public NOI         As Long        'Number of Individuals
Private INDI()     As tINDI


'tStat
Public STAT_NofACC As Long        'N of Reproductions
Public STAT_NofMUT As Long        'N of Mutations
Public STAT_NofNEW As Long        'N of New random caused by disaster
Public sTAT_NofGEN As Long        'Generation
Public STAT_AVGfit As Double      'Average fitness
Public STAT_GenerBestFit As Double    'This Generation Best Fitness Value
Public STAT_GenerWorstFit As Double    'This Generation Worst Fitness Value

Public STAT_GenerBestFitINDX As Long    'This Generation Best Fitness Individ (index)
Public STAT_PopBestFit As Double  'This Pop Best Fitness Value
Private STAT_PopBestIndi As tINDI    'This Pop Best Fitness Individ
'Public STAT_StandDeviation As Double
Public STAT_Diversity As Double

Public InitDescription As String

'---------

Public ThisIsBestGeneration As Boolean
Public GenesAreIntegers As Boolean
Public WheelCreated As Boolean


Public Property Let IndiFitness(Individ, FitnessValue As Double)
    INDI(Individ).Fitness = FitnessValue
End Property

Public Property Get IndiFitness(Individ) As Double
    IndiFitness = INDI(Individ).Fitness
End Property

Public Property Get IndiParent1(Individ) As Long
    IndiParent1 = INDI(Individ).Par1
End Property
Public Property Get IndiParent2(Individ) As Long
    IndiParent2 = INDI(Individ).Par2
End Property

Public Property Get IsIndiChanged(ind As Long) As Boolean    'since perv generation
    IsIndiChanged = INDI(ind).IsChanged
End Property
Public Property Let IsIndiChanged(ind As Long, Value As Boolean)
    INDI(ind).IsChanged = Value
End Property
Public Property Get IsIndiMutated(ind As Long) As Boolean    'since perv generation
    IsIndiMutated = INDI(ind).JustMutated
End Property
Public Property Get GeneValue(wI As Long, wG As Long) As Double
    GeneValue = INDI(wI).Gene(wG)
End Property
Public Property Let GeneValue(wI As Long, wG As Long, Value As Double)
    INDI(wI).Gene(wG) = Value
End Property

Public Property Get IndiNofGenes(wI) As Long
    IndiNofGenes = INDI(wI).NofG
End Property

Private Function fnRND(Min, Max, Optional DoRound As Boolean = True) As Double

    fnRND = RndM * (Max - Min) + Min
    If DoRound Then fnRND = Round(fnRND)

End Function

Public Sub INIT1_EvolutionParams(MutationMode As eMutateMode, MutationProbMin, MutationProbMax, MutationRate, _
                                 PercSonsPerGeneration As Double, _
                                 SelMode As eSelectionMode, _
                                 xMode As eCrossMode, _
                                 ReprMode As eReproductMode, _
                                 MutBest As Boolean, _
                                 Optional TESTDisasterEvery As Long = 100, _
                                 Optional TESTDisasterMode As eTDMode = TDbySameFitness, _
                                 Optional TESTDisasterAction As eTDAction = TDActionRandomize)
                                 
    '**************************************
    'this mut be called before INIT2_Pop
    '**************************************

    'MutationMode   Look next
    '
    'MutationProb   Each individ at each generation have this
    '               Mutation Probability if MutationMode is MutateAll ,
    '               Else (MutateOnlySons) only "Sons" have this probability to mutate
    '
    '               Diffrent Min & Max if the mutation changes according to Population Diversity.
    '               if Min=Max then the Mutation Prob do Not Change.


    'MutatationRate How Much Individ Genes Mutate (0-1)
    '               (Useless for CrossMode = CrossForTSP)
    '
    'PercSonPerGeneration  Each Generation makes a number of Reproductions
    '                       equal to this value multiplied by Number of Individs
    '                       e.g.    PSXG=0.01 , NumberOfIndivid = 200
    '                               Number of Reproductions per Generation =
    '                               PSXG*NumberOfIndivid = 0.01*200 = 2
    '
    '
    'SelMode        Parent Selection Mode
    '               selRand = 0     2 Random Individs
    '               selwheel = 1    By Roulette Wheel (Probability of Individ
    '                                  to be a parent is inverse proportional
    '                                  to fitness Value)
    '               selRank = 2     By Rank (based on fitness values)
    '
    'xMode          Crossover Mode      (how child genes are created)
    '               CrossBySwap = 0     Each Child Gene have 50% of prob to be of
    '                                   one of the 2 parents (Uniform Crossover)
    '               CrossBy1Point = 1
    '               CrossBy2Point = 2
    '               CrossforTSP = 3     Edge Recombination (for TravelSalesmanProblem)
    '                                   Genes change only their Order Position
    '
    'ReproductMode  Where to place the Childs
    '               SonToRndINDI = 0    New son replace a random individ
    '               SonToWorst = 1      New son replace worst individ
    '               SonToParent = 2     New son replace one of 2 parents
    '               SonToNewINDI = 3    New son is a new added individ
    '
    'MutBest        Mutate Best Individ too?
    '
    '
    'TESTDisasterEvery   Generations Interval to Check for Social Disaster.
    '
    'TESTDisasterMode    Detect Social Disater Mode
    '                    TDbyIdenticalIndi = 0    by looking for Identical Indiv. (Genes)
    '                    TDbySameFitness =1       by individuals that have the same Fitness values
    '
    'TESTDisasterAction  Action to perform to SocialDisatered individs.
    '                    TDActionRandomize = 0    Total Genes Randomization
    '                    TDActionMutate = 1       Mutation (according to MutatationRate)



    If MutationProbMin > MutationProbMax Then
        MutRate = MutationProbMin: MutationProbMin = MutationProbMax: MutationProbMax = MutRate
    End If
    If MutationProbMin <> MutationProbMax Then MutProbAdaptive = True
    
    MutMode = MutationMode
    MutProbMin = MutationProbMin
    MutProbMax = MutationProbMax
    MutProb = MutationProbMin

    MutRate = MutationRate


    SelectionMode = SelMode
    CrossMode = xMode
    ReproductMode = ReprMode
    MutateBest = MutBest

    PercSonsXGeneration = PercSonsPerGeneration
    TDEvery = TESTDisasterEvery
    TDMode = TESTDisasterMode
    TDAction = TESTDisasterAction
    


End Sub
Public Sub INIT2_Pop(NofIndi, GeneValueMin, GeneValueMax, NgenesMin, NgenesMax, Optional IntegerGenes As Boolean = False)
    '**************************************
    'this must be called allways
    'and allways after INIT1_EvolutionParams
    '**************************************

    Dim I          As Long
    Dim S          As String
    Dim sp()       As String

    GenesAreIntegers = IntegerGenes

    If NgenesMin < 1 Then NgenesMin = 1
    If NgenesMax < NgenesMin Then NgenesMax = NgenesMin
    NofGenesMIN = NgenesMin
    NofGenesMAX = NgenesMax
    If CrossMode = CrossforTSP Then NofGenesMIN = NofGenesMAX


    GeneValuesMin = GeneValueMin
    GeneValuesMax = GeneValueMax

    NOI = NofIndi

    ReDim INDI(NOI)
    For I = 1 To NOI
        INDI(I) = INDI_Randomize
    Next

    SonsXGeneration = PercSonsXGeneration * NOI


    '    If SonsXGeneration < 1 Then SonsXGeneration = 1
    If SonsXGeneration < 1 Then MsgBox "The Parameter 'Sons per Generation' has been set to " & SonsXGeneration & "!" & vbCrLf & vbCrLf & _
       "(At each call to 'EVOLVE' Subroutine a new Generation occours. EVOLVE sub automatically calls the Mutation and Reproduction Processes). " & vbCrLf & _
       "Setting this parameter to 0 is ok only when it's performed a 'manual' reproduction by calling 'evoReproduct' Subroutine.", vbInformation

    '--- So mut prob (in initEvolve) rapresent (Average) number of mutation x Generation
    'MutProb = MutProb / NOI
    '-------------


    ClearSTAT


    S = "Genetic Algorithm Initialized! " & vbCrLf & vbCrLf & vbCrLf
    S = S + "Current Parameters:" & vbCrLf & vbCrLf
    S = S + "Number of Individuals (Population Size)" & vbTab & NOI & vbCrLf
    S = S + "Min Number of Gene x Indiv" & vbTab & NofGenesMIN & vbCrLf
    S = S + "Max Number of Gene x Indiv" & vbTab & NofGenesMAX & vbCrLf
    S = S + "Minim Gene Value        " & vbTab & GeneValuesMin & vbCrLf
    S = S + "Max   Gene Value        " & vbTab & GeneValuesMax & vbCrLf
    sp = Split(sMutMode)
    S = S + "Mutation Mode           " & vbTab & sp(MutMode) & vbCrLf

    If MutProbAdaptive = False Then
    S = S + "Mutation Probability    " & vbTab & MutProb * 100 & "%" & vbCrLf
    Else
    S = S + "Adaptive Mutation Prob. " & vbCrLf
    S = S + "              from Min     " & vbTab & MutProbMin * 100 & "%" & vbCrLf
    S = S + "              to   Max     " & vbTab & MutProbMax * 100 & "%" & vbCrLf

    End If
    
    S = S + "Mutation Rate           " & vbTab & MutRate * 100 & "%" & vbCrLf
    S = S + "Sons per Generation     " & vbTab & SonsXGeneration & " (" & PercSonsXGeneration * 100 & "%)" & vbCrLf
    sp = Split(sSelMode)
    S = S + "Parent Selection Mode   " & vbTab & sp(SelectionMode) & vbCrLf
    sp = Split(sCrossMode)
    S = S + "Crossover Mode              " & vbTab & sp(CrossMode) & vbCrLf
    sp = Split(sReproductMode)
    S = S + "Placement of Sons       " & vbTab & sp(ReproductMode) & vbCrLf
    S = S + "Can Mutate Best Indi  " & vbTab & MutateBest & vbCrLf
    S = S + "Test Disaster Every     " & vbTab & TDEvery & " Generations" & vbCrLf
    sp = Split(sTDMode)
    S = S + "Test Disaster Mode      " & vbTab & sp(TDMode) & vbCrLf
    sp = Split(sTDAction)
    S = S + "Test Disaster Action    " & vbTab & sp(TDAction) & vbCrLf & vbCrLf & vbCrLf
 
    MsgBox S, vbInformation

InitDescription = S

End Sub

Private Function INDI_Randomize() As tINDI
    Dim G          As Long
    Dim Gpos       As Long

    INDI_Randomize.NofG = fnRND(NofGenesMIN, NofGenesMAX)

    INDI_Randomize.Fitness = MaxSingleValue
    INDI_Randomize.IsChanged = True

    ReDim INDI_Randomize.Gene(INDI_Randomize.NofG)


    If CrossMode <> CrossforTSP Then

        For G = 1 To INDI_Randomize.NofG
            INDI_Randomize.Gene(G) = fnRND(GeneValuesMin, GeneValuesMax, False)
        Next

    Else

        For G = 1 To INDI_Randomize.NofG
            INDI_Randomize.Gene(G) = 0
        Next

        For G = 1 To INDI_Randomize.NofG
            Do
                Gpos = fnRND(1, INDI_Randomize.NofG, True)
            Loop While INDI_Randomize.Gene(Gpos) <> 0
            INDI_Randomize.Gene(Gpos) = G
            'MsgBox Gpos & "   " & G
        Next

    End If

    If GenesAreIntegers Then
        For G = 1 To INDI_Randomize.NofG
            INDI_Randomize.Gene(G) = (INDI_Randomize.Gene(G)) \ 1
        Next
    End If

    INDI_Randomize.Par1 = 0
    INDI_Randomize.Par2 = 0
    INDI_Randomize.FreeForSon = True
    INDI_Randomize.IsChanged = True
    INDI_Randomize.JustMutated = False

End Function


Public Sub evoMUTATEindi(wI As Long, OnlyIfFitnessIsWorstThanAVG As Boolean)
    Dim NOG        As Long
    Dim POS        As Long
    Dim G          As Long
    Dim GG         As Long
    Dim G2         As Long
    Dim T          As Long
    Dim MutAmount  As Double
    Dim totMutAmount As Double
    Dim OldGValue  As Double      'long
    Dim MR         As Single
    Dim NgenesToMutate As Long

    
    If OnlyIfFitnessIsWorstThanAVG Then If INDI(wI).Fitness < STAT_AVGfit Then Exit Sub
    
    If Not (MutateBest) And (wI = STAT_GenerBestFitINDX) Then Exit Sub

    INDI(wI).IsChanged = True
    INDI(wI).JustMutated = True

    STAT_NofMUT = STAT_NofMUT + 1

    If CrossMode <> CrossforTSP Then
        MR = MutRate * INDI(wI).NofG
        With INDI(wI)
            NOG = .NofG
            totMutAmount = 0
            'Do

            NgenesToMutate = 1 + (NOG - 1) * MutRate
            For GG = 1 To NgenesToMutate
                G = fnRND(1, NOG)
                OldGValue = .Gene(G)
                MutAmount = fnRND(-MutRate, MutRate, False)
                totMutAmount = totMutAmount + Abs(MutAmount)
                OldGValue = OldGValue + MutAmount * (GeneValuesMax - GeneValuesMin)
                If OldGValue < GeneValuesMin Then OldGValue = GeneValuesMin
                If OldGValue > GeneValuesMax Then OldGValue = GeneValuesMax
                .Gene(G) = OldGValue
                'Loop While totMutAmount < MR
            Next

            '            G = fnRND(1, NOG)
            '            OldGValue = .Gene(G)
            '            MutAmount = fnRND(-MutRate / 2, MutRate / 2, False)
            '            totMutAmount = totMutAmount + Abs(MutAmount)
            '            OldGValue = OldGValue + MutAmount * (GeneValuesMax - GeneValuesMin)
            '            If OldGValue < GeneValuesMin Then OldGValue = GeneValuesMin
            '            If OldGValue > GeneValuesMax Then OldGValue = GeneValuesMax
            '            .Gene(G) = OldGValue
            '            GG = G
            '            For G = 1 To NOG
            '                If RndM < MutProb Then
            '                    If G <> GG Then
            '                        'Stop
            '                        OldGValue = .Gene(G)
            '                        MutAmount = fnRND(-MutRate / 2, MutRate / 2, False)
            '                        totMutAmount = totMutAmount + Abs(MutAmount)
            '                        OldGValue = OldGValue + MutAmount * (GeneValuesMax - GeneValuesMin)
            '                        If OldGValue < GeneValuesMin Then OldGValue = GeneValuesMin
            '                        If OldGValue > GeneValuesMax Then OldGValue = GeneValuesMax
            '                        .Gene(G) = OldGValue
            '                    End If
            '                End If
            '            Next


        End With

    Else

        'TSP*************
        NOG = INDI(wI).NofG
        With INDI(wI)
            POS = fnRND(1, NOG, True)
            G2 = .Gene(POS)
            For T = POS To NOG - 1
                .Gene(T) = .Gene(T + 1)
            Next
            POS = fnRND(1, NOG, True)
            For T = NOG To POS + 1 Step -1
                .Gene(T) = .Gene(T - 1)
            Next
            .Gene(POS) = G2
        End With
        '****************
    End If


    If GenesAreIntegers Then

        NOG = INDI(wI).NofG
        For G = 1 To NOG
            INDI(wI).Gene(G) = (INDI(wI).Gene(G)) \ 1
        Next
    End If


End Sub

Public Sub evoMUTATEAll()
    Dim I          As Long
    For I = 1 To NOI
        If RndM < MutProb Then
            evoMUTATEindi I, MutProbAdaptive
        End If
    Next I
End Sub

Private Sub EvaluateFitnesses()
    Dim I          As Long

    ThisIsBestGeneration = False
    STAT_GenerBestFit = MaxSingleValue
    STAT_GenerWorstFit = -1


    STAT_AVGfit = 0

    For I = 1 To NOI

        With INDI(I)

            .FreeForSon = True

            If .Fitness < STAT_GenerBestFit Then
                STAT_GenerBestFit = .Fitness
                STAT_GenerBestFitINDX = I
            End If
            If .Fitness < STAT_GenerWorstFit Then
                STAT_GenerWorstFit = .Fitness
            End If
            If .Fitness < STAT_PopBestFit Then
                ThisIsBestGeneration = True
                STAT_PopBestFit = .Fitness
                STAT_PopBestIndi = INDI(I)
            End If

            STAT_AVGfit = STAT_AVGfit + .Fitness

        End With

    Next I

    STAT_AVGfit = STAT_AVGfit / NOI

    'CalcStandDeviation
    'CalcDiversity


    If STAT_GenerBestFit = 0 Then
        DebugPrintPop
        MsgBox "Solution FOUND!!! " & vbCrLf & _
               "Generation: " & sTAT_NofGEN & _
               DebugPrintIndi(STAT_GenerBestFitINDX)
        End
    End If

End Sub

Public Function DebugPrintPop() As String
    Dim I          As Long
    Dim G          As Long

    Exit Function

    Debug.Print
    Debug.Print "POPULATION"
    For I = 1 To NOI
        DebugPrintPop = "I" & I & " FIT:" & INDI(I).Fitness & vbTab & vbTab
        For G = 1 To INDI(I).NofG
            DebugPrintPop = DebugPrintPop & vbTab & INDI(I).Gene(G)
        Next
        Debug.Print DebugPrintPop
    Next
End Function
Public Function DebugPrintIndi(wI) As String

    Dim G          As Long

    DebugPrintIndi = vbCrLf & "INDI " & wI & "  (N of Genes " & INDI(wI).NofG & ")" & vbCrLf
    '    DebugPrintIndi = DebugPrintIndi & "FIT: " & INDI(wI).Fitness & vbTab & vbTab
    DebugPrintIndi = DebugPrintIndi & "FITNESS: " & INDI(wI).Fitness & vbCrLf & "Genes:" & vbCrLf
    For G = 1 To INDI(wI).NofG
        DebugPrintIndi = DebugPrintIndi & vbTab & INDI(wI).Gene(G)
    Next
    Debug.Print DebugPrintIndi
End Function


Private Sub CreaWheel()
    Dim Sum        As Double
    Dim Sum2       As Double
    Dim Sum3       As Double

    Dim MinF       As Double
    Dim MaxF       As Double

    Dim I          As Long

    MinF = MaxSingleValue
    MaxF = -MaxSingleValue
    Sum = 0

    For I = 1 To NOI
        With INDI(I)
            Sum = Sum + .Fitness
            If .Fitness < MinF Then MinF = .Fitness
            If .Fitness > MaxF Then MaxF = .Fitness
        End With
    Next

    '*********** changed ''' don't know remeber what was need for
    'MaxF = MaxF + 1''''''
    MaxF = MaxF + 1
    '************
    Sum2 = 0
    For I = 1 To NOI
        Sum2 = Sum2 + (MaxF - INDI(I).Fitness)
    Next

    Sum3 = 0
    '        Debug.Print "WHEEL______________"
    For I = 1 To NOI
        With INDI(I)
            Sum3 = Sum3 + 100 * (MaxF - .Fitness) / Sum2
            '                       Debug.Print "fitness " & I, .Fitness, MaxF - .Fitness, 100 * (MaxF - .Fitness) / Sum2, Sum3
            .Wheel = Sum3


        End With
    Next

    WheelCreated = True

End Sub
Private Sub CreaWheelSQ()
    Dim Sum        As Double
    Dim Sum2       As Double
    Dim Sum3       As Double

    Dim MinF       As Double
    Dim MaxF       As Double

    Dim I          As Long
    Dim FITSQR     As Double

    MinF = MaxSingleValue * MaxSingleValue
    MaxF = -(MaxSingleValue * MaxSingleValue)
    Sum = 0

    For I = 1 To NOI
        With INDI(I)
            FITSQR = .Fitness * .Fitness

            Sum = Sum + FITSQR
            If FITSQR < MinF Then MinF = FITSQR
            If FITSQR > MaxF Then MaxF = FITSQR
        End With
    Next

    '*********** changed ''' don't know remeber what was need for
    'MaxF = MaxF + 1''''''
    MaxF = MaxF + 1
    '************
    Sum2 = 0
    For I = 1 To NOI
        Sum2 = Sum2 + (MaxF - INDI(I).Fitness * INDI(I).Fitness)
    Next

    Sum3 = 0
    Debug.Print "WHEEL______________"
    For I = 1 To NOI
        With INDI(I)
            Sum3 = Sum3 + 100 * (MaxF - .Fitness * .Fitness) / Sum2
            Debug.Print "fitness " & I, .Fitness, MaxF - .Fitness * .Fitness, 100 * (MaxF - .Fitness * .Fitness) / Sum2, Sum3
            .Wheel = Sum3


        End With
    Next
    WheelCreated = True

End Sub
Private Sub CreaRankWheel()
    Dim Sum        As Double
    Dim Sum2       As Double
    Dim Sum3       As Double

    Dim MinF       As Double
    Dim MaxF       As Double

    Dim I          As Long

    MinF = MaxSingleValue
    MaxF = -MaxSingleValue
    Sum = 0

    For I = 1 To NOI
        Sum = Sum + I
    Next
    MinF = 1
    MaxF = NOI

    MaxF = MaxF + 1
    Sum2 = 0
    For I = 1 To NOI
        Sum2 = Sum2 + MaxF - I
    Next

    Sum3 = 0
    '    Debug.Print "WHEEL______By Rank"
    For I = 1 To NOI
        With INDI(I)
            Sum3 = Sum3 + 100 * (MaxF - I) / Sum2
            '            Debug.Print "fitness " & I, .Fitness, MaxF - I, 100 * (MaxF - I) / Sum2, Sum3
            .Wheel = Sum3
        End With
    Next
    WheelCreated = True

End Sub


Private Function RandomParentByWheel() As Long

    Dim RandWheel  As Double
    Dim Wm         As Double

    Dim I          As Long

    RandWheel = fnRND(0, 100, False)

    For I = 1 To NOI
        Wm = IIf(I = 1, 0, INDI(I - 1).Wheel)
        If RandWheel >= Wm And RandWheel < INDI(I).Wheel Then RandomParentByWheel = I: Exit For
    Next
    '  Debug.Print "findp " & RandWheel, "Parent " & RandomParentByWheel

End Function

Private Sub evoSelectParents(ByRef P1 As Long, ByRef P2 As Long)
    'FreeForSon Used to NOT select as parent a Just born Individ
    Select Case SelectionMode

        Case SelWheel
            '        WHEEL
            If Not (WheelCreated) Then CreaWheel
            Do
                P1 = RandomParentByWheel
                P2 = RandomParentByWheel
            Loop While (P1 = P2) Or (INDI(P1).FreeForSon = False) Or (INDI(P2).FreeForSon = False)
        Case SelWheelSQ
            '        WHEEL
            If Not (WheelCreated) Then CreaWheelSQ
            Do
                P1 = RandomParentByWheel
                P2 = RandomParentByWheel
            Loop While (P1 = P2) Or (INDI(P1).FreeForSon = False) Or (INDI(P2).FreeForSon = False)

        Case SelRank

            QuickSortFitness 1, NOI
            STAT_GenerBestFit = INDI(1).Fitness
            STAT_GenerWorstFit = INDI(NOI).Fitness
            STAT_GenerBestFitINDX = 1

            '         RankWheel
            If Not (WheelCreated) Then CreaRankWheel
            Do
                P1 = RandomParentByWheel
                P2 = RandomParentByWheel
                If P1 = 0 Or P2 = 0 Then Stop
            Loop While (P1 = P2) Or (INDI(P1).FreeForSon = False) Or (INDI(P2).FreeForSon = False)


        Case SelRand
            Do
                P1 = fnRND(1, NOI, True)
                P2 = fnRND(1, NOI, True)
            Loop While (P1 = P2) Or (INDI(P1).FreeForSon = False) Or (INDI(P2).FreeForSon = False)

    End Select

    '??
    'INDI(P1).FreeForSon = False
    'INDI(P2).FreeForSon = False

End Sub

Private Sub QuickSortFitness(ByVal lngFirst As Long, ByVal lngLast As Long)
    '
    ' This is the unique part of code taken from PSC BigGenetic Proplem
    '
    ' Quicksort in order to sort the chromosomes by their fitness.
    '
    '            I got this version of quicksort years ago from
    '            a website (I believe from www.gamedev.net but
    '            I'MAN not sure). Original code was in C and Quickbasic.
    '            The quickbasic version was rewritten by me
    '            several times over the past years until
    '            the version you see here. I use it in
    '            several of my projects.
    '

    Dim lngLow     As Long
    Dim lngHigh    As Long

    Dim dblMidValue As Double

    '    Dim HelpChromo              As ChromosomeindividualType
    Dim tmpINDI    As tINDI


    lngLow = lngFirst
    lngHigh = lngLast

    ' take the absolute value of fitness
    '    dblMidValue = Abs(Chromosome((lngFirst + lngLast) \ 2).Fitness)
    dblMidValue = Abs(INDI((lngFirst + lngLast) \ 2).Fitness)
    Do
        'While Abs(Chromosome(lngLow).Fitness) < dblMidValue
        While INDI(lngLow).Fitness < dblMidValue
            lngLow = lngLow + 1
        Wend
        'While Abs(Chromosome(lngHigh).Fitness) > dblMidValue
        While INDI(lngHigh).Fitness > dblMidValue
            lngHigh = lngHigh - 1
        Wend
        If lngLow <= lngHigh Then
            GoSub Swap
            lngLow = lngLow + 1
            lngHigh = lngHigh - 1
        End If
    Loop While lngLow <= lngHigh
    If lngFirst < lngHigh Then QuickSortFitness lngFirst, lngHigh
    If lngLow < lngLast Then QuickSortFitness lngLow, lngLast
    ' the chromosome-array is sorted
    'mblnSorted = True
    Exit Sub

Swap:
    'HelpChromo = Chromosome(lngLow)
    'Chromosome(lngLow) = Chromosome(lngHigh)
    'Chromosome(lngHigh) = HelpChromo
    tmpINDI = INDI(lngLow)
    INDI(lngLow) = INDI(lngHigh)
    INDI(lngHigh) = tmpINDI
    Return
End Sub


Public Sub evoREPRODUCT(Par1 As Long, Par2 As Long, oCrossMode As eCrossMode, oReproductMode As eReproductMode)
    'MATE

    Dim NewIndi    As tINDI

    Dim G          As Long
    Dim G1         As Long
    Dim G2         As Long
    Dim G3         As Long
    Dim G4         As Long

    Dim WORST      As Long

    Dim Par        As Long

    Dim idxNI      As Long

    STAT_NofACC = STAT_NofACC + 1

    NewIndi.Fitness = MaxSingleValue
    NewIndi.NofG = IIf(INDI(Par1).NofG > INDI(Par2).NofG, INDI(Par1).NofG, INDI(Par2).NofG)
    NewIndi.Wheel = 0             'da calcolare
    NewIndi.IsChanged = True
    NewIndi.FreeForSon = False
    NewIndi.Par1 = Par1
    NewIndi.Par2 = Par2

    ReDim NewIndi.Gene(NewIndi.NofG)

    If RndM < 0.5 Then Par = Par1: Par1 = Par2: Par2 = Par
    ''crossover
    'oCrossMode = CrossMode
    'oReproductMode = ReproductMode
    Select Case oCrossMode

        Case CrossBySwap
            For G = 1 To INDI(Par1).NofG
                If RndM < 0.5 Then
                    NewIndi.Gene(G) = INDI(Par1).Gene(G)
                Else
                    NewIndi.Gene(G) = INDI(Par2).Gene(G)
                End If
            Next
        Case CrossBy1Point
            If INDI(Par1).NofG = INDI(Par2).NofG Then
                G1 = fnRND(1, INDI(Par1).NofG - 1)
                For G = 1 To INDI(Par1).NofG
                    If G < G1 Then
                        NewIndi.Gene(G) = INDI(Par1).Gene(G)
                    Else
                        NewIndi.Gene(G) = INDI(Par2).Gene(G)
                    End If
                Next
            Else
                Do
                    G1 = fnRND(1, INDI(Par1).NofG - 1)
                    G2 = fnRND(1, INDI(Par2).NofG - 1)
                    NewIndi.NofG = G1 + (INDI(Par2).NofG - G2)
                Loop While NewIndi.NofG > NofGenesMAX Or _
                     NewIndi.NofG < NofGenesMIN
                ReDim NewIndi.Gene(NewIndi.NofG)

                Debug.Print G1 & "  " & G2
                For G = 1 To G1
                    NewIndi.Gene(G) = INDI(Par1).Gene(G)
                    'Debug.Print "1 " & G
                Next
                For G = G1 + 1 To NewIndi.NofG
                    NewIndi.Gene(G) = INDI(Par2).Gene(G + G2 - G1)
                    'Debug.Print "2 " & G + G2 - G1
                Next
            End If
        Case CrossBy2Point
            If INDI(Par1).NofG = INDI(Par2).NofG Then
                Do
                    G1 = fnRND(1, INDI(Par1).NofG)
                    G2 = fnRND(1, INDI(Par1).NofG)
                Loop While G2 <= G1
                For G = 1 To INDI(Par1).NofG
                    If G <= G1 Or G >= G2 Then
                        NewIndi.Gene(G) = INDI(Par1).Gene(G)
                    Else
                        NewIndi.Gene(G) = INDI(Par2).Gene(G)
                    End If
                Next
            Else
                Do
                    Do
                        G1 = fnRND(1, INDI(Par1).NofG)
                        G2 = fnRND(1, INDI(Par1).NofG)
                    Loop While G2 <= G1
                    Do
                        G3 = fnRND(1, INDI(Par2).NofG)
                        G4 = fnRND(1, INDI(Par2).NofG)
                    Loop While G4 <= G3

                    NewIndi.NofG = G2 - G1 + 1 + G4 - G3 + 1

                Loop While NewIndi.NofG > NofGenesMAX Or _
                     NewIndi.NofG < NofGenesMIN


                ReDim NewIndi.Gene(NewIndi.NofG)
                Debug.Print INDI(Par1).NofG & " " & INDI(Par2).NofG
                Debug.Print G1 & "-" & G2 & "  " & G3 & "-" & G4
                Debug.Print "new nofG=" & NewIndi.NofG
                For G = G1 To G2
                    NewIndi.Gene(G - G1 + 1) = INDI(Par1).Gene(G)
                    'Debug.Print "1 " & G - G1 + 1 & "  source " & G
                Next
                For G = G3 To G4
                    NewIndi.Gene(G2 - G1 + 1 + G - G3 + 1) = INDI(Par2).Gene(G)
                    'Debug.Print "2 " & G2 - G1 + 1 + G - G3 + 1 & "  source " & G
                Next

            End If


        Case CrossforTSP

            'Stop

            NewIndi = TSP_EdgeRecombinationCrossover(Par1, Par2)

            'GoTo SKIP
            ''''''''''''''''''''''''''''''''''''''''''''''
            ' make gene(1) start with 1  'riordinamento
            'NewIndi2 = NewIndi
            'For G = 1 To NOG
            '    If NewIndi.Gene(G) = 1 Then Exit For
            'Next
            'G3 = G - 1
            'For G = 1 To NOG
            '    G2 = G3 + G: If G2 > NOG Then G2 = G2 - NOG
            '    NewIndi.Gene(G) = NewIndi2.Gene(G2)
            'Next G
            '''''''''''''''''''''''''''''''''''''''''''
            'SKIP:

    End Select







    Select Case oReproductMode
        Case SonToWorst
            ''' replace Worst
            WORST = INDI_GetWORST
            idxNI = WORST
            INDI(WORST) = NewIndi
        Case SonToNewINDI
            ''' ADDtoPop
            INDI_Add NewIndi
            idxNI = NOI
        Case SonToRndINDI
            ''' Replace RndM
            idxNI = fnRND(1, NOI, True)
            INDI(idxNI) = NewIndi
        Case SonToParent
            ''' Replace one of 2 parents
            Par = IIf(RndM < 0.5, Par1, Par2)
            idxNI = Par
            INDI(Par) = NewIndi
    End Select

    If MutMode = MutateOnlySons Then
        If RndM < MutProb Then evoMUTATEindi idxNI, MutProbAdaptive
    End If
End Sub

Public Function INDI_GetWORST() As Long
    'private
    Dim MaxF       As Double
    Dim I          As Long

    MaxF = -MaxSingleValue

    For I = 1 To NOI
        With INDI(I)
            If .FreeForSon Then
                If .Fitness > MaxF Then MaxF = .Fitness: INDI_GetWORST = I
            End If
        End With
    Next
    'INDI(INDI_GetWORST).FreeForSon = False 'put in eREPRODUCT sub
    Debug.Print "worst : " & INDI_GetWORST
End Function

Private Sub INDI_Add(ind As tINDI)
    NOI = NOI + 1
    ReDim Preserve INDI(NOI)
    INDI(NOI) = ind
End Sub

'************
Private Function TSP_EdgeRecombinationCrossover(P1 As Long, P2 As Long) As tINDI

    'Translated for my pourpose from here
    'http://www.rubicite.com/genetic/tutorial/crossover4.php

    Dim NI         As tINDI
    Dim NeiList()  As New Collection
    Dim CHILD      As New Collection
    Dim getCHILD   As New Collection
    Dim NOG        As Long
    Dim G          As Long
    Dim G1         As Long
    Dim G2         As Long
    Dim V1         As Long
    Dim V2         As Long
    Dim p1G1       As Long
    Dim p1G2       As Long
    Dim p2G1       As Long
    Dim p2G2       As Long
    Dim X          As Long
    Dim Z          As Long
    Dim GG         As Long
    Dim E          As Integer
    Dim S          As String



    NI.Fitness = MaxSingleValue
    NI.NofG = INDI(P1).NofG
    NI.Wheel = 0                  'da calcolare
    NI.IsChanged = True

    ReDim NI.Gene(NI.NofG)

    ReDim NeiList(NI.NofG)

    NOG = NI.NofG

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Generate Neighbor List
    For G = 1 To NOG
        G1 = G - 1
        G2 = G + 1
        If G1 < 1 Then G1 = NOG
        If G2 > NOG Then G2 = 1

        V1 = INDI(P1).Gene(G)
        V2 = INDI(P2).Gene(G)
        p1G1 = INDI(P1).Gene(G1)
        p1G2 = INDI(P1).Gene(G2)
        p2G1 = INDI(P2).Gene(G1)
        p2G2 = INDI(P2).Gene(G2)


        If TSP_collNotInColl(NeiList(V1), p1G1) Then NeiList(V1).Add p1G1
        If TSP_collNotInColl(NeiList(V1), p1G2) Then NeiList(V1).Add p1G2
        If TSP_collNotInColl(NeiList(V2), p2G1) Then NeiList(V2).Add p2G1
        If TSP_collNotInColl(NeiList(V2), p2G2) Then NeiList(V2).Add p2G2

        'TSP_collRemoveItem CHILD, G
        getCHILD.Add G
    Next
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Debug.Print "-----------------------------------------------------"

    'Stop

    X = INDI(P1).Gene(1)

    GG = 0
    Do
        '   GoSub debugNeilist

        GG = GG + 1: If GG > NOG - 1 Then Exit Do
        '   Append X to CHILD
        '   Remove X from Neighbor Lists
        CHILD.Add X
        TSP_collRemoveItem getCHILD, X


        For G = 1 To NOG
            TSP_collRemoveItem NeiList(G), X
        Next

        'if X's neighbor list is empty:
        If NeiList(X).Count = 0 Then
            'Z = random node not already in CHILD


            Z = TSP_collPickFrom(getCHILD)

            'If Not (TSP_collNotInColl(CHILD, Z)) Then Stop
        Else

            '- Determine neighbor of X that has fewest neighbors
            '- If there is a tie, randomly choose 1
            '- Z = chosen node
            Dim Min
            Min = 99999999

            For E = 1 To NeiList(X).Count
                If NeiList(NeiList(X).Item(E)).Count < Min Then
                    Min = NeiList(NeiList(X).Item(E)).Count
                    Z = NeiList(X).Item(E)    'E

                End If
            Next
            '        Stop

            '   TSP_collRemoveItem getCHILD, Z

        End If

        X = Z

    Loop While True

    Z = TSP_collPickFrom(getCHILD)
    CHILD.Add Z


    'Debug.Print "Child"
    For G = 1 To NOG
        'Debug.Print CHILD.Item(G);
        NI.Gene(G) = CHILD.Item(G)

        'If TSP_collNotInColl(CHILD, G) Then
        '    'error
        '    Stop
        'End If

    Next
    'Debug.Print
    '''''
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Set CHILD = Nothing
    Set getCHILD = Nothing
    For G = 1 To NOG
        Set NeiList(G) = Nothing
    Next

    TSP_EdgeRecombinationCrossover = NI
    Exit Function

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'debug
debugNeilist:

    S = ""
    For G = 1 To NOG
        S = S + CStr(INDI(P1).Gene(G)) & vbTab
    Next: S = S & vbCrLf
    For G = 1 To NOG
        S = S + CStr(INDI(P2).Gene(G)) & vbTab
    Next: S = S & vbCrLf
    Debug.Print S
    S = ""
    For G1 = 1 To NOG
        S = S & G1 & " |" & vbTab
        For G2 = 1 To NeiList(G1).Count
            S = S & NeiList(G1).Item(G2) & vbTab
        Next: S = S & vbCrLf
    Next
    Debug.Print S

    For G = 1 To NOG
        Set NeiList(G) = Nothing
    Next

    '    Return
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''


End Function
Private Function TSP_collNotInColl(C As Collection, Val) As Boolean
    Dim E          As Integer

    TSP_collNotInColl = True
    'If C.Count = 0 Then Stop

    For E = 1 To C.Count
        If C.Item(E) = Val Then TSP_collNotInColl = False: Exit For
    Next

End Function

Private Sub TSP_collRemoveItem(ByRef C As Collection, Val)
    Dim E          As Integer
    If C.Count = 0 Then Exit Sub

    E = 0
    Do
        E = E + 1
        If C.Item(E) = Val Then C.Remove E: Exit Do
    Loop While E < C.Count

End Sub

Private Function TSP_collPickFrom(ByRef C As Collection) As Integer
    Dim E          As Integer
    'Stop
    'If C.Count = 0 Then Stop

    E = Int(RndM * C.Count) + 1

    TSP_collPickFrom = C.Item(E)

    'C.Remove E

End Function



Public Sub INDI_Kill(Individ As Long)
    Dim II         As Long
    For II = Individ To NOI - 1
        INDI(II) = INDI(II + 1)
    Next II
    NOI = NOI - 1
    ReDim Preserve INDI(NOI)
End Sub

Public Sub INDI_AllRandoms()
    Dim I          As Long

    For I = 1 To NOI
        INDI(I) = INDI_Randomize
    Next

    STAT_GenerBestFit = MaxSingleValue
    STAT_GenerWorstFit = -1
    STAT_GenerBestFitINDX = 1
    STAT_PopBestFit = MaxSingleValue
End Sub


Public Sub EVOLVE()
    Dim II         As Long
    Dim Parent1    As Long
    Dim Parent2    As Long

    Dim R          As Long

    Dim PerformDisasterTO() As Long
    
    sTAT_NofGEN = sTAT_NofGEN + 1

    For II = 1 To NOI
        INDI(II).IsChanged = False
        INDI(II).JustMutated = False
        INDI(II).Par1 = 0
        INDI(II).Par2 = 0
    Next

    EvaluateFitnesses
    STAT_Diversity = CalcDiversity

    'ACCOPPIA 'MATE 'Reproduct **********
    WheelCreated = False
    For R = 1 To SonsXGeneration  '* NofI
        'GETPARENTS
        evoSelectParents Parent1, Parent2
        'REPRODUCTION
        evoREPRODUCT Parent1, Parent2, CrossMode, ReproductMode
    Next R
    '************************************

    If MutMode = MutateAll Then evoMUTATEAll

    If sTAT_NofGEN Mod TDEvery = 0 Then
        
        TestDisasterAndDoAction
        
    End If



End Sub
Public Sub EVOLVE2() 'for Specific Use only
    Dim II         As Long
    Dim Parent1    As Long
    Dim Parent2    As Long

    Dim R          As Long

    sTAT_NofGEN = sTAT_NofGEN + 1

    For II = 1 To NOI
        INDI(II).IsChanged = False
        INDI(II).JustMutated = False
        INDI(II).Par1 = 0
        INDI(II).Par2 = 0
    Next

    EvaluateFitnesses
    STAT_Diversity = CalcDiversity

    QuickSortFitness 1, NOI

    evoREPRODUCT 1, Int(RndM * NOI) + 1, CrossMode, ReproductMode
    evoREPRODUCT 1, 2, CrossMode, ReproductMode

    For II = 3 To NOI - 2
        evoMUTATEindi II, MutProbAdaptive
    Next

    If sTAT_NofGEN Mod TDEvery = 0 Then
        TestDisasterAndDoAction
    End If

End Sub

Public Sub TestDisasterAndDoAction()

    Dim I          As Long
    Dim J          As Long
    Dim NOGi       As Long
    Dim NOGj       As Long

    Dim G          As Long

    Dim S          As String
    Dim PervNumOfNew

    PervNumOfNew = STAT_NofNEW

    'MutRate = 0.5
    If TDMode = TDbyIdenticalIndi Then
        For I = 1 To NOI - 1
            NOGi = INDI(I).NofG
            For J = I + 1 To NOI
                NOGj = INDI(J).NofG
                If NOGi = NOGj Then
                    G = 1
Q1:
                    If G <= NOGi Then If INDI(I).Gene(G) = INDI(J).Gene(G) Then G = G + 1: GoTo Q1
                    If G > NOGi Then
                        If STAT_GenerBestFitINDX <> J Then
                            STAT_NofNEW = STAT_NofNEW + 1
                            'inid I and inid J are identical, so
                            'MUTATE OR RANDOMIZE:
                            If TDAction = TDActionRandomize Then
                                INDI(J) = INDI_Randomize
                            Else
                                evoMUTATEindi J, False
                            End If
                            '------------------------
                        End If
                        'If J = STAT_GenerBestFitINDX Then STAT_GenerBestFitINDX = I
                    End If
                End If
            Next J
        Next I
    Else
        'Based on fitness
        For I = 1 To NOI - 1
            For J = I + 1 To NOI
                If INDI(I).Fitness = INDI(J).Fitness Then
                    If STAT_GenerBestFitINDX <> J Then
                        STAT_NofNEW = STAT_NofNEW + 1
                        'inid I and inid J have same fitness
                        'MUTATE OR RANDOMIZE:
                        If TDAction = TDActionRandomize Then
                            INDI(J) = INDI_Randomize
                        Else
                            evoMUTATEindi J, False
                        End If
                        '------------------------
                    End If
                End If
            Next
        Next
    End If


    S = "Generation " & sTAT_NofGEN    '& Statistic.NofACC
    S = S & "   Tested Disaster. N of Changed Individs = " & _
        STAT_NofNEW - PervNumOfNew & " of " & NOI & vbTab & " (Total =" & STAT_NofNEW & ") " & vbCrLf

    Debug.Print S

End Sub

Private Sub Class_Initialize()
    Randomize Timer

End Sub


Public Sub SavePOP(Optional filename = "POP.txt")
    Dim II         As Long
    Dim GG         As Long

    DebugPrintPop

    Open App.Path & "\" & filename For Output As 1

    Print #1, "Number of INDIVIDs"
    Print #1, NOI
    Print #1, "Min Max Gene Value"
    Print #1, GeneValuesMin
    Print #1, GeneValuesMax
    Print #1, "Min Max Gene Number"
    Print #1, NofGenesMIN
    Print #1, NofGenesMAX
    Print #1, "Mutation Mode"
    Print #1, MutMode
    
    Print #1, "MIN MAX Mutation Prob"
    Print #1, Replace(MutProbMin, ",", ".")
    Print #1, Replace(MutProbMax, ",", ".")
    
    Print #1, "Mutation Rate"
    Print #1, Replace(MutRate, ",", ".")
    Print #1, "PercSonsXGeneration"
    Print #1, Replace(PercSonsXGeneration, ",", ".")
    Print #1, "SonsXGeneration"
    Print #1, SonsXGeneration
    Print #1, "Selection Mode"
    Print #1, SelectionMode
    Print #1, "Cross Mode"
    Print #1, CrossMode
    Print #1, "Son Mode"
    Print #1, ReproductMode

    Print #1, "Mutate Best"
    Print #1, CInt(MutateBest)
    Print #1, "INDEX BEST INDI"
    Print #1, STAT_GenerBestFitINDX
    Print #1, "TESTDisasterEvery"
    Print #1, TDEvery
    Print #1, "TESTDisasterMode"
    Print #1, TDMode
    Print #1, "TESTDisasterAction"
    Print #1, TDAction



    For II = 1 To NOI
        Print #1, "---------------INDI " & II & " _ Fitness _ Num of Genes"
        Print #1, Replace(INDI(II).Fitness, ",", ".")
        Print #1, INDI(II).NofG

        For GG = 1 To INDI(II).NofG
            Print #1, Replace(INDI(II).Gene(GG), ",", ".")
        Next GG
    Next II
    Close 1

End Sub

Public Sub LoadPOP(Optional filename = "POP.txt", Optional LoadFitnessToo As Boolean = False)


    Dim II         As Long
    Dim GG         As Long
    Dim S          As String

    Open App.Path & "\" & filename For Input As 1

    Input #1, S
    Input #1, NOI

    ReDim INDI(0 To NOI)
    Input #1, S                   '"Min Max Gene Value"
    Input #1, GeneValuesMin
    Input #1, GeneValuesMax
    Input #1, S                   '"Min Max Gene Number"
    Input #1, NofGenesMIN
    Input #1, NofGenesMAX
    Input #1, S                   '"Mutation Mode"
    Input #1, MutMode
    Input #1, S                   '"MIN MAX Mutation Prob"
    Input #1, MutProbMin
    Input #1, MutProbMax
    
    MutProb = MutProbMin
    Input #1, S                   '"Mutation Rate"
    Input #1, MutRate
    Input #1, S                   '"PercSonsXGeneration"
    Input #1, PercSonsXGeneration
    Input #1, S                   '"SonsXGeneration"
    Input #1, SonsXGeneration
    Input #1, S                   '"Selection Mode"
    Input #1, SelectionMode
    Input #1, S                   '"Cross Mode"
    Input #1, CrossMode
    Input #1, S                   '"Son Mode"
    Input #1, ReproductMode
    Input #1, S                   '"Mutate Best"
    Input #1, S
    If S = "-1" Then MutateBest = True Else: MutateBest = False
    Input #1, S                   '"INDEX BEST INDI"
    Input #1, STAT_GenerBestFitINDX
    Input #1, S                   '"TESTDisasterEvery"
    Input #1, TDEvery
    Input #1, S                   '"TESTDisasterMode"
    Input #1, TDMode
    Input #1, S                   '"TESTDisasterAction"
    Input #1, TDAction

    For II = 1 To NOI

        Input #1, S               '"INDI: -  fitness - NofG -genes"

        Input #1, S
        If LoadFitnessToo Then INDI(II).Fitness = S Else: INDI(II).Fitness = MaxSingleValue
        INDI(II).IsChanged = True

        Input #1, S
        INDI(II).NofG = S
        ReDim INDI(II).Gene(INDI(II).NofG)


        For GG = 1 To INDI(II).NofG
            Input #1, INDI(II).Gene(GG)
        Next GG

    Next II

    Close 1


End Sub

Public Sub ClearSTAT()
    STAT_NofACC = 0
    STAT_NofMUT = 0
    STAT_NofNEW = 0
    sTAT_NofGEN = 0
    STAT_AVGfit = 0
    STAT_GenerBestFit = MaxSingleValue
    STAT_GenerWorstFit = -1
    STAT_GenerBestFitINDX = 1
    STAT_PopBestFit = MaxSingleValue
End Sub

Public Function ComputeAVGfit() As Double
    Dim I          As Long

    ' ComputeAVGfit = 0
    ' For I = 1 To NOI
    '     With INDI(I)
    '        ComputeAVGfit = ComputeAVGfit + .Fitness
    '     End With
    ' Next I
    ' ComputeAVGfit = ComputeAVGfit / NOI
    EvaluateFitnesses
    ComputeAVGfit = STAT_AVGfit

End Function


Private Function CalcStandDeviation() As Double
    ' Returns the statistical Standard deviation of the fitnesses
    Dim FitAverage As Double
    Dim Variance   As Double
    Dim Diff       As Double
    Dim DiffPwr    As Double

    Dim Idx        As Long

    Variance = 0

    FitAverage = STAT_AVGfit

    For Idx = 1 To NOI
        Diff = INDI(Idx).Fitness - FitAverage
        DiffPwr = Diff * Diff
        Variance = Variance + DiffPwr
    Next Idx

    If NOI <> 0 Then
        CalcStandDeviation = Sqr(Variance / (NOI))
    Else
        CalcStandDeviation = 0
    End If
    '    Stop

    'Not Really Standard DEV but for My Use
    CalcStandDeviation = (CalcStandDeviation / STAT_AVGfit)
    'STAT_StandDeviation = CalcStandDeviation

    'ADAPTIVE MUTATION PROB
    'If sTAT_NofGEN Mod 2 = 0 Then '25
    ''    If STAT_PopBestFit / STAT_AVGfit > 0.97 Then MutProb = MutProb + 0.01: If MutProb > 0.98 Then MutProb = 0.98
    ''    If STAT_PopBestFit / STAT_AVGfit < 0.97 Then MutProb = MutProb - 0.01:: If MutProb < 0.01 Then MutProb = 0.01
    '    MutProb = (STAT_PopBestFit / STAT_AVGfit - 0.95) * 10
    '    If MutProb < 0.01 Then MutProb = 0.01
    '
    '''        If STAT_StandDeviation < 0.05 Then MutProb = MutProb + 0.01: If MutProb > 0.9 Then MutProb = 0.9
    '''        If STAT_StandDeviation > 0.05 Then MutProb = MutProb - 0.01:: If MutProb < 0.01 Then MutProb = 0.01

    'MutProb = (1 - STAT_StandDeviation * 100)
    'If MutProb < 0.01 Then MutProb = 0.01


    'End If

End Function


'
Private Function CalcDiversity() As Double

    Dim FitAverage As Double
    Dim Variance   As Double
    Dim Diff       As Double
    Dim DiffPwr    As Double

    Dim Idx        As Long
    Dim G          As Long

    Dim avgGENE()  As Double



GoTo bySumofPairwiseDistances


    ReDim avgGENE(INDI(1).NofG)

    For G = 1 To INDI(1).NofG
        For Idx = 1 To NOI
            avgGENE(G) = avgGENE(G) + INDI(Idx).Gene(G) / NOI
        Next

    Next

    Variance = 0

    For Idx = 1 To NOI
        DiffPwr = 0
        For G = 1 To INDI(1).NofG
            Diff = (INDI(Idx).Gene(G) - avgGENE(G)) / (GeneValuesMax - GeneValuesMin)
            DiffPwr = DiffPwr + Diff * Diff

        Next
        DiffPwr = DiffPwr / (INDI(1).NofG)
        Variance = Variance + DiffPwr
    Next Idx

    Variance = Sqr(Variance)

    If NOI <> 0 Then
        CalcDiversity = Variance  'Sqr(Variance / (NOI))
    Else
        CalcDiversity = 0
    End If

    'CalcDiversity = CalcDiversity / (GeneValuesMax - GeneValuesMin)


bySumofPairwiseDistances:
    '-------------------------------------------------------------------------
    '-------------------------------------------------------------------------
    'Sum of Pair-wise Distances
    '-------------------------------------------------------------------------
    '-------------------------------------------------------------------------
    Dim D          As Double
    Dim DPair      As Double
    Dim Dtot       As Double
    Dim PairN      As Long
    Dim I          As Long
    Dim J          As Long


    Dtot = 0
    PairN = 0
    For I = 1 To NOI - 1
        For J = I + 1 To NOI
            DPair = 0
            For G = 1 To INDI(I).NofG
                D = INDI(I).Gene(G) - INDI(J).Gene(G)
                D = D / (GeneValuesMax - GeneValuesMin)
                D = D * D
                DPair = DPair + D
            Next
            
            DPair = DPair / INDI(I).NofG
            
            DPair = Sqr(DPair)
            
            PairN = PairN + 1
            Dtot = Dtot + DPair
        Next
    Next


    Dtot = Dtot / PairN
    
    CalcDiversity = Dtot * 2
    '-------------------------------------------------------------------------
    '-------------------------------------------------------------------------
    '-------------------------------------------------------------------------
    '-------------------------------------------------------------------------

    'ADAPTIVE MUTATION PROB
    '*CHANGE Mutation Probability according to Population Diversity
    If MutProbAdaptive Then
        If sTAT_NofGEN Mod 2 = 0 Then    '10 '25'
            MutProb = (1 - CalcDiversity) * (MutProbMax - MutProbMin) + MutProbMin
            If MutProb < MutProbMin Then MutProb = MutProbMin
        End If
    End If

    Debug.Print MutProb

End Function



Public Function DrawFitness(ByRef P As PictureBox)
    Dim w          As Single
    Dim H          As Single
    Dim X          As Long
    Dim y1         As Long
    Dim y2         As Long
    Dim Xto        As Single

    Dim Xfrom      As Long

    Dim maxFit     As Single
    Dim I          As Long

    EvaluateFitnesses

    maxFit = -9
    For I = 1 To NOI
        If INDI(I).Fitness > maxFit Then maxFit = INDI(I).Fitness
    Next


    H = P.ScaleHeight / NOI
    w = P.ScaleWidth / (maxFit - STAT_GenerBestFit)

    BitBlt P.hdc, 0, 0, P.ScaleWidth, P.ScaleHeight, P.hdc, 0, 0, vbWhite
    P.FontSize = H \ 2
    For I = 1 To NOI
        Xto = maxFit - INDI(I).Fitness
        Xto = Xto * w
        For X = 1 To Xto
            'P.Line (X, Y1)-(X, Y1 + H - 1), vbRed
            FastLine P.hdc, X, y1, X, y1 + H - 1, 1, vbRed
        Next
        P.CurrentY = y1 + 1
        P.CurrentX = 1
        P.Print I & " [" & INDI(I).Par1 & "." & INDI(I).Par2 & "]  " & Int(INDI(I).Fitness * 1000) * 0.001
        y1 = y1 + H
    Next
    
    Xto = (maxFit - STAT_AVGfit) * w
     FastLine P.hdc, Xto \ 1, 0, Xto \ 1, P.ScaleHeight \ 1, 1, vbGreen

    
    P.Refresh


End Function

