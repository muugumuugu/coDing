VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmTable 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Table"
   ClientHeight    =   4755
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5880
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4755
   ScaleWidth      =   5880
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   4095
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   5415
      Begin VB.CommandButton Command4 
         Caption         =   "Copy"
         Height          =   375
         Left            =   2760
         TabIndex        =   16
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Select all"
         Height          =   375
         Left            =   2760
         TabIndex        =   15
         Top             =   240
         Width           =   1215
      End
      Begin MSComctlLib.ListView ListView1 
         Height          =   2415
         Left            =   120
         TabIndex        =   14
         Top             =   1560
         Width           =   5175
         _ExtentX        =   9128
         _ExtentY        =   4260
         View            =   3
         MultiSelect     =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin VB.ComboBox Combo2 
         Height          =   315
         Left            =   720
         TabIndex        =   13
         Text            =   "Combo2"
         Top             =   720
         Visible         =   0   'False
         Width           =   1935
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Close"
         Height          =   375
         Left            =   4080
         TabIndex        =   11
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Make table"
         Height          =   375
         Left            =   4080
         TabIndex        =   10
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   2880
         TabIndex        =   9
         Top             =   1200
         Width           =   735
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1680
         TabIndex        =   8
         Top             =   1200
         Width           =   735
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   480
         TabIndex        =   7
         Top             =   1200
         Width           =   735
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   720
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   240
         Width           =   1935
      End
      Begin VB.Label Label5 
         Caption         =   "y(t)="
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   720
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.Label Label4 
         Caption         =   "step:"
         Height          =   255
         Left            =   2520
         TabIndex        =   6
         Top             =   1200
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "f(x)="
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "start:"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1200
         Width           =   855
      End
      Begin VB.Label Label3 
         Caption         =   "end:"
         Height          =   255
         Left            =   1320
         TabIndex        =   3
         Top             =   1200
         Width           =   975
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   4575
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   8070
      HotTracking     =   -1  'True
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   4
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Y(x) function"
            Key             =   "normal"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "X(y) function"
            Key             =   "inverse"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Parametric function"
            Key             =   "parametric"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Polar function"
            Key             =   "polar"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Table() As String
Private Sub Command1_Click()
MakeTable
End Sub
Public Sub MakeTable()
Dim x As Double, y As Double, t As Double
Dim f As String, steps As Long, StrX As String, StrY As String
ListView1.ListItems.Clear
ListView1.Refresh
If Combo1.Text = "" Or (Combo2.Visible = True And Combo2.Text = "") Then Exit Sub
steps = (Stringval(Text2.Text) - Stringval(Text1.Text)) / Stringval(Text3.Text) + 1
ReDim Table(4, steps) As String
Select Case TabStrip1.SelectedItem.Key
Case "normal"
    Call frmMain.Init(EditedEqu(Combo1.Text), 0)
    For x = Stringval(Text1.Text) To Stringval(Text2.Text) + Stringval(Text3.Text) / 10 Step Stringval(Text3.Text)
    x = Round(x, 8)
    Call ListView1.ListItems.Add(, , Str(x))
    ListView1.ListItems(ListView1.ListItems.Count).SubItems(1) = StrGetVal(x, 0, 0, 0)
    Table(1, ListView1.ListItems.Count) = Str(x)
    Table(2, ListView1.ListItems.Count) = StrGetVal(x, 0, 0, 0)
    Next
