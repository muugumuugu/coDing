VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FrmMathGrid 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Plot a Mathematical Function"
   ClientHeight    =   5205
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10755
   Icon            =   "FrmMath.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5205
   ScaleWidth      =   10755
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Calculate"
      Height          =   345
      Left            =   120
      TabIndex        =   40
      Top             =   4740
      Width           =   1365
   End
   Begin MSComDlg.CommonDialog CDL1 
      Left            =   2940
      Top             =   4740
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   4575
      Left            =   0
      TabIndex        =   1
      Top             =   60
      Width           =   5715
      _ExtentX        =   10081
      _ExtentY        =   8070
      _Version        =   393216
      Style           =   1
      Tabs            =   2
      Tab             =   1
      TabHeight       =   520
      TabCaption(0)   =   "Function"
      TabPicture(0)   =   "FrmMath.frx":0442
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "PicHoleColor"
      Tab(0).Control(1)=   "CmbEquations"
      Tab(0).Control(2)=   "Chklogged"
      Tab(0).Control(3)=   "Frame1"
      Tab(0).Control(4)=   "TxtExpression"
      Tab(0).Control(5)=   "Label6"
      Tab(0).Control(6)=   "Label5"
      Tab(0).Control(7)=   "LblZinfo"
      Tab(0).Control(8)=   "Label2(0)"
      Tab(0).Control(9)=   "Label1(1)"
      Tab(0).ControlCount=   10
      TabCaption(1)   =   "Colors"
      TabPicture(1)   =   "FrmMath.frx":045E
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Label4"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Label3"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Label2(4)"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "Label2(1)"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "Label7"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "TxtLevels"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "CmbColorSchemes"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "Frame2"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "CmbMix"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "CmdReverse"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).ControlCount=   10
      Begin VB.PictureBox PicHoleColor 
         BackColor       =   &H00000000&
         Height          =   255
         Left            =   -73800
         ScaleHeight     =   195
         ScaleWidth      =   1275
         TabIndex        =   42
         Top             =   4140
         Width           =   1335
      End
      Begin VB.ComboBox CmbEquations 
         Height          =   315
         Left            =   -73020
         Style           =   2  'Dropdown List
         TabIndex        =   37
         Top             =   1200
         Width           =   3435
      End
      Begin VB.CheckBox Chklogged 
         Caption         =   "Log Scale"
         Height          =   375
         Left            =   -70860
         TabIndex        =   35
         Top             =   4080
         Width           =   1455
      End
      Begin VB.CommandButton CmdReverse 
         Caption         =   "Reverse Colors"
         Height          =   375
         Left            =   120
         TabIndex        =   34
         Top             =   3300
         Width           =   2475
      End
      Begin VB.ComboBox CmbMix 
         Height          =   315
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   32
         Top             =   1920
         Width           =   2460
      End
      Begin VB.Frame Frame2 
         ClipControls    =   0   'False
         Height          =   4050
         Left            =   3360
         TabIndex        =   24
         Top             =   480
         Width           =   2085
         Begin VB.PictureBox Piccolor 
            BackColor       =   &H000000FF&
            Height          =   3525
            Left            =   900
            ScaleHeight     =   3465
            ScaleWidth      =   945
            TabIndex        =   30
            Top             =   300
            Width           =   1000
         End
         Begin VB.CommandButton pic1 
            BackColor       =   &H00FF0000&
            Height          =   240
            Index           =   0
            Left            =   180
            Style           =   1  'Graphical
            TabIndex        =   29
            Top             =   3585
            Width           =   555
         End
         Begin VB.CommandButton pic1 
            BackColor       =   &H0000FF00&
            Height          =   240
            Index           =   1
            Left            =   135
            Style           =   1  'Graphical
            TabIndex        =   28
            Top             =   1935
            Width           =   555
         End
         Begin VB.CommandButton pic1 
            BackColor       =   &H000000FF&
            Height          =   240
            Index           =   2
            Left            =   135
            Style           =   1  'Graphical
            TabIndex        =   27
            Top             =   300
            Width           =   555
         End
         Begin VB.CommandButton pic1 
            BackColor       =   &H00FFFF00&
            Height          =   240
            Index           =   3
            Left            =   135
            Style           =   1  'Graphical
            TabIndex        =   26
            Top             =   2760
            Width           =   555
         End
         Begin VB.CommandButton pic1 
            BackColor       =   &H0000FFFF&
            Height          =   240
            Index           =   4
            Left            =   135
            Style           =   1  'Graphical
            TabIndex        =   25
            Top             =   1125
            Width           =   555
         End
      End
      Begin VB.ComboBox CmbColorSchemes 
         Height          =   315
         Left            =   180
         Style           =   2  'Dropdown List
         TabIndex        =   21
         Top             =   1020
         Width           =   2415
      End
      Begin VB.TextBox TxtLevels 
         Height          =   315
         Left            =   840
         TabIndex        =   20
         Text            =   "20"
         Top             =   2580
         Width           =   675
      End
      Begin VB.Frame Frame1 
         Caption         =   "Grid Info"
         Height          =   1560
         Left            =   -74880
         TabIndex        =   3
         Top             =   2400
         Width           =   5415
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   315
            Index           =   7
            Left            =   4275
            MaxLength       =   12
            TabIndex        =   11
            Text            =   "21"
            Top             =   975
            Width           =   855
         End
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   4
            Left            =   1050
            MaxLength       =   12
            TabIndex        =   10
            Text            =   "-5"
            Top             =   975
            Width           =   855
         End
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   5
            Left            =   2070
            MaxLength       =   12
            TabIndex        =   9
            Text            =   "5"
            Top             =   975
            Width           =   855
         End
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   6
            Left            =   3090
            MaxLength       =   12
            TabIndex        =   8
            Text            =   "0.5"
            Top             =   975
            Width           =   1035
         End
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   1
            Left            =   2055
            MaxLength       =   12
            TabIndex        =   7
            Text            =   "5"
            Top             =   555
            Width           =   855
         End
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   315
            Index           =   3
            Left            =   4275
            MaxLength       =   12
            TabIndex        =   6
            Text            =   "21"
            Top             =   555
            Width           =   855
         End
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   2
            Left            =   3075
            MaxLength       =   12
            TabIndex        =   5
            Text            =   "0.5"
            Top             =   555
            Width           =   1035
         End
         Begin VB.TextBox Text1 
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Index           =   0
            Left            =   1035
            MaxLength       =   12
            TabIndex        =   4
            Text            =   "-5"
            Top             =   555
            Width           =   855
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "X-direction:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   90
            TabIndex        =   17
            Top             =   585
            Width           =   1035
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Y-direction:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   2
            Left            =   90
            TabIndex        =   16
            Top             =   1035
            Width           =   1035
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Minimum"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   3
            Left            =   1095
            TabIndex        =   15
            Top             =   270
            Width           =   915
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   4
            Left            =   2055
            TabIndex        =   14
            Top             =   270
            Width           =   1035
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Spacing"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   5
            Left            =   3135
            TabIndex        =   13
            Top             =   270
            Width           =   795
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "# of lines"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            Index           =   6
            Left            =   4275
            TabIndex        =   12
            Top             =   270
            Width           =   900
         End
      End
      Begin VB.TextBox TxtExpression 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   -74175
         TabIndex        =   2
         Text            =   "sin(x^2+y^2)/(x^2+y^2)"
         Top             =   1860
         Width           =   4575
      End
      Begin VB.Label Label7 
         Caption         =   "Click on picture boxes to customize colors"
         Height          =   435
         Left            =   180
         TabIndex        =   43
         Top             =   3960
         Width           =   2655
      End
      Begin VB.Label Label6 
         Caption         =   "Hole Color:"
         Height          =   255
         Left            =   -74760
         TabIndex        =   41
         Top             =   4140
         Width           =   1035
      End
      Begin VB.Label Label5 
         Caption         =   "Pre-defined Equations:"
         Height          =   255
         Left            =   -74820
         TabIndex        =   38
         Top             =   1260
         Width           =   1695
      End
      Begin VB.Label LblZinfo 
         Height          =   975
         Left            =   -72060
         TabIndex        =   36
         Top             =   3480
         Width           =   2595
      End
      Begin VB.Label Label2 
         Caption         =   "Color Mixing:"
         Height          =   240
         Index           =   1
         Left            =   120
         TabIndex        =   33
         Top             =   1620
         Width           =   1410
      End
      Begin VB.Label Label2 
         Caption         =   "(2 - 200)"
         Height          =   240
         Index           =   4
         Left            =   1740
         TabIndex        =   31
         Top             =   2640
         Width           =   690
      End
      Begin VB.Label Label3 
         Caption         =   "Color Schemes"
         Height          =   255
         Left            =   180
         TabIndex        =   23
         Top             =   660
         Width           =   1995
      End
      Begin VB.Label Label4 
         Caption         =   "Levels:"
         Height          =   315
         Left            =   180
         TabIndex        =   22
         Top             =   2640
         Width           =   675
      End
      Begin VB.Label Label2 
         Caption         =   "Enter an equation that is a function of x and y, or choose a pre-defined equation"
         Height          =   525
         Index           =   0
         Left            =   -74820
         TabIndex        =   19
         Top             =   540
         Width           =   5460
      End
      Begin VB.Label Label1 
         Caption         =   "f(x,y) = "
         Height          =   330
         Index           =   1
         Left            =   -74805
         TabIndex        =   18
         Top             =   1860
         Width           =   645
      End
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      DrawMode        =   14  'Copy Pen
      DrawStyle       =   6  'Inside Solid
      FillStyle       =   6  'Cross
      Height          =   4335
      Left            =   5880
      ScaleHeight     =   4275
      ScaleWidth      =   4635
      TabIndex        =   0
      Top             =   360
      Width           =   4695
   End
   Begin VB.Label LblChart 
      Height          =   255
      Left            =   5880
      TabIndex        =   39
      Top             =   4800
      Width           =   4635
   End
