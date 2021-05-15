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
'       MY_SETSinapsWEIGHT  to integrate this class with (reexre) Genetic Algorithm Class "SimplyGA"
'       GetTotalNofNeurons
'       GetTotalNofSinaps



Option Base 1
Option Explicit

Const E = 2.7183 'Mathematical const, used in sigmod function

Private Type tSinapse ' Sinapse connects one neuron to another and allows signal to pass from it
    Weight As Double 'Weight it has
    WeightChange As Double 'The change in weight during learning
End Type

Private Type tNeuron 'The main thing
    Sinapses() As tSinapse 'Array of Denrites
    SinapseCount As Long 'Number of Sinapses
    Bias As Double 'The bias
    BiasChange As Double 'The change in bias during learning
    Value As Double 'The value to be passed to next layer of neurons
    Delta As Double 'The delta of neuron (used while learning)
End Type



Private Type tLayer 'Layer contaning number of neurons
    Neurons() As tNeuron 'Neurons in the layer
    NeuronCount As Long 'Number of neurons
End Type

Private Type tNeuralNetwork
    Layers() As tLayer 'Layers in the network
    LayerCount As Long 'Number of layers
    LearningRate As Double 'The learning rateof the network
End Type

Dim Network As tNeuralNetwork ' Our main network




''reexre
Dim fast_N_toLayer()
Dim fast_N_toNeuron()

Dim fast_S_toLayer()
Dim fast_S_toNeuron()
Dim fast_S_toSinap()
''



Function CreateNet(LearningRate As Double, ArrayOFlyers As Variant) As Integer '0 = Unsuccesful and 1 = Successful
Dim I, j, k As Integer
Network.LayerCount = UBound(ArrayOFlyers) 'Init number of layers
If Network.LayerCount < 2 Then 'Input and output layers must be there
    CreateNet = 0 'Unsuccessful
    Exit Function
End If
Network.LearningRate = LearningRate 'The learning rate
ReDim Network.Layers(Network.LayerCount) As tLayer 'Redim the layers variable
For I = 1 To UBound(ArrayOFlyers) ' Initialize all layers
    DoEvents
    Network.Layers(I).NeuronCount = ArrayOFlyers(I)
    ReDim Network.Layers(I).Neurons(Network.Layers(I).NeuronCount) As tNeuron
    For j = 1 To ArrayOFlyers(I) 'Initialize all neurons
        DoEvents
        If I = UBound(ArrayOFlyers) Then 'We will not init Sinapses for it because output layers doesn't have any
            Network.Layers(I).Neurons(j).Bias = GetRand 'Set the bias to random value
            Network.Layers(I).Neurons(j).SinapseCount = ArrayOFlyers(I - 1)
            ReDim Network.Layers(I).Neurons(j).Sinapses(Network.Layers(I).Neurons(j).SinapseCount) As tSinapse 'Redim the Sinapse var
            For k = 1 To ArrayOFlyers(I - 1)
                DoEvents
                Network.Layers(I).Neurons(j).Sinapses(k).Weight = GetRand 'Set the weight of each Sinapse
            Next k
        ElseIf I = 1 Then 'Only init Sinapses not bias
            DoEvents 'Do nothing coz it is input layer
        Else
            Network.Layers(I).Neurons(j).Bias = GetRand 'Set the bias to random value
            Network.Layers(I).Neurons(j).SinapseCount = ArrayOFlyers(I - 1)
            ReDim Network.Layers(I).Neurons(j).Sinapses(Network.Layers(I).Neurons(j).SinapseCount) As tSinapse 'Redim the Sinapse var
            For k = 1 To ArrayOFlyers(I - 1)
                DoEvents
                Network.Layers(I).Neurons(j).Sinapses(k).Weight = GetRand 'Set the weight of each Sinapse
            Next k
        End If
    Next j
Next I
CreateNet = 1



''reexre
ReDim fast_N_toLayer(GetTotalNofSinaps)
ReDim fast_N_toNeuron(GetTotalNofSinaps)

ReDim fast_S_toLayer(GetTotalNofSinaps)
ReDim fast_S_toNeuron(GetTotalNofSinaps)
ReDim fast_S_toSinap(GetTotalNofSinaps)


MY_InitFAST
''reexre


End Function


Function RUN(ArrayOfInputs As Variant) As Variant 'It returns the output inf form of array
Dim I, j, k As Integer
If UBound(ArrayOfInputs) <> Network.Layers(1).NeuronCount Then
    RUN = 0
    Exit Function
End If
For I = 1 To Network.LayerCount
    DoEvents
    For j = 1 To Network.Layers(I).NeuronCount
        DoEvents
        If I = 1 Then
            Network.Layers(I).Neurons(j).Value = ArrayOfInputs(j) 'Set the value of input layer
        Else
            Network.Layers(I).Neurons(j).Value = 0 'First set the value to zero
            For k = 1 To Network.Layers(I - 1).NeuronCount
                'DoEvents
                Network.Layers(I).Neurons(j).Value = Network.Layers(I).Neurons(j).Value + Network.Layers(I - 1).Neurons(k).Value * Network.Layers(I).Neurons(j).Sinapses(k).Weight 'Calculating the value
            Next k
            Network.Layers(I).Neurons(j).Value = Activation(Network.Layers(I).Neurons(j).Value + Network.Layers(I).Neurons(j).Bias) 'Calculating the real value of neuron
        End If
    Next j
