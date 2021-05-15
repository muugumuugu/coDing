VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "City Builder"
   ClientHeight    =   7200
   ClientLeft      =   0
   ClientTop       =   30
   ClientWidth     =   9600
   ForeColor       =   &H00FFFFFF&
   Icon            =   "frmMain.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   480
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   640
   StartUpPosition =   2  'CenterScreen
   Begin CityBuilder.StatusBar stBar 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   2
      Top             =   6930
      Width           =   9600
      _ExtentX        =   16933
      _ExtentY        =   476
   End
   Begin CityBuilder.Toolbar tlBar 
      Align           =   1  'Align Top
      Height          =   390
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   9600
      _ExtentX        =   16933
      _ExtentY        =   688
   End
   Begin CityBuilder.WndInfo wInfo 
      Height          =   1260
      Left            =   90
      TabIndex        =   8
      Top             =   6660
      Visible         =   0   'False
      Width           =   3165
      _ExtentX        =   5583
      _ExtentY        =   2223
      DefaultX        =   6
      DefaultY        =   372
   End
   Begin CityBuilder.WndMusic wMusicBox 
      Height          =   2715
      Left            =   7740
      TabIndex        =   5
      Top             =   6660
      Visible         =   0   'False
      Width           =   2280
      _ExtentX        =   4022
      _ExtentY        =   4789
      DefaultX        =   487
      DefaultY        =   31
   End
   Begin CityBuilder.WndDebug wDebug 
      Height          =   2370
      Left            =   0
      TabIndex        =   7
      Top             =   6390
      Visible         =   0   'False
      Width           =   3315
      _ExtentX        =   5847
      _ExtentY        =   4180
      DefaultX        =   6
      DefaultY        =   300
   End
   Begin CityBuilder.WndBuildings wBuildings 
      Height          =   3255
      Left            =   3330
      TabIndex        =   6
      Top             =   6660
      Visible         =   0   'False
      Width           =   4965
      _ExtentX        =   8758
      _ExtentY        =   5741
      DefaultX        =   300
      DefaultY        =   240
   End
   Begin CityBuilder.WndMsgBox wMsgBox 
      Height          =   555
      Left            =   7110
      TabIndex        =   4
      Top             =   6480
      Visible         =   0   'False
      Width           =   3990
      _ExtentX        =   7038
      _ExtentY        =   979
      DefaultX        =   174
      DefaultY        =   228
   End
   Begin VB.Timer tmrAnimation 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   90
      Top             =   1890
   End
   Begin VB.Timer tmrScroll 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   90
      Top             =   1440
   End
   Begin VB.PictureBox pTextures 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   465
      Index           =   0
      Left            =   8730
      ScaleHeight     =   31
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   37
      TabIndex        =   3
      Top             =   3510
      Visible         =   0   'False
      Width           =   555
   End
   Begin VB.PictureBox picTerrain 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   720
      ScaleHeight     =   97
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   217
      TabIndex        =   1
      Top             =   3420
      Visible         =   0   'False
      Width           =   3255
   End
   Begin VB.Timer tmrRender 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   90
      Top             =   990
   End
   Begin VB.Timer tmr10 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   90
      Top             =   540
   End
   Begin VB.PictureBox picDraw 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   2625
      Left            =   720
      ScaleHeight     =   175
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   571
      TabIndex        =   0
      Tag             =   "wh"
      Top             =   630
      Width           =   8565
   End
   Begin CityBuilder.WndRoads wRoads 
      Height          =   585
      Left            =   3330
      TabIndex        =   10
      Top             =   6480
      Width           =   3810
      _ExtentX        =   6720
      _ExtentY        =   1032
      DefaultX        =   384
      DefaultY        =   27
   End
   Begin ComctlLib.ImageList ilToolbar 
      Left            =   9000
      Top             =   90
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327682
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'
Dim lFPS As Integer, lRenderStart As Single, lRenderEnd As Single
Dim tDrawR As RECT

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    If tmrScroll.Enabled Then Exit Sub  ' right-click scrolling is already running.
    Select Case KeyCode
        Case vbKeyLeft
            Mouse.M.x = Mouse.M.x - 10
        Case vbKeyRight
            Mouse.M.x = Mouse.M.x + 10
        Case vbKeyUp
            Mouse.M.y = Mouse.M.y - 10
        Case vbKeyDown
            Mouse.M.y = Mouse.M.y + 10
    End Select
    ValidateMovement
    Render
