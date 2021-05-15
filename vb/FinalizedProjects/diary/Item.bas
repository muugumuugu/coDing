Attribute VB_Name = "modPhone"

Type PhoneType
  LastName As String * 20   'ItemName
  FirstName As String * 20     'DFName
  PhoneNumber As String * 25   'Quantity
  FaxNumber As String * 25 'PublicPrice
  Adress As String * 25   'NetPrice
  Email As String * 25 'ExpiryDate
  'ServiceType As Byte
End Type
Public Phones As PhoneType


Type IndexType
  FullName As String * 41
  RecNum As Integer
End Type
Public Index() As IndexType

Public numPhones As Integer
Public whichRecord As Integer


