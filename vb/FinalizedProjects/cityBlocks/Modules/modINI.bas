Attribute VB_Name = "modINI"
Option Explicit
'
' Written by Faraz Azhar (www.geocities.com/farazazhar_net/)
' Adapted from Dave Scarmozzino's Registry & INI Writer (www.TheScarms.com)
'
Private Declare Function GetPrivateProfileSection Lib "kernel32" _
        Alias "GetPrivateProfileSectionA" (ByVal lpAppName As String, _
        ByVal lpReturnedString As String, ByVal nSize As Long, ByVal _
        lpFileName As String) As Long
        
Private Declare Function GetPrivateProfileString Lib "kernel32" _
        Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, _
        ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString _
        As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
        
Private Declare Function WritePrivateProfileString Lib "kernel32" _
        Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, _
        ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) _
        As Long

Private Declare Function GetPrivateProfileInt Lib "kernel32" _
        Alias "GetPrivateProfileIntA" (ByVal lpApplicationName As String, _
        ByVal lpKeyName As String, ByVal nDefault As Long, ByVal lpFileName _
        As String) As Long

Public Function INIReadValue(ByVal sFileName As String, ByVal sSection As String, ByVal sValueName As String, _
                             ByVal vDefault As Variant, Optional ByVal bInteger As Boolean = False) As Variant
    '
    Dim lLenData    As Long
    Dim lResult     As Long
    Dim lDefault    As Long
    Dim sValue      As String
    Dim sDefaultStr As String
    '
    If bInteger = False Then
        lLenData = 255
        sDefaultStr = vDefault  ' to convert Variant into String
        sValue = Space$(lLenData)
        lResult = GetPrivateProfileString(sSection, sValueName, sDefaultStr, sValue, lLenData, sFileName)
        sValue = Left$(sValue, lResult)
    Else
        lDefault = 0
        sValue = GetPrivateProfileInt(sSection, sValueName, lDefault, sFileName)
    End If
    '
    INIReadValue = sValue
End Function

Public Function INIWriteValue(ByVal sFileName As String, ByVal sSection As String, _
                              ByVal sValueName As String, ByVal vValue As Variant) As Variant
    '
    ' Write value into the .ini file.
    '
    Dim sValue      As String
    '
    sValue = vValue
    INIWriteValue = WritePrivateProfileString(sSection, sValueName, sValue, sFileName)
    '
End Function
