VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmTrace 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Trace"
   ClientHeight    =   3075
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5745
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3075
   ScaleWidth      =   5745
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   2415
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   5295
      Begin VB.Timer Timer2 
         Interval        =   50
         Left            =   2640
         Top             =   1080
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         Left            =   120
         Max             =   200
         TabIndex        =   21
         Top             =   600
         Width           =   4095
      End
      Begin VB.TextBox Text6 
         Height          =   285
         Left            =   3600
         TabIndex        =   20
         Top             =   1320
         Width           =   1455
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   3600
         TabIndex        =   18
         Top             =   960
         Width           =   1455
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Close"
         Height          =   375
         Left            =   3600
         TabIndex        =   16
         Top             =   1920
         Width           =   1455
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   100
         Left            =   2640
         Top             =   1440
      End
      Begin VB.ComboBox Combo2 
         Height          =   315
         Left            =   3600
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   240
         Width           =   1455
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   1440
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   240
         Width           =   1455
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Loop"
         Height          =   255
         Left            =   4320
         TabIndex        =   10
         Top             =   600
         Width           =   735
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   9
         Top             =   2040
         Width           =   1695
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   7
         Top             =   1680
         Width           =   1695
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   960
         Width           =   1695
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   2
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label Label9 
         Caption         =   "To:"
         Height          =   255
         Left            =   3120
         TabIndex        =   19
         Top             =   1320
         Width           =   855
      End
      Begin VB.Label Label8 
         Caption         =   "From:"
         Height          =   375
         Left            =   3120
         TabIndex        =   17
         Top             =   960
         Width           =   495
      End
      Begin VB.Label Label7 
         Caption         =   "y(t)="
         Height          =   255
         Left            =   3240
         TabIndex        =   14
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label6 
         Caption         =   "f(x)="
         Height          =   255
         Left            =   1080
         TabIndex        =   12
         Top             =   240
         Width           =   615
      End
      Begin VB.Label Label5 
         Caption         =   "Function:"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "Radius="
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   2040
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "X="
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "Y="
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1320
         Width           =   255
      End
      Begin VB.Label Label3 
         Caption         =   "Y="
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1680
         Width           =   375
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   2895
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   5106
      HotTracking     =   -1  'True
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   4
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "X(y) function"
            Key             =   "normal"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Y(x) function"
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
Attribute VB_Name = "frmTrace"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Forward As Boolean
Public Sub InitTrace()
Dim i As Integer
Combo1.Clear
Combo2.Clear
Select Case TabStrip1.SelectedItem.Key
Case "normal"
    Label6.Caption = "f(x)="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "normal" Then
    Combo1.AddItem AllFunctions(i).expression1
    If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
    End If
    Next
    Label7.Visible = False
    Combo2.Visible = False
    Label3.Visible = False
    Label4.Visible = False
    Text3.Visible = False
    Text4.Visible = False
    Label1.Caption = "X"
    Label2.Caption = "Y"
    
Case "inverse"
    Label6.Caption = "f(y)="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "inverse" Then
    Combo1.AddItem AllFunctions(i).expression1
    If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
    End If
    Next
    Label7.Visible = False
    Combo2.Visible = False
    Label3.Visible = False
    Label4.Visible = False
    Text3.Visible = False
    Text4.Visible = False
    Label1.Caption = "Y"
    Label2.Caption = "X"
    
Case "parametric"
    Label6.Caption = "x(t)="
    Label7.Caption = "y(t)="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "parametric" Then
    Combo1.AddItem AllFunctions(i).expression1
    Combo2.AddItem AllFunctions(i).expression2
    If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
    If Combo2.Text = "" Then Combo2.Text = AllFunctions(i).expression2
    End If
    Next
    Label7.Visible = True
    Combo2.Visible = True
    Label3.Visible = True
    Label4.Visible = False
    Text3.Visible = True
    Text4.Visible = False
    Label1.Caption = "T"
    Label2.Caption = "X"
    Label3.Caption = "Y"

Case "polar"
    Label6.Caption = "f(t)="
    For i = 1 To numfunctions
    If AllFunctions(i).Type = "polar" Then
    Combo1.AddItem AllFunctions(i).expression1
    If Combo1.Text = "" Then Combo1.Text = AllFunctions(i).expression1
    End If
    Next
    Label7.Visible = False
    Combo2.Visible = False
    Label3.Visible = True
    Label4.Visible = True
    Text3.Visible = True
    Text4.Visible = True
    Label1.Caption = "T"
    Label2.Caption = "X"
    Label3.Caption = "Y"
    Label4.Caption = "Radius"

End Select
End Sub

Private Sub Check1_Click()
If Check1.Value = 1 Then Timer1.Enabled = True Else Timer1.Enabled = False
End Sub

Private Sub Combo1_Click()
Dim IsCorrect As Boolean, i As Integer
If TabStrip1.SelectedItem.Key = "parametric" Then
    IsCorrect = False
    For i = 1 To numfunctions
        If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression1 = Combo1.Text And AllFunctions(i).expression2 = Combo2.Text Then IsCorrect = True: Exit For
    Next
    
    If IsCorrect = False Then
        For i = 1 To numfunctions
            If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression1 = Combo1.Text Then Combo2.Text = AllFunctions(i).expression2: Exit For
        Next
    End If
