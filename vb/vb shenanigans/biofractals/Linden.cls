VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Linden"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Option Base 1
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)

Private mLinDef As LinDef
Private mBStack As BranchStack
Private mLindenStrings As Dictionary
Private mScaling As Dictionary
Private mCanvas As ICanvas
Private mX1 As Single
Private mY1 As Single
Private mX2 As Single
Private mY2 As Single
Private mDirection As Single
Private mRotation As Single


Private Const DRAWMOVE As String = "F"
Private Const JUSTMOVE As String = "f"
Private Const ROTATE_L As String = "-"
Private Const ROTATE_R As String = "+"
Private Const BRANCH_1 As String = "["
Private Const BRANCH_2 As String = "]"

Private Const PI As Single = 3.14159265358979

Public Function RndNum(Min As Long, max As Long, Optional AvoidThis As Variant) As Integer

    RndNum = Int((max - Min + 1) * Rnd + Min)
    
End Function


Public Sub SetDefinition(LindenDef As LinDef)

    Clear
    Set mLinDef = LindenDef
    mRotation = mLinDef.Rotation * (PI / 180)
    RecurseToDepth
    
End Sub



Private Function RecurseToDepth()
Dim Index As Long, Recursions As Long, Length  As Single
Dim LinStr As String, NewLinStr As String, Char As String
Dim BStr() As Byte, Bchr(1 To 2) As Byte

    Length = mLinDef.Length
    LinStr = mLinDef.Axiom

    For Recursions = 1 To mLinDef.RecurseDepth
        BStr = LinStr
        For Index = 0 To LenB(LinStr) - 1 Step 2
            CopyMemory Bchr(1), BStr(Index), 2
            Char = CStr(Bchr)
            If mLinDef.Rules.Exists(Char) Then
                NewLinStr = NewLinStr & mLinDef.Rules(Char)
            Else
                NewLinStr = NewLinStr & Char
            End If
        Next
        Length = Length / mLinDef.Scaling
        mLindenStrings.Add Recursions, NewLinStr
        mScaling.Add Recursions, Length
        LinStr = NewLinStr
        NewLinStr = ""
    Next
    
End Function

Private Sub Cleanup()

    Set mLindenStrings = Nothing
    Set mScaling = Nothing
    Set mBStack = Nothing
    Set mLinDef = Nothing
    Set mCanvas = Nothing
    
End Sub

Private Sub Class_Initialize()
    Initialise
End Sub

Private Sub Class_Terminate()
    Cleanup
End Sub







Public Sub Clear()
    mLindenStrings.RemoveAll
    mScaling.RemoveAll
    mCanvas.Clear
End Sub

Public Sub SetCanvas(CallBackTarget As ICanvas)
    Set mCanvas = CallBackTarget
End Sub




Public Sub TurtleDraw(Recursion As Long)

    With mCanvas
        .Clear
        .PrintText Left(mLinDef.FileName, Len(mLinDef.FileName) - 4)
        .PrintText "Recursion Depth = " & Recursion
        '.PrintText mLindenStrings.Item(Recursion)
    End With
    With mLinDef
        mX1 = .OffSetX
        mY1 = .OffSetY
        mDirection = .Direction * (PI / 180)
    End With
    
    RecurseDraw Recursion, mLindenStrings.Item(Recursion)
    
End Sub



Private Sub Initialise()
    Set mLindenStrings = New Dictionary
    Set mScaling = New Dictionary
    Set mBStack = New BranchStack
End Sub

Public Function GetDepth() As Long
    GetDepth = mLindenStrings.Count
End Function

Public Sub TurtleMove(MovementCode As String, Scaling As Single)

    Select Case MovementCode
        Case DRAWMOVE
            mX2 = mX1 + (Scaling * Cos(mDirection))
            mY2 = mY1 + (Scaling * Sin(mDirection))
            mCanvas.DrawLine mX1, mY1, mX2, mY2
            mX1 = mX2
            mY1 = mY2
        Case JUSTMOVE
            mX1 = mX1 + (Scaling * Cos(mDirection))
            mY1 = mY1 + (Scaling * Sin(mDirection))
        Case ROTATE_R
            mDirection = mDirection - mRotation
        Case ROTATE_L
            mDirection = mDirection + mRotation
        Case BRANCH_1
            mBStack.StartBranch mX1, mY1, mDirection
        Case BRANCH_2
            With mBStack
                .EndBranch
                mX1 = .X
                mY1 = .Y
                mDirection = .Direction
            End With
    End Select

End Sub

Public Sub RecurseDraw(Recursion As Long, BStr() As Byte)
Dim Bchr(1 To 2) As Byte
Dim Index As Long
Dim Char As String

    For Index = 0 To UBound(BStr) - 1 Step 2
        CopyMemory Bchr(1), BStr(Index), 2
        Char = CStr(Bchr)
        If mLinDef.Symbols.Exists(Char) Then
            RecurseDraw Recursion, mLinDef.Symbols(Char)
        Else
            TurtleMove Char, mScaling.Item(Recursion)
        End If
    Next
    
End Sub

