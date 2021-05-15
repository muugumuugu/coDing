VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmConstants 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Constants"
   ClientHeight    =   3495
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5775
   ControlBox      =   0   'False
   Icon            =   "frmConstants.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3495
   ScaleWidth      =   5775
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdRemove 
      Caption         =   "Remove"
      Enabled         =   0   'False
      Height          =   350
      Left            =   4560
      TabIndex        =   5
      Top             =   3000
      Width           =   1095
   End
   Begin MSComctlLib.ListView lstConstants 
      Height          =   2415
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   4260
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   350
      Left            =   2160
      TabIndex        =   3
      Top             =   3000
      Width           =   1095
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   350
      Left            =   960
      TabIndex        =   2
      Top             =   3000
      Width           =   1095
   End
   Begin VB.CommandButton cmdAddNew 
      Caption         =   "Add New"
      Height          =   350
      Left            =   3360
      TabIndex        =   4
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Frame fraConstants 
      Caption         =   "Current Constants"
      Height          =   2775
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5535
   End
End
Attribute VB_Name = "frmConstants"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim ListArray() As String
Dim ListArray2() As String

Private Sub cmdAddNew_Click()
Dim Check As Boolean
Dim Check2 As Boolean
Dim Check3 As Boolean
Dim Constant As String
Dim CValue As String
Dim i As Integer
Dim LItem As ListItem

    'Get new constant name
    Check = True
    Check2 = True
    Check3 = True
    Do

        'Display input box
        If Check = True And Check2 = True And Check3 = True Then
                Constant = LCase(InputBox("Enter constant name:", "New Constant", "Constant"))
        ElseIf Check = False Then
            Constant = LCase(InputBox("Error: Name must contain only letters." + vbNewLine + vbNewLine + "Enter constant name:", "New Constant", "Constant"))
        ElseIf Check2 = False Then
            Constant = LCase(InputBox("Error: Name already in use." + vbNewLine + vbNewLine + "Enter constant name:", "New Constant", "Constant"))
        ElseIf Check3 = False Then
            Constant = LCase(InputBox("Error: Reserved keyword." + vbNewLine + vbNewLine + "Enter constant name:", "New Constant", "Constant"))
        End If

        'Check for valid entry
        Check = True
        For i = 1 To Len(Constant)
            If Not (Mid(Constant, i, 1) >= "a" And Mid(Constant, i, 1) <= "z") Then
                Check = False
                Exit For
            End If
        Next i

        'Check for repeated entry
        Check2 = True
        If Check = True Then
            For i = 1 To lstConstants.ListItems.Count
                If Constant = lstConstants.ListItems(i).Text Then
                    Check2 = False
                    Exit For
                End If
            Next i
        End If

        'Check for reserved keyword
        Check3 = True
        If Check = True And Check2 = True Then
            If Constant = "rnd" Or Constant = "ans" Or _
            Constant = "abs" Or Constant = "help" Or _
            Constant = "sr" Or Constant = "log" Or _
            Constant = "ln" Or Constant = "cos" Or _
            Constant = "cot" Or Constant = "csc" Or _
            Constant = "hcos" Or Constant = "hcot" Or _
            Constant = "hcsc" Or Constant = "hsec" Or _
            Constant = "hsin" Or Constant = "htan" Or _
            Constant = "ihcos" Or Constant = "ihcot" Or _
            Constant = "ihcsc" Or Constant = "ihsec" Or _
            Constant = "ihsin" Or Constant = "ihtan" Or _
            Constant = "sec" Or Constant = "sin" Or _
            Constant = "tan" Or Constant = "e" Or _
            Constant = "pi" Then
                Check3 = False
            End If
        End If
    Loop Until Check = True And Check2 = True And Check3 = True

    'If cancel was pressed or no entry was made, exit the
    'routine
    If Constant = "" Then
        Exit Sub
    End If

    'Get new constant value
    Check = True
    Do

        'Display input box
        If Check = True Then
            CValue = InputBox("Enter constant ( " + Constant + " ) value:", "New Constant", "0")
        Else
            CValue = InputBox("Error: Value must contain only digits and decimals" + vbNewLine + vbNewLine + "Enter constant (" + Constant + ") value:", "New Constant", "0")
        End If

        'Check for valid entry
        Check = True
        For i = 1 To Len(CValue)
            If Not ((Mid(CValue, i, 1) >= "0" And Mid(CValue, i, 1) <= "9") Or (Mid(CValue, i, 1) = ".")) Then
                Check = False
                Exit For
            End If
        Next i
    Loop Until Check = True

    'If cancel was pressed or no entry was made, exit the
    'routine
    If CValue = "" Then
        Exit Sub
    End If

    'Place new constant value into ListView control
    Set LItem = lstConstants.ListItems.Add(, , Constant)
    LItem.SubItems(1) = CValue

End Sub

Private Sub cmdCancel_Click()

    'Close form without saving
    Unload Me

End Sub

Private Sub cmdOK_Click()
Dim FileNumber As Long
Dim i As Long

    'Close form after saving constants to "constants.csd"
    FileNumber = FreeFile
    Open "constants.csd" For Output As #FileNumber
        For i = 1 To lstConstants.ListItems.Count
            Write #FileNumber, lstConstants.ListItems(i).Text
            Write #FileNumber, lstConstants.ListItems(i).ListSubItems(1).Text
        Next i
    Close #FileNumber
    Unload Me

End Sub