Case "inverse"
    Call frmMain.Init(EditedEqu(Combo1.Text), 0)
    For y = Stringval(Text1.Text) To Stringval(Text2.Text) + Stringval(Text3.Text) / 10 Step Stringval(Text3.Text)
    y = Round(y, 8)
    Call ListView1.ListItems.Add(, , Str(y))
    ListView1.ListItems(ListView1.ListItems.Count).SubItems(1) = StrGetVal(0, y, 0, 0)
    Table(1, ListView1.ListItems.Count) = Str(y)
    Table(2, ListView1.ListItems.Count) = StrGetVal(0, y, 0, 0)
    Next
 Case "polar"
    Call frmMain.Init(EditedEqu(Combo1.Text), 0)
    For t = Stringval(Text1.Text) To Stringval(Text2.Text) + Stringval(Text3.Text) / 10 Step Stringval(Text3.Text)
    t = Round(t, 8)
    f = StrGetVal(0, 0, t, 0)
    
    If f <> "Error" Then
    StrX = Str(Stringval(f) * Cos(t))
    StrY = Str(Stringval(f) * Sin(t))
    Else
    StrX = "Error"
    StrY = "Error"
    End If
    
    Call ListView1.ListItems.Add(, , Str(t))
    'ListView1.ListItems(ListView1.ListItems.Count).SubItems(0) = x   '.SubItems(0) = i
    ListView1.ListItems(ListView1.ListItems.Count).SubItems(1) = StrX
    ListView1.ListItems(ListView1.ListItems.Count).SubItems(2) = StrY
    ListView1.ListItems(ListView1.ListItems.Count).SubItems(3) = f
    Table(1, ListView1.ListItems.Count) = Str(t)
    Table(2, ListView1.ListItems.Count) = StrX
    Table(3, ListView1.ListItems.Count) = StrY
    Table(4, ListView1.ListItems.Count) = f
 
    Next

 Case "parametric"
    Call frmMain.Init(EditedEqu(Combo1.Text), 0)
    Call frmMain.Init(EditedEqu(Combo2.Text), 1)
    For t = Stringval(Text1.Text) To Stringval(Text2.Text) + Stringval(Text3.Text) / 10 Step Stringval(Text3.Text)
    t = Round(t, 8)
    'x = GetVal(t, 0, 0)
    'y = GetVal(t, 0, 1)
    Call ListView1.ListItems.Add(, , Str(t))
    'ListView1.ListItems(ListView1.ListItems.Count).SubItems(0) = x   '.SubItems(0) = i
    ListView1.ListItems(ListView1.ListItems.Count).SubItems(1) = StrGetVal(0, 0, t, 0)
    ListView1.ListItems(ListView1.ListItems.Count).SubItems(2) = StrGetVal(0, 0, t, 1)

    Table(1, ListView1.ListItems.Count) = Str(t)
    Table(2, ListView1.ListItems.Count) = StrGetVal(0, 0, t, 0)
    Table(3, ListView1.ListItems.Count) = StrGetVal(0, 0, t, 1)
    Next

End Select
End Sub
Private Sub Command2_Click()
Unload frmTable
End Sub
Public Sub InitTable()
Dim i As Integer
Combo1.Clear
Combo2.Clear
ListView1.ColumnHeaders.Clear
ListView1.ListItems.Clear
Select Case TabStrip1.SelectedItem.Key
Case "normal"
    Label1.Caption = "Y="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "normal" Then
    Combo1.AddItem AllFunctions(i).expression1
    End If
    Next
    Label5.Visible = False
    Combo2.Visible = False
    Call ListView1.ColumnHeaders.Add(, , "X", 1000)
    Call ListView1.ColumnHeaders.Add(, , "Y", 2000)
Case "inverse"
    Label1.Caption = "X="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "inverse" Then
    Combo1.AddItem AllFunctions(i).expression1
    End If
    Next
    Label5.Visible = False
    Combo2.Visible = False
    Call ListView1.ColumnHeaders.Add(, , "Y", 1000)
    Call ListView1.ColumnHeaders.Add(, , "X", 2000)
Case "parametric"
    Label1.Caption = "x(t)="
    Label5.Caption = "y(t)="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "parametric" Then
    Combo1.AddItem AllFunctions(i).expression1
    Combo2.AddItem AllFunctions(i).expression2
    End If
    Next
    Label5.Visible = True
    Combo2.Visible = True
    Call ListView1.ColumnHeaders.Add(, , "t", 1000)
    Call ListView1.ColumnHeaders.Add(, , "x(t)", 1500)
    Call ListView1.ColumnHeaders.Add(, , "y(t)", 1500)

Case "polar"
    Label1.Caption = "f(t)="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "polar" Then
    Combo1.AddItem AllFunctions(i).expression1
    End If
    Next
    Label5.Visible = False
    Combo2.Visible = False
    Call ListView1.ColumnHeaders.Add(, , "t", 1000)
    Call ListView1.ColumnHeaders.Add(, , "X", 1000)
    Call ListView1.ColumnHeaders.Add(, , "Y", 1000)
    Call ListView1.ColumnHeaders.Add(, , "radius", 1000)
End Select

End Sub

Private Sub Command3_Click()
Dim i As LoadPictureColorConstants
For i = 1 To ListView1.ListItems.Count
ListView1.ListItems(i).Selected = True
Next
ListView1.SetFocus
End Sub

Private Sub Command4_Click()
Dim SubItemsNum As Byte, copytext As String, i As Long, j As Byte
Select Case TabStrip1.SelectedItem.Key
Case "normal"
SubItemsNum = 2
Case "parametric"
SubItemsNum = 3
Case "polar"
SubItemsNum = 4
End Select

copytext = ""
For i = 1 To ListView1.ListItems.Count
If ListView1.ListItems(i).Selected = True Then

For j = 1 To SubItemsNum
copytext = copytext + Table(j, i) + vbTab
Next
copytext = copytext + vbCrLf

End If
Next

Clipboard.Clear
Clipboard.SetText (copytext)
End Sub

Private Sub TabStrip1_Click()
InitTable
End Sub
