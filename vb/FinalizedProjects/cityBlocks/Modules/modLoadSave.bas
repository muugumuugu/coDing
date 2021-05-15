Attribute VB_Name = "modLoadSave"
Option Explicit
'
' Load/Save Maps (modLoadSave)   - Faraz Azhar
'

Const MOVEFILE_REPLACE_EXISTING = &H1
Private Declare Function MoveFileEx Lib "kernel32" Alias "MoveFileExA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal dwFlags As Long) As Long

Public Sub SaveMap()
    Dim Conn As New Connection, RS As New Recordset, Bld As cBuilding, vVar As Variant
    Dim bAnim As Boolean, bScroll As Boolean, Obj As Object
    
    ' Open map database
    If Dir(App.Path & "\map.mdb") = "" Then
        pShowMessage "Map database is missing. Please reinstall the game."
        PlaySound "ERROR"
        Exit Sub
    End If
    
    ' Stop everything! Pause the game!
    With frmMain
        .tmr10 = False
        bAnim = .tmrAnimation
        .tmrAnimation = False
        .tmrRender = False
        bScroll = .tmrScroll
        .tmrScroll = False
        .picDraw.Enabled = False
    End With
    
    Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\map.mdb"

    ' [Information, Prop counts, Animations]
    Conn.Execute "DELETE FROM [Information]"  ' delete all previous information
    RS.Open "SELECT * FROM [Information]", Conn, adOpenStatic, adLockOptimistic
    With RS
        .AddNew
    
            !Balance = frmMain.stBar.Balance
            !CurrentDate = frmMain.stBar.CurrentDate
            !mX = Mouse.M.X     ' mX & mY specify the current view on the map.
            !mY = Mouse.M.Y
            !PropCount = lPropCount
            !BuildingCount = mBuildings.Count
            !AnimationCount = mAnimations.Count
            If IsArray(CellList) Then
                !CellList = Join(CellList, Chr$(0))
            End If
            
            'Animations
            For Each Obj In mAnimations
                If TypeName(Obj) = "cBuilding" Then
                    !Animations = !Animations & Obj.Key & Chr$(0)
                End If
            Next
        
        .Update
        .Close
    End With

    ' [Buildings]
    Conn.Execute "DELETE FROM [Buildings]"  ' delete all previous information
    RS.Open "SELECT * FROM [Buildings]", Conn, adOpenStatic, adLockOptimistic
    With RS

        For Each Bld In mBuildings
            .AddNew
                '
                !Key = Bld.Key
                
                !Name = Bld.Name
                !BuildingType = Bld.BuildingType
                !OtherInfo = Bld.OtherInfo
                
                !Cost = Bld.Cost
                !CostToClear = Bld.CostToClear
                
                !TaxPayment = Bld.TaxPayment
                !LastTaxPaid = Bld.LastTaxPaid
                
                For Each vVar In Bld.Textures
                    !Textures = !Textures & vVar & Chr$(0)
                Next
                If Right(!Textures, 1) = Chr$(0) Then !Textures = Left(!Textures, Len(!Textures) - 1)
                !AllowSelection = Bld.AllowSelection
                
                !StartDate = Bld.StartDate
                !PhaseDays = Bld.PhaseDays
                !CurPhase = Bld.CurPhase
                !MaxPhases = Bld.MaxPhases
                
                !X = Bld.X
                !Y = Bld.Y
                '
            .Update
        Next

        .Close
    End With


    ' Ok.. we're done with saving, unpause the game.
    With frmMain
        .tmr10 = True
        .tmrAnimation = bAnim
        .tmrRender = True
        .tmrScroll = bScroll
        .picDraw.Enabled = True
        '.Render
    End With

    ' All Done!
    Conn.Close
    Set Conn = Nothing
    ' Compact database file to lower space usage
    CompactMapFile
    '
    pShowMessage "The map has been successfully saved!"
    '
End Sub

