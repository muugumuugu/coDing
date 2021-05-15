VERSION 5.00
Begin VB.Form frmNewEdit 
   Caption         =   "Fractal Definition"
   ClientHeight    =   4125
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7395
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "NewEdit.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4125
   ScaleWidth      =   7395
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdEdit 
      Caption         =   "View File"
      BeginProperty Font 
         Name            =   "Andale Mono"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4455
      TabIndex        =   32
      Top             =   3240
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Andale Mono"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4455
      TabIndex        =   30
      Top             =   3690
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Andale Mono"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   6165
      TabIndex        =   29
      Top             =   3690
      Width           =   1095
   End
   Begin VB.Frame Frames 
      Caption         =   "Drawing Offsets"
      BeginProperty Font 
         Name            =   "Andale Mono"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   1005
      Index           =   2
      Left            =   45
      TabIndex        =   22
      Top             =   3060
      Width           =   4200
      Begin VB.TextBox txtOffsetRotation 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   2880
         TabIndex        =   27
         Text            =   "0"
         Top             =   450
         Width           =   1050
      End
      Begin VB.TextBox txtOffSetX 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   180
         TabIndex        =   24
         Text            =   "1000"
         Top             =   450
         Width           =   1050
      End
      Begin VB.TextBox txtOffSetY 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1530
         TabIndex        =   23
         Text            =   "1000"
         Top             =   450
         Width           =   1050
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         Caption         =   "The canvas measures 2000 * 2000 pixels"
         BeginProperty Font 
            Name            =   "Small Fonts"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Index           =   9
         Left            =   810
         TabIndex        =   31
         Top             =   810
         Width           =   2475
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         Caption         =   "Rotation"
         Height          =   195
         Index           =   8
         Left            =   2970
         TabIndex        =   28
         Top             =   225
         Width           =   615
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         Caption         =   "X"
         Height          =   195
         Index           =   4
         Left            =   270
         TabIndex        =   26
         Top             =   225
         Width           =   90
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         Caption         =   "Y"
         Height          =   195
         Index           =   6
         Left            =   1620
         TabIndex        =   25
         Top             =   225
         Width           =   90
      End
   End
   Begin VB.Frame Frames 
      Caption         =   "Rules and Symbols"
      BeginProperty Font 
         Name            =   "Andale Mono"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   3030
      Index           =   0
      Left            =   45
      TabIndex        =   0
      Top             =   0
      Width           =   4200
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   2745
         TabIndex        =   19
         Top             =   2565
         Width           =   870
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Add"
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   630
         TabIndex        =   18
         Top             =   2565
         Width           =   870
      End
      Begin VB.OptionButton optRuSY 
         Caption         =   "Symbols"
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   1
         Left            =   3015
         TabIndex        =   6
         Top             =   225
         Width           =   1095
      End
      Begin VB.OptionButton optRuSY 
         Caption         =   "Rules"
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   0
         Left            =   2025
         TabIndex        =   5
         Top             =   225
         Value           =   -1  'True
         Width           =   1095
      End
      Begin VB.TextBox txtItem 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1080
         TabIndex        =   4
         Top             =   2205
         Width           =   2985
      End
      Begin VB.TextBox txtKey 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   135
         TabIndex        =   3
         Top             =   2205
         Width           =   960
      End
      Begin VB.ListBox lstItems 
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1710
         Left            =   1080
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   495
         Width           =   2985
      End
      Begin VB.ListBox lstKeys 
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1710
         Left            =   135
         Sorted          =   -1  'True
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   495
         Width           =   960
      End
   End
   Begin VB.Frame Frames 
      Caption         =   "Parameters"
      BeginProperty Font 
         Name            =   "Andale Mono"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   3030
      Index           =   1
      Left            =   4320
      TabIndex        =   7
      Top             =   0
      Width           =   3030
      Begin VB.TextBox txtFileName 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   180
         TabIndex        =   20
         Top             =   2565
         Width           =   2670
      End
      Begin VB.TextBox txtLength 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   180
         TabIndex        =   17
         Text            =   "500"
         Top             =   1890
         Width           =   1050
      End
      Begin VB.TextBox txtRotation 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1800
         TabIndex        =   16
         Text            =   "90"
         Top             =   1215
         Width           =   1050
      End
      Begin VB.TextBox txtScaling 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1800
         TabIndex        =   15
         Text            =   "2"
         Top             =   1890
         Width           =   1050
      End
      Begin VB.TextBox txtRecurseDepth 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   180
         TabIndex        =   14
         Text            =   "2"
         Top             =   1215
         Width           =   1050
      End
      Begin VB.TextBox txtAxiom 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "Andale Mono"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   180
         TabIndex        =   13
         Top             =   495
         Width           =   2670
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         Caption         =   "File Name"
         Height          =   195
         Index           =   2
         Left            =   225
         TabIndex        =   21
         Top             =   2340
         Width           =   690
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         Caption         =   "Recurse Depth"
         Height          =   195
         Index           =   0
         Left            =   225
         TabIndex        =   12
         Top             =   990
         Width           =   1065
      End
      Begin VB.Label Labels 
         Caption         =   "Rotation"
         Height          =   195
         Index           =   1
         Left            =   1845
         TabIndex        =   11
         Top             =   990
         Width           =   615
      End
      Begin VB.Label Labels 
         AutoSize        =   -1  'True
         Caption         =   "Unit Length"
         Height          =   195
         Index           =   3
         Left            =   225
         TabIndex        =   10
         Top             =   1665
         Width           =   825
      End
      Begin VB.Label Labels 
         Caption         =   "Scaling"
         Height          =   195
         Index           =   5
         Left            =   1845
         TabIndex        =   9
         Top             =   1665
         Width           =   615
      End
      Begin VB.Label Labels 
         Caption         =   "Axiom"
         ForeColor       =   &H00000080&
         Height          =   195
         Index           =   7
         Left            =   225
         TabIndex        =   8
         Top             =   270
         Width           =   615
      End
   End
