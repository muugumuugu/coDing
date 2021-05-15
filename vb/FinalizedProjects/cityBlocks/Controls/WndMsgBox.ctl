VERSION 5.00
Begin VB.UserControl WndMsgBox 
   AutoRedraw      =   -1  'True
   BackColor       =   &H000000FF&
   ClientHeight    =   1215
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5010
   ScaleHeight     =   81
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   334
   Begin VB.Timer tmrClose 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   540
      Top             =   450
   End
   Begin CityBuilder.LineButton cmdClose 
      Height          =   210
      Left            =   0
      TabIndex        =   4
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
      Width           =   4965
   End
   Begin VB.Label lblMessage 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "[ Message ]"
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
      Height          =   285
      Index           =   0
      Left            =   0
      TabIndex        =   2
      Top             =   270
      Width           =   4965
   End
   Begin VB.Label lblMessage 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "[ Message ]"
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
      Index           =   1
      Left            =   0
      TabIndex        =   3
      Top             =   290
      Width           =   4995
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackStyle       =   0  'Transparent
      Caption         =   "Message"
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
      Width           =   4965
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Message"
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
      Width           =   4965
   End
End
Attribute VB_Name = "WndMsgBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'
Const CLR_LIGHT = &H5864FC  ' RGB(252, 100, 88)
Const CLR_NORMAL = &HE0     ' RGB(224, 0, 0)
Const CLR_DARK = &HA0       ' RGB(160, 0, 0)

Dim mX As Single, mY As Single
Dim m_DefaultX As Single, m_DefaultY As Single

Private Sub cmdClose_Click()
    tmrClose.Enabled = False
    UserControl.Extender.Visible = False
End Sub

Private Sub lblCaption_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
    '
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
            If (lTop >= Board.Top) And ((lTop + 4) <= Board.Height) Then
                UserControl.Extender.Top = lTop
            End If
        End If
    End If
End Sub

Private Sub tmrClose_Timer()
    Call cmdClose_Click
End Sub

Private Sub UserControl_GotFocus()
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_Initialize()
    Width = 3990
    With cmdClose
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        Caption = .ReadProperty("Caption", "Message")
        Message = .ReadProperty("Message", "[ Message ]")
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
    Width = 3990
    lblCaption(0).Width = ScaleWidth
    lblCaption(1).Width = ScaleWidth
    '
    lblMessage(0).Width = ScaleWidth
    lblMessage(1).Width = ScaleWidth
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

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "Caption", Caption, "Message"
        .WriteProperty "Message", Message, "[ Message ]"
        .WriteProperty "DefaultX", DefaultX, 20
        .WriteProperty "DefaultY", DefaultY, 20
    End With
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
    With tmrClose
        .Enabled = False
        .Interval = 0
        .Enabled = True
        .Interval = 10000
    End With
End Sub

Public Property Get Caption() As String
Attribute Caption.VB_UserMemId = -518
    Caption = lblCaption(0)
End Property

Public Property Let Caption(ByVal vNewValue As String)
    lblCaption(0) = vNewValue
    lblCaption(1) = vNewValue
    PropertyChanged "Caption"
End Property

Public Property Get Message() As String
Attribute Message.VB_UserMemId = -517
    Message = lblMessage(0)
End Property

Public Property Let Message(ByVal vNewValue As String)
    lblMessage(0) = vNewValue
    lblMessage(1) = vNewValue
    PropertyChanged "Message"
    '
    lblMessage(0).Height = TextHeight(vNewValue)
    lblMessage(1).Height = lblMessage(0).Height
    Height = ((lblMessage(0).Height + lblCaption(0).Height) * Screen.TwipsPerPixelY) + 120
End Property

Public Property Get DefaultX() As Single
Attribute DefaultX.VB_Description = "Specifies the default X position when the window appears."
    DefaultX = m_DefaultX
End Property

Public Property Let DefaultX(ByVal vNewValue As Single)
    m_DefaultX = vNewValue
    PropertyChanged "DefaultX"
End Property

Public Property Get DefaultY() As Single
Attribute DefaultY.VB_Description = "Specifies the default Y position when the window appears."
    DefaultY = m_DefaultY
End Property

Public Property Let DefaultY(ByVal vNewValue As Single)
    m_DefaultY = vNewValue
    PropertyChanged "DefaultY"
End Property
