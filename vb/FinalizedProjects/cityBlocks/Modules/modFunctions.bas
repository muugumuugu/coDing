Attribute VB_Name = "modFunctions"
Option Explicit
'
' Basic functions (modFunctions).   - Faraz Azhar
'

Public Const GRASS_WIDTH = 64
Public Const GRASS_HEIGHT = 32

Public Enum eResolution
    erWindowed
    erFullScreen
End Enum

Public Enum ScrollStates
    scNone
    scStart
    scStop
    scCenter
End Enum

Public Enum eMouseStates
    emsDefault
    emsBuild
    emsRoad
    emsDestroy
    emsInfo
End Enum

Public Type tMouse
    M           As POINTAPI     ' Current coordinates of terrain picture
    lM          As POINTAPI     ' Last M coordinates
    Org         As POINTAPI     ' Original coordinates for starting of scroll
    Cur         As POINTAPI     ' Current mouse coordinates
    '
    Sel         As POINTAPI     ' Current selection coordinates
    SelON       As Boolean      ' Mouse selection is turned on
    SelDrawn    As Boolean      ' Was new mouse selection coordinates rendered to screen?
    '
    State       As eMouseStates
End Type

' objects
Public MemDC As pcMemDC
Public Mouse As tMouse
Public Board As PictureBox
' commonly used textures
Public pSelect As PictureBox
Public pSpot As PictureBox
Public pGrassMask As PictureBox
' collections
Public mAnimations As New Collection
Public mBuildings As New Collection
Public mTransactions As New Collection
' cells
Public Cells As New cCells
Public CellList As Variant
' misc
Public DisplayResolution As eResolution
Public m_SoundEffects As Boolean

Public Sub Main()
    
    ' XP styles
    InitCommonControls

    '
    frmSplash.Show
    'Load frmMain

End Sub

Public Sub CleanUp()
    ' Sounds
    CleanupSounds

    ' Forms
    Dim Frm As Object
    For Each Frm In VB.Forms
        Unload Frm
    Next
End Sub

Public Function MakeLong(ByVal LoWord As Integer, ByVal HiWord As Integer) As Long
    MakeLong = ((HiWord * &H10000) + LoWord)
End Function

Public Function LoWord(dw As Long) As Integer
    If dw And &H8000& Then
        LoWord = &H8000 Or (dw And &H7FFF&)
    Else
        LoWord = dw And &HFFFF&
    End If
End Function

Public Function HiWord(dw As Long) As Integer
    If dw And &H80000000 Then
        HiWord = (dw \ 65535) - 1
    Else
        HiWord = dw \ 65535
    End If
End Function

Public Function IsLoaded(FormName) As Boolean
    Dim Frm As Object
    For Each Frm In Forms
        If Frm.Name = FormName Then IsLoaded = True: Exit Function
    Next
End Function

Public Sub SetupToolbar()
    Dim vBtns As Variant, vBtn As Variant, lCnt As Long, Btn As ComctlLib.Button
    Dim BtnStyle As ButtonType, vImages As Variant, oImage As ComctlLib.ListImage

    ' Setup imagelist
    With frmMain.ilToolbar
        .ListImages.Clear
        .ImageHeight = 16
        .ImageWidth = 16
        
        vBtns = Split(LoadResString(101), ",")
        
        For Each vBtn In vBtns
            .ListImages.Add , vBtn, LoadResPicture("TLB_" & Trim(vBtn), vbResIcon)
        Next
    End With

    ' Setup toolbar
    With frmMain.tlBar
    
        vBtns = Split(LoadResString(102), ",")

        For Each vBtn In vBtns
            vBtn = Trim(vBtn)
            BtnStyle = tbrNormal
            '
            If vBtn = "" Then
                ' placeholder
                .AddButton tbrPlaceholder
            
            Else
                ' check for button style
                If Left(vBtn, 1) = "_" Then BtnStyle = tbrButtonGroup: vBtn = Mid(vBtn, 2)
            
                lCnt = lCnt + 1
                Set oImage = frmMain.ilToolbar.ListImages(lCnt)
                .AddButton BtnStyle, oImage.Key, oImage.ExtractIcon, vBtn
            End If
            '
        Next
        
    End With
    
    ' Clear imagelist's memory
    frmMain.ilToolbar.ListImages.Clear
End Sub

Public Property Get bBuild() As Boolean
    ' returns whether currently user is building something or just scrolling around.
    bBuild = frmMain.tlBar.ButtonSelected("CONSTRUCT")
End Property

Public Function SortArray(Ary)
    Dim KeepChecking As Boolean, I As Long, FirstValue As Variant, SecondValue As Variant
    '
    KeepChecking = True
    '
    Do Until KeepChecking = False
        KeepChecking = False

        For I = 0 To UBound(Ary)
            If I = UBound(Ary) Then Exit For
            If Ary(I) > Ary(I + 1) Then
                FirstValue = Ary(I)
                SecondValue = Ary(I + 1)
                Ary(I) = SecondValue
                Ary(I + 1) = FirstValue
                KeepChecking = True
            End If
        Next
    Loop
    SortArray = Ary
End Function

Public Sub AddToCellList(X, Y)
    If IsArray(CellList) = False Then
        CellList = Array("")
    Else
        ReDim Preserve CellList(UBound(CellList) + 1)
    End If
    CellList(UBound(CellList)) = String(4 - Len(CStr(Y)), "0") & Y & "," & String(4 - Len(CStr(X)), "0") & X
    SortArray CellList
End Sub

Public Sub RemoveFromCellList(X, Y)
    Dim sTemp As Variant, vItem As Variant, sItem As String
    '
    If IsArray(CellList) = False Then Exit Sub
    sItem = String(4 - Len(CStr(Y)), "0") & Y & "," & String(4 - Len(CStr(X)), "0") & X
    '
    For Each vItem In CellList
        If vItem <> sItem Then
            sTemp = sTemp & vItem & Chr$(0)
        End If
    Next
    If Right(sTemp, 1) = Chr$(0) Then sTemp = Left(sTemp, Len(sTemp) - 1)
    CellList = Split(sTemp, Chr$(0))
End Sub
