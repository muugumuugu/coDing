VERSION 5.00
Begin VB.Form frmEDITOR 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   Caption         =   "Creature Editor"
   ClientHeight    =   7050
   ClientLeft      =   60
   ClientTop       =   2370
   ClientWidth     =   9090
   LinkTopic       =   "Form1"
   ScaleHeight     =   470
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   606
   Begin VB.CheckBox chPenalize 
      Caption         =   "ground penalization"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6840
      TabIndex        =   10
      ToolTipText     =   "Apply a score penalization if (next added) point will touch ground"
      Top             =   1560
      Width           =   2055
   End
   Begin VB.OptionButton oAddMuscle 
      Caption         =   "Add Muscle"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6600
      TabIndex        =   9
      ToolTipText     =   "Add a (brain driven) Angle constraint between 2 links"
      Top             =   2640
      Width           =   2295
   End
   Begin VB.CommandButton cmdDELETE 
      Caption         =   "Delete From Disk"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6600
      TabIndex        =   8
      Top             =   6600
      Width           =   2295
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   7
      Text            =   "frmEDITOR.frx":0000
      Top             =   30
      Width           =   8895
   End
   Begin VB.CommandButton cmdSAVE 
      Caption         =   "SAVE AS"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6600
      TabIndex        =   5
      Top             =   3240
      Width           =   2295
   End
   Begin VB.FileListBox File1 
      Height          =   2625
      Left            =   6600
      Pattern         =   "*.cre"
      TabIndex        =   4
      Top             =   3840
      Width           =   2295
   End
   Begin VB.CommandButton cmdCLear 
      Caption         =   "New Creature"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6600
      TabIndex        =   3
      Top             =   720
      Width           =   2415
   End
   Begin VB.CheckBox chBrainLink 
      Caption         =   "with Brain"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6840
      TabIndex        =   2
      ToolTipText     =   "Brain driven ?"
      Top             =   2280
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.OptionButton oAddLink 
      Caption         =   "Add Links"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6600
      TabIndex        =   1
      ToolTipText     =   "Add Link/Limb"
      Top             =   1920
      Width           =   2295
   End
   Begin VB.OptionButton oAddPoint 
      Caption         =   "Add Points"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6600
      TabIndex        =   0
      Top             =   1200
      Value           =   -1  'True
      Width           =   2295
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Double Click to Load"
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   6600
      TabIndex        =   6
      Top             =   3600
      Width           =   2295
   End
End
Attribute VB_Name = "frmEDITOR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim CR             As New clsCreature
Dim P1             As Long
Dim P2             As Long
Dim L1 As Long
Dim L2 As Long
Dim Px As Long
Dim Py As Long

Private Sub cmdCLear_Click()
    CR.ClearAll
    Me.Cls
    oAddPoint = True

End Sub