End Sub

Public Sub Form_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyEscape Then
        ' Close all windows and return the mouse to normal cursor
        wBuildings.Visible = False
        wInfo.Visible = False
        wDebug.Visible = False
        wMusicBox.Visible = False
        wMsgBox.Visible = False
        wRoads.Visible = False
        Mouse.SelON = False
        Mouse.State = emsDefault
        ChangeMousePointer ""
        tlBar.SelectNone
        If tmrScroll = False Then Render
    End If
End Sub

Private Sub Form_Load()

    ' Show splash screen
    frmSplash.Show
    frmSplash.Prg.Max = 9
    DoEvents
    Sleep 500

    ' Initialise all controls, graphics and misc stuff
    Initialise
    
    ' Take away the splash screen
    Sleep 500
    frmSplash.Hide
    Unload frmSplash

    ' Setup graphics mode
    
    If DisplayModeChange = False Then End
    '
    tmr10.Enabled = True
    '
    Show
    Sleep 500
    DoEvents
    TopMostWindow True
    DoEvents
'    TopMostWindow False
    '
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ' music
    wMusicBox.StopAll
    ' timers
    tmr10.Enabled = False
    tmrScroll.Enabled = False
    tmrAnimation.Enabled = False
    tmrRender.Enabled = False
    ' UI
    TopMostWindow False
    Hide
    DisplayModeRestore
    ' registry settings
    SaveSetting App.Title, "Settings", "Music", wMusicBox.Music
    SaveSetting App.Title, "Settings", "Volume", wMusicBox.Volume
    SaveSetting App.Title, "Settings", "Sounds", m_SoundEffects
    '
    CleanUp
End Sub

Private Sub picDraw_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim lRet As Long
    '
    Status "CX: " & Mouse.Sel.x & "  CY: " & Mouse.Sel.y
    '
    If Button = vbLeftButton Then
        '
        Select Case Mouse.State

            Case emsDefault
                ' center the terrain's position in screen
                Scroll scCenter, x, y

            Case emsBuild
                ' construct building
                DoConstruction

            Case emsRoad
                DoConstructRoad

            Case emsDestroy
                ' destroy tile
                DoExplosion

            Case emsInfo
                ' show building info
                wInfo.SetCoordinates Mouse.Sel.x, Mouse.Sel.y
                wInfo.ShowWindow

        End Select
    
    ElseIf Button = vbRightButton Then
        ' scroll terrain
        Scroll scStart, x, y
    End If

End Sub

Private Sub picDraw_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Mouse.Cur.x = x
    Mouse.Cur.y = y
    '
    Status
End Sub

Private Sub picDraw_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = vbRightButton Then
        Scroll scStop   ' stop scrolling
    End If
End Sub

Private Sub stBar_DateChanged(dDate As Date)
    '
    Dim Bld As cBuilding, bAnimate As Boolean
    '
    stBar.ZOrder 0
    '
    If lFPS Then lRenderEnd = (lRenderEnd / lFPS) Else lRenderEnd = 0
    Status , "FPS: " & lFPS & vbNewLine & _
             "Average rendering time: " & vbNewLine & _
             FormatNumber(lRenderEnd, 6, vbTrue) & " seconds"
    lFPS = 0
    lRenderEnd = 0
    '
    ' Monthly tax payments by constructed buildings
    For Each Bld In mBuildings
        With Bld
            If Left(.Key, 1) <> "_" Then
                If .CurPhase = .MaxPhases Then  ' to ensure that the building is fully constructed.
                    If DateDiff("d", .LastTaxPaid, dDate) = 30 Then
                        ' Do some FX

                        ' Check if this building is currently visible on the screen
                        bAnimate = ((Bld.x + GRASS_WIDTH) > Mouse.M.x) And (Bld.x < (Mouse.M.x + Board.ScaleWidth)) And _
                                   ((Bld.y + GRASS_HEIGHT) > Mouse.M.y) And (Bld.y < (Mouse.M.y + Board.ScaleHeight))
                            
                        If .TaxPayment > 0 And bAnimate Then PlaySound "INCOME"
                        DoTransaction .x, .y, .TaxPayment, Not bAnimate
                        .LastTaxPaid = dDate
                    End If
                End If
            End If
        End With
    Next
    '
