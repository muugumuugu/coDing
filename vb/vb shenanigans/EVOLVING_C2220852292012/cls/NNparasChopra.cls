VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "NNparasChopra"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Don't forget to write option base 1 into the code
' or else this net will not work
'
'Coded by Paras Chopra
'paraschopra@lycos.com
'http://paraschopra.com/
'


'reexre@gmail.com
'Made   MY_SETneuronBIAS    and
'       MY_SETSinapsWEIGHT  to integrate this class with (reexre) Genetic Algorithm Class "SimplyGA2"
'       GetTotalNofNeurons
'       GetTotalNofSinaps
'       DRAW


Option Base 1
Option Explicit

'************************* DRAW NET
Private Type Bitmap
    bmType         As Long
    bmWidth        As Long
    bmHeight       As Long
    bmWidthBytes   As Long
    bmPlanes       As Integer
    bmBitsPixel    As Integer
    bmBits         As Long
End Type

Private Declare Function GetObject Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, ByRef lpObject As Any) As Long
Private Declare Function GetBitmapBits Lib "gdi32" (ByVal hBitmap As Long, ByVal dwCount As Long, ByRef lpBits As Any) As Long
Private Declare Function SetBitmapBits Lib "gdi32" (ByVal hBitmap As Long, ByVal dwCount As Long, ByRef lpBits As Any) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long

'Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (dest As Any, _
 source As Any, ByVal bytes As Long)
Private hBmp       As Bitmap

Private pW         As Long
Private pH         As Long
Private pB         As Long
Private DrawImageHandle As Long
Private DrawImageHDC As Long
Private DrawR      As Long

'***********************************


'Private Const PI As Double = 3.14159265358979


Const E            As Single = 2.7183    'Mathematical const, used in sigmod function

Private Type tSinapse             ' Sinapse connects one neuron to another and allows signal to pass from it
    Weight         As Double      'Weight it has
    WeightChange   As Double      'The change in weight during learning
End Type

Private Type tNeuron              'The main thing
    Sinapses()     As tSinapse    'Array of Denrites
    SinapseCount   As Long        'Number of Sinapses
    Bias           As Double      'The bias
    BiasChange     As Double      'The change in bias during learning
    Value          As Double      'The value to be passed to next layer of neurons
    Delta          As Double      'The delta of neuron (used while learning)
End Type



Private Type tLayer               'Layer contaning number of neurons
    Neurons()      As tNeuron     'Neurons in the layer
    NeuronCount    As Long        'Number of neurons
End Type

Private Type tNeuralNetwork
    Layers()       As tLayer      'Layers in the network
    LayerCount     As Long        'Number of layers
    LearningRate   As Double      'The learning rateof the network
End Type

Dim Network        As tNeuralNetwork    ' Our main network




''reexre
Private fast_N_toLayer()
Private fast_N_toNeuron()

Private fast_S_toLayer()
Private fast_S_toNeuron()
Private fast_S_toSinap()


Public AVGInputSinapsesXNeuron As Long

''

Public DrawHDC     As Long



