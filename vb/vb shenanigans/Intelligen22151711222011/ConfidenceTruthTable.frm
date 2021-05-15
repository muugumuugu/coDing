VERSION 5.00
Begin VB.Form ConfidenceTruthTable 
   Caption         =   "Confidence Truth Table"
   ClientHeight    =   8475
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9615
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   565
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   641
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox TTPic 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7755
      Index           =   1
      Left            =   4860
      ScaleHeight     =   513
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   293
      TabIndex        =   4
      Top             =   660
      Width           =   4455
   End
   Begin VB.VScrollBar VScroll 
      Height          =   7755
      Index           =   1
      Left            =   9300
      TabIndex        =   3
      Top             =   660
      Width           =   255
   End
   Begin VB.CommandButton SaveCommand 
      Caption         =   "Save Settings"
      Height          =   375
      Left            =   7860
      TabIndex        =   2
      Top             =   480
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.VScrollBar VScroll 
      Height          =   7755
      Index           =   0
      Left            =   4500
      TabIndex        =   1
      Top             =   660
      Width           =   255
   End
   Begin VB.PictureBox TTPic 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7755
      Index           =   0
      Left            =   60
      ScaleHeight     =   513
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   293
      TabIndex        =   0
      Top             =   660
      Width           =   4455
   End
   Begin VB.Label Label3 
      Caption         =   "Note:  Truth Tables are filled while the algorithm runs.  May take several minutes to complete after starting."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   60
      Width           =   9435
   End
   Begin VB.Label Label2 
      Caption         =   "Forward/Reverse"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   420
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "Left/Right"
      Height          =   255
      Left            =   4920
      TabIndex        =   5
      Top             =   420
      Width           =   1155
   End
End
Attribute VB_Name = "ConfidenceTruthTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim X, Y As Long
Dim X1, Y1, X2, Y2 As Long
Dim N As Long
Dim TTString(1, 1000) As String
Dim TxtLines As Long
Dim MouseN As Long
Dim TxtHei As Long
Dim B1, B2, B3, B4, B5, B6, B7 As Long
Dim H1, H2 As String
Dim IncDecStr As String
Dim IncDec As Long
Public PathString As String
Dim FSO

Private Sub Form_Load()
  TxtHei = TTPic(0).TextHeight("H")
  TxtLines = Fix(TTPic(0).Height / TxtHei) - 1
  VScroll(0).Min = 0
  VScroll(0).Max = (2 ^ 6) - TxtLines
  VScroll(0) = 0
  VScroll(1).Min = 0
  VScroll(1).Max = (2 ^ 6) - TxtLines
  VScroll(1) = 0
  Set FSO = CreateObject("Scripting.FileSystemObject")
End Sub

Private Sub VScroll_Change(Index As Integer)
   Call DrawTruthTable(Index)
End Sub
Private Sub VScroll_Scroll(Index As Integer)
   Call DrawTruthTable(Index)
End Sub

Public Sub FillTruthTables(TT() As Long)
Dim Index As Integer
 For Index = 0 To 1
           N = 0
  For B6 = 0 To 1
   For B5 = 0 To 1
    For B4 = 0 To 1
     For B3 = 0 To 1
      For B2 = 0 To 1
       For B1 = 0 To 1
           IncDec = TT(Index, B6, B5, B4, B3, B2, B1)
           IncDecStr = ""
        If IncDec = 1 Then IncDecStr = "Inc"
        If IncDec = -1 Then IncDecStr = "Dec"
           TTString(Index, N) = " " & Format(N, "00") & "   " & Str(B6) & "   " & Str(B5) & "   " & Str(B4) & "   " & Str(B3) & "   " & Str(B2) & "   " & Str(B1) & "    " & IncDecStr
           N = N + 1
       Next B1
      Next B2
     Next B3
    Next B4
   Next B5
  Next B6
   Call DrawTruthTable(Index)
 Next Index
End Sub

Private Sub DrawTruthTable(Index As Integer) '(TruthTable() As Byte)
     TTPic(Index).Cls
     TTPic(Index).FillStyle = 0
     TTPic(Index).DrawWidth = 1