End If
End Sub

Private Sub Combo2_Click()
Dim IsCorrect As Boolean, i As Integer
If TabStrip1.SelectedItem.Key = "parametric" Then
    IsCorrect = False
    For i = 1 To numfunctions
        If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression1 = Combo1.Text And AllFunctions(i).expression2 = Combo2.Text Then IsCorrect = True: Exit For
    Next
    
    If IsCorrect = False Then
        For i = 1 To numfunctions
            If AllFunctions(i).Type = "parametric" And AllFunctions(i).expression2 = Combo2.Text Then Combo1.Text = AllFunctions(i).expression1: Exit For
        Next
    End If
End If
End Sub

Private Sub Command1_Click()
frmMain.LineHtrace2.Visible = False
frmMain.LineVtrace2.Visible = False
Unload frmTrace
End Sub

Private Sub Form_Load()
Forward = True
End Sub

Private Sub HScroll1_Change()
FindScrollX
End Sub

Private Sub HScroll1_Scroll()
FindScrollX
End Sub
Public Sub FindScrollX()
On Error Resume Next
frmTrace.Text1.Text = MyRound(Stringval(Text5.Text) + ((Stringval(Text6.Text) - Stringval(Text5.Text)) * HScroll1.Value / 200), Round(2 - Log(Stringval(Text6.Text) - Stringval(Text5.Text)) / Log(10)))
End Sub
Private Sub TabStrip1_Click()
Timer1.Enabled = False
Check1.Value = 0
InitTrace
Text2.Text = ""
Text3.Text = ""
Text4.Text = ""
Text1_Change
End Sub

Private Sub Text1_Change()
On Error Resume Next
Dim x As Double, y As Double
Dim f As String, StrX As String, StrY As String
frmMain.LineHtrace2.Visible = True
frmMain.LineVtrace2.Visible = True

Select Case TabStrip1.SelectedItem.Key

Case "normal"
Call frmMain.Init(EditedEqu(Combo1.Text), 0)
Text2.Text = StrGetVal(Stringval(Text1.Text), 0, 0, 0)
If Text2.Text = "Error" Then
frmMain.LineHtrace2.Visible = False
End If
x = Stringval(Text1.Text)
y = Stringval(Text2.Text)

Case "inverse"
Call frmMain.Init(EditedEqu(Combo1.Text), 0)
Text2.Text = StrGetVal(0, Stringval(Text1.Text), 0, 0)
If Text2.Text = "Error" Then
frmMain.LineVtrace2.Visible = False
End If
y = Stringval(Text1.Text)
x = Stringval(Text2.Text)

Case "polar"
Call frmMain.Init(EditedEqu(Combo1.Text), 0)
f = StrGetVal(0, 0, Stringval(Text1.Text), 0)
If f <> "Error" Then
StrX = Str(Stringval(f) * Cos(Stringval(Text1.Text)))
StrY = Str(Stringval(f) * Sin(Stringval(Text1.Text)))
Else
StrX = "Error"
StrY = "Error"
frmMain.LineHtrace2.Visible = False
frmMain.LineVtrace2.Visible = False
End If

Text2.Text = StrX
Text3.Text = StrY
Text4.Text = f
x = Stringval(Text2.Text)
y = Stringval(Text3.Text)

Case "parametric"
Call frmMain.Init(EditedEqu(Combo1.Text), 0)
Call frmMain.Init(EditedEqu(Combo2.Text), 1)
Text2.Text = StrGetVal(0, 0, Stringval(Text1.Text), 0)
Text3.Text = StrGetVal(0, 0, Stringval(Text1.Text), 1)
x = Stringval(Text2.Text)
y = Stringval(Text3.Text)

If Text2.Text = "Error" Or Text3.Text = "Error" Then
frmMain.LineHtrace2.Visible = False
frmMain.LineVtrace2.Visible = False
End If

End Select
Dim point1 As XY
point1 = OnPicture(x, y)
frmMain.LineHtrace2.y1 = point1.y
frmMain.LineHtrace2.y2 = point1.y
frmMain.LineVtrace2.x1 = point1.x
frmMain.LineVtrace2.x2 = point1.x
frmMain.LineVtrace2.y1 = 0
frmMain.LineVtrace2.y2 = frmMain.Picgraph.ScaleHeight
frmMain.LineHtrace2.x1 = 0
frmMain.LineHtrace2.x2 = frmMain.Picgraph.ScaleWidth


End Sub

Private Sub Timer1_Timer()
If HScroll1.Value = 0 Then Forward = True
If HScroll1.Value = 200 Then Forward = False
If Forward = True Then HScroll1.Value = HScroll1.Value + 1 Else HScroll1.Value = HScroll1.Value - 1
End Sub

Private Sub Timer2_Timer()
FindScrollX
Text1_Change
End Sub