End
Attribute VB_Name = "FrmMathGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim expr As New CExpression
Dim Updating As Boolean

Dim EndColors As Integer    'Number of endcolors to mix
Dim RGBEnds(1 To 5, 1 To 5, 1 To 5) As Integer

Dim Rcolor(1 To 200) As Integer
Dim Gcolor(1 To 200) As Integer
Dim Bcolor(1 To 200) As Integer

Const MaxAllowedZ As Double = 1E+20
Const MinAllowedZ As Double = -1E+20
Const HoleValue As Double = 1E-21
Public Function NumInStr(SearchFor As String, MainString As String) As Integer
'This function returns the number of occurences of a character in another string

Dim i As Integer
Dim Num As Integer
NumInStr = 0
For i = 1 To Len(MainString)
  If Mid(MainString, i, 1) = SearchFor Then NumInStr = NumInStr + 1
Next

End Function

Private Sub CmbColorSchemes_Click()
On Error Resume Next

TxtLevels = "100"

Select Case CmbColorSchemes.ListIndex
Case 0 'rainbow
  pic1(0).BackColor = RGB(0, 0, 255)
  pic1(1).BackColor = RGB(0, 255, 0)
  pic1(2).BackColor = RGB(255, 0, 0)
  CmbMix.ListIndex = 2
  CmbMix_Click