End Sub

Private Sub tlBar_ButtonClick(ByVal Key As String, State As ButtonValues)
    Dim bBool As Boolean
    bBool = (State = tbrPressed)
    '
    Select Case Key
        Case "EXIT"
            Unload Me

        Case "LOAD"
            LoadMap

        Case "SAVE"
            SaveMap

        Case "CONSTRUCT"
            ChangeMousePointer IIf(bBool, "BUILD", "")
            Mouse.State = IIf(bBool, emsBuild, emsDefault)
            Mouse.SelON = bBool
            If Mouse.SelON = False And Mouse.SelDrawn Then Render   ' probably a piece of selection is still visible on screen
            If bBool Then wBuildings.ShowWindow Else wBuildings.Visible = False

        Case "ROAD"
            ChangeMousePointer IIf(bBool, "ROAD", "")
            Mouse.State = IIf(bBool, emsRoad, emsDefault)
            Mouse.SelON = bBool
            If Mouse.SelON = False And Mouse.SelDrawn Then Render
            If bBool Then wRoads.ShowWindow Else wRoads.Visible = False

        Case "BLAST"
            ChangeMousePointer IIf(bBool, "BLAST", "")
            Mouse.State = IIf(bBool, emsDestroy, emsDefault)
            Mouse.SelON = bBool
            If Mouse.SelON = False And Mouse.SelDrawn Then Render

        Case "INFO"
            ChangeMousePointer IIf(bBool, "INFO", "")
            Mouse.State = IIf(bBool, emsInfo, emsDefault)
            Mouse.SelON = bBool
            If Mouse.SelON = False And Mouse.SelDrawn Then Render

        Case "MUSIC"
            wMusicBox.ShowWindow

        Case "DEBUG"
            wDebug.ShowWindow

        Case "ABOUT"
            With frmSplash
                .lblLoading.Visible = False
                .Prg.Visible = False
                .chkSounds.Visible = True
                .Show vbModal
            End With

        Case Else
            'MsgBox Button.Key
    End Select
End Sub

Private Sub tmrAnimation_Timer()
    Dim Obj As Object, pBld As PictureBox, DoRender As Boolean
    Dim Bld As cBuilding, cTrans As cTransaction
    '
    If mAnimations.Count = 0 Then
        tmrAnimation.Enabled = False
        Exit Sub
    End If
    '
RestartLoop:
    For Each Obj In mAnimations
        If TypeName(Obj) = "cBuilding" Then
            '
            Set Bld = Obj
            With Bld

                If .BuildingType = "_explosion" Then
                    '
                    DoRender = True
                    ' This was just an explosion. we remove this from buildings collection.
                    .CurPhase = .CurPhase + 0.25
                    If .CurPhase = .MaxPhases Then
                        RemoveFromCellList .x, .y
                        Cells.Remove (.x & "," & .y)
                        mBuildings.Remove .Key
                        ' End of animation. Remove this class from collection
                        mAnimations.Remove .Key
                        GoTo RestartLoop    ' to restart enumeration
                    End If
                Else
                    '
                    If DateDiff("d", .StartDate, stBar.CurrentDate) = (.CurPhase * .PhaseDays) Then
                        ' This construction phase is complete, move onto next texture/phase.
                        '
                        DoRender = True
                        '
                        .CurPhase = .CurPhase + 1
                        If .CurPhase = .MaxPhases Then
                            ' Record this date as the beginning for tax payments
                            .LastTaxPaid = stBar.CurrentDate
                            ' End of animation. Remove this class from collection
                            mAnimations.Remove .Key
                            GoTo RestartLoop    ' to restart enumeration
                        End If
                        '
                    End If
                    '
                End If
            End With
            '
        ElseIf TypeName(Obj) = "cTransaction" Then
            '
            Set cTrans = Obj
            With cTrans
                '
                DoRender = True
                '
                .CurPhase = .CurPhase + 1
                .y = .y - 2
                If .CurPhase = 20 Then
                    ' End of animation. Remove this class from collection
                    mTransactions.Remove .Key
                    mAnimations.Remove .Key
                    GoTo RestartLoop    ' to restart enumeration
                End If
            
            End With
            '
        'ElseIf TypeName(Obj) = "cVehicle" Then
        'ElseIf TypeName(Obj) = "cShip" Then
        'ElseIf TypeName(Obj) = "cAircraft" Then
        'ElseIf TypeName(Obj) = "cTrain" Then
        'ElseIf TypeName(Obj) = "cProps" Then
        
        End If
    Next
    '
    If (DoRender) And (Not tmrScroll.Enabled) Then Render
    '
