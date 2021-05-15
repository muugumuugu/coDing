VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmGraph 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Graph"
   ClientHeight    =   5490
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8715
   Icon            =   "frmGraph.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5490
   ScaleWidth      =   8715
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lstHistoryGraphMode 
      Enabled         =   0   'False
      Height          =   255
      Left            =   7560
      MultiSelect     =   2  'Extended
      TabIndex        =   34
      Top             =   4920
      Visible         =   0   'False
      Width           =   1125
   End
   Begin VB.ListBox lstHistoryAngMode 
      Enabled         =   0   'False
      Height          =   255
      Left            =   6480
      MultiSelect     =   2  'Extended
      TabIndex        =   33
      Top             =   4920
      Visible         =   0   'False
      Width           =   1125
   End
   Begin MSComctlLib.ProgressBar pgbProgress 
      Height          =   135
      Left            =   120
      TabIndex        =   32
      Top             =   5040
      Width           =   3660
      _ExtentX        =   6456
      _ExtentY        =   238
      _Version        =   393216
      Appearance      =   1
      Max             =   3600
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Enabled         =   0   'False
      Height          =   350
      Left            =   1380
      TabIndex        =   3
      Top             =   840
      Width           =   1095
   End
   Begin VB.Frame fraGraphMode 
      Caption         =   "Graph Mode"
      Height          =   1092
      Left            =   6720
      TabIndex        =   29
      Top             =   1320
      Width           =   1812
      Begin VB.OptionButton optGraphMode 
         Caption         =   "Derivative"
         Height          =   252
         Index           =   1
         Left            =   360
         TabIndex        =   16
         Top             =   620
         Width           =   1290
      End
      Begin VB.OptionButton optGraphMode 
         Caption         =   "Normal"
         Height          =   252
         Index           =   0
         Left            =   360
         TabIndex        =   15
         Top             =   360
         Value           =   -1  'True
         Width           =   975
      End
   End
   Begin VB.Frame fraAngMode 
      Caption         =   "Angle Mode"
      Height          =   1095
      Left            =   6720
      TabIndex        =   28
      Top             =   120
      Width           =   1812
      Begin VB.OptionButton optAngMode 
         Caption         =   "Degrees"
         Height          =   252
         Index           =   0
         Left            =   360
         TabIndex        =   13
         Top             =   360
         Value           =   -1  'True
         Width           =   975
      End
      Begin VB.OptionButton optAngMode 
         Caption         =   "Radians"
         Height          =   252
         Index           =   1
         Left            =   360
         TabIndex        =   14
         Top             =   620
         Width           =   975
      End
   End
   Begin VB.Frame fraWindow 
      Caption         =   "Window"
      Height          =   4575
      Left            =   3890
      TabIndex        =   23
      Top             =   120
      Width           =   2652
      Begin VB.TextBox txtScaleY 
         Height          =   285
         Left            =   480
         TabIndex        =   10
         Text            =   "1"
         Top             =   3600
         Width           =   1815
      End
      Begin VB.TextBox txtScaleX 
         Height          =   285
         Left            =   480
         TabIndex        =   7
         Text            =   "1"
         Top             =   1800
         Width           =   1815
      End
      Begin VB.CommandButton cmdOriginal 
         Caption         =   "Original"
         Height          =   350
         Left            =   120
         TabIndex        =   11
         Top             =   4080
         Width           =   1095
      End
      Begin VB.CommandButton cmdApply 
         Caption         =   "Apply"
         Enabled         =   0   'False
         Height          =   350
         Left            =   1410
         TabIndex        =   12
         Top             =   4080
         Width           =   1095
      End
      Begin VB.TextBox txtMinX 
         Height          =   285
         Left            =   480
         TabIndex        =   5
         Text            =   "-10"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtMaxX 
         Height          =   285
         Left            =   480
         TabIndex        =   6
         Text            =   "10"
         Top             =   1200
         Width           =   1815
      End
      Begin VB.TextBox txtMinY 
         Height          =   285
         Left            =   480
         TabIndex        =   8
         Text            =   "-10"
         Top             =   2400
         Width           =   1815
      End
      Begin VB.TextBox txtMaxY 
         Height          =   285
         Left            =   480
         TabIndex        =   9
         Text            =   "10"
         Top             =   3000
         Width           =   1815
      End
      Begin VB.Label lblScaleY 
         AutoSize        =   -1  'True
         Caption         =   "Scale Y:"
         Height          =   195
         Left            =   240
         TabIndex        =   31
         Top             =   3360
         Width           =   600
      End
      Begin VB.Label lblScaleX 
         AutoSize        =   -1  'True
         Caption         =   "Scale X:"
         Height          =   195
         Left            =   240
         TabIndex        =   30
         Top             =   1560
         Width           =   585
      End
      Begin VB.Label lblMinX 
         AutoSize        =   -1  'True
         Caption         =   "Minimum X:"
         Height          =   195
         Left            =   240
         TabIndex        =   27
         Top             =   360
         Width           =   810
      End
      Begin VB.Label lblMaxX 
         AutoSize        =   -1  'True
         Caption         =   "Maximum X:"
         Height          =   195
         Left            =   240
         TabIndex        =   26
         Top             =   960
         Width           =   855
      End
      Begin VB.Label lblMinY 
         AutoSize        =   -1  'True
         Caption         =   "Minimum Y:"
         Height          =   195
         Left            =   240
         TabIndex        =   25
         Top             =   2160
         Width           =   810
      End
      Begin VB.Label lblMaxY 
         AutoSize        =   -1  'True
         Caption         =   "Maximum Y:"
         Height          =   195
         Left            =   240
         TabIndex        =   24
         Top             =   2760
         Width           =   870
      End
   End
   Begin VB.ListBox lstHistory 
      Height          =   2205
      Left            =   6645
      MultiSelect     =   2  'Extended
      TabIndex        =   17
      Top             =   2760
      Width           =   1965
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear (F7)"
      Height          =   350
      Left            =   2640
      TabIndex        =   4
      Top             =   840
      Width           =   1095
   End
   Begin MSComctlLib.StatusBar stbStatus 
      Align           =   2  'Align Bottom
      Height          =   240
      Left            =   0
      TabIndex        =   20
      Top             =   5244
      Width           =   8712
      _ExtentX        =   15372
      _ExtentY        =   423
      Style           =   1
      SimpleText      =   "Enter equation"
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdGraph 
      Caption         =   "Graph (F5)"
      Enabled         =   0   'False
      Height          =   350
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   1095
   End
   Begin VB.Frame fraGraph 
      Caption         =   "Equation"
      Height          =   612
      Left            =   120
      TabIndex        =   19
      Top             =   120
      Width           =   3660
      Begin VB.ComboBox cmbGraph 
         Height          =   288
         ItemData        =   "frmGraph.frx":09CA
         Left            =   120
         List            =   "frmGraph.frx":09D4
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   240
         Width           =   492
      End
      Begin VB.TextBox txtGraph 
         Height          =   288
         Left            =   840
         TabIndex        =   0
         Top             =   240
         Width           =   2652
      End
      Begin VB.Label lblEquals 
         Alignment       =   2  'Center
         Caption         =   "="
         Height          =   192
         Left            =   645
         TabIndex        =   21
         Top             =   270
         Width           =   156
      End
   End
   Begin VB.PictureBox picGraph 
      Height          =   3660
      Left            =   120
      ScaleHeight     =   3600
      ScaleWidth      =   3600
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   1320
      Width           =   3660
      Begin VB.Line linXPoint 
         Index           =   0
         Visible         =   0   'False
         X1              =   180
         X2              =   180
         Y1              =   1730
         Y2              =   1890
      End
      Begin VB.Line linYPoint 
         Index           =   0
         Visible         =   0   'False
         X1              =   1730
         X2              =   1890
         Y1              =   180
         Y2              =   180
      End
      Begin VB.Line linY 
         X1              =   1800
         X2              =   1800
         Y1              =   3600
         Y2              =   0
      End
      Begin VB.Line linX 
         X1              =   0
         X2              =   3600
         Y1              =   1800
         Y2              =   1800
      End
   End
   Begin VB.Label lblCoordinates 
      Alignment       =   2  'Center
      Caption         =   "( 0, 0 )"
      Height          =   255
      Left            =   3960
      TabIndex        =   35
      Top             =   4860
      Width           =   2535
   End
   Begin VB.Label lblHistory 
      BackStyle       =   0  'Transparent
      Caption         =   "History:"
      Height          =   252
      Left            =   6600
      TabIndex        =   22
      Top             =   2520
      Width           =   732
   End