Case 1 'fiery
  CmbMix.ListIndex = 3
  pic1(0).BackColor = RGB(255, 255, 0)
  pic1(1).BackColor = RGB(255, 0, 255)
  pic1(2).BackColor = RGB(0, 255, 255)
  pic1(3).BackColor = RGB(255, 0, 0)
  pic1(4).BackColor = RGB(0, 0, 255)
  ColorScale
  
Case 2
  CmbMix.ListIndex = 3
  pic1(0).BackColor = RGB(0, 0, 128)
  pic1(1).BackColor = RGB(0, 128, 0)
  pic1(2).BackColor = RGB(255, 255, 0)
  pic1(3).BackColor = RGB(0, 255, 255)
  pic1(4).BackColor = RGB(128, 64, 64)
  ColorScale
Case 3
  CmbMix.ListIndex = 1
  pic1(0).BackColor = RGB(128, 128, 255)
  pic1(1).BackColor = RGB(0, 100, 100)
  pic1(2).BackColor = RGB(255, 255, 128)
  ColorScale
  
End Select
End Sub


Private Sub CmbEquations_Click()

TxtExpression = CmbEquations.List(CmbEquations.ListIndex)

 Text1(0) = -5
 Text1(1) = 5
 Text1(4) = -5
 Text1(5) = 5

Select Case CmbEquations.ListIndex
Case 1
  Text1(0) = 1
  Text1(1) = 3
  Text1(4) = 1
  Text1(5) = 3
Case 5
  Text1(0) = -1
  Text1(1) = 1
  Text1(4) = 1
  Text1(5) = 4
Case 6
  Text1(0) = -2
  Text1(1) = 2
  Text1(4) = -2
  Text1(5) = 2
Case 7
  Text1(0) = 0
  Text1(1) = 1
  Text1(4) = 0
  Text1(5) = 1
Case 8
  Text1(0) = 0
  Text1(1) = 2.5
  Text1(4) = 0
  Text1(5) = 2.5


End Select

End Sub


Private Sub CmbMix_Click()
Dim Rend(0 To 4) As Integer
Dim Gend(0 To 4) As Integer
Dim Bend(0 To 4) As Integer
Dim i As Integer
Dim ColString$

pic1(0).Visible = True
pic1(1).Visible = True
pic1(2).Visible = True

Select Case CmbMix.ListIndex
Case 0 '2 color
  pic1(1).Visible = False
  For i = 3 To 4
    pic1(i).Visible = False
  Next i
Case 1  ' 3 color linear
  For i = 3 To 4
    pic1(i).Visible = False
  Next i
Case 2  '3 auto
  For i = 3 To 4
    pic1(i).Visible = False
  Next i