Private Sub cmdRemove_Click()
Dim i As Long
Dim j As Long
Dim Message As String
Dim Question As String

    'Set basic array dimensions
    ReDim ListArray(0)

    'Load selected list items into array
    For i = 1 To lstConstants.ListItems.Count
        If lstConstants.ListItems(i).Selected = True Then
            ReDim Preserve ListArray(UBound(ListArray) + 1)
            ListArray(UBound(ListArray)) = lstConstants.ListItems(i).Text
        End If
    Next i

    'Set displayed question
    If UBound(ListArray) > 1 Then
        Question = "Remove selected items?  ( "
        For i = (LBound(ListArray) + 1) To UBound(ListArray)
            Question = Question + ListArray(i)
            If i <> UBound(ListArray) Then
                Question = Question + ", "
            Else
                Question = Question + " )"
            End If
        Next i
    Else
        Question = "Remove selected item?  ( " + lstConstants.SelectedItem + " )"
    End If

    'Request confirmation
    Message = MsgBox(Question, vbYesNo, "Constants")
    If Message = vbNo Then
        Exit Sub
    End If

    'Remove multiple items from list
    If UBound(ListArray) > 1 Then
        For i = (LBound(ListArray) + 1) To UBound(ListArray)
            For j = 1 To lstConstants.ListItems.Count
                If lstConstants.ListItems(j).Text = ListArray(i) Then
                    lstConstants.ListItems.Remove j
                    Exit For
                End If
            Next j
        Next i

    'Remove single item from list
    Else
        lstConstants.ListItems.Remove lstConstants.SelectedItem.Index
    End If

    'Prevent clicking of remove button with nothing selected
    lstConstants_Click

End Sub

Private Sub Form_Load()
On Error GoTo ErrorHandler
Dim CHeader As ColumnHeader
Dim FileNumber As Long
Dim i As Long

    'Set headers for ListView control
    Set CHeader = lstConstants.ColumnHeaders.Add(, , "Constants ( A - Z )")
    Set CHeader = lstConstants.ColumnHeaders.Add(, , "Values")

    'Evenly distribute width to all columns
    For i = 1 To lstConstants.ColumnHeaders.Count
        lstConstants.ColumnHeaders(i).Width = lstConstants.Width / lstConstants.ColumnHeaders.Count - (3 * Screen.TwipsPerPixelX)
    Next i

    'Load data from file
    LoadConstantData

    Exit Sub

ErrorHandler:

    'File not found
    If Err.Number = 53 Then
        FileNumber = FreeFile
        Open "constants.csd" For Output As #FileNumber
        Close #FileNumber
        LoadConstantData
        Exit Sub
    End If

End Sub

Private Sub lstConstants_Click()

    'Disable Remove button if no list items exist
    If lstConstants.ListItems.Count > 0 Then

        'Enable / disable Remove button
        If lstConstants.ListItems(lstConstants.SelectedItem.Index).Text <> "" Then
            cmdRemove.Enabled = True
        Else
            cmdRemove.Enabled = False
        End If
    Else
        cmdRemove.Enabled = False
    End If

End Sub

Private Sub lstConstants_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
Dim CHeader As ColumnHeader

    'Switch between ascending/descending
    If lstConstants.SortOrder = lvwAscending Then
        lstConstants.SortOrder = lvwDescending
        lstConstants.ColumnHeaders(1).Text = "Constants ( Z - A )"
    Else
        lstConstants.SortOrder = lvwAscending
        lstConstants.ColumnHeaders(1).Text = "Constants ( A - Z )"
    End If

End Sub

Private Sub LoadConstantData()
Dim FileNumber As Long
Dim i As Long
Dim LItem As ListItem

    'Set basic array dimensions
    ReDim ListArray(0)
    ReDim ListArray2(0)
    FileNumber = FreeFile

    'Open "constants.csd" and load the constants and their
    'values into ListArray and ListArray2, respectively
    Open "constants.csd" For Input As #FileNumber
        Do While Not EOF(FileNumber)
            ReDim Preserve ListArray(UBound(ListArray) + 1)
            ReDim Preserve ListArray2(UBound(ListArray2) + 1)
            Input #FileNumber, ListArray(UBound(ListArray))
            Input #FileNumber, ListArray2(UBound(ListArray2))
        Loop
    Close #FileNumber

    'Set ListView items and subitems
    For i = 1 To UBound(ListArray)
        Set LItem = lstConstants.ListItems.Add(, , ListArray(i))
        LItem.SubItems(1) = ListArray2(i)
    Next i

End Sub

Private Sub lstConstants_DblClick()
Dim Location As Integer
Dim Message As String

    'Do not go through routine if no items exist
    If lstConstants.ListItems.Count > 0 Then

        If lstConstants.SelectedItem.Text <> "" Then

            'Request confirmation
            Message = MsgBox("Insert selected constant ( " + lstConstants.SelectedItem.Text + " ) into main Entry?", vbYesNo, "Insert Constant")
    
            'If user denied confirmation, exit
            If Message = vbNo Then
                Exit Sub
            End If
    
            'Insert constant into text box with a space "buffer"
            'on either side
            Location = frmCalcSolver.txtEntry.SelStart
            frmCalcSolver.txtEntry.Text = Left(frmCalcSolver.txtEntry.Text, frmCalcSolver.txtEntry.SelStart) + " " + lstConstants.SelectedItem.Text + " " + Right(frmCalcSolver.txtEntry.Text, Len(frmCalcSolver.txtEntry.Text) - frmCalcSolver.txtEntry.SelStart)
            frmCalcSolver.txtEntry.SelStart = Location + 2 + Len(lstConstants.SelectedItem.Text)
        End If

    End If

End Sub
