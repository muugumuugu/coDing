VERSION 5.00
Begin VB.Form frmCalculator 
   BackColor       =   &H00FF8080&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Calculator"
   ClientHeight    =   3030
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5250
   Icon            =   "frmCal.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   5250
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdfunc 
      Caption         =   "int"
      Height          =   375
      Index           =   5
      Left            =   1320
      TabIndex        =   32
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton Command11 
      Caption         =   "^y"
      Height          =   375
      Left            =   1320
      TabIndex        =   31
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command9 
      Caption         =   "e"
      Height          =   375
      Left            =   720
      TabIndex        =   30
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Pi"
      Height          =   375
      Left            =   120
      TabIndex        =   29
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton cmdfunc 
      Caption         =   "log"
      Height          =   375
      Index           =   4
      Left            =   720
      TabIndex        =   28
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton cmdfunc 
      Caption         =   "sqr"
      Height          =   375
      Index           =   3
      Left            =   120
      TabIndex        =   27
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton cmdfunc 
      Caption         =   "Tan"
      Height          =   375
      Index           =   2
      Left            =   1320
      TabIndex        =   26
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton cmdfunc 
      Caption         =   "Cos"
      Height          =   375
      Index           =   1
      Left            =   720
      TabIndex        =   25
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton cmdfunc 
      Caption         =   "Sin"
      Height          =   375
      Index           =   0
      Left            =   120
      TabIndex        =   24
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Exp"
      Height          =   375
      Left            =   1320
      TabIndex        =   23
      Top             =   1080
      Width           =   495
   End
   Begin VB.TextBox Text2 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   285
      Left            =   120
      TabIndex        =   22
      Top             =   600
      Width           =   5055
   End
   Begin VB.CommandButton Command6 
      Caption         =   ")"
      Height          =   375
      Left            =   720
      TabIndex        =   21
      Top             =   1080
      Width           =   495
   End
   Begin VB.CommandButton Command5 
      Caption         =   "("
      Height          =   375
      Left            =   120
      TabIndex        =   20
      Top             =   1080
      Width           =   495
   End
   Begin VB.CommandButton Command3 
      Caption         =   "+/-"
      Height          =   375
      Left            =   3360
      TabIndex        =   19
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton cmdoper 
      Caption         =   "/"
      Height          =   375
      Index           =   3
      Left            =   4680
      TabIndex        =   18
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton cmdoper 
      Caption         =   "*"
      Height          =   375
      Index           =   2
      Left            =   4080
      TabIndex        =   17
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton cmdoper 
      Caption         =   "-"
      Height          =   375
      Index           =   1
      Left            =   4680
      TabIndex        =   16
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton cmdoper 
      Caption         =   "+"
      Height          =   375
      Index           =   0
      Left            =   4080
      TabIndex        =   15
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton Command2 
      Caption         =   "C"
      Height          =   375
      Left            =   4680
      TabIndex        =   14
      Top             =   1080
      Width           =   495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "AC"
      Height          =   375
      Left            =   4080
      TabIndex        =   13
      Top             =   1080
      Width           =   495
   End
   Begin VB.CommandButton cmdequal 
      Caption         =   "="
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   12
      Top             =   2520
      Width           =   1095
   End
   Begin VB.CommandButton cmddecimal 
      Caption         =   "."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2760
      TabIndex        =   11
      Top             =   2520
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   3360
      TabIndex        =   10
      Top             =   1080
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   2760
      TabIndex        =   9
      Top             =   1080
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   2160
      TabIndex        =   8
      Top             =   1080
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   3360
      TabIndex        =   7
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   2760
      TabIndex        =   6
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   2160
      TabIndex        =   5
      Top             =   1560
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   3360
      TabIndex        =   4
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   2760
      TabIndex        =   3
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   2160
      TabIndex        =   2
      Top             =   2040
      Width           =   495
   End
   Begin VB.CommandButton cmdnum 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2160
      TabIndex        =   1
      Top             =   2520
      Width           =   495
   End
   Begin VB.TextBox Text1 
      Height          =   405
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   0
      Text            =   "0"
      Top             =   120
      Width           =   5055
   End
End
Attribute VB_Name = "frmCalculator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmddecimal_Click()
Text1.Text = Text1.Text & "."
End Sub

Private Sub cmdequal_Click()
On Error Resume Next
Dim expression As String
If Mid(Text2.Text, Len(Text2.Text), 1) <> ")" And Command5.Enabled = True Then Text2.Text = Text2.Text + Text1.Text
expression = EditedEqu(Text2.Text)
Call frmMain.Init(expression)
Text1.Text = GetVal(0, 0)
For Each com In Me.Controls
com.Enabled = False
Next
cmdequal.Enabled = True
Command1.Enabled = True
'Command2.Enabled = True
Text1.Enabled = True
Text2.Enabled = True
End Sub

Private Sub cmdfunc_Click(Index As Integer)
Text2.Text = Text2.Text + cmdfunc(Index).Caption + "("
End Sub

Private Sub cmdnum_Click(Index As Integer)
If Text1.Text = "0" Then Text1.Text = ""
Text1.Text = Text1.Text & Index
End Sub

Private Sub cmdoper_Click(Index As Integer)
On Error Resume Next
If Mid(Text2.Text, Len(Text2.Text), 1) <> ")" Then Text2.Text = Text2.Text + Text1.Text
Text1.Text = "0"
Text2.Text = Text2.Text + cmdoper(Index).Caption
End Sub

Private Sub Command1_Click()
Text1.Text = "0"
Text2.Text = ""
For Each com In Me.Controls
com.Enabled = True
Next

End Sub
Private Sub Command11_Click()
On Error Resume Next
If Mid(Text2.Text, Len(Text2.Text), 1) <> ")" Then Text2.Text = Text2.Text + Text1.Text
Text1.Text = "0"
Text2.Text = Text2.Text + "^"
End Sub

Private Sub Command2_Click()
Text1.Text = "0"
End Sub

Private Sub Command3_Click()
Text1.Text = -Val(Text1.Text)
End Sub

Private Sub Command5_Click()
Text2.Text = Text2.Text + "("
End Sub

Private Sub Command6_Click()
Text2.Text = Text2.Text + Text1.Text + ")"
Text1.Text = "0"
End Sub

Private Sub Command7_Click()
On Error Resume Next
If Mid(Text2.Text, Len(Text2.Text), 1) <> ")" Then Text2.Text = Text2.Text + Text1.Text
Text2.Text = Text2.Text + "*10^"
Text1.Text = "0"
End Sub

Private Sub Command8_Click()
Text1.Text = 4 * Atn(1)
End Sub

Private Sub Command9_Click()
Text1.Text = "2.71828182845904"
End Sub

Private Sub Form_Load()
Call frmMain.Init("")
End Sub

Private Sub Text2_Click()
Text2.Refresh

End Sub