Function CreateNet(LearningRate As Double, ArrayOFlyers As Variant, ByRef PIC As PictureBox) As Integer    '0 = Unsuccesful and 1 = Successful


    Dim I          As Long
    Dim J          As Long
    Dim K          As Long

    Dim iRET       As Long
    Dim TMPSinap   As Long

    Network.LayerCount = UBound(ArrayOFlyers)    'Init number of layers
    If Network.LayerCount < 2 Then    'Input and output layers must be there
        CreateNet = 0             'Unsuccessful
        Exit Function
    End If
    Network.LearningRate = LearningRate    'The learning rate
    ReDim Network.Layers(Network.LayerCount) As tLayer    'Redim the layers variable
    For I = 1 To UBound(ArrayOFlyers)    ' Initialize all layers
        DoEvents

        Network.Layers(I).NeuronCount = ArrayOFlyers(I)
        ReDim Network.Layers(I).Neurons(Network.Layers(I).NeuronCount) As tNeuron

        For J = 1 To ArrayOFlyers(I)    'Initialize all neurons
            DoEvents
            If I = UBound(ArrayOFlyers) Then    'We will not init Sinapses for it because output layers doesn't have any
                Network.Layers(I).Neurons(J).Bias = GetRand    'Set the bias to random value
                Network.Layers(I).Neurons(J).SinapseCount = ArrayOFlyers(I - 1)



                ReDim Network.Layers(I).Neurons(J).Sinapses(Network.Layers(I).Neurons(J).SinapseCount) As tSinapse    'Redim the Sinapse var
                For K = 1 To ArrayOFlyers(I - 1)
                    DoEvents
                    Network.Layers(I).Neurons(J).Sinapses(K).Weight = GetRand    'Set the weight of each Sinapse
                Next K
            ElseIf I = 1 Then     'Only init Sinapses not bias
                DoEvents          'Do nothing coz it is input layer
            Else
                Network.Layers(I).Neurons(J).Bias = GetRand    'Set the bias to random value
                Network.Layers(I).Neurons(J).SinapseCount = ArrayOFlyers(I - 1)
                ReDim Network.Layers(I).Neurons(J).Sinapses(Network.Layers(I).Neurons(J).SinapseCount) As tSinapse    'Redim the Sinapse var

                For K = 1 To ArrayOFlyers(I - 1)
                    DoEvents
                    Network.Layers(I).Neurons(J).Sinapses(K).Weight = GetRand    'Set the weight of each Sinapse
                Next K
            End If


        Next J


                If I <> Network.LayerCount Then AVGInputSinapsesXNeuron = AVGInputSinapsesXNeuron + Network.Layers(I).NeuronCount

    Next I

    CreateNet = 1


    ''reexre
    I = I - 2
        AVGInputSinapsesXNeuron = AVGInputSinapsesXNeuron / I
    'AVGInputSinapsesXNeuron = (11 + 4 + Network.Layers(2).NeuronCount) / 2


    ReDim fast_N_toLayer(GetTotalNofSinaps)
    ReDim fast_N_toNeuron(GetTotalNofSinaps)

    ReDim fast_S_toLayer(GetTotalNofSinaps)
    ReDim fast_S_toNeuron(GetTotalNofSinaps)
    ReDim fast_S_toSinap(GetTotalNofSinaps)

    MY_InitFAST
    ''reexre



    '************** DRAW
    DrawImageHandle = PIC.Image.Handle
    DrawImageHDC = PIC.hdc

    If DrawImageHandle <> 0 Then
        '    Stop

        iRET = GetObject(DrawImageHandle, Len(hBmp), hBmp)
        '    iRET = GetBitmapBits(DrawImageHandle, hBmp.bmWidthBytes * hBmp.bmHeight, Sbyte(0, 0, 0))

        pW = hBmp.bmWidth         '- 1
        pH = hBmp.bmHeight        '- 1
        pB = (hBmp.bmBitsPixel \ 8) - 1

        DrawR = (pW * pH / GetTotalNofNeurons) / 250
        '    Stop

    End If


End Function


Function RUN(ArrayOfInputs As Variant) As Variant    'It returns the output inf form of array


    Dim I          As Long
    Dim J          As Long
    Dim K          As Long

    If UBound(ArrayOfInputs) <> Network.Layers(1).NeuronCount Then
        RUN = 0
        Exit Function
    End If
    For I = 1 To Network.LayerCount
        DoEvents
        For J = 1 To Network.Layers(I).NeuronCount

            'DoEvents
            If I = 1 Then
                Network.Layers(I).Neurons(J).Value = ArrayOfInputs(J)    'Set the value of input layer
            Else
                Network.Layers(I).Neurons(J).Value = 0    'First set the value to zero
                For K = 1 To Network.Layers(I - 1).NeuronCount
                    'DoEvents
                    Network.Layers(I).Neurons(J).Value = Network.Layers(I).Neurons(J).Value + Network.Layers(I - 1).Neurons(K).Value * Network.Layers(I).Neurons(J).Sinapses(K).Weight    'Calculating the value
                Next K
                Network.Layers(I).Neurons(J).Value = Activation(Network.Layers(I).Neurons(J).Value + Network.Layers(I).Neurons(J).Bias)    'Calculating the real value of neuron
            End If
        Next J
    Next I
    ReDim OutputResult(Network.Layers(Network.LayerCount).NeuronCount) As Double
    For I = 1 To (Network.Layers(Network.LayerCount).NeuronCount)
        DoEvents
        OutputResult(I) = (Network.Layers(Network.LayerCount).Neurons(I).Value)    'The array of output result
    Next I
    RUN = OutputResult
End Function