End
Attribute VB_Name = "frmNewEdit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private mLinDef As LinDef
Private mCopyDef As LinDef
Private mSymbolsSelected As Boolean
Private mNoEntry As Boolean
Private mKey As String

Public Cancelled As Boolean

Private Const NEWKEY As String = "?"
Private Const NEWRULE As String = "[]"
Private Const NEWSYMBOL As String = "F"
Public Sub SetDefinition(PFile As LinDef)

    Set mLinDef = PFile
    Set mCopyDef = PFile.CreateCopy()
    Cancelled = False
    LoadRules
    LoadDetails
    If lstKeys.ListCount > 0 Then
        lstKeys.ListIndex = 0
        lstItems.ListIndex = 0
    End If
    
End Sub

Public Sub LoadRules()
Dim Index As Long

    mSymbolsSelected = False
    lstKeys.Clear
    lstItems.Clear

    With mCopyDef.Rules
        If .Count = 0 Then
            lstKeys.AddItem NEWKEY
            lstItems.AddItem NEWRULE
            mCopyDef.Rules.Add NEWKEY, NEWRULE
            lstKeys.ListIndex = 0
        Else
            For Index = 0 To .Count - 1
                lstKeys.AddItem .Keys(Index)
            Next
            For Index = 0 To .Count - 1
                lstItems.AddItem .Item(lstKeys.List(Index))
            Next
        End If
    End With
    
End Sub
Public Sub LoadSymbols()
Dim Index As Long

    lstKeys.Clear
    lstItems.Clear
    With mCopyDef.Symbols
        For Index = 0 To .Count - 1
            lstKeys.AddItem .Keys(Index)
        Next
        For Index = 0 To .Count - 1
            lstItems.AddItem .Item(lstKeys.List(Index))
        Next
    End With
    
    If lstItems.ListCount = 0 Then lstItems.AddItem "No Turtle Symbols"
    
    mSymbolsSelected = True
    
End Sub


