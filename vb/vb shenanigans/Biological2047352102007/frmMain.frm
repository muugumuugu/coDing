VERSION 5.00
Begin VB.Form frmMain 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Tanner Helland for InBio 365: Biological Life Simulator"
   ClientHeight    =   8490
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11445
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   566
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   763
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picFront 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      DrawWidth       =   2
      FillColor       =   &H00FF0000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   7530
      Left            =   120
      MousePointer    =   2  'Cross
      ScaleHeight     =   500
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   500
      TabIndex        =   27
      Top             =   360
      Width           =   7530
   End
   Begin VB.CommandButton cmdSaveData 
      Caption         =   "Save simulation data to file..."
      Height          =   375
      Left            =   5400
      TabIndex        =   26
      Top             =   8040
      Width           =   2295
   End
   Begin VB.CheckBox chkDisplayDead 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Display dead organisms?"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   21
      Top             =   8040
      Value           =   1  'Checked
      Width           =   2175
   End
   Begin VB.Frame frmStartSettings 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Initial Simulation Settings:"
      ForeColor       =   &H80000008&
      Height          =   4095
      Left            =   7800
      TabIndex        =   7
      Top             =   1080
      Width           =   3495
      Begin VB.TextBox txtMutations 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   2400
         TabIndex        =   24
         Text            =   "15"
         Top             =   3720
         Width           =   855
      End
      Begin VB.TextBox txtMutateTurns 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   2040
         TabIndex        =   22
         Text            =   "750"
         Top             =   3360
         Width           =   1215
      End
      Begin VB.CheckBox chkMultiply 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Allow organisms to multiply and mutate"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   3000
         Value           =   1  'Checked
         Width           =   3255
      End
      Begin VB.TextBox txtFoodWorth 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   2400
         TabIndex        =   18
         Text            =   "35"
         Top             =   2520
         Width           =   855
      End
      Begin VB.TextBox txtFoodGen 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   2280
         TabIndex        =   16
         Text            =   "5"
         Top             =   2160
         Width           =   975
      End
      Begin VB.TextBox txtFoodRegen 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   2760
         TabIndex        =   14
         Text            =   "20"
         Top             =   1800
         Width           =   495
      End
      Begin VB.TextBox txtInitialEnergy 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   1440
         TabIndex        =   12
         Text            =   "500"
         Top             =   720
         Width           =   1815
      End
      Begin VB.TextBox txtInitialFood 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   1440
         TabIndex        =   10
         Text            =   "1500"
         Top             =   1440
         Width           =   1815
      End
      Begin VB.TextBox txtOrganisms 
         Appearance      =   0  'Flat
         Height          =   255
         Left            =   1440
         TabIndex        =   9
         Text            =   "15"
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "New DNA mutates (x) bases:"
         Height          =   210
         Left            =   120
         TabIndex        =   25
         Top             =   3720
         Width           =   2130
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Multiply every (x) cycles:"
         Height          =   210
         Left            =   120
         TabIndex        =   23
         Top             =   3360
         Width           =   1815
      End
      Begin VB.Line Line2 
         X1              =   120
         X2              =   3360
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Food grants this much energy: "
         Height          =   210
         Left            =   120
         TabIndex        =   19
         Top             =   2520
         Width           =   2250
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Regenerate this much food: "
         Height          =   210
         Left            =   120
         TabIndex        =   17
         Top             =   2160
         Width           =   2040
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Regenerate food every (x) cycles: "
         Height          =   210
         Left            =   120
         TabIndex        =   15
         Top             =   1800
         Width           =   2550
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Initial energy: "
         Height          =   210
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   990
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Amount of food: "
         Height          =   210
         Left            =   120
         TabIndex        =   11
         Top             =   1440
         Width           =   1215
      End
      Begin VB.Line Line1 
         X1              =   120
         X2              =   3360
         Y1              =   1200
         Y2              =   1200
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "# of Organisms: "
         Height          =   210
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   1200
      End
   End
   Begin VB.Frame frmOrganisms 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Select an organism for detailed information:"
      ForeColor       =   &H80000008&
      Height          =   3015
      Left            =   7800
      TabIndex        =   4
      Top             =   5400
      Width           =   3495
      Begin VB.TextBox txtInfo 
         Appearance      =   0  'Flat
         Height          =   2055
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   6
         Text            =   "frmMain.frx":0000
         Top             =   840
         Width           =   3255
      End
      Begin VB.ComboBox cmbOrganisms 
         Height          =   330
         Left            =   120
         TabIndex        =   5
         Text            =   "Please start the simulator"
         Top             =   360
         Width           =   3255
      End
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop current simulation"
      Height          =   495
      Left            =   9600
      TabIndex        =   3
      Top             =   360
      Width           =   1695
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "START new simulation"
      Height          =   495
      Left            =   7800
      TabIndex        =   2
      Top             =   360
      Width           =   1695
   End
   Begin VB.PictureBox picMap 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      ClipControls    =   0   'False
      DrawWidth       =   2
      FillColor       =   &H00FF0000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   7530
      Left            =   120
      MousePointer    =   2  'Cross
      ScaleHeight     =   500
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   500
      TabIndex        =   0
      Top             =   360
      Visible         =   0   'False
      Width           =   7530
   End
   Begin VB.PictureBox picFood 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      ClipControls    =   0   'False
      DrawWidth       =   2
      FillColor       =   &H00FF0000&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   7530
      Left            =   120
      MousePointer    =   2  'Cross
      ScaleHeight     =   500
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   500
      TabIndex        =   28
      Top             =   360
      Visible         =   0   'False
      Width           =   7530
   End
   Begin VB.Label lblTitle 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Press the start button to begin the simulator --------------------------------------------------------------------->"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   7455
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'***************************************************************************
'Biological Life Simulator
'©2006 Tanner 'DemonSpectre' Helland
'Created: December 2006
'Last updated: 10 February 2007
'
'This little program was my final project for a university bioinformatics
'course.  It is designed to represent basic evolutionary and population
'genetics principles for simple artifical organisms.  Each organism has a
'strand of pseudo-DNA that determines three basic attributes (size, speed, and
'range - how far it can see) and when they split to form new organisms,
'mutations may take place.
'
'My longest simulation went for 390357 cycles before all organisms died out.
'Maybe you can get it to go longer!
'
'E-mail questions or comments to
'tannerhelland@hotmail.com
'
'Check out original VG music at my online music studio
'http://www.tannerhelland.com
'
'More great game-related code at
'http://www.studentsofgamedesign.com
'***************************************************************************