Function Train(inputdata As Variant, outputdata As Variant) As Integer    '0=unsuccessful and 1 = sucessful
    Dim I          As Long
    Dim J          As Long
    Dim K          As Long

    If UBound(inputdata) <> Network.Layers(1).NeuronCount Then    'Check if correct amount of input is given
        Train = 0
        Exit Function
    End If
    If UBound(outputdata) <> Network.Layers(Network.LayerCount).NeuronCount Then    'Check if correct amount of output is given
        Train = 0
        Exit Function
    End If
    Call RUN(inputdata)           'Calculate values of all neurons and set the input
    'Calculate delta's
    For I = 1 To Network.Layers(Network.LayerCount).NeuronCount
        '    DoEvents
        Network.Layers(Network.LayerCount).Neurons(I).Delta = Network.Layers(Network.LayerCount).Neurons(I).Value * (1 - Network.Layers(Network.LayerCount).Neurons(I).Value) * (outputdata(I) - Network.Layers(Network.LayerCount).Neurons(I).Value)    'Deltas of Output layer
        For J = Network.LayerCount - 1 To 2 Step -1
            '        DoEvents
            For K = 1 To Network.Layers(J).NeuronCount
                DoEvents
                Network.Layers(J).Neurons(K).Delta = Network.Layers(J).Neurons(K).Value * (1 - Network.Layers(J).Neurons(K).Value) * Network.Layers(J + 1).Neurons(I).Sinapses(K).Weight * Network.Layers(J + 1).Neurons(I).Delta    'Deltas of Hidden Layers
            Next K
        Next J
    Next I
    For I = Network.LayerCount To 2 Step -1
        '    DoEvents
        For J = 1 To Network.Layers(I).NeuronCount
            '        DoEvents
            Network.Layers(I).Neurons(J).Bias = Network.Layers(I).Neurons(J).Bias + (Network.LearningRate * 1 * Network.Layers(I).Neurons(J).Delta)    'Calculate new bias
            For K = 1 To Network.Layers(I).Neurons(J).SinapseCount
                DoEvents
                Network.Layers(I).Neurons(J).Sinapses(K).Weight = Network.Layers(I).Neurons(J).Sinapses(K).Weight + (Network.LearningRate * Network.Layers(I - 1).Neurons(K).Value * Network.Layers(I).Neurons(J).Delta)    'Calculate new weights
            Next K
        Next J
    Next I
    Train = 1
End Function


'Function Sigmod(Value As double, Threshold As double)
'Sigmod = 1 / (1 + e ^ (-(Value - Threshold)))
'End Function


Private Function Activation(ByRef Value As Double) As Double
    'If Value < -50 Then Activation = 0: Exit Function
    'If Value > 50 Then Activation = 1: Exit Function

    'To crunch a number between 0 and 1
    'Activation = (1 / (1 + Exp(-Value)))
    
    'Activation = 0.5 * (1 + (Sin(Value * 0.375 - Pi * 0.5)))
    '
    Activation = 0.5 * (1 + (Sin(Value * 0.25 - Pi * 0.5)))


End Function

Function GetRand() As Double      'Produces a number between -1 and 1
    'Randomize
    
    GetRand = 2 - (1 + RndM + RndM)
    'GetRand = RndM
    
End Function

Sub EraseNetwork()
    Erase Network.Layers
End Sub

Function SaveNet(FilePath As String) As Integer    ' 1 = successful, 0 =unsucessful
    Dim I          As Long
    Dim J          As Long
    Dim K          As Long
    Open FilePath For Output As #1
    Print #1, "START Learning Rate"
    Print #1, Network.LearningRate
    Print #1, "END Learning Rate"
    Print #1, "START Layer Count"
    Print #1, Network.LayerCount
    Print #1, "END Layer Count"
    Print #1, "START Input Layer Neuron Count"
    Print #1, Network.Layers(1).NeuronCount
    Print #1, "END Input Layer Neuron Count"
    For I = 2 To Network.LayerCount
        Print #1, "START Next Layer"
        Print #1, "START Neuron Count"
        Print #1, Network.Layers(I).NeuronCount
        Print #1, "END Neuron Count"
        For J = 1 To Network.Layers(I).NeuronCount
            Print #1, "START Neuron"
            Print #1, "START Bias"
            Print #1, Network.Layers(I).Neurons(J).Bias
            Print #1, "END Bias"
            Print #1, "START Sinapses"
            For K = 1 To Network.Layers(I).Neurons(J).SinapseCount
                Print #1, Network.Layers(I).Neurons(J).Sinapses(K).Weight
            Next K
            Print #1, "END Sinapses"
            Print #1, "END Neuron"
        Next J
        Print #1, "END Layer"
    Next I
    Close #1
    SaveNet = 1