Next I
ReDim OutputResult(Network.Layers(Network.LayerCount).NeuronCount) As Double
For I = 1 To (Network.Layers(Network.LayerCount).NeuronCount)
    DoEvents
    OutputResult(I) = (Network.Layers(Network.LayerCount).Neurons(I).Value) 'The array of output result
Next I
RUN = OutputResult
End Function

Function Train(inputdata As Variant, outputdata As Variant) As Integer '0=unsuccessful and 1 = sucessful
Dim I, j, k As Integer
If UBound(inputdata) <> Network.Layers(1).NeuronCount Then 'Check if correct amount of input is given
    Train = 0
    Exit Function
End If
If UBound(outputdata) <> Network.Layers(Network.LayerCount).NeuronCount Then 'Check if correct amount of output is given
    Train = 0
    Exit Function
End If
Call RUN(inputdata) 'Calculate values of all neurons and set the input
'Calculate delta's
For I = 1 To Network.Layers(Network.LayerCount).NeuronCount
    DoEvents
    Network.Layers(Network.LayerCount).Neurons(I).Delta = Network.Layers(Network.LayerCount).Neurons(I).Value * (1 - Network.Layers(Network.LayerCount).Neurons(I).Value) * (outputdata(I) - Network.Layers(Network.LayerCount).Neurons(I).Value) 'Deltas of Output layer
    For j = Network.LayerCount - 1 To 2 Step -1
        DoEvents
        For k = 1 To Network.Layers(j).NeuronCount
            DoEvents
            Network.Layers(j).Neurons(k).Delta = Network.Layers(j).Neurons(k).Value * (1 - Network.Layers(j).Neurons(k).Value) * Network.Layers(j + 1).Neurons(I).Sinapses(k).Weight * Network.Layers(j + 1).Neurons(I).Delta 'Deltas of Hidden Layers
        Next k
    Next j
Next I
For I = Network.LayerCount To 2 Step -1
    DoEvents
    For j = 1 To Network.Layers(I).NeuronCount
        DoEvents
        Network.Layers(I).Neurons(j).Bias = Network.Layers(I).Neurons(j).Bias + (Network.LearningRate * 1 * Network.Layers(I).Neurons(j).Delta) 'Calculate new bias
        For k = 1 To Network.Layers(I).Neurons(j).SinapseCount
            DoEvents
            Network.Layers(I).Neurons(j).Sinapses(k).Weight = Network.Layers(I).Neurons(j).Sinapses(k).Weight + (Network.LearningRate * Network.Layers(I - 1).Neurons(k).Value * Network.Layers(I).Neurons(j).Delta) 'Calculate new weights
        Next k
    Next j
Next I
Train = 1
End Function


'Function Sigmod(Value As Double, Threshold As Double)
'Sigmod = 1 / (1 + e ^ (-(Value - Threshold)))
'End Function


Private Function Activation(Value As Double)
'If Value < -50 Then Activation = 0: Exit Function
'If Value > 50 Then Activation = 1: Exit Function

'To crunch a number between 0 and 1
Activation = (1 / (1 + Exp(Value * -1)))
End Function

Function GetRand() As Double 'Produces a number between -1 and 1
Randomize
GetRand = 2 - (1 + Rnd + Rnd)
'GetRand = Rnd
End Function

Sub EraseNetwork()
Erase Network.Layers
End Sub

Function SaveNet(FilePath As String) As Integer ' 1 = successful, 0 =unsucessful
Dim I, j, k As Integer
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
    For j = 1 To Network.Layers(I).NeuronCount
        Print #1, "START Neuron"
        Print #1, "START Bias"
        Print #1, Network.Layers(I).Neurons(j).Bias
        Print #1, "END Bias"
        Print #1, "START Sinapses"
        For k = 1 To Network.Layers(I).Neurons(j).SinapseCount
            Print #1, Network.Layers(I).Neurons(j).Sinapses(k).Weight
        Next k
        Print #1, "END Sinapses"
        Print #1, "END Neuron"
    Next j
    Print #1, "END Layer"
Next I
Close #1
SaveNet = 1
End Function

Function LoadNet(FilePath As String) As Integer ' 1 = successful, 0 =unsucessful
Dim Data, DataMain As String
Dim LayerTrack, NeuronTrack As Long 'The variable which tracks the current layer and current neuron
Dim I As Long
If FileExists(FilePath) = 0 Then
    LoadNet = 0 'File doest not exists
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
        Case "START Input Layer Neuron Count": 'Input layer
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
            For I = 1 To Network.Layers(LayerTrack).Neurons(NeuronTrack).SinapseCount 'All the Sinapses
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
Dim NN As Long
Dim L

NN = 0

For L = 1 To Network.LayerCount
    NN = NN + Network.Layers(L).NeuronCount
    
    
Next
GetTotalNofNeurons = NN

End Function

Public Function GetTotalNofSinaps() As Long
Dim SS As Long
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


Public Property Let MY_SETneuronBIAS(wGlobalNeuron, vBIAS)

Dim L
Dim N
L = fast_N_toLayer(wGlobalNeuron)
N = fast_N_toNeuron(wGlobalNeuron)
Network.Layers(L).Neurons(N).Bias = vBIAS

End Property


Public Property Let MY_SETSinapsWEIGHT(wGlobalSinap, vWEI)
Dim L
Dim N
Dim S


L = fast_S_toLayer(wGlobalSinap)
N = fast_S_toNeuron(wGlobalSinap)
S = fast_S_toSinap(wGlobalSinap)

Network.Layers(L).Neurons(N).Sinapses(S).Weight = vWEI


End Property