Case 3  '3 man
  For i = 3 To 4
    pic1(i).Visible = True
  Next i
    'get rgb  values
     For i = 0 To 2
      ColString$ = Hex(pic1(i).BackColor)
      If Len(ColString$) = 2 Then
        Bend(i) = 0
        Gend(i) = 0
        Rend(i) = HextoDecimal(ColString$)
      ElseIf Len(ColString$) = 4 Then
        Bend(i) = 0
        Gend(i) = HextoDecimal(Left$(ColString$, 2))
        Rend(i) = HextoDecimal(Right$(ColString$, 2))
      ElseIf Len(ColString$) = 6 Then
        Bend(i) = HextoDecimal(Left$(ColString$, 2))
        Gend(i) = HextoDecimal(Mid$(ColString$, 3, 2))
        Rend(i) = HextoDecimal(Right$(ColString$, 2))
      End If
      Next i
             
      For i = 3 To 4 Step 1
        If Rend(i - 2) > Rend(i - 3) Then
           Rend(i) = Rend(i - 2)
           Else
           Rend(i) = Rend(i - 3)
        End If
         If Gend(i - 2) > Gend(i - 3) Then
           Gend(i) = Gend(i - 2)
           Else
           Gend(i) = Gend(i - 3)
        End If
         If Bend(i - 2) > Bend(i - 3) Then
           Bend(i) = Bend(i - 2)
           Else
           Bend(i) = Bend(i - 3)
        End If
      Next i
      For i = 3 To 4
        pic1(i).BackColor = RGB(Rend(i), Gend(i), Bend(i))
      Next i
  
End Select
ColorScale

End Sub



Private Sub CmdReverse_Click()
Dim temp As Single
temp = pic1(0).BackColor
pic1(0).BackColor = pic1(2).BackColor
pic1(2).BackColor = temp

temp = pic1(3).BackColor
pic1(3).BackColor = pic1(4).BackColor
pic1(4).BackColor = temp

ColorScale

End Sub

Public Sub Command1_Click()
On Error Resume Next

Dim i As Long, j As Long, counter As Long
Dim Xval As Double
Dim Yval As Double
Dim nCol As Long, nRow As Long
Dim dX As Double, dy As Double
Dim Xmin As Double, Ymin As Double
Dim Zmin As Double, Zmax As Double
Dim Zval(1 To 1000000) As Double, zdat As Double
Dim Msg As String
Dim LogData As Boolean
Dim ZLevel As Integer, Levels As Integer

TxtExpression = Trim(TxtExpression)
expr.Expression = TxtExpression

If Len(TxtExpression.Text) > 200 Then
    MsgBox "Expression cannot have more than 200 characters"
    Exit Sub
End If
If expr.ErrorCode Then
    MsgBox "Error in expression"
    Exit Sub
End If

ColorScale

nRow = CInt(Val(Text1(3)))
nCol = CInt(Val(Text1(7)))
dX = Val(Text1(2))
dy = Val(Text1(6))
Xmin = Val(Text1(0))
Ymin = Val(Text1(4))

LogData = (Chklogged.Value = 1)
Levels = CInt(TxtLevels)

If nRow * nCol > 1000000 Then
  Msg = "too many data points.  The total number of points cannot exceed 1,000,000 points.  "
  Msg = Msg & "Please reduce the number of rows or columns."
  Exit Sub
End If

Zmax = MinAllowedZ
Zmin = MaxAllowedZ
counter = 0

Me.Caption = "Calculating Grid..."
For i = 1 To nRow
  Xval = Xmin + (i - 1) * dX
  Me.Caption = "Calculating Grid... " & CInt(i / nRow * 100) & " % Done"
  For j = 1 To nCol
    counter = counter + 1
    Yval = Ymin + (j - 1) * dy
    
    zdat = expr.Value(Xval, Yval)
      
    If expr.ErrorCode = expOK Then
      
      If LogData Then
        If zdat > 0 Then
          Zval(counter) = Log(zdat) / Log(10)
        Else
          Zval(counter) = HoleValue
        End If
      Else
        Zval(counter) = zdat
      End If
    
      If Zval(counter) < Zmin Then
        If Zval(counter) > MinAllowedZ Then
          Zmin = Zval(counter)
        Else
          Zval(counter) = MinAllowedZ
          Zmin = MinAllowedZ
        End If
      End If

      If Zval(counter) > Zmax Then
        If Zval(counter) < MaxAllowedZ Then
          Zmax = Zval(counter)
        Else
          Zval(counter) = MaxAllowedZ
          Zmax = MaxAllowedZ
        End If
      End If
    Else  'there was an error in the calculation (i.e. bad input values)
      Zval(counter) = HoleValue
      expr.ClearError
    
    End If
    
  Next j
Next i

With Picture1
  .ScaleLeft = Xmin
  .ScaleWidth = (nRow - 1) * dX
  .ScaleTop = Ymin + nCol * dy
  .ScaleHeight = (nCol - 1) * -dy
End With

