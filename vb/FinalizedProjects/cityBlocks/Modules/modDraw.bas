Attribute VB_Name = "modDraw"
Option Explicit

Private Enum eGetCoordinates
    egcNorthEast
    egcNorthWest
    egcSouthEast
    egcSouthWest
End Enum

Public lPropCount As Long
Private spMemDC As New pcMemDC

Public Sub DrawCenterSpot(ByVal x As Single, ByVal y As Single)
    '
    TransparentBlt MemDC.hdc, x - Int(pSpot.ScaleWidth / 2), y - Int(pSpot.ScaleHeight / 2), _
                   pSpot.ScaleWidth, pSpot.ScaleHeight, _
                   pSpot.hdc, 0, 0, pSpot.ScaleWidth, pSpot.ScaleHeight, _
                   RGB(40, 40, 40)
    '
End Sub

Public Sub CreateTerrain()
    Dim x As Single, y As Single, pGrass As PictureBox, cCell As cCell
    Set pGrass = Texture("GRASS")
    '
    With frmMain.picTerrain
        .Width = GRASS_WIDTH * 20
        .Height = GRASS_HEIGHT * 20
        .BackColor = RGB(32, 84, 4)
        ' Even tiles
        For x = 0 To .Width Step GRASS_WIDTH
            For y = 0 To .Height Step GRASS_HEIGHT
                TransparentBlt .hdc, x, y, pGrass.ScaleWidth, pGrass.ScaleHeight, _
                               pGrass.hdc, 0, 0, pGrass.ScaleWidth, pGrass.ScaleHeight, vbGreen
            Next
        Next
        ' Odd tiles
        For x = -(GRASS_WIDTH / 2) To .Width Step GRASS_WIDTH
            For y = -(GRASS_HEIGHT / 2) To .Height Step GRASS_HEIGHT
                TransparentBlt .hdc, x, y, pGrass.ScaleWidth, pGrass.ScaleHeight, _
                               pGrass.hdc, 0, 0, pGrass.ScaleWidth, pGrass.ScaleHeight, vbGreen
            Next
        Next
    End With
End Sub

Public Sub LoadTextures()
    Dim vTextures As Variant, vTex As Variant, lIndex As Long, Fr As Integer, sLine As String
    '
    ' load textures (specified in the resource file) into textures library
    vTextures = Split(LoadResString(103), ",")
    For Each vTex In vTextures
        GoSub AddToLibrary
    Next
    '
    ' load textures of buildings from Buildings.ini
    Fr = FreeFile
    Open (App.Path & "\data\buildings.ini") For Input As #Fr
    Do Until EOF(Fr)
        Line Input #Fr, sLine
        If Left(LCase(sLine), 7) = "texture" Then
            vTex = Mid(sLine, InStr(sLine, "=") + 1)
            GoSub AddToLibrary
        End If
    Loop
    Close #Fr
    '
    ' load textures of misc objects from Objects.ini
    Fr = FreeFile
    Open (App.Path & "\data\objects.ini") For Input As #Fr
    Do Until EOF(Fr)
        Line Input #Fr, sLine
        If Left(LCase(sLine), 7) = "texture" Then
            vTex = Mid(sLine, InStr(sLine, "=") + 1)
            GoSub AddToLibrary
        End If
    Loop
    Close #Fr
    '
    Exit Sub

AddToLibrary:
    lIndex = frmMain.pTextures.UBound + 1
    Load frmMain.pTextures(lIndex)
    With frmMain.pTextures(lIndex)
        Set .Picture = LoadResPicture(vTex, vbResBitmap)
        .AutoSize = True
        .Tag = vTex
    End With
    Return
End Sub

Public Function Texture(ByVal ID As String) As PictureBox
    Dim lIndex As Long
    For lIndex = 1 To frmMain.pTextures.UBound
        If LCase(frmMain.pTextures(lIndex).Tag) = LCase(ID) Then
            Set Texture = frmMain.pTextures(lIndex)
            Exit Function
        End If
    Next
End Function

Public Sub ChangeMousePointer(ID)
    Dim MouseIcon As New StdPicture, MousePointer As MousePointerConstants
    Static LastID As Variant
    '
    If (LastID = "CURSOR_" & ID) Then Exit Sub    ' to save some valuable microseconds.
    LastID = ("CURSOR_" & ID)
    '
    Set MouseIcon = LoadResPicture("CURSOR" & IIf(Len(ID), "_", "") & ID, vbResCursor)
    MousePointer = vbCustom
    ' now set these icons to all controls
    On Error Resume Next
    With frmMain
        Set .MouseIcon = MouseIcon
        .MousePointer = MousePointer
        '
        Set .picDraw.MouseIcon = MouseIcon
        .picDraw.MousePointer = MousePointer
        '
        Set .tlBar.MouseIcon = MouseIcon
        .tlBar.MousePointer = MousePointer
        '
        Set .stBar.MouseIcon = MouseIcon
        .stBar.MousePointer = MousePointer
    End With
    '