End
Attribute VB_Name = "frmGraph"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim CancelWasPressed As Boolean
Dim GraphCall As Boolean
Dim GraphIsClear As Boolean
Dim NumericError As Boolean
Dim UnloadForm As Boolean
Dim UpperLineNumX As Integer
Dim UpperLineNumY As Integer

Private Sub cmdApply_Click()
On Error Resume Next
Dim i As Integer
Dim XAxisDistance As Double
Dim YAxisDistance As Double

    'Check for numeric entry
    If Not (IsNumeric(txtMinX.Text) Or IsNumeric(txtMaxX.Text) Or IsNumeric(txtMinY.Text) Or IsNumeric(txtMaxY.Text)) Then
        stbStatus.SimpleText = "Window dimensions must be numeric."
        NumericError = True
        Exit Sub
    End If

    'If computer has reached this point, then all values
    'are numeric
    NumericError = False

    'Clear graph to avoid confusion
    If GraphCall = False Then
        picGraph.Cls
        pgbProgress.Value = 0
        GraphIsClear = True
    End If

    'Disable the apply button (until next change)
    cmdApply.Enabled = False

    'The minimum value for either axis must be at least
    'one below the maximum value
    If Val(txtMinX.Text) >= Val(txtMaxX.Text) Then
        txtMinX.Text = CStr(Val(txtMaxX.Text - 1))
    ElseIf Val(txtMinY.Text) >= Val(txtMaxY.Text) Then
        txtMinY.Text = CStr(Val(txtMaxY.Text - 1))
    End If

    'There can be no greater than a 250 range
    If Val(txtMaxX.Text) - Val(txtMinX.Text) > 250 Then
        txtMinX.Text = CStr(Val(txtMaxX.Text - 250))
    ElseIf Val(txtMaxY.Text) - Val(txtMinY.Text) > 250 Then
        txtMinY.Text = CStr(Val(txtMaxY.Text - 250))
    End If

    'Hide all displayed lines, if only temporarily
    linX.Visible = False
    linY.Visible = False

    'Remove old line controls
    If UpperLineNumX >= 0 Then
        For i = 1 To UpperLineNumX + 1
            Unload linXPoint(i)
        Next i
        UpperLineNumX = 0
    End If
    If UpperLineNumY >= 0 Then
        For i = 1 To UpperLineNumY + 1
            Unload linYPoint(i)
        Next i
        UpperLineNumY = 0
    End If

    'Set distance factors
    XAxisDistance = picGraph.ScaleWidth / ((Val(txtMaxX.Text) - Val(txtMinX.Text)) / Val(txtScaleX.Text))
    YAxisDistance = picGraph.ScaleWidth / ((Val(txtMaxY.Text) - Val(txtMinY.Text)) / Val(txtScaleY.Text))

    'Hid y axis if minimum x value is greater than 0 or
    'if maximum x value is less than 0
    If Not (Val(txtMinX.Text) > 0 Or Val(txtMaxX.Text) < 0) Then

        'Create new line controls
        If (Val(txtMaxY.Text) - Val(txtMinY.Text)) <> 1 Then
            For i = (Val(txtMinY.Text) + 1) To (Val(txtMaxY.Text) + 1)
                Load linYPoint(i - Val(txtMinY.Text))
                With linYPoint(i - Val(txtMinY.Text))
                    .X1 = ((0 - (Val(txtMinX.Text) / Val(txtScaleX.Text))) * XAxisDistance) - 80
                    .X2 = ((0 - (Val(txtMinX.Text) / Val(txtScaleX.Text))) * XAxisDistance) + 80
                    .Y1 = (i - Val(txtMinY.Text) - 1) * YAxisDistance
                    .Y2 = (i - Val(txtMinY.Text) - 1) * YAxisDistance
                    .Visible = True
                End With
                UpperLineNumY = i - Val(txtMinY.Text) - 1
            Next i
        End If

        'Display Y axis
        linY.X1 = (0 - (Val(txtMinX.Text) / Val(txtScaleX.Text))) * XAxisDistance
        linY.X2 = (0 - (Val(txtMinX.Text) / Val(txtScaleX.Text))) * XAxisDistance
        linY.Visible = True
    End If

    'Hid x axis if minimum y value is greater than 0 or
    'if maximum y value is less than 0
    If Not (Val(txtMinY.Text) > 0 Or Val(txtMaxY.Text) < 0) Then

        'Create new line controls
        If (Val(txtMaxX.Text) - Val(txtMinX.Text)) <> 1 Then
            For i = (Val(txtMinX.Text) + 1) To (Val(txtMaxX.Text) + 1)
                Load linXPoint(i - Val(txtMinX.Text))
                With linXPoint(i - Val(txtMinX.Text))
                    .X1 = (i - Val(txtMinX.Text) - 1) * XAxisDistance
                    .X2 = (i - Val(txtMinX.Text) - 1) * XAxisDistance
                    .Y1 = ((0 + (Val(txtMaxY.Text) / Val(txtScaleY.Text))) * YAxisDistance) - 80
                    .Y2 = ((0 + (Val(txtMaxY.Text) / Val(txtScaleY.Text))) * YAxisDistance) + 80
                    .Visible = True
                End With
                UpperLineNumX = i - Val(txtMinX.Text) - 1
            Next i
        End If

        'Display X axis
        linX.Y1 = (0 + (Val(txtMaxY.Text) / Val(txtScaleY.Text))) * YAxisDistance
        linX.Y2 = (0 + (Val(txtMaxY.Text) / Val(txtScaleY.Text))) * YAxisDistance
        linX.Visible = True
    End If

