VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LinDef"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public RecurseDepth As Long
Public Rotation As Single
Public Length As Single
Public Scaling As Single
Public Axiom As String
Public FileName As String
Public Path As String
Public OffSetX As Long
Public OffSetY As Long
Public Direction As Single

Public Rules As Dictionary
Public Symbols As Dictionary

Private FSO As Scripting.FileSystemObject
Private Const SYMBOL As String = "="
Private Const RULE As String = ":"
Private FilePath As String
Public Sub OpenFile(FName As String, FPath As String)
Dim FText As Scripting.TextStream
Dim DblVal As String, DblValSplit() As String

    Clear
    FileName = FName
    Path = FPath
    FilePath = FPath & FName
 
    Set FText = FSO.GetFile(FilePath).OpenAsTextStream(ForReading)
    
    With FText
        Axiom = .ReadLine
        RecurseDepth = .ReadLine
        Rotation = .ReadLine
        Length = .ReadLine
        Scaling = .ReadLine
        OffSetX = .ReadLine
        OffSetY = .ReadLine
        Direction = .ReadLine
        Do
            DblVal = .ReadLine
            If InStr(1, DblVal, RULE) Then
                DblValSplit = Split(DblVal, RULE, 2)
                Rules.Add DblValSplit(0), DblValSplit(1)
            Else
                DblValSplit = Split(DblVal, SYMBOL, 2)
                Symbols.Add DblValSplit(0), DblValSplit(1)
            End If
        Loop Until FText.AtEndOfStream
    End With
    
    
End Sub

Private Sub Initialise()

    Set FSO = New Scripting.FileSystemObject
    Set Rules = New Dictionary
    Set Symbols = New Dictionary
    
    RecurseDepth = 2
    Rotation = 90
    Length = 500
    Scaling = 2
    OffSetX = 1000
    OffSetY = 1000

End Sub

Private Sub Cleanup()
    Set FSO = Nothing
    Set Rules = Nothing
    Set Symbols = Nothing
End Sub

Private Sub Class_Initialize()
    Initialise
End Sub


Private Sub Class_Terminate()
    Cleanup
End Sub



Public Sub SaveFile()
Dim FText As Scripting.TextStream
Dim Index As Long
    
    FilePath = Path & FileName
    Set FText = FSO.CreateTextFile(FilePath)
    With FText
        .WriteLine Axiom
        .WriteLine CStr(RecurseDepth)
        .WriteLine CStr(Rotation)
        .WriteLine CStr(Length)
        .WriteLine CStr(Scaling)
        .WriteLine CStr(OffSetX)
        .WriteLine CStr(OffSetY)
        .WriteLine CStr(Direction)
        For Index = 0 To Rules.Count - 1
            .WriteLine Rules.Keys(Index) & RULE & Rules.Items(Index)
        Next
        For Index = 0 To Symbols.Count - 1
            .WriteLine Symbols.Keys(Index) & SYMBOL & Symbols.Items(Index)
        Next
    End With
    

End Sub

Public Function CreateCopy() As LinDef
Dim PCopy As LinDef
Dim Index As Long

    Set PCopy = New LinDef
    With PCopy
        .Axiom = Axiom
        .Path = Path
        .FileName = FileName
        .Length = Length
        .RecurseDepth = RecurseDepth
        .Rotation = Rotation
        .Scaling = Scaling
        .OffSetX = OffSetX
        .OffSetY = OffSetY
        .Direction = Direction
        For Index = 0 To Rules.Count - 1
            .Rules.Add Rules.Keys(Index), Rules.Items(Index)
        Next
        For Index = 0 To Symbols.Count - 1
            .Symbols.Add Symbols.Keys(Index), Symbols.Items(Index)
        Next
    End With
    
    Set CreateCopy = PCopy
    
    
End Function
Public Sub SetDefinition(LindenDef As LinDef)
Dim Index As Long

    With LindenDef
        Axiom = .Axiom
        Path = .Path
        FileName = .FileName
        Length = .Length
        RecurseDepth = .RecurseDepth
        Rotation = .Rotation
        Scaling = .Scaling
        OffSetX = .OffSetX
        OffSetY = .OffSetY
        Direction = .Direction
        Rules.RemoveAll
        For Index = 0 To .Rules.Count - 1
            Rules.Add .Rules.Keys(Index), .Rules.Items(Index)
        Next
        Symbols.RemoveAll
        For Index = 0 To .Symbols.Count - 1
            Symbols.Add .Symbols.Keys(Index), .Symbols.Items(Index)
        Next
    End With
    
End Sub


Public Sub Clear()

    RecurseDepth = 0
    Rotation = 0
    Length = 0
    Scaling = 0
    Axiom = ""
    OffSetX = 0
    OffSetY = 0
    Direction = 0
    Rules.RemoveAll
    Symbols.RemoveAll
 
End Sub
