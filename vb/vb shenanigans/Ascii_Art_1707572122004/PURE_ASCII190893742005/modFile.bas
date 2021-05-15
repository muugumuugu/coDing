Attribute VB_Name = "modFile"
'These are for StartDoc:
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Function GetDesktopWindow Lib "user32" () As Long

'This will start a file up with it's default program
Function StartDoc(ByVal DocName As String) As Long
    Dim Scr_hDC As Long
    Scr_hDC = GetDesktopWindow()
    StartDoc = ShellExecute(Scr_hDC, "Open", DocName, "", "", 1)
End Function

Public Function GetExt(File As String) As String
On Error GoTo ScrewUp
    Dim i As Byte
    
    File = StrReverse(File)
    i = InStr(1, File, ".")
    File = StrReverse(File)
    
    GetExt = Mid(File, Len(File) - i + 2, Len(File) - i - 2)
    
    Exit Function
ScrewUp:
    GetExt = ""
End Function

Public Function AddSlash(Path As String) As String
On Error GoTo ScrewUp
    If Right(Path, 1) = "\" Then AddSlash = Path Else AddSlash = Path & "\"
    
    Exit Function
ScrewUp:
    AddSlash = ""
End Function
