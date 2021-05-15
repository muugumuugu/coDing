VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cCells"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'local variable to hold collection
Private mcolCells As Collection

Friend Function Add(X, Y, Data) As cCell
    Dim NewCell As New cCell
    With NewCell
        .X = X
        .Y = Y
        .Data = Data
    End With

    'create a new object
    mcolCells.Add NewCell, (X & "," & Y)
    'return the object created
    Set Add = NewCell

End Function

Public Property Get Item(Index As Variant) As cCell
Attribute Item.VB_UserMemId = 0
    ' This item routine is a slight modification from the norm
    ' If an invalid or unmatched key is passed then this property returns a Nothing object rather than an error
    Dim Clss As cCell
    On Error Resume Next
    Set Clss = mcolCells(Index)
    '
    If Err <> 0 Then
        Set Item = Nothing
    Else
        Set Item = Clss
    End If
End Property

Public Property Get Count() As Long
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mcolCells.Count
End Property

Public Sub Remove(vntIndexKey As Variant)
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)
    mcolCells.Remove vntIndexKey
End Sub

Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mcolCells.[_NewEnum]
End Property

Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mcolCells = New Collection
End Sub

Private Sub Class_Terminate()
    'destroys collection when this class is terminated
    Set mcolCells = Nothing
End Sub

Public Sub Clear()
    'clears and recreates the collection
    Set mcolCells = New Collection
End Sub

