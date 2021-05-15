VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Memo"
   ClientHeight    =   5970
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5520
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5970
   ScaleMode       =   0  'User
   ScaleWidth      =   6001.396
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   360
      Top             =   4560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Load"
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
      Left            =   3600
      TabIndex        =   4
      Top             =   4680
      Width           =   855
   End
   Begin VB.Frame Frame2 
      Height          =   1575
      Left            =   893
      TabIndex        =   7
      Top             =   4200
      Width           =   3735
      Begin VB.CommandButton Command5 
         Caption         =   "&Exit"
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
         Left            =   2040
         TabIndex        =   6
         Top             =   960
         Width           =   855
      End
      Begin VB.CommandButton Command4 
         Caption         =   "&Main"
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
         Left            =   720
         TabIndex        =   5
         Top             =   960
         Width           =   855
      End
      Begin VB.CommandButton Command2 
         Caption         =   "&Save"
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
         Left            =   1440
         TabIndex        =   3
         Top             =   480
         Width           =   855
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&Clear"
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
         Left            =   240
         TabIndex        =   2
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Memo:-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3855
      Left            =   180
      TabIndex        =   0
      Top             =   240
      Width           =   5160
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3255
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   1
         Top             =   360
         Width           =   4695
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Text1.Text = ""
End Sub
Private Sub Command2_Click()
Dim iFile As Integer
 Dim SaveFileFromTB As Boolean
 Dim TxtBox As Object
 Dim FilePath As String
Dim Append As Boolean
  iFile = FreeFile
If Append Then
    Open "\Memo.txt" For Append As #iFile
Else
    Open "\Memo.txt" For Output As #iFile
End If
Print #iFile, Text1.Text
SaveFileFromTB = True
ErrorHandler:
Close #iFile
End Sub
Private Sub Command3_Click()
 Dim LoadFileToTB As Boolean
 Dim TxtBox As Object
 Dim FilePath As String
  Dim Append As Boolean
Dim iFile As Integer
Dim s As String
If Dir(FilePath) = "" Then Exit Sub
On Error GoTo ErrorHandler:
s = Text1.Text
iFile = FreeFile
Open "\Memo.txt" For Input As #iFile
s = Input(LOF(iFile), #iFile)
If Append Then
    Text1.Text = Text1.Text & s
Else
    Text1.Text = s
End If

LoadFileToTB = True

ErrorHandler:
If iFile > 0 Then Close #iFile
End Sub

Private Sub Command4_Click()
Unload Me
Form1.Show
End Sub

Private Sub Command5_Click()
End
End Sub


Private Sub Form_Load()
Form1.Hide
 Dim LoadFileToTB As Boolean
 Dim TxtBox As Object
 Dim FilePath As String
  Dim Append As Boolean
Dim iFile As Integer
Dim s As String
If Dir(FilePath) = "" Then Exit Sub
On Error GoTo ErrorHandler:
s = Text1.Text
iFile = FreeFile
Open "\Memo.txt" For Input As #iFile
s = Input(LOF(iFile), #iFile)
If Append Then
    Text1.Text = Text1.Text & s
Else
    Text1.Text = s
End If
LoadFileToTB = True
ErrorHandler:
If iFile > 0 Then Close #iFile
End Sub