Public Sub LoadDetails()

    With mLinDef
        txtAxiom = .Axiom
        txtRecurseDepth = .RecurseDepth
        txtRotation = .Rotation
        txtLength = .Length
        txtScaling = .Scaling
        txtFileName = .FileName
        txtOffSetX = .OffSetX
        txtOffSetY = .OffSetY
        txtOffsetRotation = .Direction
    End With
    
End Sub


Private Sub cmdAdd_Click()

    RSAdd

End Sub

Private Sub cmdCancel_Click()
    Cancelled = True
    Cleanup
End Sub


Private Sub cmdDelete_Click()

    RSDelete
    
End Sub

Private Sub cmdEdit_Click()
    Shell "C:\WINDOWS\NOTEPAD.EXE " & mCopyDef.Path & mCopyDef.FileName, vbNormalFocus
End Sub

Private Sub cmdOK_Click()
    
    If CheckValues Then
        mLinDef.SetDefinition mCopyDef
        Cleanup
    End If
    
End Sub



Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If Not mNoEntry Then Cleanup
End Sub


Private Sub lstItems_Click()

    If mNoEntry Then Exit Sub
    
    mNoEntry = True
    mKey = lstKeys.Text
    txtKey = lstKeys.Text
    txtItem = lstItems.Text
    mNoEntry = False
    
End Sub

Private Sub lstItems_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lstKeys.ListIndex = lstItems.ListIndex
End Sub


Private Sub lstKeys_Click()

    If mNoEntry Then Exit Sub
    mNoEntry = True
    mKey = lstKeys.Text
    txtKey = lstKeys.Text
    txtItem = lstItems.Text
    mNoEntry = False
    
End Sub


Private Sub lstKeys_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lstItems.ListIndex = lstKeys.ListIndex
End Sub


Private Sub optRuSY_Click(Index As Integer)
    If Index = 0 Then
        LoadRules
    Else
        LoadSymbols
    End If
    If lstKeys.ListCount > 0 Then
        lstKeys.ListIndex = 0
        lstItems.ListIndex = 0
    Else
        txtKey = ""
        txtItem = ""
    End If
End Sub


Private Sub txtAxiom_Change()
    If Not Len(txtAxiom) = 0 Then mCopyDef.Axiom = txtAxiom.Text
End Sub

Private Sub txtFileName_Change()
    If Not Len(txtFileName) = 0 Then mCopyDef.FileName = txtFileName.Text
End Sub

Private Sub txtItem_Change()

    If mNoEntry Then Exit Sub
    If Len(txtItem.Text) = 0 Then Exit Sub
    RSUpdate
    
End Sub

Private Sub txtKey_Change()
    
    If mNoEntry Then Exit Sub
    If Len(txtKey.Text) = 0 Then Exit Sub
    RSUpdate

End Sub

Private Sub txtKey_KeyPress(KeyAscii As Integer)
Dim Index As Long
    
    If Not KeyAscii = Asc(vbBack) Then
        If KeyAscii < Asc("A") Or KeyAscii > Asc("Z") Then
            If KeyAscii > Asc("a") Or KeyAscii < Asc("z") Then
                KeyAscii = KeyAscii - (Asc("a") - Asc("A"))
            Else
                KeyAscii = 0
                Exit Sub
            End If
        End If
        For Index = 0 To lstKeys.ListCount - 1
            If KeyAscii = Asc(lstKeys.List(Index)) Then
                KeyAscii = 0
                Exit For
            End If
        Next
    End If
    
End Sub


Private Sub txtLength_Change()
    If Not Len(txtLength) = 0 Then mCopyDef.Length = txtLength.Text
End Sub


Private Sub txtLength_KeyPress(KeyAscii As Integer)
    If CheckNumber(KeyAscii) = False Then KeyAscii = 0
End Sub


Private Sub txtOffsetRotation_Change()
    If Not Len(txtOffsetRotation) = 0 Then mCopyDef.Direction = txtOffsetRotation
End Sub

Private Sub txtOffsetRotation_KeyPress(KeyAscii As Integer)
    If CheckNumber(KeyAscii) = False Then KeyAscii = 0
End Sub


Private Sub txtOffSetX_Change()
    If Not Len(txtOffSetX) = 0 Then mCopyDef.OffSetX = txtOffSetX.Text
