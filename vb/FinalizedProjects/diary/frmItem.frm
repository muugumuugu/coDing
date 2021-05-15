VERSION 5.00
Begin VB.Form frmPhone 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "PhoneBook"
   ClientHeight    =   5685
   ClientLeft      =   1785
   ClientTop       =   1920
   ClientWidth     =   5520
   Icon            =   "frmItem.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5685
   ScaleWidth      =   5520
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtFirstName 
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
      Left            =   2220
      TabIndex        =   2
      Text            =   " "
      Top             =   600
      Width           =   1815
   End
   Begin VB.TextBox txtLastName 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   373
      Left            =   2213
      TabIndex        =   1
      Text            =   " "
      Top             =   120
      Width           =   1815
   End
   Begin VB.TextBox txtFaxNumber 
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
      Left            =   2220
      TabIndex        =   3
      Text            =   " "
      Top             =   1080
      Width           =   2535
   End
   Begin VB.TextBox txtPhoneNumber 
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
      Left            =   2220
      TabIndex        =   4
      Text            =   " "
      Top             =   1560
      Width           =   2535
   End
   Begin VB.TextBox txtAdress 
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
      Left            =   2220
      TabIndex        =   5
      Text            =   " "
      Top             =   2040
      Width           =   2535
   End
   Begin VB.TextBox txtEmail 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "M/d/yy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   3
      EndProperty
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
      Left            =   2220
      TabIndex        =   6
      Top             =   2520
      Width           =   2535
   End
   Begin VB.Frame Frame1 
      Caption         =   "Record:-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   765
      TabIndex        =   7
      Top             =   3120
      Width           =   3975
      Begin VB.CommandButton cmdSave 
         Caption         =   "Enter"
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
         Left            =   480
         TabIndex        =   10
         Top             =   360
         Width           =   855
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
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
         Left            =   1680
         TabIndex        =   9
         Top             =   360
         Width           =   855
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "Main"
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
         Left            =   2880
         TabIndex        =   8
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Search Items:-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   765
      TabIndex        =   0
      Top             =   4200
      Width           =   3975
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "&Browse"
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
         Left            =   2280
         TabIndex        =   18
         Top             =   360
         Width           =   855
      End
      Begin VB.CommandButton cmdSearch 
         Caption         =   "&Search"
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
         Left            =   960
         TabIndex        =   17
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&LastName"
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
      TabIndex        =   16
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label2 
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
      TabIndex        =   15
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
      TabIndex        =   14
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
      TabIndex        =   13
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
      TabIndex        =   12
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
      TabIndex        =   11
      Top             =   2640
      Width           =   465
   End
   Begin VB.Menu File 
      Caption         =   "&File"
      Begin VB.Menu Create 
         Caption         =   "&Create File"
      End
      Begin VB.Menu Open 
         Caption         =   "&Open"
      End
   End
End
Attribute VB_Name = "frmPhone"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Const ATTR_NORMAL = 0
Const ATTR_READONLY = 1
Const ATTR_HIDDEN = 2
Const ATTR_SYSTEM = 4
Const ATTR_VOLUME = 8
Const ATTR_DIRECTORY = 16
Const ATTR_ARCHIVE = 32
Const PhoneDB = "\PhoneVB.DB"
Const PhoneTextFile = "\Phones.Txt"
Private Sub ShowRecord(readRecord As Integer)
  Get #1, readRecord, Phones
  With Phones
    txtLastName.Text = .LastName
    txtFirstName.Text = .FirstName
    txtFaxNumber.Text = .FaxNumber
    txtPhoneNumber.Text = .PhoneNumber
    txtAdress.Text = .Adress
    txtEmail.Text = .Email
  
  End With
    End Sub


Private Sub cmdBrowse_Click()
  If whichRecord = 0 Then _
    whichRecord = 1
  frmBrowse.Show 1
End Sub
Private Sub cmdClear_Click()
  txtLastName.Text = ""
  txtFirstName.Text = ""
  txtFaxNumber.Text = ""
  txtPhoneNumber.Text = ""
  txtAdress.Text = ""
   txtEmail.Text = ""
   txtLastName.SetFocus
End Sub
Private Sub CmdExit_Click()
 Close #1
  Unload Me
  Form1.Show
  End Sub
Private Sub cmdSave_Click()
  Dim isFound As Integer, i
  Dim answer As Integer, lf As String
  lf = Chr(13) & Chr(10)
    If Not FullNameOK Then
    MsgBox "Please enter First and Last Names", vbCritical, "Error"
        Else
    isFound = Search(MakeName(txtLastName.Text, _
                              txtFirstName.Text))
    With Phones
      .LastName = txtLastName.Text
      .FirstName = txtFirstName.Text
      .PhoneNumber = txtPhoneNumber.Text
      .FaxNumber = txtFaxNumber.Text
      .Adress = txtAdress.Text
      .Email = txtEmail.Text
 End With
   If isFound = 0 Then
      numPhones = numPhones + 1