End Sub

Private Sub tmr10_Timer()
    ' Check if Display Mode needs to be changed
    CheckForActiveWindow
    ' Mouse selector
    Dim lRet As Long, cX As Long, cY As Long
    With Mouse
        If .SelON Then
            lRet = TestCoordinates(.M.x + .Cur.x, .M.y + .Cur.y)
            If lRet <> -1 Then
                cX = LoWord(lRet): cY = HiWord(lRet)
                If cX <> .Sel.x Then .Sel.x = cX: .SelDrawn = False
                If cY <> .Sel.y Then .Sel.y = cY: .SelDrawn = False
                '
                If .SelDrawn = False Then
                    If tmrScroll.Enabled = False Then Render
                End If
                '
            End If
        End If
    End With
    '
End Sub

Private Sub tmrRender_Timer()
    MemDC.Draw Board.hdc
End Sub

Private Sub Scroll(State As ScrollStates, Optional x As Single, Optional y As Single)

    Dim dX As Long, dY As Long, sPointer As String

    With Mouse
    Select Case State
    
        Case scStart    ' Mouse Down
            ChangeMousePointer "SCROLL"
            .Org.x = x: .Org.y = y
            .lM.x = .M.x: .lM.y = .M.y
            tmrScroll.Enabled = True

        Case scStop     ' Mouse Up
            tmrScroll.Enabled = False
            If tlBar.ButtonSelected("CONSTRUCT") Then
                sPointer = "BUILD"
            ElseIf tlBar.ButtonSelected("ROAD") Then
                sPointer = "ROAD"
            ElseIf tlBar.ButtonSelected("BLAST") Then
                sPointer = "BLAST"
            ElseIf tlBar.ButtonSelected("INFO") Then
                sPointer = "INFO"
            End If
            ChangeMousePointer sPointer
            Render

        Case scCenter   ' Center the pic at current mouse coordinates
            '
            DrawCenterSpot x, y
            MemDC.Draw Board.hdc  ' force refresh
            DoEvents
            MyTimer 200
            ' Center coordinates
            .M.x = .M.x + (x - (Board.Width / 2))
            .M.y = .M.y + (y - (Board.Height / 2))
            ValidateMovement
            '
            Render

    End Select
    End With

End Sub

Private Sub tmrScroll_Timer()
    Dim dX As Long, dY As Long, sMouse As String

    With Mouse
        ' X-Axis difference
        dX = (.Cur.x - .Org.x) / 20
        If dX > 10 Then dX = 10 Else If dX < -10 Then dX = -10
        .M.x = .lM.x + dX
        ' Y-Axis difference
        dY = (.Cur.y - .Org.y) / 20
        If dY > 10 Then dY = 10 Else If dY < -10 Then dY = -10
        .M.y = .lM.y + dY
        ' Mouse cursors
        If .M.x = .lM.x And .M.y = .lM.y Then
            ChangeMousePointer "SCROLL"
        Else
            If .M.y < .lM.y Then sMouse = "N"
            If .M.y > .lM.y Then sMouse = "S"
            If .M.x < .lM.x Then sMouse = sMouse & "W"
            If .M.x > .lM.x Then sMouse = sMouse & "E"
            ChangeMousePointer "SCROLL_" & sMouse
        End If
        ' Validate MX and MY
        ValidateMovement
        '
        Render
        DrawCenterSpot .Org.x, .Org.y
        '
        ' Set these after Draw function, cause Draw function
        ' my change the values of mX & mY during validation.
        .lM.x = .M.x
        .lM.y = .M.y
        '
    End With
