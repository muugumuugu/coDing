VERSION 5.00
Begin VB.UserControl WndDebug 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00C0C0C0&
   ClientHeight    =   2370
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3315
   ScaleHeight     =   158
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   221
   Begin VB.TextBox txtStatus 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1905
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   3
      Top             =   360
      Width           =   3075
   End
   Begin CityBuilder.LineButton cmdClose 
      Height          =   210
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   165
      _ExtentX        =   291
      _ExtentY        =   370
      ColorNormal     =   255
      ColorLight      =   12632319
   End
   Begin VB.Shape shpBox 
      BorderColor     =   &H00FFFFFF&
      Height          =   1185
      Left            =   0
      Top             =   0
      Width           =   1635
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackStyle       =   0  'Transparent
      Caption         =   "Debug Information"
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
      Height          =   240
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3615
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Debug Information"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Top             =   15
      Width           =   3615
   End
End
Attribute VB_Name = "WndDebug"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'
Const CLR_LIGHT = &HC0ACAC  ' RGB(172, 172, 192)
Const CLR_NORMAL = &H886464 ' RGB(100, 100, 136)
Const CLR_DARK = &H644040   ' RGB(64, 64, 100)

Dim mX As Single, mY As Single
Dim m_DefaultX As Single, m_DefaultY As Single

Private Sub cmdClose_Click()
    UserControl.Extender.Visible = False
End Sub

Private Sub lblCaption_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
    If Index = 0 Then
        If Button = vbLeftButton Then
            mX = X / Screen.TwipsPerPixelX
            mY = Y / Screen.TwipsPerPixelY
        End If
    End If
End Sub

Private Sub lblCaption_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lLeft As Single, lTop As Single
    If Index = 0 Then
        If Button = vbLeftButton Then
            '
            lLeft = UserControl.Extender.Left - (mX - (X / Screen.TwipsPerPixelX))
            lTop = UserControl.Extender.Top - (mY - (Y / Screen.TwipsPerPixelY))
            ' validate
            If (lLeft >= 0) And ((lLeft + ScaleWidth) <= Board.Width) Then
                UserControl.Extender.Left = lLeft
            End If
            If (lTop >= Board.Top) And ((lTop + 4) <= Board.ScaleHeight) Then
                UserControl.Extender.Top = lTop
            End If
        End If
    End If
End Sub

Private Sub UserControl_GotFocus()
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_Initialize()
    Width = 3315
    Height = 2370
    '
    With cmdClose
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    txtStatus.BackColor = CLR_DARK
    txtStatus.ForeColor = vbWhite
    '
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        DefaultX = .ReadProperty("DefaultX", 20)
        DefaultY = .ReadProperty("DefaultY", 20)
    End With
    '
    If (UserControl.Ambient.UserMode) Then
        UserControl.Extender.Left = DefaultX
        UserControl.Extender.Top = DefaultY
    End If
    '
End Sub

Private Sub UserControl_Resize()
    Width = 3315
    Height = 2370
    lblCaption(0).Width = ScaleWidth
    lblCaption(1).Width = ScaleWidth
    '
    shpBox.Move 0, 0, ScaleWidth, ScaleHeight
    '
    DrawWindow
    '
End Sub

Private Sub UserControl_Show()
    DrawWindow
    MyTimer 100
    '
    cmdClose.Spark = True
    shpBox.ZOrder 0
    shpBox.Visible = True
    MyTimer 100
    '
    shpBox.Visible = False
    cmdClose.Spark = False
End Sub

Private Sub DrawWindow()
    '
    Cls
    '
    UserControl.BackColor = CLR_NORMAL
    '
    ' NOTE: The following coordinates are for vbPixel scalemode only.
    SetLine 0, 0, ScaleWidth, 0, CLR_LIGHT
    SetLine 0, 13, ScaleWidth, 13, CLR_DARK
    SetLine 0, 14, ScaleWidth, 14, CLR_LIGHT
    SetLine 0, ScaleHeight - 1, ScaleWidth, ScaleHeight - 1, CLR_DARK
    SetLine 0, 14, 0, ScaleHeight - 1, CLR_LIGHT
    '
    SetLine 10, 0, 10, 13, CLR_DARK
    SetLine 11, 0, 11, 13, CLR_LIGHT
    SetLine 12, 1, 12, 13, CLR_DARK
    SetLine 12, 1, ScaleWidth, 1, CLR_DARK
    SetLine 13, 12, ScaleWidth - 1, 12, CLR_LIGHT
    SetLine ScaleWidth - 2, 2, ScaleWidth - 2, 12, CLR_LIGHT
    '
    SetLine ScaleWidth - 1, 0, ScaleWidth - 1, ScaleHeight, CLR_DARK
    '
    lblCaption(0).ZOrder 0
    cmdClose.ZOrder 0
    shpBox.ZOrder 0
    '
End Sub

Private Sub SetLine(X1, Y1, X2, Y2, Clr)
    Line (X1, Y1)-(X2, Y2), Clr
End Sub

Public Sub ShowWindow()
    UserControl.Extender.ZOrder 0
    If UserControl.Extender.Visible Then
        Call UserControl_Show
    Else
        UserControl.Extender.Visible = True
    End If
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "DefaultX", DefaultX, 20
        .WriteProperty "DefaultY", DefaultY, 20
    End With
End Sub

Public Property Get DefaultX() As Single
    DefaultX = m_DefaultX
End Property

Public Property Let DefaultX(ByVal vNewValue As Single)
    m_DefaultX = vNewValue
    PropertyChanged "DefaultX"
End Property

Public Property Get DefaultY() As Single
    DefaultY = m_DefaultY
End Property

Public Property Let DefaultY(ByVal vNewValue As Single)
    m_DefaultY = vNewValue
    PropertyChanged "DefaultY"
End Property

Public Property Let Status(ByVal vNewValue As String)
    txtStatus = vNewValue
End Property