End Sub

Public Function TestCoordinates(ByVal x As Long, ByVal y As Long) As Long
    ' THE CORE FUNCTION!!!! MUHAHAHAHA! :D

    Dim cX As Single, cY As Single, _
        pX As Single, pY As Single, _
        CellX As Single, CellY As Single, _
        pMask As PictureBox, pClr As OLE_COLOR

    Const HalfX As Single = GRASS_WIDTH / 2
    Const Halfy As Single = GRASS_HEIGHT / 2

    pX = x
    pY = y
    
    cX = pX Mod GRASS_WIDTH
    cY = pY Mod GRASS_HEIGHT

    CellX = (pX - cX)
    CellY = (pY - cY)
    pX = pX - CellX
    pY = pY - CellY

    ' Now we try to get the pixel color from the mask image
    pClr = GetPixel(pGrassMask.hdc, pX, pY)
    If pClr = vbWhite Then
        If pX < HalfX And pY < Halfy Then
            ' top-left side
            CellX = CellX - HalfX
            CellY = CellY - Halfy
        ElseIf pX >= HalfX And pY < Halfy Then
            ' top-right side
            CellX = CellX + HalfX
            CellY = CellY - Halfy
        ElseIf pX < HalfX And pY >= Halfy Then
            ' bottom-left side
            CellX = CellX - HalfX
            CellY = CellY + Halfy
        ElseIf pX >= HalfX And pY >= Halfy Then
            ' bottom-right side
            CellX = CellX + HalfX
            CellY = CellY + Halfy
        End If
    End If
    ' return a long value containing both X & Y values
    TestCoordinates = MakeLong(CellX, CellY)
End Function

Private Function GetBuilding(CurX As Single, CurY As Single, _
                             FindFor As eGetCoordinates, Optional BuildingType As String) As cBuilding
    ' THIS FUNCTION SOLVES ALL MY PROBLEMS!! :)

    Dim iX As Long, iY As Long, bEven As Boolean
    iX = CurX
    iY = CurY

    ' First get the tile number of the current X Y coordinates
    If ((iX Mod GRASS_WIDTH) = 0) And ((iY Mod GRASS_HEIGHT) = 0) Then
        ' Even tiles
        iX = iX / GRASS_WIDTH
        iY = (iY / GRASS_HEIGHT) * 2
        bEven = True
    Else
        ' Odd tiles
        iX = (iX - (GRASS_WIDTH / 2)) / GRASS_WIDTH
        iY = (((iY - (GRASS_HEIGHT / 2)) / GRASS_HEIGHT) * 2) + 1
    End If
    
    ' Now lets see what we want to find out.
    Select Case FindFor
        Case egcNorthWest
            If bEven Then iX = iX - 1
            iY = iY - 1
        Case egcSouthWest
            If bEven Then iX = iX - 1
            iY = iY + 1
        Case egcNorthEast
            If bEven = False Then iX = iX + 1
            iY = iY - 1
        Case egcSouthEast
            If bEven = False Then iX = iX + 1
            iY = iY + 1
    End Select

    ' Ok we have the tile number of the requested tile, now to
    ' calculate the X Y coordinates of it.
    If (iY Mod 2 = 0) Then
        ' Even tiles
        iX = iX * GRASS_WIDTH
        iY = (iY * GRASS_HEIGHT) / 2
    Else
        ' Odd tiles
        iX = (iX * GRASS_WIDTH) + (GRASS_WIDTH / 2)
        iY = (((iY - 1) / 2) * GRASS_HEIGHT) + (GRASS_HEIGHT / 2)
    End If

    ' Now give away the Building object.
    If Not Cells(iX & "," & iY) Is Nothing Then
        Set GetBuilding = mBuildings(Cells(iX & "," & iY).Data)
        If Len(BuildingType) Then
            ' It is requested to return the Building object
            ' only if it is of a certain type.
            If GetBuilding.BuildingType <> BuildingType Then Set GetBuilding = Nothing
        End If
    Else
        Set GetBuilding = Nothing
    End If
End Function