counter = 0
With Picture1
  .AutoRedraw = False
  .Cls
  For i = 1 To nRow
     Xval = Xmin + (i - 1) * dX
     Me.Caption = "Drawing plot... " & CInt(i / nRow * 100) & " % Done"
     For j = 1 To nCol
       counter = counter + 1
       Yval = Ymin + (j - 1) * dy
       'get color for z value
       ZLevel = CInt(((Zval(counter) - Zmin) / (Zmax - Zmin)) * Levels)
       If ZLevel = 0 Then ZLevel = 1
       If ZLevel > Levels Then ZLevel = Levels
       If Zval(counter) <> HoleValue Then
         Picture1.Line (Xval, Yval)-(Xval + dX, Yval + dy), RGB(Rcolor(ZLevel), Gcolor(ZLevel), Bcolor(ZLevel)), BF
       Else
         Picture1.Line (Xval, Yval)-(Xval + dX, Yval + dy), PicHoleColor.BackColor, BF
       End If
     Next j
  Next i
  .AutoRedraw = True
  DoEvents
End With

LblZinfo = "Z Maximum = " & NumString(Zmax, 0, 0) & Chr(13) & Chr(10) & "Z Minimum = " & NumString(Zmin, 0, 0)
Me.Refresh
Me.Caption = "Create Grid from Math Function"

End Sub


Private Sub Form_Load()
 
 
 CmbMix.AddItem "2 Color Linear"
 CmbMix.AddItem "3 Color Linear"
 CmbMix.AddItem "3 Color Automatic Mix"
 CmbMix.AddItem "3 Color Manual Mix"
 
 CmbColorSchemes.AddItem "Rainbow"
 CmbColorSchemes.AddItem "Fiery"
 CmbColorSchemes.AddItem "Earth"
 CmbColorSchemes.AddItem "Marine"
 
 CmbColorSchemes.ListIndex = 0
 
 Picture1.DrawMode = 13 'very important!!
 
CmbEquations.AddItem "Sin(x^2 + Y^2) / (x^2 + Y^2)"
CmbEquations.AddItem "COS(SIN(X*Y)) + SIN(COS(X/Y))"
CmbEquations.AddItem "3*X*Y - X*X*X - Y*Y*Y"
CmbEquations.AddItem "((Y*Y <=1) + (X*X >1)) * SIN(X-Y)"
CmbEquations.AddItem "COS(4*(SIN(X) + COS(Y)))"
CmbEquations.AddItem "Y * (Y-1) * (Y-1.1) - 10*X*X*(X*X-1)"
CmbEquations.AddItem "ACOS(X*Y)"
CmbEquations.AddItem "POW(POW(X, -LOG(Y)), POW(Y, -LOG(X)))"
CmbEquations.AddItem "ATAN(POW(X, Y))"
CmbEquations.AddItem "SIN(X*Y)"
CmbEquations.AddItem "COS(X*Y)"
CmbEquations.AddItem "TAN(X*Y)"
CmbEquations.ListIndex = 6

Text1(3) = 100
Text1(7) = 100

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

If LblChart <> "" Then LblChart = ""

End Sub


Private Sub Form_Unload(Cancel As Integer)
Set expr = Nothing
End Sub

Public Function CheckNum(KeyAscii As Integer, NumText As String) As Integer
On Error Resume Next
Dim K As Integer
'ASCII Character constants
'Const Char0 As Integer = 48
'Const Char9 As Integer = 57
'Const CharBackSpace As Integer = 8
'Const CharTab As Integer = 9
'Const CharMinus As Integer = 45
'Const CharPeriod As Integer = 46
'Const CharEnter = 13
'const comma = 44
NumText = UCase(Trim(NumText))

If KeyAscii = 46 Then
  If InStr(NumText, ".") > 0 Then
    CheckNum = 0
    Exit Function
  End If
End If

If KeyAscii = 45 Then
  If InStr(NumText, "-") > 0 Then
    If Mid(NumText, InStr(NumText, "-") - 1, 1) <> "E" Then
      CheckNum = 0
      Exit Function
    End If
  End If
End If

If KeyAscii = 101 Or KeyAscii = 69 Then
  If NumInStr("E", NumText) <> 0 Or Len(NumText) = 0 Then
    CheckNum = 0
    Exit Function
  End If
End If


K = KeyAscii
If (K < 48 Or K > 57) And K <> 101 And K <> 69 And K <> 46 And K <> 8 And K <> 9 And K <> 45 And K <> 13 And K <> 44 Then
  CheckNum = 0
Else
  CheckNum = KeyAscii
End If

End Function

Public Function NumString(ByVal Num, nspace As Byte, nformat As Byte) As String
On Error Resume Next
'num = number to format
'nspace = nspaces  '0 = 0.01% accuracy
'                  '1 = 0.001% accuracy
'                  '2 = 0.0001% accuracy
'nformat - 0 = general

'start at 0.01
Dim addneg As Boolean
Dim B As Single
B = Log(10)

addneg = False
If Num < 0 Then
   addneg = True
   Num = Abs(Num)