End Function

Function LoadNet(FilePath As String) As Integer    ' 1 = successful, 0 =unsucessful
    Dim Data, DataMain As String
    Dim LayerTrack, NeuronTrack As Long    'The variable which tracks the current layer and current neuron
    Dim I          As Long
    If FileExists(FilePath) = 0 Then
        LoadNet = 0               'File doest not exists
        Exit Function
    End If
    Open FilePath For Input As #1
    Do While Not EOF(1)
        DoEvents
        Line Input #1, Data
        Select Case Data
            Case "START Learning Rate":
                Line Input #1, DataMain
                Network.LearningRate = CDbl(DataMain)
            Case "START Layer Count":
                Line Input #1, DataMain
                Network.LayerCount = CLng(DataMain)
                ReDim Network.Layers(Network.LayerCount) As tLayer
            Case "START Input Layer Neuron Count":    'Input layer
                LayerTrack = 1
                Line Input #1, DataMain
                Network.Layers(1).NeuronCount = CLng(DataMain)
                ReDim Network.Layers(1).Neurons(Network.Layers(1).NeuronCount) As tNeuron
            Case "START Neuron Count":
                LayerTrack = LayerTrack + 1
                Line Input #1, DataMain
                Network.Layers(LayerTrack).NeuronCount = CLng(DataMain)
                ReDim Network.Layers(LayerTrack).Neurons(Network.Layers(LayerTrack).NeuronCount) As tNeuron
            Case "START Bias":
                NeuronTrack = NeuronTrack + 1
                Line Input #1, DataMain
                Network.Layers(LayerTrack).Neurons(NeuronTrack).Bias = CDbl(DataMain)
                Network.Layers(LayerTrack).Neurons(NeuronTrack).SinapseCount = Network.Layers(LayerTrack - 1).NeuronCount
                ReDim Network.Layers(LayerTrack).Neurons(NeuronTrack).Sinapses(Network.Layers(LayerTrack).Neurons(NeuronTrack).SinapseCount) As tSinapse
            Case "START Sinapses":
                For I = 1 To Network.Layers(LayerTrack).Neurons(NeuronTrack).SinapseCount    'All the Sinapses
                    DoEvents
                    Line Input #1, DataMain
                    Network.Layers(LayerTrack).Neurons(NeuronTrack).Sinapses(I).Weight = CDbl(DataMain)
                Next I
            Case "END Layer":
                NeuronTrack = 0
            Case Else
                DoEvents
        End Select
    Loop
    Close #1
    LayerTrack = 0
    NeuronTrack = 0
    LoadNet = 1
End Function

' FUNCTION: FileExists
' Determines whether the specified file exists
'
' IN: [strPathName] - file to check for
'
' Returns: True if file exists, False otherwise
'-----------------------------------------------------------
'
Private Function FileExists(ByVal strPathName As String) As Integer
    Dim intFileNum As Integer

    On Error Resume Next

    '
    'Remove any trailing directory separator character
    '
    If Right$(strPathName, 1) = "\" Then
        strPathName = Left$(strPathName, Len(strPathName) - 1)
    End If

    '
    'Attempt to open the file, return value of this function is False
    'if an error occurs on open, True otherwise
    '
    intFileNum = FreeFile
    Open strPathName For Input As intFileNum

    FileExists = IIf(Err, False, True)

    Close intFileNum

    Err = 0
End Function


Public Function GetTotalNofNeurons() As Long
    Dim NN         As Long
    Dim L

    NN = 0

    For L = 1 To Network.LayerCount
        NN = NN + Network.Layers(L).NeuronCount


    Next
    GetTotalNofNeurons = NN

End Function

Public Function GetTotalNofSinaps() As Long
    Dim SS         As Long
    Dim L
    Dim N

    SS = 0
    For L = 1 To Network.LayerCount
        For N = 1 To Network.Layers(L).NeuronCount
            SS = SS + Network.Layers(L).Neurons(N).SinapseCount
        Next
    Next
    GetTotalNofSinaps = SS

End Function

Public Property Get NofInputs()
    NofInputs = Network.Layers(1).NeuronCount
End Property
Public Property Get NofOutputs()
    NofOutputs = Network.Layers(Network.LayerCount).NeuronCount
End Property