Public Sub DoConstruction()
    Dim x As Single, y As Single ', cX As Single, cY As Single
    Dim Bld As cBuilding, Cell As cCell, sKey As String, bDontAdd As Boolean
    '
    x = Mouse.Sel.x
    y = Mouse.Sel.y
    ' validate
    If x < 0 Or y < 0 Then
        PlaySound "ERROR"
        Exit Sub
    End If
    If ((x + GRASS_WIDTH) > frmMain.picTerrain.ScaleWidth) Or ((y + GRASS_HEIGHT) >= frmMain.picTerrain.ScaleHeight) Then
        PlaySound "ERROR"
        Exit Sub
    End If

    ' check if there is enough bank balance
    If CheckBankBalance(frmMain.wBuildings.Cost, "construct this building") = False Then Exit Sub

    ' check for previous construction
    If Not Cells(x & "," & y) Is Nothing Then
        sKey = Cells(x & "," & y).Data
        If Left(sKey, 1) <> "e" Then ' "e" = explosion
            ' there is a building here.
            With frmMain.wMsgBox
                .Message = "Can't construct here... this place" & vbCrLf & "is already occupied"
                .ShowWindow
            End With
            PlaySound "ERROR"
            Exit Sub
        Else
            ' this area has been exploded/destroyed.
            If Not mAnimations(sKey) Is Nothing Then mAnimations.Remove sKey
            mBuildings.Remove sKey
            Cells.Remove (x & "," & y)  ' we remove the key so a new building can be built on it.
            bDontAdd = True
        End If
    End If
    
    ' create building
    lPropCount = lPropCount + 1

    Set Bld = New cBuilding
    With frmMain.wBuildings
        Bld.Key = "b" & lPropCount
        '
        Bld.Name = .BuildingName
        Bld.BuildingType = .BuildingType
        Bld.Cost = .Cost
        Bld.CostToClear = .ClearCost
        '
        Bld.TaxPayment = .TaxPayments
        '
        Set Bld.Textures = .Textures
        '
        Bld.StartDate = frmMain.stBar.CurrentDate
        Bld.PhaseDays = .PhaseDays
        Bld.CurPhase = 1
        Bld.MaxPhases = .Phases
        Bld.AllowSelection = .AllowSelection
        '
        Bld.x = x
        Bld.y = y
        '
        'Bld.Height = Texture(Bld.Textures(1)).ScaleHeight
    End With
    mBuildings.Add Bld, Bld.Key
    ' store cell information
    Cells.Add x, y, Bld.Key
    ' store this info in a list of all used tiles
    If bDontAdd = False Then AddToCellList x, y

    ' add building to the animations' collection
    If Bld.MaxPhases > 1 Then
        mAnimations.Add Bld, Bld.Key
        frmMain.tmrAnimation.Enabled = True ' timer auto-switches off when collection is empty.
    Else
        ' since building is not to be 'constructed' (cause this type
        ' of building gets constructed in 0 days) so the we set the
        ' LastTaxPaid here; which is normally set in tmrAnimation_Timer.
        Bld.LastTaxPaid = frmMain.stBar.CurrentDate
    End If
    '
    DoTransaction Bld.x, Bld.y, -Bld.Cost   ' deduct balance and show animation
    '
    DoEvents
    frmMain.Render
    PlaySound "BUILD"
End Sub

Public Sub DoConstructRoad()
    Dim x As Single, y As Single, lIndex As Integer, lIndex2 As Integer, lCostToClear As Long
    Dim Road As cBuilding, Cell As cCell, sKey As String, bDontAdd As Boolean, sCurrentTexture As String
    Dim RoadNE As cBuilding, RoadNW As cBuilding, RoadSE As cBuilding, RoadSW As cBuilding
    '
    x = Mouse.Sel.x
    y = Mouse.Sel.y
    ' validate
    If x < 0 Or y < 0 Then
        PlaySound "ERROR"
        Exit Sub
    End If
    If ((x + GRASS_WIDTH) > frmMain.picTerrain.ScaleWidth) Or ((y + GRASS_HEIGHT) >= frmMain.picTerrain.ScaleHeight) Then
        PlaySound "ERROR"
        Exit Sub
    End If

    ' Road construction cost
    lCostToClear = INIReadValue(App.Path & "\data\Objects.ini", "Road", "ClearCost", 0, True)

    ' check if there is enough bank balance
    If CheckBankBalance(lCostToClear, "build road") = False Then Exit Sub

    ' check for previous construction
    If Not Cells(x & "," & y) Is Nothing Then
        sKey = Cells(x & "," & y).Data
        If Left(sKey, 1) <> "e" Then    ' "e" = explosion
            ' there is a building here.
            With frmMain.wMsgBox
                .Message = "Can't construct here... this place" & vbCrLf & "is already occupied"
                .ShowWindow
            End With
            PlaySound "ERROR"
            Exit Sub
        Else
            ' this area has been exploded/destroyed or a road is already here.
            On Error Resume Next
                If Not mAnimations(sKey) Is Nothing Then mAnimations.Remove sKey
                mBuildings.Remove sKey
            On Error GoTo 0
            Cells.Remove (x & "," & y)  ' we remove the key so a new building can be built on it.
            bDontAdd = True
        End If
    End If

    ' Determine which road type to place. This is tough! We
    ' will have to check the adjacent road tiles and maybe
    ' also change their road types too.
