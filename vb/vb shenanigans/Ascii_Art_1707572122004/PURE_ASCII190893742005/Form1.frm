VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7500
   ClientLeft      =   480
   ClientTop       =   1935
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   7500
   ScaleWidth      =   6585
   Begin VB.TextBox Text1 
      Height          =   1935
      Left            =   2280
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   2160
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   615
      Left            =   1800
      TabIndex        =   0
      Top             =   600
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
'load
Dim sFileText As String
Dim sFinal As String
Dim iFileNo As Integer
iFileNo = FreeFile()
Open "D:\maze.maze.txt" For Input As #iFileNo
Do While Not EOF(iFileNo)
  Input #iFileNo, sFileText
sFinal = sFinal & sFileText & vbCrLf
Loop
Close #iFileNo
'copy
Dim inptxt() As String
Dim j As Integer
Dim num As Integer
num = Len(sFinal)
ReDim inptxt(num) As String
For j = 0 To num - 1
inptxt(j) = Mid(sFinal, j + 1, 1)
Next j
'code
 Dim key As Integer
 Dim i As Integer
 key = Asc("b")
Text1.Text = ""
For i = 0 To num - 3
  Text1.Text = Text1.Text + Chr(Asc(inptxt(i)) Xor key)
Next
End Sub