'Array of creatures
Dim Creatures() As Organism

'For handling the main program loop
Dim runSim As Boolean

'Couple of variables for showing the user information
Dim totalCreatures As Long
Dim numAlive As Long
Dim numOfCycles As Long

Private Sub chkDisplayDead_Click()
    drawDeadCreatures = chkDisplayDead
    picMap.Cls
    If runSim = False Then DrawMap
End Sub

Private Sub chkMultiply_Click()
    toMultiply = chkMultiply
End Sub

'This combo box is used to display information about a particular organism
Private Sub cmbOrganisms_Click()
    'Only update the box if we've run the simulation before
    If UBound(Creatures) > 0 Then
        'Mark all creatures as unselected
        For i = 0 To UBound(Creatures)
            Creatures(i).Selected = False
            If drawDeadCreatures = True Then
                Creatures(i).drawOrganism picMap
            Else
                If Creatures(i).isAlive = True Then Creatures(i).drawOrganism picMap
            End If
        Next i
        'Select the current organism
        Creatures(cmbOrganisms.ListIndex).Selected = True
        If drawDeadCreatures = True Then Creatures(cmbOrganisms.ListIndex).drawOrganism picMap
        With txtInfo
            .Text = ""
            .Text = "Creature #" & cmbOrganisms.ListIndex & vbCrLf
            .Text = .Text & "------------------------" & vbCrLf
            .Text = .Text & "Lifetime: " & Creatures(cmbOrganisms.ListIndex).Lifetime & " cycles"
            If Creatures(cmbOrganisms.ListIndex).isAlive = False Then
                .Text = .Text & " (now dead)"
            Else
                .Text = .Text & " (still alive)"
            End If
            .Text = .Text & vbCrLf
            .Text = .Text & "Size: " & Creatures(cmbOrganisms.ListIndex).gSize & vbCrLf
            .Text = .Text & "Range: " & Creatures(cmbOrganisms.ListIndex).gRange & vbCrLf
            .Text = .Text & "Speed: " & Creatures(cmbOrganisms.ListIndex).gSpeed & vbCrLf
            .Text = .Text & "Current Energy: " & Creatures(cmbOrganisms.ListIndex).Energy & vbCrLf
            .Text = .Text & "Parent: "
            If Creatures(cmbOrganisms.ListIndex).ParentID = -1 Then
                .Text = .Text & "none (original)" & vbCrLf
            Else
                .Text = .Text & Creatures(cmbOrganisms.ListIndex).ParentID & vbCrLf
            End If
            .Text = .Text & "Original ancestor: "
            If Creatures(cmbOrganisms.ListIndex).AncestralID = -1 Then
                .Text = .Text & "none (original)" & vbCrLf
            Else
                .Text = .Text & Creatures(cmbOrganisms.ListIndex).AncestralID & vbCrLf
            End If
        End With
    End If
End Sub

