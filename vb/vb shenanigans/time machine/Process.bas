Attribute VB_Name = "Porcess"
Option Explicit

Public Terminate_app As Boolean
Public NumOfCores As Integer
Public AvgUsageCount As Double
Public AvgCpu0 As Double
Public AvgCpu1 As Double
Public StartTime As Date

Public hQuery As Long

Public Type CounterInfo
    hCounter As Long
End Type

Public Counters(0 To 1) As CounterInfo

Public Enum PDH_STATUS
    PDH_CSTATUS_VALID_DATA = &H0
    PDH_CSTATUS_NEW_DATA = &H1
End Enum

Public Declare Function PdhOpenQuery _
    Lib "PDH.DLL" _
    (ByVal Reserved As Long, _
    ByVal dwUserData As Long, _
    ByRef hQuery As Long) _
    As PDH_STATUS

Public Declare Function PdhCloseQuery _
    Lib "PDH.DLL" _
    (ByVal hQuery As Long) _
    As PDH_STATUS

Public Declare Function PdhVbAddCounter _
    Lib "PDH.DLL" _
    (ByVal QueryHandle As Long, _
    ByVal CounterPath As String, _
    ByRef CounterHandle As Long) _
    As PDH_STATUS

Public Declare Function PdhCollectQueryData _
    Lib "PDH.DLL" _
    (ByVal QueryHandle As Long) _
    As PDH_STATUS
    
Public Declare Function PdhVbGetDoubleCounterValue _
    Lib "PDH.DLL" _
    (ByVal CounterHandle As Long, _
    ByRef CounterStatus As Long) _
    As Double

Public Declare Sub PdhLookupPerfNameByIndex Lib "PDH.DLL" _
    Alias "PdhLookupPerfNameByIndexA" (ByVal szMachineName As String, _
    ByVal dwNameIndex As Long, _
    ByVal szNameBuffer As String, _
    ByRef pcchNameBufferSize As Long)


Public Const WM_LBUTTONDBLCLK = &H203
Public Const WM_RBUTTONUP = &H205
Public Const NIM_ADD = &H0
Public Const NIM_MODIFY = &H1
Public Const NIF_MESSAGE = &H1
Public Const NIM_DELETE = &H2
Public Const NIF_ICON = &H2
Public Const NIF_TIP = &H4
Public Const WM_MOUSEMOVE = &H200


Public Type NOTIFYICONDATA
    cbSize As Long
    hWnd As Long
    uId As Long
    uFlags As Long
    ucallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type

Public Type SYSTEM_INFO
    dwOemID As Long
    dwPageSize As Long
    lpMinimumApplicationAddress As Long
    lpMaximumApplicationAddress As Long
    dwActiveProcessorMask As Long
    dwNumberOrfProcessors As Long
    dwProcessorType As Long
    dwAllocationGranularity As Long
    wProcessorLevel As Integer
    wProcessorRevision As Integer
End Type

Public Function GetCPUCounter(Instance As Integer) As String
   

    Dim NameLen As Long
    Dim ObjectName As String, CounterName As String
    
    NameLen = 260
    ObjectName = Space$(NameLen)
    PdhLookupPerfNameByIndex ByVal vbNullString, 238, ObjectName, NameLen
    ObjectName = Left$(ObjectName, NameLen - 1)
        
    NameLen = 260
    CounterName = Space$(NameLen)
    PdhLookupPerfNameByIndex ByVal vbNullString, 6, CounterName, NameLen
    GetCPUCounter = "\" & ObjectName & "(" & CStr(Instance) & ")\" & Left$(CounterName, NameLen - 1)
    

End Function

Public Sub Set_Process()

    Dim i As Integer
    Dim hCounter As Long
    Dim CPU_Obj As String
    Dim pdhStatus As PDH_STATUS
    Dim SysInfo As SYSTEM_INFO

    If App.PrevInstance = True Then
        MsgBox "A copy of CPU Usage in Tray is already running!", vbInformation + vbMsgBoxSetForeground + vbOKOnly
        Terminate_app = True
        Exit Sub
    End If

    pdhStatus = PdhOpenQuery(0, 1, hQuery)
    If pdhStatus <> 0 Then
        MsgBox "Windows performance service disabled or broken!", vbCritical + vbMsgBoxSetForeground + vbOKOnly
        Terminate_app = True
        Exit Sub
    End If

    GetSystemInfo SysInfo
    NumOfCores = SysInfo.dwNumberOrfProcessors
    If NumOfCores > 2 Then NumOfCores = 2

    For i = 0 To NumOfCores - 1
        CPU_Obj = GetCPUCounter(i)
        pdhStatus = PdhVbAddCounter(hQuery, CPU_Obj, hCounter)
        Counters(i).hCounter = hCounter
    Next i
    
    If hCounter = 0 Then
        MsgBox "CPU usage query failed!", vbInformation + vbMsgBoxSetForeground + vbOKOnly
        Terminate_app = True
        Exit Sub
    End If
                

End Sub
Public Sub CycleED()

    Call QueryPerformanceCounter(cNow) ' 
    Call Clk.CpuClk(C2) ' 
    tFa = 1000 / (CDbl(cCycles) / (C2 - C1))

End Sub

Public Sub CycleST()

    Call QueryPerformanceFrequency(cCycles)
    Call Clk.CpuClk(C1)
    Call QueryPerformanceCounter(cStart)

End Sub

