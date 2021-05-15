VERSION 5.00
Begin VB.UserControl StatusBar 
   Alignable       =   -1  'True
   AutoRedraw      =   -1  'True
   ClientHeight    =   1710
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7170
   ScaleHeight     =   1710
   ScaleWidth      =   7170
   Begin VB.Timer tmrDate 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   90
      Top             =   990
   End
   Begin VB.Label lblBalance 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Rs. 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   1
      Left            =   6150
      TabIndex        =   5
      Top             =   360
      Width           =   465
   End
   Begin VB.Label lblBalance 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Rs. 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   6150
      TabIndex        =   4
      Top             =   45
      Width           =   465
   End
   Begin VB.Label lblText 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   1
      Left            =   2250
      TabIndex        =   3
      Top             =   360
      Width           =   480
   End
   Begin VB.Label lblDate 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Date"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   1
      Left            =   630
      TabIndex        =   2
      Top             =   270
      Width           =   420
   End
   Begin VB.Label lblDate 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "September 22, 2004"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   150
      TabIndex        =   1
      Top             =   45
      Width           =   1740
   End
   Begin VB.Label lblText 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   2250
      TabIndex        =   0
      Top             =   45
      Width           =   480
   End
   Begin VB.Line Line2 
      X1              =   2250
      X2              =   5760
      Y1              =   1440
      Y2              =   1440
   End
   Begin VB.Line Line1 
      X1              =   2340
      X2              =   5400
      Y1              =   810
      Y2              =   810
   End
End
Attribute VB_Name = "StatusBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'
Public Event DateChanged(dDate As Date)

Private Sub tmrDate_Timer()
    Dim dDate As Date

    dDate = CDate(lblDate(0).Caption)
    dDate = DateAdd("d", 1, dDate)

    SetDate Format(dDate, "mmmm d, yyyy")
    RaiseEvent DateChanged(dDate)
End Sub

Private Sub UserControl_Initialize()
    With UserControl
        .BackColor = RGB(132, 132, 132)
        .AutoRedraw = True
        Line (0, 0)-(0, Height), RGB(168, 168, 168)
    End With
End Sub

Private Sub UserControl_Resize()
    '
    UserControl.Height = 18 * Screen.TwipsPerPixelY
    '
    lblBalance(0).Left = ScaleWidth - (lblBalance(0).Width + 210)   ' shadow
    With lblBalance(1)                                              ' white text
        .Left = lblBalance(0).Left
        .Top = 30
        .ZOrder 0
    End With
    '
    Cls
    Line (Width - 15, 0)-(Width - 15, Height), RGB(168, 168, 168)   ' border
    
    Line (2000, 0)-(2000, Height), RGB(168, 168, 168)   ' separator 1
    Line (2015, 0)-(2015, Height), RGB(100, 100, 100)   ' separator 1
    
    Line (ScaleWidth - 1500, 0)-(ScaleWidth - 1500, Height), RGB(168, 168, 168)  ' separator 2
    Line (ScaleWidth - 1515, 0)-(ScaleWidth - 1515, Height), RGB(100, 100, 100) ' separator 2
    '
    With Line1
        .X1 = 0
        .X2 = Width
        .Y1 = 0
        .Y2 = 0
        .BorderColor = RGB(168, 168, 168)
    End With
    With Line2
        .X1 = 0
        .X2 = Width
        .Y1 = Height - 15
        .Y2 = Height - 15
        .BorderColor = RGB(100, 100, 100)
    End With
End Sub

Private Sub UserControl_Show()
    SetDate Format(#12/31/2004#, "mmmm d, yyyy")
    Text = ""
End Sub

Public Property Get CurrentDate() As Date
    CurrentDate = CDate(lblDate(0).Caption)
End Property

Public Property Let CurrentDate(vNewValue As Date)
    SetDate Format(vNewValue, "mmmm d, yyyy")
End Property

Private Sub SetDate(ByVal Text As String)
    lblDate(0).Caption = Text   ' shadow
    With lblDate(1)             ' white text
        .Caption = Text
        .Left = lblDate(0).Left
        .Top = 30
        .ZOrder 0
    End With
End Sub

Public Property Get Enabled() As Boolean
    Enabled = tmrDate.Enabled
End Property

Public Property Let Enabled(vNewValue As Boolean)
    tmrDate.Enabled = vNewValue
    PropertyChanged "Enabled"
End Property

Public Property Get Text() As String
    Text = lblText(0).Caption
End Property

Public Property Let Text(vNewValue As String)
    lblText(0).Caption = vNewValue
    With lblText(1)
        .Caption = vNewValue
        .Left = lblText(0).Left
        .Top = 30
    End With
End Property

Public Property Get MouseIcon() As StdPicture
    Set MouseIcon = UserControl.MouseIcon
End Property

Public Property Set MouseIcon(ByVal vNewValue As StdPicture)
    Set UserControl.MouseIcon = vNewValue
End Property

Public Property Get MousePointer() As MousePointerConstants
    MousePointer = UserControl.MousePointer
End Property

Public Property Let MousePointer(ByVal vNewValue As MousePointerConstants)
    UserControl.MousePointer = vNewValue
End Property

Public Property Get Balance() As Long
    Balance = CLng(Mid(lblBalance(0), 5))
End Property

Public Property Let Balance(ByVal vNewValue As Long)
    lblBalance(0) = "Rs. " & FormatNumber(vNewValue, 0, , vbFalse, vbTrue)
    If lblBalance(0) = "Rs. " Then lblBalance(0) = "Rs. 0"
    lblBalance(1) = lblBalance(0)
    lblBalance(1).ForeColor = IIf(vNewValue >= 0, vbWhite, vbRed)
End Property