Private Sub cmdSaveData_Click()
    'Simple save dialog
    Dim CC As cCommonDialog
    
    Dim sFile As String
    Set CC = New cCommonDialog
    If CC.VBGetSaveFileName(sFile, , True, "Simulation data (.txt)|*.txt|All files|*.*", , , "Save your biological simulation data", ".txt", frmMain.hWnd, 0) Then
        'Open the target file and output information as a tab-delimited text file
        
        If FileExist(sFile) Then Kill sFile
        
        Open sFile For Output As #1
        Dim hInfo As String
        hInfo = "Creature#" & vbTab & "Lifetime" & vbTab & "Size" & vbTab & "Range" & vbTab & "Speed" & vbTab & "Parent" & vbTab & "AncestralID" & vbTab & "DNA"
        Print #1, hInfo
        
        If UBound(Creatures) > 0 Then
        
            For i = 0 To UBound(Creatures)
                
                'A temporary string for storing the information we'll dump to file
                Dim tInfo As String
                
                tInfo = Creatures(i).ID & vbTab
                tInfo = tInfo & Creatures(i).Lifetime & vbTab
                tInfo = tInfo & Creatures(i).gSize & vbTab
                tInfo = tInfo & Creatures(i).gRange & vbTab
                tInfo = tInfo & Creatures(i).gSpeed & vbTab
                If Creatures(i).ParentID = -1 Then
                    tInfo = tInfo & "n/a" & vbTab
                Else
                    tInfo = tInfo & Creatures(i).ParentID & vbTab
                End If
                If Creatures(i).AncestralID = -1 Then
                    tInfo = tInfo & "n/a" & vbTab
                Else
                    tInfo = tInfo & Creatures(i).AncestralID & vbTab
                End If
      
                For x = 0 To Creatures(i).getMaxDNA
                    tInfo = tInfo & Creatures(i).getDNABase(x)
                Next x
      
                'tInfo = tInfo & vbCrLf
                
                Print #1, tInfo
        
            Next i
            
        End If
        
        Close #1
        
    End If
End Sub

'START button
Private Sub cmdStart_Click()
    
    picMap.Cls
    
    'Collect values from text boxes
    startEnergy = CLng(txtInitialEnergy)
    InitialCreatures = CLng(txtOrganisms) - 1
    foodRegen = CLng(txtFoodRegen)
    foodGen = CLng(txtFoodGen)
    foodWorth = CLng(txtFoodWorth)
    toMultiply = chkMultiply
    drawDeadCreatures = chkDisplayDead
    mutateTurns = CLng(txtMutateTurns)
    numOfMutations = CLng(txtMutations)
    
    'Prepare the food array
    ReDim Food(0 To WORLDWIDTH, 0 To WORLDHEIGHT) As Long
    'Fill it with a random amount of food
    For i = 0 To CLng(txtInitialFood)
        x = Int(Rnd * WORLDWIDTH)
        y = Int(Rnd * WORLDHEIGHT)
        Food(x, y) = 255
    Next i
    'Then draw it to its own special picture box
    For x = 0 To WORLDWIDTH
    For y = 0 To WORLDHEIGHT
        If Food(x, y) > 0 Then SetPixelV picFood.hdc, x, y, RGB(0, 64, 0)
        'If Food(x, y) > 0 Then picMap.PSet (x, y), RGB(0, 64, 0)
    Next y
    Next x
    
    'Create the original batch of creatures
    ReDim Creatures(0 To InitialCreatures) As Organism
    cmbOrganisms.Clear
    For i = 0 To InitialCreatures
        Set Creatures(i) = New Organism
        Creatures(i).CreateRandom
        Creatures(i).ID = i
        Creatures(i).oX = Int(Rnd * WORLDWIDTH)
        Creatures(i).osX = Creatures(i).oX
        Creatures(i).oY = Int(Rnd * WORLDHEIGHT)
        Creatures(i).osY = Creatures(i).oY
        cmbOrganisms.AddItem "Organism #" & i
    Next i
    
    numOfCycles = 0
    numAlive = InitialCreatures '- 1
    totalCreatures = InitialCreatures '- 1
    
    runSim = True
    MainLoop
End Sub

'STOP button
Private Sub cmdStop_Click()
    runSim = False
End Sub

Private Sub Form_Load()
    
    'Disable running the main loop initially
    runSim = False
    
    'Randomize the program
    Randomize Timer
    
    ReDim Creatures(0) As Organism
    
End Sub

'Draw the world out
Private Sub DrawMap()
    
    BitBlt picMap.hdc, 0, 0, picMap.ScaleWidth, picMap.ScaleHeight, picFood.hdc, 0, 0, vbSrcCopy
    
    'Next, draw the creatures
    For i = 0 To UBound(Creatures)
        If drawDeadCreatures = True Then
            Creatures(i).drawOrganism picMap
        Else
            If Creatures(i).isAlive = True Then Creatures(i).drawOrganism picMap
        End If
    Next i
    
    BitBlt picFront.hdc, 0, 0, picFront.ScaleWidth, picFront.ScaleHeight, picMap.hdc, 0, 0, vbSrcCopy
    