'Draw Header
     TTPic(Index).Font.Underline = True
     H1 = " Nm   LEye REye LTwd RTwd Corr Spin "
     H2 = " Conf"
     TTPic(Index).Print H1 & H2
     TTPic(Index).Font.Underline = False
'Print text lines to screen.
     X2 = TTPic(Index).Width - 5
 For N = VScroll(Index) To VScroll(Index) + TxtLines
   If Right(TTString(Index, N), 3) = "Inc" Then
       TTPic(Index).FillColor = RGB(230, 255, 255)
   Else
     If Right(TTString(Index, N), 3) = "Dec" Then
       TTPic(Index).FillColor = RGB(255, 230, 230)
     Else
       TTPic(Index).FillColor = RGB(230, 230, 230)
     End If
   End If
     Y = TxtHei * (N - VScroll(Index) + 1)
       TTPic(Index).Line (X2, Y)-(0, Y + TxtHei), vbBlack, B
       TTPic(Index).CurrentY = Y
       TTPic(Index).Print TTString(Index, N)
 Next N
'Draw Vertical Lines
  Y = TxtHei * (TxtLines + 1)
  X = TTPic(Index).TextWidth("1234")
  TTPic(Index).Line (X, 0)-(X, Y)
  X = TTPic(Index).TextWidth(H1)
  TTPic(Index).Line (X, 0)-(X, Y)
End Sub

Public Sub TTPic_MouseDown(Index As Integer, Button As Integer, Shift As Integer, XM As Single, YM As Single)
 Exit Sub  'Truth Table change is turned off. Not needed for this version of program. Tables only filled.
   MouseN = (Fix(YM / TxtHei) - 1) + VScroll(Index)
      IncDecStr = Right(TTString(Index, MouseN), 3)
      TTString(Index, MouseN) = Left(TTString(Index, MouseN), Len(TTString(Index, MouseN)) - 3)
   If IncDecStr = "Inc" Then
      IncDecStr = "Dec"
      IncDec = -1
   Else
      IncDecStr = "Inc"
      IncDec = 1
   End If
      TTString(Index, MouseN) = TTString(Index, MouseN) + IncDecStr
  Call DrawTruthTable(Index)
  Call ChangeTruthTable(Index, MouseN, IncDec)
End Sub

Public Sub SaveTruthTableFile()
  Open App.Path & "\TruthTableFwdRev.Txt" For Output As #1
  Open App.Path & "\TruthTableLftRgt.Txt" For Output As #2
 For B6 = 0 To 1
  For B5 = 0 To 1
   For B4 = 0 To 1
    For B3 = 0 To 1
     For B2 = 0 To 1
      For B1 = 0 To 1
'        Print #1, TruthTable(0, B6, B5, B4, B3, B2, B1)
'        Print #2, TruthTable(1, B6, B5, B4, B3, B2, B1)
      Next B1
     Next B2
    Next B3
   Next B4
  Next B5
 Next B6
     Close #2
     Close #1
End Sub

Public Sub ChangeTruthTable(Index As Integer, MouseN As Long, IncDec As Long)
   B1 = MouseN And 1
   B2 = (MouseN And 2) / 2
   B3 = (MouseN And 4) / 4
   B4 = (MouseN And 8) / 8
   B5 = (MouseN And 16) / 16
   B6 = (MouseN And 32) / 32
'  TT(Index, B6, B5, B4, B3, B2, B1) = IncDec
End Sub

Public Sub SaveTruthTable(Index As Integer)
 Open ConfidenceTruthTable.PathString For Output As #1
  For B6 = 0 To 1
   For B5 = 0 To 1
    For B4 = 0 To 1
     For B3 = 0 To 1
      For B2 = 0 To 1
       For B1 = 0 To 1
'         Print #1, TT(Index, B6, B5, B4, B3, B2, B1)
       Next B1
      Next B2
     Next B3
    Next B4
   Next B5
  Next B6
 Close #1
End Sub