End If
   
If Num = 0 Then
   NumString = "0.000"
   Exit Function
End If

If nformat = 0 Then  'General notation
   If nspace = 0 Then  'minimum with .01% accuracy
        If Log(Num) / B < 1 Then NumString = Format(Num, "0.0000")
        If (Log(Num) / B >= 1 And Log(Num) / B And Log(Num) / B < 2) Then NumString = Format(Num, "0.0#")
        If (Log(Num) / B >= 2 And Log(Num) / B And Log(Num) / B < 3) Then NumString = Format(Num, "0.#")
        If (Log(Num) / B >= 3 And Log(Num) / B And Log(Num) / B < 5) Then NumString = Format(Num, "0")
        If Log(Num) / B >= 5 Then NumString = Format(Num, "0.00E+00")
   End If
   If nspace = 1 Then  'minimum with .001% accuracy
        If Log(Num) / B < 1 Then NumString = Format(Num, "0.00000")
        If (Log(Num) / B >= 1 And Log(Num) / B And Log(Num) / B < 2) Then NumString = Format(Num, "0.00#")
        If (Log(Num) / B >= 2 And Log(Num) / B And Log(Num) / B < 3) Then NumString = Format(Num, "0.0#")
        If (Log(Num) / B >= 3 And Log(Num) / B And Log(Num) / B < 5) Then NumString = Format(Num, "0.#")
        If Log(Num) / B >= 5 Then NumString = Format(Num, "0.00E+00")
   End If
   If nspace = 2 Then  'minimum with .0001% accuracy
        If Log(Num) / B < 1 Then NumString = Format(Num, "0.000000")
        If (Log(Num) / B >= 1 And Log(Num) / B And Log(Num) / B < 2) Then NumString = Format(Num, "0.000#")
        If (Log(Num) / B >= 2 And Log(Num) / B And Log(Num) / B < 3) Then NumString = Format(Num, "0.00#")
        If (Log(Num) / B >= 3 And Log(Num) / B And Log(Num) / B < 5) Then NumString = Format(Num, "0.0#")
        If (Log(Num) / B >= 5 And Log(Num) / B And Log(Num) / B < 6) Then NumString = Format(Num, "0.0")
        If Log(Num) / B >= 6 Then NumString = Format(Num, "0.000E+00")
   End If
   If addneg Then NumString = "-" & NumString
   If Right$(NumString, 1) = "." Then NumString = Left(NumString, Len(NumString) - 1)
   Exit Function
End If



End Function

Private Sub pic1_Click(Index As Integer)
  On Error GoTo CancelError
  With CDL1
    .CancelError = True
    .Color = pic1(Index).BackColor
    .Flags = &H1 Or &H2
    .ShowColor
    pic1(Index).BackColor = .Color
    ColorScale
  End With

Exit Sub
CancelError:

End Sub

Private Sub Piccolor_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label7 = "Level " & CInt(Y)
End Sub


Private Sub PicHoleColor_Click()
 On Error GoTo CancelError
  With CDL1
    .CancelError = True
    .Color = PicHoleColor.BackColor
    .Flags = &H1 Or &H2
    .ShowColor
    PicHoleColor.BackColor = .Color
  End With

Exit Sub
CancelError:

End Sub

Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

Dim zdat As Double

expr.Expression = TxtExpression
zdat = expr.Value(X, Y)
If expr.ErrorCode = expOK Then
  LblChart = "x = " & X & ", y = " & Y & ", z = " & NumString(zdat, 0, 0)
Else
  LblChart = "x = " & X & ", y = " & Y & ", z = undefined"
End If


    



End Sub


Private Sub SSTab1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

  If LblChart <> "" Then LblChart = ""
  If Label7 <> "Click on picture boxes to customize colors" Then
    Label7 = "Click on picture boxes to customize colors"
  End If
End Sub


Private Sub Text1_Change(Index As Integer)
Dim Xrange!
Dim Yrange!
Dim temp1$
Dim ExpPos%
On Error Resume Next
If Updating Then Exit Sub
If Text1(Index).Text = "" Then Exit Sub

Text1(Index) = UCase(Text1(Index))

If Right$(Text1(Index), 1) = "E" Or Right$(Text1(Index), 1) = "-" Then
  Text1(Index).SelStart = Len(Text1(Index))
  Exit Sub
End If
ExpPos = 0
If InStr(Text1(Index), "E") <> 0 Then
  ExpPos = InStr(Text1(Index), "E")
  temp1$ = Text1(Index)
  Text1(Index) = Val(Left$(Text1(Index), ExpPos - 1)) * 10 ^ (Val(Right$(Text1(Index), Len(Text1(Index)) - ExpPos)))
End If
  