If numPhones > 0 Then
        cmdBrowse.Enabled = True
End If
      Put #1, numPhones, Phones
      ReDim Index(numPhones)
      CreateIndex
 Else
      answer = MsgBox("This name already exists." _
        & lf & "Do you want to save " & lf & _
        "as updated record?", 4, "Error")
 
      If answer = 6 Then _
        Put #1, Index(isFound).RecNum, Phones
    End If
 End If
End Sub

Private Sub cmdSearch_Click()
Dim searchName As String
Dim rec As Integer, inFileRec As Integer
  If Not FullNameOK Then
    MsgBox "Enter the First and Last Names.", vbCritical, "Error"
  Else
searchName = MakeName(txtLastName.Text, _
                        txtFirstName.Text)
    rec = Search(searchName)
If rec > 0 Then
      inFileRec = Index(rec).RecNum
      ShowRecord inFileRec
Else
   MsgBox "Cannot find " & "[" & txtLastName.Text & "]" & ".", vbCritical, "Sorry..!"
      End If
  End If
End Sub
Private Sub Command2_Click()
  Dim i
Open PhoneTextFile For Output As #2
  For i = 1 To numPhones
    Get #1, Index(i).RecNum, Phones
    With Phones
      Print #2, UCase(Trim(.LastName))
      Print #2, "FirstName:  "; .FirstName
      Print #2, "FaxNumber:  "; .FaxNumber
      Print #2, "PhoneNumber:"; .PhoneNumber
      Print #2, "Adress:     "; .Adress
      Print #2, "Email:      "; .Email
      Print #2, "-------------------------------"
Print #2,
    End With
  Next i
  Close #2
  MsgBox "Phone.txt is created", vbDefaultButton1, "Pharmacy Stock"
End Sub

Private Sub Create_Click()
  Dim i
  Open PhoneTextFile For Output As #2
  For i = 1 To numPhones
    Get #1, Index(i).RecNum, Phones
    With Phones
      Print #2, UCase(Trim(.LastName))
      Print #2, "FirstName:   "; .FirstName
      Print #2, "FaxNumber:  "; .FaxNumber
      Print #2, "PhoneNumber:     "; .PhoneNumber
      Print #2, "Adress:     "; .Adress
      Print #2, "Email:   "; .Email
      Print #2, "-------------------------------"

      Print #2,
    End With
  Next i
  Close #2
  MsgBox "Phone.txt is created", vbDefaultButton1, "Diary"
End Sub
Private Sub Form_Activate()

If whichRecord > 0 Then _
    ShowRecord Index(whichRecord).RecNum
    End Sub

Private Sub Form_Load()


  Open PhoneDB For Random As #1 Len = Len(Phones)

  numPhones = LOF(1) / Len(Phones)

  If numPhones > 0 Then
    ReDim Index(numPhones)
    CreateIndex

  Else
    cmdBrowse.Enabled = False

  End If
  End Sub
Sub CreateIndex()

  Dim indexEntry As IndexType, i, j, temp As String

  For i = 1 To numPhones
    Get #1, i, Phones

    temp = MakeName(Phones.LastName, Phones.FirstName)
    Index(i).FullName = temp
    Index(i).RecNum = i
  Next i

  For i = 1 To numPhones - 1
    For j = i + 1 To numPhones
      If Index(i).FullName > Index(j).FullName Then
        indexEntry = Index(i)
        Index(i) = Index(j)
        Index(j) = indexEntry
      End If
    Next j
  Next i
End Sub

Function MakeName(f As String, l As String) _
    As String

  MakeName = UCase(Trim(l) + " " + Trim(f))
End Function
Function Search(findText As String) As Integer

  Dim pos1 As Integer, pos2 As Integer
  Dim posX As Integer, midPos As Integer, midStr As String
pos1 = 1
  pos2 = numPhones
  posX = 0
  Do While pos1 <= pos2 And posX = 0
    midPos = (pos1 + pos2) \ 2
    midStr = RTrim(Index(midPos).FullName)
    If findText = midStr Then
      posX = midPos
    ElseIf findText > midStr Then
      pos1 = midPos + 1
    Else
      pos2 = midPos - 1
    End If
  Loop
Search = posX
End Function
Private Function FullNameOK() As Boolean
Dim blankFirst As Boolean, blankLast As Boolean
  blankFirst = (Trim(txtLastName.Text) = "")
  blankLast = (Trim(txtFirstName.Text) = "")
  FullNameOK = Not (blankFirst Or blankLast)
  End Function
Private Sub ShowName()
With Phones
txtLastName.Text = Trim(.LastName)
End With
    End Sub
Private Sub Open_Click()
Call ShellExecute(hwnd, "Open", "\Phones.Txt", "", App.Path, 1)
End Sub