'    sCurrentTexture = "ROAD_1"
'    Set RoadNE = GetBuilding(X, Y, egcNorthEast, "_Road")
   
'    Set RoadNW = GetBuilding(X, Y, egcNorthWest, "_Road")
'    If Not RoadNW Is Nothing Then
'        Set Road = RoadNW
'        Set RoadNE = GetBuilding(Road.X, Road.Y, egcNorthEast, "_Road")
'        Set RoadNW = GetBuilding(Road.X, Road.Y, egcNorthWest, "_Road")
'        Set RoadSE = GetBuilding(Road.X, Road.Y, egcSouthEast, "_Road")
'        Set RoadSW = GetBuilding(Road.X, Road.Y, egcSouthWest, "_Road")
'    End If

'    Set RoadSE = GetBuilding(X, Y, egcSouthEast, "_Road")
'    Set RoadSW = GetBuilding(X, Y, egcSouthWest, "_Road")

    ' create building
    lPropCount = lPropCount + 1

    Set Road = New cBuilding
    With Road
        .Key = "r" & lPropCount
        '
        .Name = "Road"
        .BuildingType = "_Road"
        .Cost = INIReadValue(App.Path & "\data\Objects.ini", "Road", "Cost", 0, True)
        .CostToClear = lCostToClear
        '
        Set .Textures = New Collection
        .Textures.Add frmMain.wRoads.SelectedRoad
        '
        .StartDate = frmMain.stBar.CurrentDate
        .PhaseDays = 1
        .CurPhase = 1
        .MaxPhases = 1
        '
        .x = x
        .y = y
        '
        '.Height = Texture(.Textures(1)).ScaleHeight
    End With
    mBuildings.Add Road, Road.Key
    ' store cell information
    Cells.Add x, y, Road.Key
    ' store this info in a list of all used tiles
    If bDontAdd = False Then AddToCellList x, y
    '
    DoTransaction Road.x, Road.y, -Road.Cost   ' deduct balance and show animation
    '
    DoEvents
    frmMain.Render
    PlaySound "BUILD"
End Sub

Public Sub DoExplosion()
    Dim x As Single, y As Single, lIndex As Integer, lIndex2 As Integer, lCostToClear As Long
    Dim Bld As cBuilding, Cell As cCell, sKey As String, bDontAdd As Boolean
    '
    x = Mouse.Sel.x
    y = Mouse.Sel.y
    ' validate
    If x < 0 Or y < 0 Then
        PlaySound "ERROR"
        Exit Sub
    End If
    If ((x + GRASS_WIDTH) > frmMain.picTerrain.ScaleWidth) Or ((y + GRASS_HEIGHT) >= frmMain.picTerrain.ScaleHeight) Then
        PlaySound "ERROR"
        Exit Sub
    End If

    ' check for previous construction
    If Not Cells(x & "," & y) Is Nothing Then
        sKey = Cells(x & "," & y).Data
        'If Left(sKey, 1) <> "e" Then ' "e" = explosion
            ' there is a building here.
            lCostToClear = mBuildings(sKey).CostToClear
            
            If lCostToClear > frmMain.stBar.Balance Then    ' check bank balance
                ' no money :( so cant do the mighty explosions!!! :D
            Else
                On Error Resume Next    ' error may occur probably in mAnimations. because if a building is complete, it wont exist in mAnimation hence cause error when .Remove is called.
                    mAnimations.Remove sKey
                    mBuildings.Remove sKey
                On Error GoTo 0
                Cells.Remove (x & "," & y)  ' we remove the key so a new building can be built on it.
                bDontAdd = True
            End If
        'Else
            ' should not explode a previous explosion. just for frame rate purpose.
        '    Exit Sub
        'End If
    End If

    ' determine cost to clear the spot
    If lCostToClear = 0 Then lCostToClear = INIReadValue(App.Path & "\data\Objects.ini", "Blast", "Cost", 0, True)

    ' check if there is enough bank balance
    If CheckBankBalance(lCostToClear, "clear this area") = False Then Exit Sub

    ' create explosion
    lPropCount = lPropCount + 1

    Set Bld = New cBuilding
    With Bld
        .Key = "e" & lPropCount
        '
        .BuildingType = "_explosion"
        '
        ' Create texture list
        Set .Textures = New Collection
        For lIndex = 1 To 4
            .Textures.Add "BLAST_" & lIndex
        Next
        For lIndex = 5 To 8
            For lIndex2 = 1 To 10
                .Textures.Add "BLAST_" & lIndex
            Next
        Next
        '
        .StartDate = frmMain.stBar.CurrentDate
        .PhaseDays = 1
        .MaxPhases = .Textures.Count
        .CurPhase = 1
        '
        .x = x
        .y = y
        '
        '.Height = Texture(.Textures(1)).ScaleHeight
    End With
    mBuildings.Add Bld, Bld.Key
    ' store cell information
    Cells.Add x, y, Bld.Key
    ' store this info in a list of all used tiles
    If bDontAdd = False Then AddToCellList x, y

    ' add building to the animations' collection
    mAnimations.Add Bld, Bld.Key
    frmMain.tmrAnimation.Enabled = True ' timer auto-switches off when collection is empty.
    '
    DoTransaction Bld.x, Bld.y, -Abs(lCostToClear)
    '
    DoEvents
    frmMain.Render
    PlaySound "BLAST"
