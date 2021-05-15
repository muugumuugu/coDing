VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cCpuClk"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long

Private hMem      As Long
Private pOldCode  As Long
Private pNewCode  As Long
Private pMyself   As Long

Public Sub CpuClk(Cycles As Currency)
End Sub

Private Sub Class_Initialize()
  hMem = GlobalAlloc(0, 16)
  pNewCode = GlobalLock(hMem)
  Call CopyMemory(pMyself, ByVal ObjPtr(Me), 4)
  Call CopyMemory(ByVal pNewCode + &H0, &H4C8B310F, 4)
  Call CopyMemory(ByVal pNewCode + &H4, &H1890824, 4)
  Call CopyMemory(ByVal pNewCode + &H8, &H33045189, 4)
  Call CopyMemory(ByVal pNewCode + &HC, &H8C2C0, 4)
  Call CopyMemory(pOldCode, ByVal pMyself + &H1C, 4)
  Call CopyMemory(ByVal pMyself + &H1C, pNewCode, 4)
  Call GlobalUnlock(hMem)
End Sub

Private Sub Class_Terminate()
  Call CopyMemory(ByVal pMyself + &H1C, pOldCode, 4)
  Call GlobalFree(hMem)
End Sub

