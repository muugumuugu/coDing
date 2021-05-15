VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Organism"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Organism-specific constants
Private Const DNALENGTH As Long = 299

'First, organism attributes
Public ID As Long
Public ParentID As Long
Public AncestralID As Long
Public isAlive As Boolean
Private DNA() As Byte
'Current coordinates
Public oX As Long, oY As Long
Public osX As Single, osY As Single
'Last coordinates
Public oldX As Long, oldY As Long
'Currently selected or not
Public Selected As Boolean


'Next, the values for specific genes
'These are determined ONLY at birth

'Radius of the creature
Public gSize As Long
'Speed of the creature
Public gSpeed As Single
'Eyesight range of the creature (as a radius)
Public gRange As Long

'Next, organism properties that exist independent of genes
'These are changed as the program progresses

'Energy of the creature
Public Energy As Long
'How many frames the organism has been alive
Public Lifetime As Long
'The type of our target coordinates
Public targetType As Long
'Our actual target coordinates
Public tX As Long, tY As Long

'Iterative variables
Dim i As Long, j As Long
Dim x As Long, y As Long

'Return the length of this creature's DNA
Public Function getMaxDNA() As Long
    getMaxDNA = DNALENGTH
End Function

'Return a DNA base at position (pos)
Public Function getDNABase(ByVal pos As Long) As Byte
    getDNABase = DNA(pos)
End Function

'Mutate a base randomly
Public Sub mutateBase()
    Randomize Timer
    Dim mutate As Long
    mutate = Int(Rnd * 3) - 1
    'At this point, mutate simply represents a random # between -1 and 1
    
    'We will then add this number (if legal) to a random base
    Dim pos As Long
    pos = Rnd * DNALENGTH
    If DNA(pos) = 3 And mutate = 1 Then mutate = 0
    If DNA(pos) = 0 And mutate = -1 Then mutate = 0
    DNA(pos) = DNA(pos) + mutate
End Sub

'Two possible methods for creating an organism: either base its DNA
'off of an existing organism, or generate it randomly
Public Sub CreateRandom()

    'Give them full energy to start
    Energy = startEnergy
    
    'Initialize their DNA to something random (the only option at present)
    InitializeRandomDNA
    
    'Generate initial values for all their genetically-set attributes
    getInitialSize
    getInitialSpeed
    getInitialRange
    
    'Assume this is our initial generation, so set ParentID to -1
    ParentID = -1
    AncestralID = -1
    
End Sub

'This creates a creature from an existing creature (reproduction?)
Public Sub CreateFromCreature(ByRef srcCreature As Organism)
    'Give them half energy to start
    srcCreature.Energy = srcCreature.Energy / 2
    Energy = srcCreature.Energy
    ParentID = srcCreature.ID
    If srcCreature.AncestralID = -1 Then
        AncestralID = srcCreature.ID
    Else
        AncestralID = srcCreature.AncestralID
    End If
    
    'Initialize their DNA to match their maker's
    InitializeDNAFromCreature srcCreature
    
    'If mutations are enabled, mutate away!
    For i = 0 To numOfMutations
        mutateBase
    Next i
    
    'Generate initial values for all their genetically-set attributes
    getInitialSize
    getInitialSpeed
    getInitialRange
End Sub

'This routine will copy the creature's DNA from an existing organism
Public Sub InitializeDNAFromCreature(ByRef srcDNA As Organism)
    'Randomize Timer
    ReDim DNA(0 To DNALENGTH) As Byte
    For x = 0 To DNALENGTH
        DNA(x) = srcDNA.getDNABase(x)
    Next x
End Sub

'This routine will generate a random strand of DNA for this organism and assign all attributes
' based on the random values of the DNA
Public Sub InitializeRandomDNA()
    Randomize Timer
    ReDim DNA(0 To DNALENGTH) As Byte
    For x = 0 To DNALENGTH
        DNA(x) = Int(Rnd * 4)
    Next x
    
End Sub

'When an organism is "born", calculate all necessary variables
Private Sub Class_Initialize()
    
    'The critter isn't selected
    Selected = False
    
    'Mark the critter as being alive
    isAlive = True
    
    'No lifetime yet
    Lifetime = 0
        
    'Set their target type as "undefined"
    targetType = -1
    tX = 0
    tY = 0
    
End Sub

'****************************************************
'This set of routines determines actual values for the organism's attributes
'They base their calculations off of scanning segments of DNA and counting values

Public Sub getInitialSize()
    
    'Size: 50-100
    For i = 0 To 49
        If DNA(i) = 3 Then gSize = gSize + 1
    Next i
    
End Sub

Public Sub getInitialSpeed()
    
    'Size: 450-550
    For i = 50 To 149
        If DNA(i) = 3 Then gSpeed = gSpeed + 1
    Next i
    
    'We don't want speed to be too fast, so divide it by 25
    gSpeed = gSpeed / 20 '/ 25
    
    'MsgBox gSpeed
    
End Sub

