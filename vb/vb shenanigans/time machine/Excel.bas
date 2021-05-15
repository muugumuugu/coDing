Attribute VB_Name = "Excel"
Option Explicit

Public ExelArray()
Public oExcel As Object
Public bNewExcelObjectCreated As Boolean
Public oWorkBook1 As Object
Public oWorkBook2 As Object
Public Function OpenExcel(ByRef bObjectCreated As Boolean) As Boolean
  On Error Resume Next
  Err.Clear
  ' If we haven't opened excel yet...
  If oExcel Is Nothing Then
    ' Assume we will use existing object
    bObjectCreated = False
    ' Attemtp to get existing excel application object
    Set oExcel = GetObject(, "Excel.Application")
    ' Existing excel not found, try to create a new one
    If Err.Number <> 0 Then
      Err.Clear
      Set oExcel = CreateObject("excel.application")
      oExcel.Visible = True
      If Err.Number <> 0 Then
        MsgBox "Cannot create excel object", vbCritical
        Exit Function
      End If
      ' We created a new instance of excel
      bObjectCreated = True
    End If
  End If
  ' We succesfully fetched an excel object
  OpenExcel = True
End Function
Public Sub CloseExcel()
  ' If we have no excel object, just return
  If oExcel Is Nothing Then Exit Sub
  ' If we have any workbooks open...
  If Not oWorkBook1 Is Nothing Then
    ' Close and do NOT save
    oWorkBook1.Close False
  End If
  If Not oWorkBook2 Is Nothing Then
    ' Close and do NOT save
    oWorkBook2.Close False
  End If
  ' If we had to create our own excel application object
  If bNewExcelObjectCreated Then
    ' Close it
    oExcel.Quit
  End If
  Set oExcel = Nothing
End Sub
Public Function AddWorkBook(oExcelApplication As Object) As Object
  ' Add a workbook and return object
  Set AddWorkBook = oExcelApplication.Workbooks.Add()
End Function
Public Function GetWorkSheet(oWorkBook As Object, n As Integer) As Object
  ' Get first worksheet and return object
  Set GetWorkSheet = oWorkBook.Sheets(n)
End Function

Public Sub FillSheetCellByCell(oSheet As Object, aryData)
  Dim n As Integer, m As Integer
  ' Loop through array and set values in sheet
  For n = LBound(aryData, 1) To UBound(aryData, 1)
    For m = LBound(aryData, 2) To UBound(aryData, 2)
      oSheet.Cells(n + 1, m + 1) = aryData(n, m)
    Next
  Next
End Sub
Public Sub FillSheetUsingRange(oSheet As Object, aryData)
  ' Use "resize" function to fill cells from array
  ' Important:  Rows and Columns are 1-based in excel
  ' We start with range that includes only the first cell
  ' Using the resize function, we pump all the data into the sheet in one step
  oSheet.range("A1", "A1").Resize(UBound(aryData, 1) - LBound(aryData, 1) + 1, UBound(aryData, 2) - LBound(aryData, 2) + 1).Value = aryData
End Sub
Public Sub InitDataArray()
  Dim n As Integer, m As Integer
  
  For n = 0 To 99
    For m = 0 To 99
      ExelArray(n, m) = n * 100 + m
    Next
  Next
  
End Sub

Public Sub ExcelSaveArrayStp()
  Screen.MousePointer = vbHourglass
  
  ' Load Excel Object
  If Not OpenExcel(bNewExcelObjectCreated) Then Exit Sub
  ' Add new workbook
  Set oWorkBook1 = AddWorkBook(oExcel)
  ' Fill first sheet with data
  FillSheetCellByCell GetWorkSheet(oWorkBook1, 1), ExelArray
  
  Screen.MousePointer = vbDefault
End Sub

Public Sub ExcelSaveArray()
  Screen.MousePointer = vbHourglass
  
  If Not OpenExcel(bNewExcelObjectCreated) Then Exit Sub
  ' Add new workbook
  Set oWorkBook2 = AddWorkBook(oExcel)
  ' Fill first sheet with data
  FillSheetUsingRange GetWorkSheet(oWorkBook2, 1), ExelArray
  
  Screen.MousePointer = vbDefault
End Sub

'Private Sub Form_Load()
'  InitDataArray
'End Sub

'Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
'  CloseExcel
'End Sub