End Sub

'Obviously, this routine is used to make new food appear every turn
Private Sub GenerateFood()
    
    Dim setNewFood As Long
    
    setNewFood = Int(Rnd * 1000000)
    
    If (setNewFood Mod foodRegen = 0) Then
        For i = 0 To foodGen
            x = Int(Rnd * WORLDWIDTH)
            y = Int(Rnd * WORLDHEIGHT)
            'Food(x, y) = Abs(Food(x, y) - 255) - to randomly make food disappear too?
            Food(x, y) = 255
            SetPixelV picFood.hdc, x, y, RGB(0, 64, 0)
        Next i
    End If
    
End Sub

'This runs when start is pushed and stops when stop is pushed.  Not too tricky.
Private Sub MainLoop()
    Dim count As Long
    count = 1
    Do While runSim = True
        GenerateFood
        Think
        'If they are allowed to multiply every (x) turns, this will handle that
        If toMultiply = True Then
            If count Mod mutateTurns = 0 Then
                For i = 0 To UBound(Creatures)
                    'MsgBox Creatures(i).Lifetime
                    If (Creatures(i).isAlive = True And Creatures(i).Lifetime >= mutateTurns) Then
                        totalCreatures = totalCreatures + 1
                        numAlive = numAlive + 1
                        ReDim Preserve Creatures(0 To totalCreatures) As Organism
                        Set Creatures(totalCreatures) = New Organism
                        Creatures(totalCreatures).CreateFromCreature Creatures(i)
                        Creatures(totalCreatures).ID = totalCreatures
                        Creatures(totalCreatures).oX = Creatures(i).oX
                        Creatures(totalCreatures).osX = Creatures(i).osX
                        Creatures(totalCreatures).oY = Creatures(i).oY
                        Creatures(totalCreatures).osY = Creatures(i).osY
                        cmbOrganisms.AddItem "Organism #" & totalCreatures
                    End If
                Next i
            End If
        End If
        count = count + 1
        lblTitle.Caption = "Running simulator: " & numAlive & " alive, " & (totalCreatures - numAlive + 1) & " dead @ " & count & " cycles"
        DrawMap
        DoEvents
        If numAlive = 0 Then runSim = False
    Loop
End Sub

'This routine will launch the brain of every organism for this round
Private Sub Think()

    numAlive = 0

    'Loop through every creature, processing its simple thought process
    For i = 0 To UBound(Creatures)
        If Creatures(i).isAlive = True Then
            Creatures(i).Brain
            numAlive = numAlive + 1
        End If
    Next i

End Sub

Private Sub Form_Unload(Cancel As Integer)
    runSim = False
End Sub

'This allows the user to click on a particular organism and see its vital information
Private Sub picFront_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    
    If Button = 1 Then
    
        Dim minDistance As Single
        Dim curDist As Single
        Dim minIndex As Long
        
        minDistance = 10000
        minIndex = 0
        
        If UBound(Creatures) > 0 Then
        
            For i = 0 To UBound(Creatures)
                If drawDeadCreatures = False And Creatures(i).isAlive = False Then GoTo NEXTI
                curDist = Distance(x, y, Creatures(i).oX, Creatures(i).oY)
                If curDist < minDistance Then
                    minDistance = curDist
                    minIndex = i
                End If
NEXTI:      Next i
            
            If minDistance < (Creatures(minIndex).gRange * 2) Then
                If drawDeadCreatures = True Then
                    cmbOrganisms.ListIndex = minIndex
                Else
                    If Creatures(minIndex).isAlive = True Then
                        cmbOrganisms.ListIndex = minIndex
                    End If
                End If
            Else
                For i = 0 To UBound(Creatures)
                    Creatures(i).Selected = False
                Next i
                cmbOrganisms.Text = "Please select an organism"
                txtInfo.Text = "Please select an organism from the drop-down box.  Once selected, an organism will turn BLACK for easy identification."
            End If
        
        End If
    
    Else
    
        If UBound(Creatures) > 0 Then
        
            For i = 0 To UBound(Creatures)
                Creatures(i).Selected = False
            Next i
      
        End If
        
        cmbOrganisms.Text = "Please select an organism"
        txtInfo.Text = "Please select an organism from the drop-down box.  Once selected, an organism will turn BLACK for easy identification."
    
    End If
    

End Sub

'Simple Euclidean distance function
Private Function Distance(ByVal x1 As Single, ByVal y1 As Single, ByVal x2 As Single, ByVal y2 As Single)
    Distance = Sqr((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
End Function

'See if a file exists or not
Private Function FileExist(fName As String) As Boolean
    On Error Resume Next
    Dim Temp As Long
    Temp = GetAttr(fName)
    FileExist = Not CBool(Err)
End Function