End Sub

Private Sub cmdCancel_Click()

    'Set cancel value
    CancelWasPressed = True

End Sub

Private Sub cmdClear_Click()

    'Clear picture box that contains graph first, and then
    'text box
    If GraphIsClear Then
        txtGraph.Text = ""
    Else
        picGraph.Cls
        pgbProgress.Value = 0
        GraphIsClear = True
    End If

End Sub

Private Sub cmdGraph_Click()
Dim Color As Integer
Dim CancelEvent As Single
Dim i As Double
Dim j As Long
Dim k As Double
Dim LowerBound As Double
Dim MajorVar As String
Dim Max As Double
Dim Min As Double
Dim MinorVar As String
Dim Point As Double
Dim Point2 As Double
Dim ReplaceVar As Double
Dim UpperBound As Double
Dim X As Double
Dim XAxisDistance As Double
Dim Y As Double
Dim YAxisDistance As Double

    'Cancel button has not been pressed
    CancelWasPressed = False

    'Set focus to the Graph command button
    cmdGraph.SetFocus

    'Show status bar text
    stbStatus.SimpleText = "Working..."

    'Set mouse pointer
    MousePointer = vbArrowHourglass

    'Set working environment
    txtGraph.Enabled = False
    cmdClear.Enabled = False
    txtMinX.Enabled = False
    txtMaxX.Enabled = False
    txtScaleX.Enabled = False
    txtMinY.Enabled = False
    txtMaxY.Enabled = False
    txtScaleY.Enabled = False
    cmdOriginal.Enabled = False
    cmdApply.Enabled = False
    fraAngMode.Enabled = False
    fraGraphMode.Enabled = False
    lstHistory.Enabled = False
    CancelWasPressed = False
    cmdCancel.Enabled = True

    'If changes were made to the graph window, apply them
    'first
    GraphCall = True
    cmdApply_Click
    GraphCall = False
    If NumericError = True Then
        Exit Sub
    End If

    'Set progress bar to match Graph window
    pgbProgress.Max = picGraph.ScaleWidth

    'Select X or Y and set the corresponding variables
    Select Case cmbGraph.Text
        Case "x"
            LowerBound = Val(txtMinX.Text)
            MajorVar = "x"
            Max = Val(txtMinY.Text)
            Min = Val(txtMaxY.Text)
            MinorVar = "y"
            UpperBound = Val(txtMaxX.Text)
        Case "y"
            LowerBound = Val(txtMinY.Text)
            MajorVar = "y"
            Max = Val(txtMaxX.Text)
            Min = Val(txtMinX.Text)
            MinorVar = "x"
            UpperBound = Val(txtMaxY.Text)
    End Select

    'Set color for graph
    Randomize
    Do
        Color = CInt(Rnd * 15)
    Loop Until Color <> 7 And Color <> 8 And Color <> 10 And Color <> 11 And Color <> 14 And Color <> 15

    'Set distance factors
    XAxisDistance = picGraph.ScaleWidth / (Val(txtMaxX.Text) - Val(txtMinX.Text))
    YAxisDistance = picGraph.ScaleHeight / (Val(txtMaxY.Text) - Val(txtMinY.Text))

    'Get the value of each point
    For i = Min To Max Step ((Max - Min) / (picGraph.ScaleWidth / 2))

        'Allow for pressing of cancel button and X button
        CancelEvent = DoEvents
        If CancelWasPressed Then
            If UnloadForm = True Then
                Unload Me
                Exit Sub
            Else
                Exit For
            End If
        End If

        'Set the basic variables
        CurrentEntryIndex = 1
        Help = False
        InError = False
        InputString = ""
        SetVariable = False

        'If in radian mode, 360 degrees (2 pi radians) are
        'equal to 6 points n the axis, resulting in 60
        'degrees (pi / 3 radians) for 1 point on the axis
        If optAngMode(1).Value = True Then
            ReplaceVar = i * 60
        Else
            ReplaceVar = i
        End If

        'Replace each unknown variable with ReplaceVar
        For j = 1 To Len(txtGraph.Text)
            If Mid(txtGraph.Text, j, 1) = MinorVar Then
                InputString = InputString + "(" + CStr(ReplaceVar) + ")"
            Else
                InputString = InputString + Mid(txtGraph.Text, j, 1)
            End If
        Next j

        'Get the first token and evaluate the string
        ExtractToken
        Point = GetE()

        'If error occured, exit the routine
        If InError Or SetVariable Then
            ErrorHandler
            Exit Sub
        End If

        'Open Syntax help
        If Help Then
            frmCalcSolver.mnuHelpSyntax_Click
            Exit Sub
        End If

        'If necessary, set derivative point
        If optGraphMode(0).Value = False Then

            'Set the basic variables
            CurrentEntryIndex = 1
            Help = False
            InError = False
            InputString = ""
            SetVariable = False

            'Increment i by a small step in order to find
            'the next point and the corresponding "rise
            'over run" number
            k = i + ((Max - Min) / 10000)

            'If in radian mode, 360 degrees (2 pi radians)
            'are equal to 6 points n the axis, resulting
            'in 60 degrees (pi / 3 radians) for 1 point on
            'the axis
            If optAngMode(1).Value = True Then
                ReplaceVar = k * 60
            Else
                ReplaceVar = k
            End If

            'Replace each unknown variable with ReplaceVar
            For j = 1 To Len(txtGraph.Text)
                If Mid(txtGraph.Text, j, 1) = MinorVar Then
                    InputString = InputString + "(" + CStr(ReplaceVar) + ")"
                Else
                    InputString = InputString + Mid(txtGraph.Text, j, 1)
                End If
            Next j

            'Get the first token and evaluate the string
            ExtractToken
            Point2 = GetE()

            'If error occured, exit the routine
            If InError Or SetVariable Then
                ErrorHandler
                Exit Sub
            End If

            'Open Syntax help
            If Help Then
                frmCalcSolver.mnuHelpSyntax_Click
                Exit Sub
            End If

            'Set derivative point
            Point = (Point - Point2) / (i - k)
        End If

        'Switch X and Y if necessary and increase the
        'progress bar
        Select Case MajorVar
            Case "x"
                X = (Point - Val(txtMinX.Text)) * XAxisDistance
                Y = (Val(txtMaxY.Text) - i) * YAxisDistance
                pgbProgress.Value = Y
            Case "y"
                X = (i - Val(txtMinX.Text)) * XAxisDistance
                Y = (Val(txtMaxY.Text) - Point) * YAxisDistance
                pgbProgress.Value = X
        End Select

        'Only plot points that should be on the graph
        If Point >= LowerBound And Point <= UpperBound Then

            'Plot the point
            picGraph.PSet (X, Y), QBColor(Color)
        End If

    Next i

    'Graph is not clear
    GraphIsClear = False

    'Add item to history
    lstHistory.AddItem (cmbGraph.Text + " = " + txtGraph.Text), 0

    'Add angle mode to history
    For i = optAngMode.LBound To optAngMode.UBound
        If optAngMode(i).Value = True Then
            Exit For
        End If
    Next i
    lstHistoryAngMode.AddItem i, 0

    'Add graph mode to history
    For i = optGraphMode.LBound To optGraphMode.UBound
        If optGraphMode(i).Value = True Then
            Exit For
        End If
    Next i
    lstHistoryGraphMode.AddItem i, 0

    'Set editing environment
    cmdCancel.Enabled = False
    txtGraph.Enabled = True
    cmdClear.Enabled = True
    txtMinX.Enabled = True
    txtMaxX.Enabled = True
    txtScaleX.Enabled = True
    txtMinY.Enabled = True
    txtMaxY.Enabled = True
    txtScaleY.Enabled = True
    cmdOriginal.Enabled = True
    fraAngMode.Enabled = True
    fraGraphMode.Enabled = True
    lstHistory.Enabled = True

    'Set focus to the Graph command button
    cmdGraph.SetFocus

    'Set mouse pointer
    MousePointer = vbDefault

    'Show status bar text
    stbStatus.SimpleText = "Done"