Xrange = Val(Text1(1)) - Val(Text1(0))
Yrange = Val(Text1(5)) - Val(Text1(4))
Updating = True
If Index = 0 Or Index = 1 Then
  If Val(Text1(0)) >= Val(Text1(1)) Or Val(Text1(3)) < 2 Then
    Text1(2) = ""
    GoTo ResetUpdate
  End If
  Text1(2) = NumString((Xrange) / (Val(Text1(3)) - 1), 0, 0)
End If

If Index = 4 Or Index = 5 Then
  If Val(Text1(4)) >= Val(Text1(5)) Or Val(Text1(7)) < 2 Then
    Text1(6) = ""
    GoTo ResetUpdate
  End If
  Text1(6) = NumString((Yrange) / (Val(Text1(7)) - 1), 0, 0)
End If

If Index = 2 Then
  If Val(Text1(2)) <= 0 Then
    Text1(3) = ""
    GoTo ResetUpdate
  End If
  Text1(3) = CInt(Xrange / Text1(2)) + 1
End If
If Index = 6 Then
  If Val(Text1(6)) <= 0 Then
    Text1(7) = ""
    GoTo ResetUpdate
  End If
  Text1(7) = CInt(Yrange / Val(Text1(6))) + 1
End If
If Index = 3 Then
  Text1(3) = CInt(Val(Text1(3)))
  If Val(Text1(3)) >= 2 Then Text1(2) = NumString((Xrange) / (Val(Text1(3)) - 1), 0, 0)
End If

If Index = 7 Then
  Text1(7) = CInt(Val(Text1(7)))
   If Val(Text1(7)) >= 2 Then Text1(6) = NumString((Yrange) / (Val(Text1(7)) - 1), 0, 0)
End If

ResetUpdate:
If ExpPos <> 0 Then Text1(Index) = temp1
Updating = False
Text1(Index).SelStart = Len(Text1(Index))
End Sub



Public Sub GetColor(Z As Double)
'This sets the color for the Contour plot

















End Sub

