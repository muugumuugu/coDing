VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5130
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9555
   LinkTopic       =   "Form1"
   ScaleHeight     =   5130
   ScaleWidth      =   9555
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CD1 
      Left            =   480
      Top             =   4080
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox edThBlue 
      Height          =   285
      Left            =   120
      TabIndex        =   8
      Text            =   "50"
      Top             =   1560
      Width           =   735
   End
   Begin VB.TextBox edThGreen 
      Height          =   285
      Left            =   120
      TabIndex        =   7
      Text            =   "250"
      Top             =   1200
      Width           =   735
   End
   Begin VB.TextBox edThRed 
      Height          =   285
      Left            =   120
      TabIndex        =   6
      Text            =   "1250"
      Top             =   840
      Width           =   735
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      Height          =   3615
      Left            =   1680
      ScaleHeight     =   237
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   285
      TabIndex        =   5
      Top             =   120
      Width           =   4335
   End
   Begin VB.TextBox valHei 
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Text            =   "200"
      Top             =   480
      Width           =   735
   End
   Begin VB.TextBox valWid 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Text            =   "200"
      Top             =   120
      Width           =   735
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save Picture"
      Enabled         =   0   'False
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   3240
      Width           =   1095
   End
   Begin VB.CommandButton cmdRender 
      Caption         =   "Render"
      Enabled         =   0   'False
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   2640
      Width           =   1095
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "New"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label Label5 
      Caption         =   "Blue"
      Height          =   255
      Left            =   960
      TabIndex        =   13
      Top             =   1680
      Width           =   615
   End
   Begin VB.Label Label4 
      Caption         =   "Green"
      Height          =   255
      Left            =   960
      TabIndex        =   12
      Top             =   1320
      Width           =   615
   End
   Begin VB.Label Label3 
      Caption         =   "Red"
      Height          =   255
      Left            =   960
      TabIndex        =   11
      Top             =   960
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Height"
      Height          =   255
      Left            =   960
      TabIndex        =   10
      Top             =   600
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "Width"
      Height          =   375
      Left            =   960
      TabIndex        =   9
      Top             =   120
      Width           =   495
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Stopped As Boolean, Rendering As Boolean
Dim sTime As Long, eTime As Long
Const BailVal As Long = 4
Dim x1 As Double, y1 As Double, x2 As Double, y2 As Double
Dim Wid As Long, Hei As Long, UpdateVal As Long
Dim thRed As Long, thGreen As Long, thBlue As Long
Dim densRed() As Long, densGreen() As Long, densBlue() As Long
Dim maxRed As Long, maxGreen As Long, maxBlue As Long
Dim ExposurePixels As Long
  
Private Declare Function GetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function SetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
Private Declare Function SetPixelV Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
Private Declare Function GetTickCount Lib "kernel32.dll" () As Long

Private Sub cmdNew_Click()

    Dim i As Long
    
    Hei = Val(valWid.Text)
    Wid = Val(valHei.Text)
    thRed = Val(edThRed.Text)
    thGreen = Val(edThGreen.Text)
    thBlue = Val(edThBlue.Text)
    UpdateVal = 50000 ' How many iterations until you paint it?'valUpdate.Value
    
    Picture1.Width = Wid * Screen.TwipsPerPixelX
    Picture1.Height = Hei * Screen.TwipsPerPixelY
    
    Picture1.Cls
    
    x1 = -2
    y1 = -1.5
    x2 = 1
    y2 = 1.5
    ExposurePixels = 100000000
    ReDim densRed(Wid * Hei)
    ReDim densGreen(Wid * Hei)
    ReDim densBlue(Wid * Hei)
    
    maxRed = 1
    maxGreen = 1
    maxBlue = 1

    cmdRender.Enabled = True
End Sub

Private Function Iterate(cx As Double, cy As Double, thVal As Long) As Boolean

    Dim itr As Long
    Dim x As Double, y As Double, xx As Double, yy As Double, tmp As Double
    
    x = cx
    xx = x * x
    y = cy
    yy = y * y
    itr = 0
    
    Do While (itr < thVal) And ((xx + yy) < BailVal)
        tmp = cx + xx - yy
        y = cy + 2 * x * y
        yy = y * y
        x = tmp
        xx = x * x
        itr = itr + 1
    Loop

    Iterate = True
    
    If (xx + yy) >= BailVal Then
        Iterate = False
    End If
    
End Function

Private Sub PlotBuddhabrot()
    Dim cx As Double, cy As Double
    Dim dx As Double, dy As Double
    Dim i As Long, j As Long, cnt As Long, idx As Long
    Dim ud As Boolean

    maxRed = 1
    maxGreen = 1
    maxBlue = 1
    For i = 0 To Wid - 1
        For j = 0 To Hei - 1
            idx = j * Wid + i
            densRed(idx) = 0
            densGreen(idx) = 0
            densBlue(idx) = 0
      Next j
    Next i

    dx = (x2 - x1) / Wid
    dy = (y2 - y1) / Hei

    i = 0
    cnt = 0
    Rendering = True
    ud = False
    Do While (i < ExposurePixels) And (Rendering = True)
        cx = x1 + Rnd() * (x2 - x1)
        cy = y1 + Rnd() * (y2 - y1)
        If Iterate(cx, cy, thRed) = False Then
            Call PlotIterative(cx, cy, dx, dy, 1)
            i = i + 1
            ud = True
        End If

        cx = x1 + Rnd() * (x2 - x1)
        cy = y1 + Rnd() * (y2 - y1)
        If Iterate(cx, cy, thGreen) = False Then
            Call PlotIterative(cx, cy, dx, dy, 2)
            i = i + 1
            ud = True
        End If

        cx = x1 + Rnd() * (x2 - x1)
        cy = y1 + Rnd() * (y2 - y1)
        If Iterate(cx, cy, thBlue) = False Then
            Call PlotIterative(cx, cy, dx, dy, 3)
            i = i + 1
            ud = True
        End If
        

        If ((i Mod UpdateVal) = 0) And (ud = True) Then
            eTime = Now
            Me.Caption = (i + 1) & " pixels exposed." & " Elapsed - " & GetTickCount - sTime & " ms. Max Red - " & maxRed & _
                " Max Green - " & maxGreen & " Max Blue - " & maxBlue
            makeBitmap
            ud = False
        End If
        
        DoEvents
        
    Loop
        
    makeBitmap
        
    cmdRender.Caption = "Render"