End Sub

Private Sub wBuildings_ItemClicked()
    tlBar.ButtonClick "CONSTRUCT", True
    ChangeMousePointer "BUILD"
    Mouse.State = emsBuild
    Mouse.SelON = True
End Sub

Private Sub wRoads_ItemClicked()
    tlBar.ButtonClick "ROAD", True
    ChangeMousePointer "ROAD"
    Mouse.State = emsRoad
    Mouse.SelON = True
End Sub

Private Sub Initialise()

    ' Setup drawing board
    With picDraw
        .Left = 0
        .Top = tlBar.Height
        .Width = Me.ScaleWidth
        .Height = Me.ScaleHeight - tlBar.Height
    End With
    Set Board = picDraw
    With tDrawR ' used in clearing the screen [Sub Render()]
        .Right = Board.Width
        .Bottom = Board.Height
    End With
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Memory DC
    Set MemDC = New pcMemDC
    MemDC.Height = picDraw.Height
    MemDC.Width = picDraw.Width
        ' Background mode
        SetBkMode MemDC.hdc, BK_TRANSPARENT
        ' Default font
        Dim oFNT As LOGFONT, lFNT As Long, lIndex As Integer
        For lIndex = 1 To Len("MS Sans Serif")
            oFNT.lfFaceName(lIndex - 1) = Asc(Mid("MS Sans Serif", lIndex, 1))
        Next
        oFNT.lfWeight = 700
        lFNT = CreateFontIndirect(oFNT)
        SelectObject MemDC.hdc, lFNT
        DeleteObject lFNT

    ' Setup toolbar
    SetupToolbar
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Setup sounds
    SetupSounds
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Load all textures
    LoadTextures
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Load other data
    wBuildings.LoadBuildingsData
    wRoads.LoadRoadData
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Setup terrain
    CreateTerrain
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Setup commonly used textures
    Set pSelect = Texture("SELECT")
    Set pSpot = Texture("SPOT")
    Set pGrassMask = Texture("GRASS_MASK")
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' OK, now finalise everything
    tmrRender.Enabled = True
    tmrAnimation.Enabled = True
    stBar.Enabled = True
    stBar.Balance = 200000
    ChangeMousePointer ""
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Render for the first time
    Render
    frmSplash.Prg.value = frmSplash.Prg.value + 1

    ' Start music
    wMusicBox.Music = CBool(GetSetting(App.Title, "Settings", "Music", True))
    wMusicBox.Volume = GetSetting(App.Title, "Settings", "Volume", 50)
    m_SoundEffects = CBool(GetSetting(App.Title, "Settings", "Sounds", True))
End Sub