Public Sub ColorScale()

 Dim Rend(1 To 5) As Integer
 Dim Gend(1 To 5) As Integer
 Dim Bend(1 To 5) As Integer
 Dim EndPic As Byte
 Dim Levels As Integer, counter As Integer
 Dim End1 As Integer, End2 As Integer, End3 As Integer, i As Integer
 Dim ColString As String
  
 Levels = CInt(TxtLevels)
 
 If Levels <= 1 Or Levels > 200 Then
    TxtLevels = "100"
    Levels = 100
 End If
     
 If (CmbMix.ListIndex = 0) Or (CmbMix.ListIndex = 1) Then 'linear grades
    End1 = Int(Levels / 2)
    'get rgb  values
    For i = 0 To 2
      ColString$ = Hex(pic1(i).BackColor)
      If Len(ColString$) = 2 Then
        Bend(i + 1) = 0
        Gend(i + 1) = 0
        Rend(i + 1) = HextoDecimal(ColString$)
      ElseIf Len(ColString$) = 4 Then
        Bend(i + 1) = 0
        Gend(i + 1) = HextoDecimal(Left$(ColString$, 2))
        Rend(i + 1) = HextoDecimal(Right$(ColString$, 2))
      ElseIf Len(ColString$) = 6 Then
        Bend(i + 1) = HextoDecimal(Left$(ColString$, 2))
        Gend(i + 1) = HextoDecimal(Mid$(ColString$, 3, 2))
        Rend(i + 1) = HextoDecimal(Right$(ColString$, 2))
      End If
    Next i
     
    'Reset middle color for 2 color linear
    If CmbMix.ListIndex = 0 Then
       Bend(2) = (Bend(1) + Bend(3)) / 2
       Gend(2) = (Gend(1) + Gend(3)) / 2
       Rend(2) = (Rend(1) + Rend(3)) / 2
    End If
    
    'set color levels
    For i = 1 To End1
       Rcolor(i) = (i - 1) * (Rend(2) - Rend(1)) / (End1 + 1) + Rend(1)
       Gcolor(i) = (i - 1) * (Gend(2) - Gend(1)) / (End1 + 1) + Gend(1)
       Bcolor(i) = (i - 1) * (Bend(2) - Bend(1)) / (End1 + 1) + Bend(1)
    Next
    counter = 0
    For i = End1 + 1 To Levels
       counter = counter + 1
       Rcolor(i) = counter * (Rend(3) - Rend(2)) / (Levels - End1 + 1) + Rend(2)
       Gcolor(i) = counter * (Gend(3) - Gend(2)) / (Levels - End1 + 1) + Gend(2)
       Bcolor(i) = counter * (Bend(3) - Bend(2)) / (Levels - End1 + 1) + Bend(2)
    Next i
    For i = 1 To Levels
      If Rcolor(i) < 0 Then Rcolor(i) = 0
      If Gcolor(i) < 0 Then Gcolor(i) = 0
      If Bcolor(i) < 0 Then Bcolor(i) = 0
    Next i
    
   ElseIf CmbMix.ListIndex >= 2 Then 'Mixed Color Options
     
      End2 = Int(Levels / 2)
      End1 = Int(End2 / 2)
      End3 = End2 + Int((Levels - End2) / 2)
     'get rgb  values
         
     If CmbMix.ListIndex = 2 Then
       EndPic = 2
     Else
       EndPic = 4
     End If
     
     For i = 0 To EndPic
      ColString$ = Hex(pic1(i).BackColor)
      If Len(ColString$) = 2 Then
        Bend(i + 1) = 0
        Gend(i + 1) = 0
        Rend(i + 1) = HextoDecimal(ColString$)
      ElseIf Len(ColString$) = 4 Then
        Bend(i + 1) = 0
        Gend(i + 1) = HextoDecimal(Left$(ColString$, 2))
        Rend(i + 1) = HextoDecimal(Right$(ColString$, 2))
      ElseIf Len(ColString$) = 6 Then
        Bend(i + 1) = HextoDecimal(Left$(ColString$, 2))
        Gend(i + 1) = HextoDecimal(Mid$(ColString$, 3, 2))
        Rend(i + 1) = HextoDecimal(Right$(ColString$, 2))
      End If
    Next i
       
    If CmbMix.ListIndex = 2 Then
      'set mixed new colors
      For i = 4 To 5 Step 1
        If Rend(i - 2) > Rend(i - 3) Then
           Rend(i) = Rend(i - 2)
           Else
           Rend(i) = Rend(i - 3)
        End If
         If Gend(i - 2) > Gend(i - 3) Then
           Gend(i) = Gend(i - 2)
           Else
           Gend(i) = Gend(i - 3)
        End If
         If Bend(i - 2) > Bend(i - 3) Then
           Bend(i) = Bend(i - 2)
           Else
           Bend(i) = Bend(i - 3)
        End If
      Next i
    End If
      
     'set color levels
      For i = 1 To End1
        Rcolor(i) = (i - 1) * (Rend(4) - Rend(1)) / (End1 + 1) + Rend(1)
        Gcolor(i) = (i - 1) * (Gend(4) - Gend(1)) / (End1 + 1) + Gend(1)
        Bcolor(i) = (i - 1) * (Bend(4) - Bend(1)) / (End1 + 1) + Bend(1)
      Next
      counter = 0
      For i = End1 + 1 To End2
        counter = counter + 1
        Rcolor(i) = counter * (Rend(2) - Rend(4)) / (End2 - End1 + 1) + Rend(4)
        Gcolor(i) = counter * (Gend(2) - Gend(4)) / (End2 - End1 + 1) + Gend(4)
        Bcolor(i) = counter * (Bend(2) - Bend(4)) / (End2 - End1 + 1) + Bend(4)
      Next
      counter = 0
      For i = End2 + 1 To End3
        counter = counter + 1
        Rcolor(i) = counter * (Rend(5) - Rend(2)) / (End3 - End2 + 1) + Rend(2)
        Gcolor(i) = counter * (Gend(5) - Gend(2)) / (End3 - End2 + 1) + Gend(2)
        Bcolor(i) = counter * (Bend(5) - Bend(2)) / (End3 - End2 + 1) + Bend(2)
      Next
      counter = 0
      For i = End3 + 1 To Levels
        counter = counter + 1
        Rcolor(i) = counter * (Rend(3) - Rend(5)) / (Levels - End3 + 1) + Rend(5)
        Gcolor(i) = counter * (Gend(3) - Gend(5)) / (Levels - End3 + 1) + Gend(5)
        Bcolor(i) = counter * (Bend(3) - Bend(5)) / (Levels - End3 + 1) + Bend(5)
      Next i
     
   End If
                
  'Draw the sample color scale
   Piccolor.ScaleTop = Levels
   Piccolor.ScaleLeft = 0
   Piccolor.ScaleWidth = 1
   Piccolor.ScaleHeight = -Levels
   Piccolor.AutoRedraw = True
   For i = 1 To Levels
     Piccolor.Line (0, i - 1)-(1, i), RGB(Rcolor(i), Gcolor(i), Bcolor(i)), BF
   Next
   DoEvents
   
  Piccolor.Refresh
  Me.Refresh


End Sub

Private Sub Text1_KeyPress(Index As Integer, KeyAscii As Integer)
KeyAscii = CheckNum(KeyAscii, Text1(Index).Text)
End Sub




Public Function HextoDecimal(hexstring$) As Long
  On Error GoTo errorhandler
  
  HextoDecimal = CLng("&H" & hexstring)
  Exit Function
errorhandler:
  HextoDecimal = 0
End Function

Private Sub TxtLevels_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then ColorScale
End Sub


Private Sub TxtLevels_LostFocus()
ColorScale
End Sub