Public Sub getInitialRange()

    'Range: 750-800
    For i = 150 To 199
        If DNA(i) = 3 Then gRange = gRange + 1
    Next i
    
    'Add size to this value (so range is never smaller than the size of the organism)
    gRange = gRange + gSize

End Sub

'end gene creators
'************************************************************************

'Due to better buffering methods, this routine is no longer necessary
'Public Sub drawBlankOrganism(ByVal pBox As PictureBox)
    'pBox.Circle (oX, oY), gSize, pBox.BackColor
    'pBox.Circle (oX, oY), gRange, pBox.BackColor
'End Sub

'This routine will draw the organism onto (PictureBox) at its present coordinates
Public Sub drawOrganism(ByVal pBox As PictureBox)

    If isAlive = True Then
        oldX = oX
        oldY = oY
        
        'pBox.Circle (oX, oY), gSize, pBox.BackColor
        'pBox.Circle (oX, oY), gRange, pBox.BackColor
        
        oX = Int(osX)
        oY = Int(osY)
    
        If Selected = False Then
            pBox.Circle (oX, oY), gSize, RGB(0, 0, 255)
            pBox.Circle (oX, oY), gRange, RGB(255, 0, 0)
        Else
            pBox.Circle (oX, oY), gSize, RGB(0, 0, 0)
            pBox.Circle (oX, oY), gRange, RGB(0, 0, 0)
        End If
    Else
        If Selected = False Then
            pBox.Circle (oX, oY), gSize, RGB(255, 0, 255)
            pBox.Circle (oX, oY), gRange, RGB(255, 0, 255)
        Else
            pBox.Circle (oX, oY), gSize, RGB(0, 0, 0)
            pBox.Circle (oX, oY), gRange, RGB(0, 0, 0)
        End If
    End If
        
    
End Sub

'This routine handles the main thought process for an organism
Public Sub Brain()
    
    'Thinking takes energy...
    Energy = Energy - 1
    
    'If we have no energy, we die
    If Energy <= 0 Then
        Energy = 0
        isAlive = False
        'drawBlankOrganism frmMain.picMap
    End If
    
    'If we didn't just die, count this as a cycle that we've been alive
    Lifetime = Lifetime + 1
    
    'Determine what kind of a target square we have
    If targetType = -1 Then
        'If our target type is undefined, scan for food
        ScanForFood
    Else
    
        'Check to see if our target is close enough to evaluate
        If (Abs(osX - tX) < gSize) And (Abs(osY - tY) < gSize) Then
        
            'Check out target type
            If targetType = 1 Then '(food)
                Food(tX, tY) = 0
                SetPixelV frmMain.picFood.hdc, tX, tY, frmMain.picFood.BackColor
                Energy = Energy + foodWorth
                targetType = -1
            Else 'If it wasn't food, it must've been a random target
                targetType = -1
            End If
            
        
        
        Else    'Otherwise, we must move closer
    
            'TEMP: move towards the target
            If tY < osY Then
                osY = osY - gSpeed
            Else
                osY = osY + gSpeed
            End If
            If tX < osX Then
                osX = osX - gSpeed
            Else
                osX = osX + gSpeed
            End If
            
            'MsgBox Sqr((osX - tX) ^ 2 + (osY - tY) ^ 2) & "," & gSize
            
        End If
    
    End If
    
End Sub

'This subroutine will attempt to find food within the organism's acceptable radius
Public Sub ScanForFood()

    'The initial x and y coordinates to search from
    Dim iX As Long, iY As Long
    
    'The initial x and y coordinates to search to
    Dim fX As Long, fY As Long
    
    'Determine search coordinates (don't want them to be outside the limit of the food array
    iX = gThan(0, oX - gRange)
    iY = gThan(0, oY - gRange)
    fX = lThan(WORLDWIDTH, oX + gRange)
    fY = lThan(WORLDHEIGHT, oY + gRange)
    
    'Search trying to find food
    For x = iX To fX
    For y = iY To fY
        'If we find food...
        If Food(x, y) = 255 Then
            'Mark our target as being of type "Food"
            targetType = 1
            'Remember these x and y coordinates as our new target
            tX = x
            tY = y
            GoTo noMoreSearch
        End If
    Next y
    Next x
    
'Come here when our search has ended (one way or another)
noMoreSearch:

    'If we found food, then quit
    If targetType = 1 Then
        Exit Sub
    'If we didn't find food, set a random location to start moving towards
    Else
        'Random target
        targetType = 0
        tX = Rnd * WORLDWIDTH
        tY = Rnd * WORLDHEIGHT
    End If

End Sub

'Returns the smaller of two numbers
Private Function lThan(ByVal n1 As Long, ByVal n2 As Long) As Long
    If n1 < n2 Then lThan = n1 Else lThan = n2
End Function

'Returns the larger of two numbers
Private Function gThan(ByVal n1 As Long, ByVal n2 As Long) As Long
    If n1 > n2 Then gThan = n1 Else gThan = n2
End Function