End Sub

Private Sub cmdOriginal_Click()

    'Load original values into text boxes and apply the
    'changes
    txtMinX.Text = "-10"
    txtMaxX.Text = "10"
    txtScaleX.Text = "1"
    txtMinY.Text = "-10"
    txtMaxY.Text = "10"
    txtScaleY.Text = "1"
    cmdApply_Click

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    Select Case KeyCode

        'F5 = Graph button
        Case vbKeyF5
            If cmdGraph.Enabled = True Then
                cmdGraph_Click
            End If

        'F7 = Clear button
        Case vbKeyF7
            If cmdClear.Enabled = True Then
                cmdClear_Click
            End If

        'Return = Graph button
        Case vbKeyReturn
            If cmdGraph.Enabled = True Then
                cmdGraph_Click
            End If
    End Select

End Sub

Private Sub Form_Load()
Dim i As Integer
Dim XAxisDistance As Double
Dim YAxisDistance As Double

    'Load settings
    LoadGraphSettings

    'Set variables
    CancelWasPressed = False
    GraphCall = False
    GraphIsClear = True
    UnloadForm = False

    'Set distance factors
    XAxisDistance = picGraph.ScaleWidth / (Val(txtMaxX.Text) - Val(txtMinX.Text))
    YAxisDistance = picGraph.ScaleWidth / (Val(txtMaxY.Text) - Val(txtMinY.Text))

    'Create graph lines
    For i = 0 To Val(Val(txtMaxX.Text) - Val(txtMinX.Text) - 1)

        'Add controls to picture box
        Load linXPoint(linXPoint.UBound + 1)
        Load linYPoint(linYPoint.UBound + 1)

        'Set properties of controls
        With linXPoint(linXPoint.UBound)
            .X1 = i * XAxisDistance - 1
            .X2 = i * XAxisDistance - 1
            .Y1 = 1730
            .Y2 = 1890
            .Visible = True
        End With
        With linYPoint(linYPoint.UBound)
            .X1 = 1730
            .X2 = 1890
            .Y1 = i * YAxisDistance - 1
            .Y2 = i * YAxisDistance - 1
            .Visible = True
        End With

        'Set variables
        UpperLineNumX = Val(Val(txtMaxX.Text) - Val(txtMinX.Text) - 1)
        UpperLineNumY = Val(Val(txtMaxX.Text) - Val(txtMinX.Text) - 1)
    Next i

    'Arrange lines by using the Apply button routine
    cmdApply_Click

    'Increase window count
    WindowCount = WindowCount + 1

    'Set form as always on top
    SetWindowPos Me.hwnd, HWND_TOPMOST, Me.Left / Screen.TwipsPerPixelX, Me.Top / Screen.TwipsPerPixelY, Me.Width / Screen.TwipsPerPixelX, Me.Height / Screen.TwipsPerPixelY, SWP_SHOWWINDOW

