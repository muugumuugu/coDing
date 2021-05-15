VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsGraph"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Type tGraphLine
    MinY           As Single
    MaxY           As Single
    Val()          As Single
End Type


Public MinX        As Long
Public MaxX        As Long

Public NGL         As Long

Private GL()       As tGraphLine

Public XRange      As Long



Public Sub AddGraphLine(Optional Nlines = 1)
    Dim I          As Long
    Dim PN         As Long
    PN = NGL
    NGL = NGL + Nlines
    ReDim Preserve GL(NGL)

    For I = PN + 1 To NGL
        GL(I).MaxY = -1E+20
        GL(I).MinY = 1E+20
        ReDim Preserve GL(I).Val(1)
    Next

End Sub

Private Sub FindMaxMinY()
    Dim I          As Long
    Dim V          As Long

    If MinX < 1 Then MinX = 1


    For I = 1 To NGL
        With GL(I)
            .MaxY = -9999999999#
            .MinY = 9999999999#
        End With
    Next


    For I = 1 To NGL
        With GL(I)
            For V = MinX + 1 To MaxX
                If .Val(V) > .MaxY Then .MaxY = .Val(V)
                If .Val(V) < .MinY Then .MinY = .Val(V)

            Next
            If .MaxY = .MinY Then .MaxY = .MaxY + 0.001
        End With

    Next


    'THIS IS TO MAKE line1 and Line2  to have the SAME MIN MAX
    If GL(1).MaxY > GL(2).MaxY Then GL(2).MaxY = GL(1).MaxY
    If GL(2).MaxY > GL(1).MaxY Then GL(1).MaxY = GL(2).MaxY
    If GL(1).MinY < GL(2).MinY Then GL(2).MinY = GL(1).MinY
    If GL(2).MinY < GL(1).MinY Then GL(1).MinY = GL(2).MinY
    'GL(1).MinY = 0
    'GL(2).MinY = 0

End Sub

Public Sub ADDValue(wGL, wX, Value)
    Dim I          As Long

    With GL(wGL)
        If MinX > wX Then MinX = wX
        If MaxX < wX Then
            MaxX = wX:
            'ReDim Preserve .Val(MaxX)
            For I = 1 To NGL
                ReDim Preserve GL(I).Val(MaxX)
            Next

        End If

        .Val(wX) = Value
    End With
End Sub


Public Sub DRAW(ByRef P As PictureBox)
    Dim cMinY      As Single
    Dim cMaxY      As Single
    Dim PX         As Single
    Dim PY         As Single
    Dim x1         As Long
    Dim y1         As Long
    Dim x2         As Long
    Dim y2         As Long

    Dim I          As Long
    Dim V          As Long
    Dim KY         As Single

    Dim Smax As String
    Dim Smin As String
    
    
    P.Cls
    PX = P.Width - 2
    PY = P.Height - 2

    If XRange <> 0 Then
        MinX = MaxX - XRange
    Else
        MinX = 1
    End If

    FindMaxMinY


'Vetical Line Every 50
    For V = MaxX To MinX + 1 Step -1
        If V Mod 50 = 0 Then
            x1 = (V - MinX) * PX / (MaxX - MinX)
            P.Line (x1, 0)-(x1, P.ScaleHeight), vbWhite
        End If
    Next
'--------------------
Smax = "MAX: "
Smin = "MIN: "
    For I = 1 To NGL
        If (GL(I).MaxY - GL(I).MinY) > 0.000001 Then
        KY = PY / (GL(I).MaxY - GL(I).MinY)
        Else
        KY = 1000000
        End If
        
        For V = MaxX To MinX + 1 Step -1

            x1 = (V - MinX) * PX / (MaxX - MinX)
            x2 = (V - MinX - 1) * PX / (MaxX - MinX)

            y1 = PY - KY * (GL(I).Val(V) - GL(I).MinY)
            y2 = PY - KY * (GL(I).Val(V - 1) - GL(I).MinY)

            P.Line (x1, y1)-(x2, y2), QBColor(I)


        Next
    
        Smax = Smax & "(" & I & ") " & Format(GL(I).MaxY, "0.0000") & vbTab
        Smin = Smin & "(" & I & ") " & Format(GL(I).MinY, "0.0000") & vbTab
    Next
    P.CurrentX = 2
    P.CurrentY = 5
    P.Print Smax 'GL(1).MaxY
    P.CurrentX = 2
    P.CurrentY = PY - 20
    P.Print Smin 'GL(1).MinY

End Sub


Private Sub Class_Initialize()

    MinX = 999999999#
    MaxX = -999999999#

End Sub
