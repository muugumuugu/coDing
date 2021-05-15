Attribute VB_Name = "modFormFunctions"
Option Explicit
Global OpenBook As Variant
Global gvForeColor As Variant
Global bvMargin As Variant
'Global gbCheck As Boolean
'
'Public Function OpenString(sFilename As String) As String
'Dim Printline As String
'Dim MyString As String
'pgb.Show
'Open sFilename For Input As #1    ' Open file for output.
'    Do While Not EOF(1) ' Loop until end of file.
'    Line Input #1, MyString    ' Read data into two variables.
'    DoEvents
'    Printline = Printline & MyString & vbCrLf
'    pgb.Progress Len(Printline), LOF(1), "Opening Book"
'    Loop
'Close #1 ' Close the newly created file
'
'OpenString = Printline
'Unload pgb
'End Function
'Public Function SaveString(sFilename As String, sString As String) As Boolean
'Dim Printline As String
'
'Open sFilename For Output As #1    ' Open file for output.
'    Printline = sString
'    Print #1, Printline ' Write the record to the text file
'Close #1 ' Close the newly created file
'
'
'End Function