Private Sub MY_InitFAST()

    'Stop

    Dim SS
    Dim L
    Dim N
    Dim S
    Dim NN

    SS = 0
    NN = 0
    For L = 1 To Network.LayerCount
        For N = 1 To Network.Layers(L).NeuronCount
            NN = NN + 1

            fast_N_toLayer(NN) = L
            fast_N_toNeuron(NN) = N

            For S = 1 To Network.Layers(L).Neurons(N).SinapseCount

                SS = SS + 1

                fast_S_toLayer(SS) = L
                fast_S_toNeuron(SS) = N
                fast_S_toSinap(SS) = S

            Next
        Next
    Next


End Sub


Public Property Let MY_SETneuronBIAS(wGlobalNeuron As Long, vBIAS)

    Dim L
    Dim N
    L = fast_N_toLayer(wGlobalNeuron)
    N = fast_N_toNeuron(wGlobalNeuron)
    Network.Layers(L).Neurons(N).Bias = vBIAS

End Property


Public Property Let MY_SETSinapsWEIGHT(wGlobalSinap As Long, vWEI)
    Dim L
    Dim N
    Dim S


    L = fast_S_toLayer(wGlobalSinap)
    N = fast_S_toNeuron(wGlobalSinap)
    S = fast_S_toSinap(wGlobalSinap)

    Network.Layers(L).Neurons(N).Sinapses(S).Weight = vWEI


End Property

Public Sub DRAW()
    Dim I          As Long
    Dim J          As Long
    Dim K          As Long

    Dim x1         As Long
    Dim y1         As Long

    Dim x2         As Long
    Dim y2         As Long
    Dim C          As Long
    Dim Cs1        As Single
    Dim Cs2        As Single
    Dim V          As Single


    BitBlt DrawImageHDC, 0, 0, pW, pH, DrawImageHDC, 0, 0, vbBlack

    '   FastLine DrawImageHDC, 0, 0, pW, pH, 2, vbWhite


    For I = 1 To Network.LayerCount
        'DoEvents

        x1 = 20 + ((I - 1) / Network.LayerCount) * (pW - 10)
        For J = 1 To Network.Layers(I).NeuronCount

            y1 = 10 + ((J - 1) / Network.Layers(I).NeuronCount) * (pH - 10)


            '            Cs1 = Network.Layers(I).Neurons(J).Bias
            '            Cs2 = Network.Layers(I).Neurons(J).Value
            '            If Cs1 < 0 Then
            '                If Cs1 < -1 Then Cs1 = -1
            '                C = RGB(-Cs1 * 127, Cs2 * 255, 0)
            '                'C = RGB(0, Cs2 * 255, 0) 'Value
            '
            '            Else
            '                If Cs1 > 1 Then Cs1 = 1
            '                C = RGB(0, Cs2 * 255, Cs1 * 127)
            '                'C = RGB(0, Cs2 * 255, 0) 'Value
            '
            '            End If
            V = Network.Layers(I).Neurons(J).Value
            C = RGB(0, V * 255, 0)

            MyCircle DrawImageHDC, x1, y1, DrawR, 1, C
            For K = 1 To Network.Layers(I).Neurons(J).SinapseCount

                x2 = 20 + ((I - 2) / Network.LayerCount) * (pW - 10)
                y2 = 10 + ((K - 1) / Network.Layers(I).Neurons(J).SinapseCount) * (pH - 10)

                '                Cs1 = Network.Layers(I).Neurons(J).Sinapses(K).Weight
                '                If Cs1 < 0 Then
                '                    If Cs1 < -2 Then Cs1 = -2
                '                    C = RGB(-Cs1 * 127, Cs2 * 255, 0)
                '                Else
                '                    If Cs1 > 2 Then Cs1 = 2
                '                    C = RGB(0, Cs2 * 255, Cs1 * 127)
                '                End If
                'V = Network.Layers(I).Neurons(J).Sinapses(K).Weight * Network.Layers(I - 1).Neurons(K).Value * Network.Layers(I - 1).Neurons(K).Bias
                V = Network.Layers(I).Neurons(J).Sinapses(K).Weight * Network.Layers(I - 1).Neurons(K).Value

                If V < 0 Then
                    If V < -1 Then V = -1
                    C = RGB(-V * 255, 0, 0)
                Else
                    C = RGB(0, V * 255, 0)
                End If
                FastLine DrawImageHDC, x1, y1, x2, y2, 1, C

            Next K

        Next J
    Next I

End Sub