End Sub

Private Sub lstHistory_DblClick()

    'Load the clicked equation into the text box
    If lstHistory.Text <> "" Then
        txtGraph.Text = Right(lstHistory.Text, Len(lstHistory.Text) - InStr(1, lstHistory.Text, "=") - 1)
        lstHistoryAngMode.ListIndex = lstHistory.ListIndex
        lstHistoryGraphMode.ListIndex = lstHistory.ListIndex
        optAngMode(Val(lstHistoryAngMode.Text)).Value = True
        optGraphMode(Val(lstHistoryGraphMode.Text)).Value = True
    End If

End Sub

Private Sub lstHistory_KeyDown(KeyCode As Integer, Shift As Integer)
Dim i As Long
Dim RemovedItem As Boolean

    'Delete = remove item from list
    If KeyCode = vbKeyDelete And lstHistory.Text <> "" Then
        Do

            'No item is found to remove initially
            RemovedItem = False

            'If item is found, remove it and restart loop
            For i = 0 To lstHistory.ListCount - 1
                If lstHistory.Selected(i) = True Then
                    lstHistory.RemoveItem i
                    lstHistoryAngMode.RemoveItem i
                    lstHistoryGraphMode.RemoveItem i
                    RemovedItem = True
                End If
                If RemovedItem = True Then Exit For
            Next i
        Loop While RemovedItem = True
    End If