End Sub

Public Sub DoTransaction(x As Single, y As Single, Amount As Long, Optional bDontAnimate As Boolean)
    '
    If bDontAnimate = False Then
        '
        lPropCount = lPropCount + 1
        '
        Dim cTrans As New cTransaction, oColor As OLE_COLOR, lColor As Long
        With cTrans
            .Key = "t" & lPropCount
            .x = x
            .y = y
            .Amount = "Rs." & FormatNumber(Abs(Amount), 0, , vbFalse, vbTrue)
            If Amount >= 0 Then
                .Amount = "Income:" & .Amount
            Else
                .Amount = "Cost:" & .Amount
            End If
            oColor = IIf(Amount >= 0, vbGreen, vbRed)
            OleTranslateColor oColor, 0, lColor
            .Color = lColor
        End With
        '
        mTransactions.Add cTrans, cTrans.Key
    
        ' Add building to the animations' collection
        mAnimations.Add cTrans, cTrans.Key
        frmMain.tmrAnimation.Enabled = True ' timer auto-switches off when collection is empty.
        '
    End If
    ' Show current bank balance in status bar
    frmMain.stBar.Balance = frmMain.stBar.Balance + Amount
End Sub

Public Function CheckBankBalance(ByVal Amount As Single, ByVal FailMessage As String) As Boolean
    If Amount > frmMain.stBar.Balance Then
        With frmMain.wMsgBox
            .Message = "There is not enough money in the" & vbCrLf & "bank to " & FailMessage & "."
            .ShowWindow
        End With
        Exit Function
    End If
    CheckBankBalance = True
End Function

Private Sub SelectionEffectsColorAdjustments()
    Dim CA As COLORADJUSTMENT
    '
    ' Do color settings so that when user hovers over a building,
    ' it appears with the following gamma settings.
    With spMemDC
        '
        SetStretchBltMode .hdc, HALFTONE
        '
        GetColorAdjustment .hdc, CA
            CA.caSize = Len(CA)
            CA.caBlueGamma = 2500
            CA.caGreenGamma = 10034
            CA.caRedGamma = 10034
            CA.caReferenceBlack = 383
            CA.caReferenceWhite = 9453
        SetColorAdjustment .hdc, CA
        '
    End With
End Sub

Public Function SelectionEffectsHDC(objTexture As PictureBox) As Long
    Static lLastTexture As String
    '
    With spMemDC
        '
        If lLastTexture = objTexture.Tag Then
            SelectionEffectsHDC = .hdc
            Exit Function
        End If
        '
        lLastTexture = objTexture.Tag
        '
        .Width = objTexture.Width
        .Height = objTexture.Height
        SelectionEffectsColorAdjustments    ' we're calling this again & again because
                                            ' spMemDC's HDC is recreated when Width &
                                            ' Height are changed.
        '
        StretchBlt .hdc, 0, 0, objTexture.ScaleWidth, objTexture.ScaleHeight, _
                   objTexture.hdc, 0, 0, objTexture.ScaleWidth, objTexture.ScaleHeight, vbSrcCopy
        '
        SelectionEffectsHDC = .hdc
        '
     End With
End Function
