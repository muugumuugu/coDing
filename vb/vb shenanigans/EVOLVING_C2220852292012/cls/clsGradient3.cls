VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsGradient3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private V(-255 To 255) As Long

Public Property Get GetGrad(I As Long)
    GetGrad = V(I)
End Property

Public Sub Init(R1, G1, B1, R0, G0, B0, R2, G2, B2)
    Dim R          As Long
    Dim G          As Long
    Dim B          As Long

    Dim P1         As Single
    Dim P2         As Single

    For I = 0 To 255
        P1 = I / 255
        P2 = 1 - P1

        R = R2 * P1 + R0 * P2
        G = G2 * P1 + G0 * P2
        B = B2 * P1 + B0 * P2
        V(I) = RGB(R, G, B)

        R = R1 * P1 + R0 * P2
        G = G1 * P1 + G0 * P2
        B = B1 * P1 + B0 * P2
        V(-I) = RGB(R, G, B)

    Next


End Sub