End Sub

Private Sub picGraph_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim XLocation As String
Dim YLocation As String

    'Format set X and Y locations
    XLocation = Format(CStr((X / (picGraph.ScaleWidth / (Val(txtMaxX.Text) - Val(txtMinX.Text)))) + Val(txtMinX.Text)), "0.000")
    YLocation = Format(CStr(-((Y / (picGraph.ScaleWidth / (Val(txtMaxY.Text) - Val(txtMinY.Text)))) - Val(txtMaxY.Text))), "0.000")

    'Display locations
    lblCoordinates.Caption = "( " + XLocation + ", " + YLocation + " )"

End Sub

Private Sub txtGraph_Change()

    'Enable / disable Graph button
    If txtGraph.Text = "" Then
        cmdGraph.Enabled = False
    Else
        cmdGraph.Enabled = True
    End If

End Sub

Private Sub ErrorHandler()

    'Display error message
    stbStatus.SimpleText = "Syntax error"

    'Set editing environment
    cmdCancel.Enabled = False
    txtGraph.Enabled = True
    cmdClear.Enabled = True
    txtMinX.Enabled = True
    txtMaxX.Enabled = True
    txtScaleX.Enabled = True
    txtMinY.Enabled = True
    txtMaxY.Enabled = True
    txtScaleY.Enabled = True
    cmdOriginal.Enabled = True
    fraAngMode.Enabled = True
    fraGraphMode.Enabled = True
    lstHistory.Enabled = True

    'Set mouse pointer
    MousePointer = vbDefault

