VERSION 5.00
Begin VB.Form frmL2D 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4035
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6240
   BeginProperty Font 
      Name            =   "Lucida Console"
      Size            =   1.5
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   269
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   416
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   2640
      Top             =   1800
   End
   Begin VB.ListBox lstNumbers 
      Height          =   240
      ItemData        =   "frmL2D.frx":0000
      Left            =   960
      List            =   "frmL2D.frx":0002
      TabIndex        =   3
      Top             =   3360
      Width           =   252
   End
   Begin VB.ListBox lstTemp 
      Height          =   240
      ItemData        =   "frmL2D.frx":0004
      Left            =   480
      List            =   "frmL2D.frx":0006
      TabIndex        =   2
      Top             =   3360
      Width           =   252
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1200
      Left            =   3360
      ScaleHeight     =   80
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   80
      TabIndex        =   0
      Top             =   1200
      Width           =   1200
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   204
      Left            =   5280
      TabIndex        =   4
      Top             =   360
      Width           =   120
   End
   Begin VB.Label lbltest 
      AutoSize        =   -1  'True
      Caption         =   "H"
      Height          =   24
      Left            =   360
      TabIndex        =   1
      Top             =   2040
      Width           =   12
   End
End
Attribute VB_Name = "frmL2D"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Sub Order()
On Error Resume Next
    Dim tmp As Single
    Dim temp As Long
    Dim i As Single
    tmp = 1E+10!
    For i = 0 To lstNumbers.ListCount - 1
        lstTemp.AddItem lstNumbers.List(i)
    Next i
    lstNumbers.Clear
    Do
        DoEvents
        For i = 0 To lstTemp.ListCount - 1
            If CSng(lstTemp.List(i)) <= tmp Then tmp = CSng(lstTemp.List(i))
        Next i
        lstNumbers.AddItem tmp
        For i = 0 To lstTemp.ListCount - 1
            If CSng(lstTemp.List(i)) = tmp Then lstTemp.RemoveItem i: Exit For
        Next i
        tmp = 1E+10!
    Loop Until lstTemp.ListCount = 0
    lstTemp.Clear
End Sub

Private Sub Timer1_Timer()
    Dim ctr As Integer
    Dim PixelPicture() As Long
    Dim PPicture() As Long
    
    Dim i As Integer
    Dim j As Integer
    Dim k As Integer
    Dim ip As String
    
    Dim Ltrs() As String
    Dim Nums() As Integer
    
    Dim Chars() As Integer
    
    Picture1.Width = lbltest.Width * 100
    Picture1.Height = lbltest.Height * 100
    
    ip = InputBox("Please Type The Characters You Would Like To Use In A Light To Dark Scale:", "L2D")
    
    If ip = "" Then Exit Sub: Unload Me
    
    ReDim Nums(Len(ip) - 1)
    ReDim Ltrs(Len(ip) - 1)
    ReDim Chars(Len(ip) - 1)
    For i = 0 To Len(ip) - 1
        Label1.Caption = Mid(ip, i + 1, 1)
'        Form1.Caption = i * 100 / (Len(ap) - 1) & "%"
        txt = 0
        For j = 1 To 100
            txt = txt & Mid(ip, i + 1, 1)
            DoEvents
        Next j 'X
        For j = 1 To 100
            Print txt
            DoEvents
        Next j 'Y
'.Form1.Refresh
        For j = 0 To lbltest.Width * 100 - 1
            For k = 0 To lbltest.Height * 100 - 1
                SetPixel Picture1.hdc, j, k, GetPixel(Form1.hdc, j, k)
                DoEvents
            Next k
        Next j
        Picture1.Refresh
        ReDim PixelPicture(lbltest.Width * 100 - 1, lbltest.Height * 100 - 1)
        ctr = -1
        For j = 0 To lbltest.Width * 100 - 1
            For k = 0 To lbltest.Height * 100 - 1
                ctr = ctr + 1
                PixelPicture(j, k) = GetPixel(Picture1.hdc, j, k)
                DoEvents
            Next k
        Next j
        ReDim PPicture(ctr)
        ctr = -1
        For j = 0 To lbltest.Width * 100 - 1
            For k = 0 To lbltest.Height * 100 - 1
                ctr = ctr + 1
                PPicture(ctr) = MakeBAW(PixelPicture(j, k))
                DoEvents
            Next k
        Next j
        
        Chars(i) = RedC(AverageColours(PPicture))
        lstNumbers.AddItem Chars(i)
        Nums(i) = Chars(i)
        Ltrs(i) = Mid(ip, i + 1, 1)
        Form1.Cls
    Next i
    
    
    Call Order
    
    Clipboard.Clear
    Dim stri As String
    For i = 0 To lstNumbers.ListCount - 1
        For j = 0 To UBound(Nums)
            If Nums(j) = lstNumbers.List(i) Then
                If InStr(1, stri, Ltrs(j)) = 0 Then Exit For
            End If
            DoEvents
        Next j
        stri = stri & Ltrs(j)
    Next i
    'Clipboard.SetText StrReverse(stri)
    frmASCII!txtL2D.Text = StrReverse(stri)
    
    MsgBox "Finished!", , "Done"
    Unload Me
End Sub