End Sub

Private Function PlotIterative(cx As Double, cy As Double, dx As Double, dy As Double, clr As Long) As Long
    Dim itr As Long, ix As Long, iy As Long, idx As Long
    Dim x As Double, y As Double, xx As Double, yy As Double, tmp As Double
    
    x = cx
    xx = x * x
    y = cy
    yy = y * y
    itr = 0
    
    If clr = 1 Then
        Do While (itr < thRed) And ((xx + yy) < BailVal) And (Rendering = True)
            tmp = cx + xx - yy
            y = cy + 2 * x * y
            yy = y * y
            x = tmp
            xx = x * x

            ix = Round((x - x1) / dx)
            iy = Round((y - y1) / dy)
              
            If (ix >= 0) And (ix < Wid) And (iy >= 0) And (iy < Hei) Then
            
                idx = iy * Wid + ix
                densRed(idx) = densRed(idx) + 1
                
                If densRed(idx) > maxRed Then
                    maxRed = densRed(idx)
                    
                    itr = itr + 1
                End If
                
            End If
        Loop
    ElseIf clr = 2 Then
        Do While (itr < thGreen) And ((xx + yy) < BailVal) And (Rendering = True)
            tmp = cx + xx - yy
            y = cy + 2 * x * y
            yy = y * y
            x = tmp
            xx = x * x

            ix = Round((x - x1) / dx)
            iy = Round((y - y1) / dy)
            If (ix >= 0) And (ix < Wid) And (iy >= 0) And (iy < Hei) Then
                idx = iy * Wid + ix
                densGreen(idx) = densGreen(idx) + 1
            
                If densGreen(idx) > maxGreen Then
                    maxGreen = densGreen(idx)
                
                    itr = itr + 1
                End If
            
            End If
       Loop
  Else
     Do While (itr < thBlue) And ((xx + yy) < BailVal) And (Rendering = True)
        tmp = cx + xx - yy
        y = cy + 2 * x * y
        yy = y * y
        x = tmp
        xx = x * x

        ix = Round((x - x1) / dx)
        iy = Round((y - y1) / dy)
        If (ix >= 0) And (ix < Wid) And (iy >= 0) And (iy < Hei) Then
            idx = iy * Wid + ix
            densBlue(idx) = densBlue(idx) + 1
            If densBlue(idx) > maxBlue Then
                maxBlue = densBlue(idx)
                itr = itr + 1
            End If
        End If
    Loop
End If

End Function

Private Sub makeBitmap()
  Dim i As Long, j As Long, valRed As Long, valGreen As Long, ValBlue As Long, idx As Long
  Dim MaxVal As Long
  Dim rampRed As Double, rampGreen As Double, rampBlue As Double
  
  If Rendering = False Then Exit Sub

  For i = 0 To Wid - 1
    For j = 0 To Hei - 1
    
      idx = j * Wid + i
      rampRed = densRed(idx) / (maxRed / 2.5)
      rampGreen = densGreen(idx) / (maxGreen / 2.5)
      rampBlue = densBlue(idx) / (maxBlue / 2.5)
      
      If rampRed > 1 Then rampRed = 1
      valRed = Round(rampRed * 255)
      
      If rampGreen > 1 Then rampGreen = 1
      valGreen = Round(rampGreen * 255)
      
      If rampBlue > 1 Then rampBlue = 1
      ValBlue = Round(rampBlue * 255)

      SetPixel Picture1.hdc, j, i, RGB(valRed, valGreen, ValBlue)
    Next j
    'DoEvents
  Next i

  Picture1.Refresh
End Sub

Private Sub cmdRender_Click()
  If cmdRender.Caption = "Render" Then
    cmdNew.Enabled = False
    cmdSave.Enabled = False
    valWid.Enabled = False
    valHei.Enabled = False
    edThRed.Enabled = False
    edThGreen.Enabled = False
    edThBlue.Enabled = False

    cmdRender.Caption = "Stop Rendering!"
    sTime = GetTickCount
    PlotBuddhabrot
  Else
    Rendering = False
    cmdNew.Enabled = True
    cmdSave.Enabled = True
    valWid.Enabled = True
    valHei.Enabled = True
    edThRed.Enabled = True
    edThGreen.Enabled = True
    edThBlue.Enabled = True
    cmdRender.Caption = "Render"
End If

End Sub

Private Sub cmdSave_Click()

    'Clipboard.SetData Picture1.Image, vbCFBitmap
    
    On Error GoTo skipIt
    CD1.CancelError = True
    CD1.Filter = "*.bmp|*.bmp"
    CD1.ShowSave
    SavePicture Picture1.Image, CD1.FileName
    
skipIt:
End Sub

Private Sub Form_Load()
    Randomize (Now)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Rendering = False
    DoEvents
    End
End Sub