End Sub

Private Sub txtGraph_GotFocus()

    'Select all text when text box receives focus
    txtGraph.SelStart = 0
    txtGraph.SelLength = Len(txtGraph.Text)

End Sub

Private Sub txtMaxX_Change()

    'All text boxes must be filled in to click Apply
    txtMinX_Change

End Sub

Private Sub txtMaxX_GotFocus()

    'Select all text when text box receives focus
    txtMaxX.SelStart = 0
    txtMaxX.SelLength = Len(txtMaxX.Text)

End Sub

Private Sub txtMaxY_Change()

    'All text boxes must be filled in to click Apply
    txtMinX_Change

End Sub

Private Sub txtMaxY_GotFocus()

    'Select all text when text box receives focus
    txtMaxY.SelStart = 0
    txtMaxY.SelLength = Len(txtMaxY.Text)

End Sub

Private Sub txtMinX_Change()

    'All text boxes must be filled in to click Apply
    If txtMinX.Text = "" Or txtMaxX.Text = "" Or txtScaleX.Text = "" Or txtMinY.Text = "" Or txtMaxY.Text = "" Or txtScaleY.Text = "" Then
        cmdApply.Enabled = False
    Else
        cmdApply.Enabled = True
    End If

End Sub

Private Sub txtMinX_GotFocus()

    'Select all text when text box receives focus
    txtMinX.SelStart = 0
    txtMinX.SelLength = Len(txtMinX.Text)