End Sub

Private Sub txtOffSetX_KeyPress(KeyAscii As Integer)
    If CheckNumber(KeyAscii) = False Then KeyAscii = 0
End Sub


Private Sub txtOffSetY_Change()
    If Not Len(txtOffSetY) = 0 Then mCopyDef.OffSetY = txtOffSetY.Text
End Sub


Private Sub txtOffSetY_KeyPress(KeyAscii As Integer)
    If CheckNumber(KeyAscii) = False Then KeyAscii = 0
End Sub


Private Sub txtRecurseDepth_Change()
    If Not Len(txtRecurseDepth) = 0 Then mCopyDef.RecurseDepth = txtRecurseDepth.Text
End Sub


Private Sub txtRecurseDepth_KeyPress(KeyAscii As Integer)
    If CheckNumber(KeyAscii) = False Then KeyAscii = 0
End Sub


Private Sub txtRotation_Change()
    If Not Len(txtRotation) = 0 Then mCopyDef.Rotation = txtRotation.Text
End Sub


Private Sub txtRotation_KeyPress(KeyAscii As Integer)
    If CheckNumber(KeyAscii) = False Then KeyAscii = 0
End Sub


Private Sub txtScaling_Change()
    If Not Len(txtScaling) = 0 Then mCopyDef.Scaling = txtScaling.Text
End Sub



Public Sub Cleanup()

    mNoEntry = True
    Set mLinDef = Nothing
    Set mCopyDef = Nothing
    Unload Me
    mNoEntry = False
    
End Sub

Private Sub ToggleButtons()
Dim Toggle As Boolean

    Toggle = CBool(Len(txtKey.Text)) And CBool(Len(txtItem.Text))
    
    cmdAdd.Enabled = Toggle
    cmdDelete.Enabled = Toggle
    
End Sub

Public Function CheckValues() As Boolean
Dim Msg As String

    With mCopyDef
        If .Rules.Count = 0 Then
            Msg = "You must have at least one rule"
        ElseIf Len(.Axiom) = 0 Then
            Msg = "Your Axiom is missing"
        End If
        If Not Len(Msg) = 0 Then
            MsgBox Msg
            Exit Function
        End If
    End With
    CheckValues = True

End Function

Public Function CheckNumber(KeyAscii As Integer) As Boolean

    Select Case KeyAscii
        Case Asc("0") To Asc("9")
            CheckNumber = True
        Case Asc(".")
            CheckNumber = True
        Case Asc(vbBack)
            CheckNumber = True
    End Select

End Function

Private Sub txtScaling_KeyPress(KeyAscii As Integer)
    If CheckNumber(KeyAscii) = False Then KeyAscii = 0
End Sub



Private Sub RSUpdate()
Dim LI As Long

    If mSymbolsSelected Then
        If Not mCopyDef.Symbols.Count = 0 Then
            mCopyDef.Symbols.Remove mKey
            mKey = txtKey.Text
            mCopyDef.Symbols.Add mKey, txtItem.Text
            LoadSymbols
        End If
    Else
        If Not mCopyDef.Rules.Count = 0 Then
            mCopyDef.Rules.Remove mKey
            mKey = txtKey.Text
            mCopyDef.Rules.Add mKey, txtItem.Text
            LoadRules
        End If
    End If
  
End Sub

Public Sub RSAdd()

    If mSymbolsSelected Then
        mCopyDef.Symbols.Add NEWKEY, NEWSYMBOL
        LoadSymbols
    Else
        mCopyDef.Rules.Add NEWKEY, NEWRULE
        LoadRules
    End If
    mKey = NEWKEY
    lstKeys.ListIndex = 0
    lstItems.ListIndex = 0
    
End Sub

Public Sub RSDelete()

    With mCopyDef
        If mSymbolsSelected Then
            .Symbols.Remove lstKeys.Text
            LoadSymbols
        Else
            .Rules.Remove lstKeys.Text
            LoadRules
        End If
    End With
    txtKey = ""
    txtItem = ""
    
End Sub