Public Sub Render()
    Dim lRet As Long, cX As Single, cY As Single, vItem As Variant
    Dim Bld As cBuilding, cTrans As cTransaction, pBld As PictureBox

    lRenderStart = Timer

    '/* Clear background to white color
    lRet = CreateSolidBrush(vbBlack)
    FillRect MemDC.hdc, tDrawR, lRet
    DeleteObject lRet

    With Mouse

        '/* Draw terrain at specified coordinates
        BitBlt MemDC.hdc, 0, 0, Board.ScaleWidth, Board.ScaleHeight, picTerrain.hdc, .M.x, .M.y, vbSrcCopy

        '/* Draw selection if not draw in above code
        If .SelON Then
            TransparentBlt MemDC.hdc, .Sel.x - .M.x, .Sel.y - .M.y, pSelect.ScaleWidth, pSelect.ScaleHeight, _
                           pSelect.hdc, 0, 0, pSelect.ScaleWidth, pSelect.ScaleHeight, vbGreen
            .SelDrawn = True
        End If

        '/* Draw buildings
        If IsArray(CellList) Then
            For Each vItem In CellList
                vItem = Split(vItem, ",")
                cX = vItem(1)
                cY = vItem(0)
                ' Only draw if the building is currently visible on the screen.
                If ((cX + GRASS_WIDTH) > .M.x And cX < (.M.x + Board.ScaleWidth)) Then
                    '
                    Set Bld = mBuildings(Cells(cX & "," & cY).Data)
                    Set pBld = Texture(Bld.Textures(Bld.CurPhase))
                    '
                    ' Only draw if the building is currently visible on the screen.
                    If ((cY + GRASS_HEIGHT) > .M.y And (cY - (pBld.ScaleHeight - 31)) < (.M.y + Board.ScaleHeight)) Then
                        '
                        TransparentBlt MemDC.hdc, (Bld.x - ((pBld.ScaleWidth - 64) / 2)) - .M.x, (Bld.y - (pBld.ScaleHeight - 31)) - .M.y, pBld.ScaleWidth, pBld.ScaleHeight, _
                                       pBld.hdc, 0, 0, pBld.ScaleWidth, pBld.ScaleHeight, vbGreen
                        ' Redraw mouse selection tile
                        If .SelON Then
                            If Bld.x = .Sel.x And Bld.y = .Sel.y Then
                                If Left(Bld.BuildingType, 1) = "_" Then
                                    ' Draw the complete mouse selection tile all over this tile.
                                    TransparentBlt MemDC.hdc, .Sel.x - .M.x, .Sel.y - .M.y, pSelect.ScaleWidth, pSelect.ScaleHeight, _
                                                   pSelect.hdc, 0, 0, pSelect.ScaleWidth, pSelect.ScaleHeight, vbGreen
                                Else
                                    ' Draw the building with 'special effects'
                                    TransparentBlt MemDC.hdc, (Bld.x - ((pBld.ScaleWidth - 64) / 2)) - .M.x, (Bld.y - (pBld.ScaleHeight - 31)) - .M.y, pBld.ScaleWidth, pBld.ScaleHeight, _
                                                   SelectionEffectsHDC(pBld), 0, 0, pBld.ScaleWidth, pBld.ScaleHeight, vbGreen
                                    ' Draw bottom half of the selection tile.
                                    TransparentBlt MemDC.hdc, .Sel.x - .M.x, (.Sel.y - .M.y) + 15, pSelect.ScaleWidth, 16, _
                                                   pSelect.hdc, 0, 15, pSelect.ScaleWidth, 16, vbGreen
                                End If
                            End If
                        End If ' mouse selection
                        '
                    End If '
                    '
                End If
                '
            Next
        End If

        '/* Draw transactions
        For Each cTrans In mTransactions
            ' shadow
            SetTextColor MemDC.hdc, 0
            TextOut MemDC.hdc, ((cTrans.x + 32) - Int(TextWidth(cTrans.Amount) / 2)) - .M.x, cTrans.y - .M.y + 1, cTrans.Amount, Len(cTrans.Amount)
            ' colored text
            SetTextColor MemDC.hdc, cTrans.Color
            TextOut MemDC.hdc, ((cTrans.x + 32) - Int(TextWidth(cTrans.Amount) / 2)) - .M.x, cTrans.y - .M.y, cTrans.Amount, Len(cTrans.Amount)
        Next

    End With

    '/* Note down the Frames-Per-Second
    lFPS = lFPS + 1
    lRenderEnd = lRenderEnd + (Timer - lRenderStart)
End Sub

Public Sub ValidateMovement()   ' This sub is to be called whenever terrain is scrolled.
    '/* Validate coordinates
    With Mouse
        If .M.x < 0 Then .M.x = 0
        If .M.y < 0 Then .M.y = 0
        If (.M.x + Board.Width) > picTerrain.ScaleWidth Then .M.x = (picTerrain.ScaleWidth - Board.Width)
        If (.M.y + Board.Height) > picTerrain.ScaleHeight Then .M.y = (picTerrain.ScaleHeight - Board.Height)
    End With
End Sub

Sub Status(Optional ByVal txt As String = "", Optional ByVal FPS As String = "")
    Static t As String, f As String
    If txt <> "" Then t = txt
    If FPS <> "" Then f = FPS
    '
    With Mouse
        wDebug.Status = "mX: " & .M.x & "   mY: " & .M.y & vbNewLine & _
                        "lmX: " & .lM.x & "   lmY: " & .lM.y & vbNewLine & _
                        "oX: " & .Org.x & "   oY: " & .Org.y & vbNewLine & _
                        "CurX: " & .Cur.x & "   CurY: " & .Cur.y & vbNewLine & _
                        t & vbNewLine & _
                        f
    End With
End Sub