Private Sub cmdDELETE_Click()
    Dim R          As Long
    R = MsgBox("Are you Sure to Delete  " & Chr$(34) & CreFN & Chr$(34) & " ?", vbYesNo)

    If R = vbYes Then
        If Dir(App.Path & "\Creatures\" & CreFN) <> vbNullString Then
            Kill App.Path & "\Creatures\" & CreFN
            If Dir(App.Path & "\Creatures\" & CreFN & "Pop.txt") <> vbNullString Then Kill App.Path & "\Creatures\" & CreFN & "Pop.txt"
        Else
            MsgBox Chr$(34) & CreFN & Chr$(34) & "  already deleted."
        End If
        File1.Refresh
    End If


End Sub

Private Sub cmdSAVE_Click()
    Dim FN         As String
ag:
    FN = InputBox("Type FileName", "Save as ", "new")
    If Len(FN) < 3 Then MsgBox "Too short Name": GoTo ag
    CR.SaveMe "Creatures\" & FN
    File1.Refresh
    CreFN = FN

End Sub

Private Sub File1_DblClick()
    BitBlt Me.hdc, 0, 0, Me.ScaleWidth, Me.ScaleHeight, Me.hdc, 0, 0, vbBlack    'ness
    CR.LoadMe "Creatures\" & File1, 50, Me.ScaleHeight - 50
    CR.DRAW Me.hdc, 0, True
    Me.Refresh
    CreFN = File1
End Sub

Private Sub Form_Activate()
    File1.Path = App.Path & "\Creatures"
    File1.Refresh

    CR.DRAW Me.hdc, 0, True
    Me.Refresh
End Sub

Private Sub Form_Load()
    CR.LoadMe "Creatures\" & "default.cre", 50, Me.ScaleHeight - 50


End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim I          As Long
    Dim dx         As Single
    Dim dy         As Single
    Dim D          As Single
    Dim Dmin       As Single
    Dim tpX As Single
    Dim tpY As Single
    
    If oAddPoint Then
        CR.ADDpoint X, Y, chPenalize.Value
        For I = 1 To CR.NP
            MyCircle Me.hdc, CR.getpointX(I), CR.getpointY(I), 3, 2, IIf(CR.IsPenalized(I), vbRed, vbBlue)
            Me.Refresh

        Next
    End If
    If oAddLink Then
        If P1 = 0 Then
            Dmin = 99999999999#
            For I = 1 To CR.NP
                dx = CR.getpointX(I) - X
                dy = CR.getpointY(I) - Y
                D = Sqr(dx * dx + dy * dy)
                If D < Dmin Then Dmin = D: P1 = I
            Next
        End If
    End If

    If oAddMuscle Then
        If L1 = 0 Then
            Dmin = 99999999999#
            For I = 1 To CR.NL
                tpX = (CR.getpointX(CR.GetLinkP1(I)) + CR.getpointX(CR.GetLinkP2(I))) * 0.5
                dx = tpX - X
                tpY = (CR.getpointY(CR.GetLinkP1(I)) + CR.getpointY(CR.GetLinkP2(I))) * 0.5
                dy = tpY - Y
                D = Sqr(dx * dx + dy * dy)
                If D < Dmin Then Dmin = D: L1 = I: Px = tpX: Py = tpY
            Next
        End If
    End If


End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim I          As Long
    
    
    If Button = 1 And oAddLink And P1 <> 0 Then
        BitBlt Me.hdc, 0, 0, Me.ScaleWidth, Me.ScaleHeight, Me.hdc, 0, 0, vbBlack    'ness
        For I = 1 To CR.NP
            MyCircle Me.hdc, CR.getpointX(I), CR.getpointY(I), 3, 2, vbBlue
        Next
        FastLine Me.hdc, X \ 1, Y \ 1, CR.getpointX(P1), CR.getpointY(P1), 1, vbWhite
        CR.DRAW Me.hdc, 0, True
        Me.Refresh

    End If
    
        If Button = 1 And oAddMuscle And L1 <> 0 Then
        
        BitBlt Me.hdc, 0, 0, Me.ScaleWidth, Me.ScaleHeight, Me.hdc, 0, 0, vbBlack    'ness
        For I = 1 To CR.NP
            MyCircle Me.hdc, CR.getpointX(I), CR.getpointY(I), 3, 2, vbBlue
        Next
        FastLine Me.hdc, X \ 1, Y \ 1, Px, Py, 1, vbWhite
        CR.DRAW Me.hdc, 0, True
        Me.Refresh

    End If
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim I          As Long
    Dim dx         As Single
    Dim dy         As Single
    Dim D          As Single
    Dim Dmin       As Single

    If oAddLink Then
        If P1 <> 0 Then
            Dmin = 99999999999#
            For I = 1 To CR.NP
                dx = CR.getpointX(I) - X
                dy = CR.getpointY(I) - Y
                D = Sqr(dx * dx + dy * dy)
                If D < Dmin And I <> P1 Then Dmin = D: P2 = I
            Next
        End If
        Me.Caption = "Added link: " & P1 & "-" & P2
        CR.AddLink P1, P2, ST, chBrainLink
        P1 = 0
        P2 = 0
        BitBlt Me.hdc, 0, 0, Me.ScaleWidth, Me.ScaleHeight, Me.hdc, 0, 0, vbBlack    'ness
        CR.DRAW Me.hdc, 0, True
        Me.Refresh
    End If

    If oAddMuscle Then
        If L1 <> 0 Then
            Dmin = 99999999999#
            For I = 1 To CR.NL
                Px = (CR.getpointX(CR.GetLinkP1(I)) + CR.getpointX(CR.GetLinkP2(I))) * 0.5
                dx = Px - X
                Py = (CR.getpointY(CR.GetLinkP1(I)) + CR.getpointY(CR.GetLinkP2(I))) * 0.5
                dy = Py - Y
                D = Sqr(dx * dx + dy * dy)
                If D < Dmin Then Dmin = D: L2 = I
            Next


            If CR.ADDMuscle(L1, L2) Then
                Me.Caption = "Added muscle  from Link " & L1 & " to " & L2
            Else
                Me.Caption = "No muscle created (" & L1 & "-" & L2 & ")"
            End If


            L1 = 0
            L2 = 0
            BitBlt Me.hdc, 0, 0, Me.ScaleWidth, Me.ScaleHeight, Me.hdc, 0, 0, vbBlack    'ness
            CR.DRAW Me.hdc, 0, True
            Me.Refresh
        End If
    End If



End Sub

Private Sub oAddLink_Click()
    chBrainLink.Visible = oAddLink
chPenalize.Visible = oAddPoint
End Sub

Private Sub oAddMuscle_Click()
If oAddMuscle Then chBrainLink.Visible = False
chPenalize.Visible = oAddPoint
End Sub

Private Sub oAddPoint_Click()
    chBrainLink.Visible = oAddLink
    chPenalize.Visible = oAddPoint
    
    
End Sub
