VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BranchStack"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public X As Single
Public Y As Single
Public Direction As Single

Private mIndex As Long
Private mStack As Dictionary

Private Sub Initialise()
    Set mStack = New Dictionary
End Sub

Private Sub Cleanup()
    Set mStack = Nothing
End Sub

Public Sub StartBranch(X1 As Single, Y1 As Single, Dir As Single)
Dim BrData(1 To 3) As Single

    mIndex = mIndex + 1
    
    BrData(1) = X1
    BrData(2) = Y1
    BrData(3) = Dir
    
    mStack.Add mIndex, BrData

End Sub

Public Sub EndBranch()
Dim BrData() As Single

    BrData = mStack.Item(mIndex)
    mStack.Remove mIndex
    
    X = BrData(1)
    Y = BrData(2)
    Direction = BrData(3)
    
    mIndex = mIndex - 1

End Sub

Public Property Get Depth() As Long
    Depth = mIndex
End Property

Private Sub Class_Initialize()
Initialise
End Sub

Private Sub Class_Terminate()
Cleanup
End Sub