End Sub

Private Sub txtMinY_Change()

    'All text boxes must be filled in to click Apply
    txtMinX_Change

End Sub

Private Sub txtMinY_GotFocus()

    'Select all text when text box receives focus
    txtMinY.SelStart = 0
    txtMinY.SelLength = Len(txtMinY.Text)

End Sub

Private Sub txtScaleX_Change()

    'All text boxes must be filled in to click Apply
    txtMinX_Change

End Sub

Private Sub txtScaleX_GotFocus()

    'Select all text when text box receives focus
    txtScaleX.SelStart = 0
    txtScaleX.SelLength = Len(txtScaleX.Text)

End Sub

Private Sub txtScaleY_Change()

    'All text boxes must be filled in to click Apply
    txtMinX_Change

End Sub

Private Sub txtScaleY_GotFocus()

    'Select all text when text box receives focus
    txtScaleY.SelStart = 0
    txtScaleY.SelLength = Len(txtScaleY.Text)

End Sub

Private Sub Form_Unload(Cancel As Integer)

    'Make X button close form permanently instead of
    '"reviving" it as the graphing routine continues
    If cmdCancel.Enabled = True And UnloadForm = False Then
        CancelWasPressed = True
        UnloadForm = True
        Cancel = 1
    End If

    'Set focus to main form
    frmCalcSolver.SetFocus
    WindowCount = WindowCount - 1

    'Enable modally displayed form menu items
    If WindowCount = 0 Then
        frmCalcSolver.mnuEditOptions.Enabled = True
        frmCalcSolver.mnuMathConstants.Enabled = True
        frmCalcSolver.mnuHelpAbout.Enabled = True
    End If

    'Save settings
    SaveGraphSettings

End Sub

Private Sub SaveGraphSettings()

    'Save settings

    'Last entered equation
    SaveSetting App.Title, "Graph", "EquationVar", cmbGraph.ListIndex
    SaveSetting App.Title, "Graph", "Equation", txtGraph.Text

    'Window settings
    SaveSetting App.Title, "Graph", "MinX", txtMinX.Text
    SaveSetting App.Title, "Graph", "MaxX", txtMaxX.Text
    SaveSetting App.Title, "Graph", "ScaleX", txtScaleX.Text
    SaveSetting App.Title, "Graph", "MinY", txtMinY.Text
    SaveSetting App.Title, "Graph", "MaxY", txtMaxY.Text
    SaveSetting App.Title, "Graph", "ScaleY", txtScaleY.Text

    'Angle and graph modes
    SaveSetting App.Title, "Graph", "AngMode", optAngMode(0).Value
    SaveSetting App.Title, "Graph", "GraphMode", optGraphMode(0).Value

End Sub

Private Sub LoadGraphSettings()
Dim RegTemp As String

    'Load settings

    'Last entered equation
    cmbGraph.ListIndex = CInt(GetSetting(App.Title, "Graph", "EquationVar", "0"))
    txtGraph.Text = GetSetting(App.Title, "Graph", "Equation", "")

    'Window settings
    txtMinX.Text = GetSetting(App.Title, "Graph", "MinX", "-10")
    txtMaxX.Text = GetSetting(App.Title, "Graph", "MaxX", "10")
    txtScaleX.Text = GetSetting(App.Title, "Graph", "ScaleX", "1")
    txtMinY.Text = GetSetting(App.Title, "Graph", "MinY", "-10")
    txtMaxY.Text = GetSetting(App.Title, "Graph", "MaxY", "10")
    txtScaleY.Text = GetSetting(App.Title, "Graph", "ScaleY", "1")

    'Angle and graph modes
    RegTemp = GetSetting(App.Title, "Graph", "AngMode", True)
    Select Case RegTemp
        Case "True"
            optAngMode(0).Value = True
        Case "False"
            optAngMode(1).Value = True
    End Select
    RegTemp = GetSetting(App.Title, "Graph", "GraphMode", True)
    Select Case RegTemp
        Case "True"
            optGraphMode(0).Value = True
        Case "False"
            optGraphMode(1).Value = True
    End Select

End Sub
