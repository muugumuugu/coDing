Attribute VB_Name = "modDisplayMode"
Option Explicit
'
' Display Mode Manager (modDisplayMode)   - Faraz Azhar
'
Private Const GA_ROOT = 2

' Display window
Const WM_DISPLAYCHANGE = &H7E
Const HWND_BROADCAST = &HFFFF&
Const CCDEVICENAME = 32
Const CCFORMNAME = 32
Const DM_BITSPERPEL = &H40000
Const DM_PELSWIDTH = &H80000
Const DM_PELSHEIGHT = &H100000
Const CDS_UPDATEREGISTRY = &H1
Const CDS_TEST = &H4
Const DISP_CHANGE_SUCCESSFUL = 0
Const DISP_CHANGE_RESTART = 1
Const BITSPIXEL = 12
Private Type DEVMODE
    dmDeviceName As String * CCDEVICENAME
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * CCFORMNAME
    dmUnusedPadding As Integer
    dmBitsPerPel As Integer
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
End Type
Private Declare Function EnumDisplaySettings Lib "user32" Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As Long, ByVal iModeNum As Long, lpDevMode As Any) As Boolean
Private Declare Function ChangeDisplaySettings Lib "user32" Alias "ChangeDisplaySettingsA" (lpDevMode As Any, ByVal dwFlags As Long) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hDC As Long, ByVal nIndex As Long) As Long
Private Declare Function CreateDC Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, ByVal lpInitData As Any) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function GetAncestor Lib "user32.dll" (ByVal hWnd As Long, ByVal gaFlags As Long) As Long

' Active window
Private Declare Function GetActiveWindow Lib "user32" () As Long

' Misc
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

' Vars
Dim OldX As Long, OldY As Long, nDC As Long, lActiveWindow As Long

Private Function ChangeRes(X As Long, Y As Long, Bits As Long) As Boolean
    Dim DevM As DEVMODE, ScInfo As Long, erg As Long, an As VbMsgBoxResult
    'Get the info into DevM
    erg = EnumDisplaySettings(0&, 0&, DevM)
    'This is what we're going to change
    DevM.dmFields = DM_PELSWIDTH Or DM_PELSHEIGHT Or DM_BITSPERPEL
    DevM.dmPelsWidth = X 'ScreenWidth
    DevM.dmPelsHeight = Y 'ScreenHeight
    DevM.dmBitsPerPel = Bits '(can be 8, 16, 24, 32 or even 4)
    'Now change the display and check if possible
    erg = ChangeDisplaySettings(DevM, CDS_TEST)
    'Check if succesfull
    Select Case erg&
        Case DISP_CHANGE_RESTART
            'an = MsgBox("You've to reboot", vbYesNo + vbSystemModal, "Info")
            'If an = vbYes Then
            '    erg& = ExitWindowsEx(EWX_REBOOT, 0&)
            'End If
        Case DISP_CHANGE_SUCCESSFUL
            erg = ChangeDisplaySettings(DevM, CDS_UPDATEREGISTRY)
            ScInfo = Y * 2 ^ 16 + X
            'Notify all the windows of the screen resolution change
            SendMessage HWND_BROADCAST, WM_DISPLAYCHANGE, ByVal Bits, ByVal ScInfo
            'MsgBox "Everything's ok", vbOKOnly + vbSystemModal, "It worked!"
            ChangeRes = True
        Case Else
            'MsgBox "Mode not supported", vbOKOnly + vbSystemModal, "Error"
    End Select
End Function

Public Function DisplayModeChange() As Boolean
    '
    If DisplayResolution = erWindowed Then
        DisplayModeChange = True
        Exit Function
    End If
    '
    'retrieve the screen's resolution
    If OldX = 0 And OldY = 0 Then
        OldX = Screen.Width / Screen.TwipsPerPixelX
        OldY = Screen.Height / Screen.TwipsPerPixelY
    End If
    'Create a device context, compatible with the screen
    nDC = CreateDC("DISPLAY", vbNullString, vbNullString, ByVal 0&)
    'Change the screen's resolution
    If ChangeRes(640, 480, GetDeviceCaps(nDC, BITSPIXEL)) = False Then
        MsgBox "640x480 screen mode either not supported by your graphics card or " & _
               "windows requires restart when display mode is changed; hence game " & _
               "cannot continue.", vbExclamation
        DisplayModeRestore
    Else
        DisplayModeChange = True
    End If
End Function

Public Function DisplayModeRestore() As Boolean
    '
    If DisplayResolution = erWindowed Then
        DisplayModeRestore = True
        Exit Function
    End If
    '
    'restore the screen resolution
    MyTimer 100
    ChangeRes OldX, OldY, GetDeviceCaps(nDC, BITSPIXEL)
    'delete our device context
    DeleteDC nDC
    '
    DoEvents
    MyTimer 2000
    DoEvents
    '
    DisplayModeRestore = True
End Function

Public Sub CheckForActiveWindow()
    If GetActiveWindow = lActiveWindow Then Exit Sub
    '
    Dim Frm As Object, lAncestor As Long
    '
    lActiveWindow = GetActiveWindow
    lAncestor = GetAncestor(lActiveWindow, GA_ROOT)
    '
    For Each Frm In Forms
        If lActiveWindow = Frm.hWnd Or lAncestor = Frm.hWnd Then
            ' got focus
            DisplayModeChange
            DoEvents
            TopMostWindow True ', lActiveWindow
            '
            Exit Sub
        End If
    Next
    '
    ' lost focus
    If IsLoaded("frmSplash") Then Unload frmSplash
    DisplayModeRestore
    TopMostWindow False
    frmMain.WindowState = vbMinimized
    '
End Sub