Public Sub LoadMap()
    Dim Conn As New Connection, RS As New Recordset, Bld As cBuilding
    Dim vVars As Variant, vVar As Variant, sAnimations As String, bDontLoad As Boolean
    
    ' Open map database
    If Dir(App.Path & "\map.mdb") = "" Then
        pShowMessage "Map database is missing. Please reinstall the game."
        PlaySound "ERROR"
        Exit Sub
    End If

    ' First we stop everything so we can cease the current running game.
    With frmMain
        .tmr10 = False
        .tmrAnimation = False
        .tmrRender = False
        .tmrScroll = False
        .picDraw.Enabled = False
    End With

    pShowMessage "Loading..."
    MyTimer 10

    Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\map.mdb"

    ' [Information, Prop counts, Animations]
    RS.Open "SELECT * FROM [Information]", Conn, adOpenStatic, adLockOptimistic
    With RS
        '
        If .RecordCount = 0 Then
            bDontLoad = True    ' stop loading the building data (below)

        Else
            '
            .MoveFirst


            ' Now we will reset all settings; after knowing there is a saved map available.
            Set mBuildings = New Collection
            Set mAnimations = New Collection
            Set mTransactions = New Collection
            Set Cells = New cCells
            lPropCount = 0


            ' bank balance & current date
            frmMain.stBar.Balance = !Balance
            frmMain.stBar.CurrentDate = !CurrentDate
            ' mouse
            Mouse.M.X = !mX
            Mouse.M.Y = !mY
            Mouse.SelON = False
            Mouse.SelDrawn = False
            Mouse.State = emsDefault
            ChangeMousePointer ""
            ' props
            lPropCount = !PropCount
            If Len(!CellList & "") Then
                CellList = Split(!CellList, Chr$(0))
            End If
            ' animations
            sAnimations = (!Animations & "")
            '
        End If
        .Close
        '
    End With

    ' [Buildings]
    If bDontLoad = False Then   ' bDontLoad=True tells that "Information" table
                                ' was empty so dont load the "Buildings" table.
        RS.Open "SELECT * FROM [Buildings]", Conn, adOpenStatic, adLockOptimistic
        With RS
            '
            Do Until .EOF
                '
                Set Bld = New cBuilding
                '
                Bld.Key = !Key
                
                Bld.Name = !Name
                Bld.BuildingType = !BuildingType
                Bld.OtherInfo = !OtherInfo
                
                Bld.Cost = !Cost
                Bld.CostToClear = !CostToClear
                
                Bld.TaxPayment = !TaxPayment
                Bld.LastTaxPaid = !LastTaxPaid
                
                vVars = Split(!Textures, Chr$(0))
                Set Bld.Textures = New Collection
                For Each vVar In vVars
                    Bld.Textures.Add vVar
                Next
                Bld.AllowSelection = !AllowSelection
                
                Bld.StartDate = !StartDate
                Bld.PhaseDays = !PhaseDays
                Bld.CurPhase = !CurPhase
                Bld.MaxPhases = !MaxPhases
                
                Bld.X = !X
                Bld.Y = !Y
                '
                ' Store this information
                mBuildings.Add Bld, Bld.Key
                Cells.Add Bld.X, Bld.Y, Bld.Key
    
                ' Check this this building is also in the animations list
                If InStr(sAnimations, (Bld.Key & Chr$(0))) Then
                    mAnimations.Add Bld, Bld.Key
                End If
                '
                .MoveNext
            Loop
            '
            .Close
        End With
        '
        Call frmMain.Form_KeyPress(vbKeyEscape) ' to close all buildings and reset toolbar.
        '
    End If  ' bDontLoad

    ' Ok.. we're done with loading, now crank start everything up!
    With frmMain
        .tmr10 = True
        .tmrAnimation = True
        .tmrRender = True
        '.tmrScroll = False
        .picDraw.Enabled = True
        ' RENDER!!!!!
        .Render
    End With

    ' All Done!
    Conn.Close
    Set Conn = Nothing
    '
    frmMain.wMsgBox.Visible = False
End Sub

Private Sub pShowMessage(Message)
    With frmMain.wMsgBox
        .Message = Message
        .ShowWindow
    End With
End Sub

Private Sub CompactMapFile()

    On Error GoTo ErrHanlder      ' This happens if MS Access is using the database.

    Dim JE       As New JRO.JetEngine
    Dim Src      As String
    Dim Dst      As String
    Dim dbPath1  As String
    Dim dbPath2  As String

    dbPath1 = App.Path & "\map.mdb"
    dbPath2 = App.Path & "\map.bck"

    Src = "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Data Source=" & dbPath1
    Dst = "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Data Source=" & dbPath2

    JE.CompactDatabase Src, Dst
    Set JE = Nothing
 
    MoveFileEx dbPath2, dbPath1, MOVEFILE_REPLACE_EXISTING
    
    Exit Sub

ErrHanlder:
    Debug.Print "ERROR: (modLoadSave.CompactMapFile) "; Err.Description & ". [" & Err.Number & "]"
End Sub
