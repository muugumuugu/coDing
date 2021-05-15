VERSION 5.00
Begin VB.Form frmBrowse 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Browse"
   ClientHeight    =   5685
   ClientLeft      =   5985
   ClientTop       =   2880
   ClientWidth     =   5520
   Icon            =   "frmBrowse.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5655.158
   ScaleMode       =   0  'User
   ScaleWidth      =   5520
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdPrevious 
      Caption         =   "Previous"
      Default         =   -1  'True
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
      Left            =   893
      TabIndex        =   14
      Top             =   3840
      Width           =   1095
   End
   Begin VB.CommandButton cmdview 
      Caption         =   "&View"
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
      Left            =   893
      TabIndex        =   13
      Top             =   3360
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "Browse:-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   773
      TabIndex        =   12
      Top             =   3000
      Width           =   3975
      Begin VB.CommandButton cmdcancel 
         Cancel          =   -1  'True
         Caption         =   "Back"
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
         TabIndex        =   16
         Top             =   840
         Width           =   1095
      End
      Begin VB.CommandButton cmdNext 
         Caption         =   "Next"
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
         TabIndex        =   15
         Top             =   840
         Width           =   1095
      End
   End
   Begin VB.TextBox Text2 
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
      Left            =   2213
      TabIndex        =   5
      Text            =   " "
      Top             =   600
      Width           =   1815
   End
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
      Height          =   375
      Left            =   2213
      TabIndex        =   4
      Text            =   " "
      Top             =   120
      Width           =   1815
   End
   Begin VB.TextBox Text3 
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
      Left            =   2213
      TabIndex        =   3
      Text            =   " "
      Top             =   1080
      Width           =   2535
   End
   Begin VB.TextBox Text4 
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
      Left            =   2213
      TabIndex        =   2
      Text            =   " "
      Top             =   1560
      Width           =   2535
   End
   Begin VB.TextBox Text5 
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
      Left            =   2213
      TabIndex        =   1
      Text            =   " "
      Top             =   2040
      Width           =   2535
   End
   Begin VB.TextBox Text6 
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
      Left            =   2213
      TabIndex        =   0
      Text            =   " "
      Top             =   2520
      Width           =   2535
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "LastName"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   780
      TabIndex        =   11
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "FirstName"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   773
      TabIndex        =   10
      Top             =   720
      Width           =   855
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "FaxNumber"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   773
      TabIndex        =   9
      Top             =   1200
      Width           =   960
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "PhoneNumber"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   773
      TabIndex        =   8
      Top             =   1680
      Width           =   1200
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Adress"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   773
      TabIndex        =   7
      Top             =   2160
      Width           =   585
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "Email"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   773
      TabIndex        =   6
      Top             =   2640
      Width           =   465
   End
   Begin VB.Menu File 
      Caption         =   "&File"
      Begin VB.Menu Exit 
         Caption         =   "&Exit"
      End
   End
End
Attribute VB_Name = "frmBrowse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Exit_Click()
End
End Sub
Private Sub Form_KeyDown _
  (KeyCode As Integer, Shift As Integer)
  Const PgDn = 34
  Const PgUp = 33
  If KeyCode = PgDn _
    And cmdNext.Enabled = True _
      Then cmdNext_Click
 If KeyCode = PgUp _
    And cmdPrevious.Enabled = True _
      Then cmdPrevious_Click
End Sub
Private Sub ShowName()
On Error GoTo Hi
  Get #1, Index(whichRecord).RecNum, Phones
    With Phones
Text1.Text = Trim(.LastName)
Text2.Text = Trim(.FirstName)
Text3.Text = Trim(.FaxNumber)
Text4.Text = Trim(.PhoneNumber)
Text5.Text = Trim(.Adress)
Text6.Text = Trim(.Email)
End With
Hi:
    End Sub
Private Sub cmdCancel_Click()
  whichRecord = 0
   frmBrowse.Hide
End Sub
Private Sub cmdNext_Click()
  whichRecord = whichRecord + 1
  ShowName
  If whichRecord > 1 Then _
    cmdPrevious.Enabled = True
  If whichRecord = numPhones Then _
    cmdNext.Enabled = False
 

End Sub
Private Sub cmdPrevious_Click()
  whichRecord = whichRecord - 1
  ShowName
  If whichRecord < numPhones Then _
    cmdNext.Enabled = True
    

  If whichRecord = 1 Then _
    cmdPrevious.Enabled = False
End Sub
Private Sub cmdView_Click()

frmBrowse.Hide
  End Sub
Private Sub Form_Activate()

 ShowName


  If whichRecord > 1 Then
    cmdPrevious.Enabled = True
  Else
    cmdPrevious.Enabled = False
  End If
  If whichRecord < numPhones Then
    cmdNext.Enabled = True
  Else
    cmdNext.Enabled = False
 
  End If
  End Sub




