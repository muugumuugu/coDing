VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cBuilding"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public Key          As String
'
Public Name         As String
Public BuildingType As String
Public OtherInfo    As String
'
Public Cost         As Long
Public CostToClear  As Long
'
Public TaxPayment   As Long
Public LastTaxPaid  As Date
'
Public Textures     As Collection
Public AllowSelection As String
'
Public StartDate    As Date
Public PhaseDays    As Integer
Public CurPhase     As Single       ' completion stage
Public MaxPhases    As Integer
'
Public X            As Single
Public Y            As Single
