VERSION 5.00
Begin VB.UserControl LineButton 
   ClientHeight    =   1380
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1680
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ScaleHeight     =   92
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   112
   ToolboxBitmap   =   "LineButton.ctx":0000
   Begin VB.Timer Timer1 
      Left            =   270
      Top             =   810
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   285
      Left            =   900
      Top             =   990
      Visible         =   0   'False
      Width           =   465
   End
   Begin VB.Label lblMask 
      BackStyle       =   0  'Transparent
      Height          =   375
      Left            =   990
      TabIndex        =   1
      Top             =   360
      Width           =   375
   End
   Begin VB.Line lLine 
      Index           =   0
      X1              =   18
      X2              =   36
      Y1              =   6
      Y2              =   6
   End
   Begin VB.Line lLine 
      Index           =   1
      X1              =   6
      X2              =   6
      Y1              =   30
      Y2              =   18
   End
   Begin VB.Line lLine 
      Index           =   3
      X1              =   42
      X2              =   18
      Y1              =   42
      Y2              =   42
   End
   Begin VB.Line lLine 
      Index           =   2
      X1              =   48
      X2              =   48
      Y1              =   30
      Y2              =   12
   End
   Begin VB.Label lblCaption 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "x"
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   270
      TabIndex        =   0
      Top             =   270
      Width           =   105
   End
End
Attribute VB_Name = "LineButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Version 2 - Now supports images, flat buttons (hovering)
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'

Private Type POINTAPI
   X As Long
   Y As Long
End Type

Private Declare Function GetCursorPos Lib "user32" _
  (lpPoint As POINTAPI) As Long

Private Declare Function ScreenToClient Lib "user32" _
  (ByVal hWnd As Long, _
   lpPoint As POINTAPI) As Long

Private Enum ButtonState
    stNormal
    stHot
    stDown
End Enum

Dim m_Light As OLE_COLOR, m_Normal As OLE_COLOR, m_Dark As OLE_COLOR
Dim m_Enabled As Boolean, m_Style As ButtonConstants, m_Flat As Boolean
Dim m_Selected As Boolean, m_CheckButton As Boolean, m_Spark As Boolean

Dim State As ButtonState

Public Event Click()

Private Sub Settings()
    '
    UserControl.BackColor = m_Normal
    '
    lblCaption.Left = Int((ScaleWidth - lblCaption.Width) / 2)
    lblCaption.Top = Int((ScaleHeight - lblCaption.Height) / 2)
    '
    Img.Left = Int((ScaleWidth - Img.Width) / 2)
    Img.Top = Int((ScaleHeight - Img.Height) / 2)
    '
    lblMask.Move 0, 0, ScaleWidth, ScaleHeight
    lblMask.ZOrder 0
    '
End Sub

Private Sub DrawWindow(Optional lState As ButtonState = stNormal)
    '
    Dim CLR1 As Long, CLR2 As Long
    '
    If m_CheckButton = False Then
        If lState = stNormal And m_Selected Then lState = stDown
    End If
    '
    Select Case lState
        Case stNormal
            If m_Flat Then
                CLR1 = m_Normal ' this will make the lines invisible
                CLR2 = m_Normal
            Else
                CLR1 = m_Light
                CLR2 = m_Dark
            End If
        
        Case stDown
            CLR1 = m_Dark
            CLR2 = m_Light

        Case stHot
            CLR1 = m_Light
            CLR2 = m_Dark
    End Select
    '
    State = lState
    '
    If (UserControl.Ambient.UserMode = False) Then
        ' no hot/down states until the app is running
        CLR1 = m_Light
        CLR2 = m_Dark
    End If
    ' See if Spark Mode is on.
    If m_Spark Then
        CLR1 = vbWhite
        'CLR2 = vbWhite
    End If
    '
    ' NOTE: The following coordinates are for vbPixel scalemode only.
    SetLine 0, 0, 0, ScaleWidth, 0, CLR1
    SetLine 1, 0, 0, 0, ScaleHeight - 1, CLR1
    SetLine 2, ScaleWidth - 1, 1, ScaleWidth - 1, ScaleHeight - 1, CLR2
    SetLine 3, 0, ScaleHeight - 1, ScaleWidth, ScaleHeight - 1, CLR2
    '
End Sub

Private Sub SetLine(Index, X1, Y1, X2, Y2, Clr)
    With lLine(Index)
        .X1 = X1
        .Y1 = Y1
        .X2 = X2
        .Y2 = Y2
        .BorderColor = Clr
    End With
End Sub

Private Sub lblMask_Click()
    If m_Enabled Then
        If m_CheckButton Then
            Selected = Not m_Selected
            RaiseEvent Click
        Else
            If m_Selected = False Then RaiseEvent Click
        End If
    End If
End Sub

Private Sub lblMask_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If m_Enabled = False Then Exit Sub
    DrawWindow stDown
End Sub

Private Sub lblMask_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If m_Enabled = False Then Exit Sub
    If m_Flat = False Then Exit Sub     ' flat button (hovering) is turned off
    '
    If State = stNormal Then
        DrawWindow stHot
        Timer1.Interval = 50
        Timer1.Enabled = True
    End If
End Sub

Private Sub lblMask_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If m_Enabled = False Then Exit Sub
    DrawWindow
End Sub

Private Sub Timer1_Timer()
    '
    Dim pt As POINTAPI
    Dim X As Long
    Dim Y As Long
    Dim lLeft As Long
    Dim lTop As Long
    '
    With UserControl
        '
        lLeft = .Extender.Left
        lTop = .Extender.Top
        '
        GetCursorPos pt
        ScreenToClient .ContainerHwnd, pt
        '
        X = pt.X '* Screen.TwipsPerPixelX
        Y = pt.Y ' * Screen.TwipsPerPixelY
        '
        If (X < lLeft) Or (X > (.ScaleWidth + lLeft)) Or _
           (Y < lTop) Or (Y > (.ScaleHeight + lTop)) Then
            '
            'the cursor has moved outside, so
            'reset the button appearance
            If State = stHot Then DrawWindow stNormal
            
            'and disable the timer
            Timer1.Enabled = False
            '
        End If
        '
    End With
    '
End Sub

Private Sub UserControl_Initialize()
    m_Normal = vbButtonFace
    m_Light = vb3DLight
    m_Dark = vb3DShadow
    m_Enabled = True
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        ColorNormal = .ReadProperty("ColorNormal", vbButtonFace)
        ColorLight = .ReadProperty("ColorLight", vb3DLight)
        ColorDark = .ReadProperty("ColorDark", vb3DShadow)
        Caption = .ReadProperty("Caption", "x")
        Set lblCaption.Font = .ReadProperty("Font", UserControl.Font)
        Set Picture = .ReadProperty("Picture", Nothing)
        Style = .ReadProperty("Style", vbButtonStandard)
        FlatButtons = .ReadProperty("FlatButtons", False)
        Enabled = .ReadProperty("Enabled", True)
        Selected = .ReadProperty("Selected", False)
        CheckButton = .ReadProperty("CheckButton", False)
        ToolTip = .ReadProperty("ToolTip", "")
    End With
End Sub

Private Sub UserControl_Resize()
    Settings
    DrawWindow
End Sub

Public Property Get ColorNormal() As OLE_COLOR
Attribute ColorNormal.VB_UserMemId = -501
    ColorNormal = m_Normal
End Property

Public Property Let ColorNormal(ByVal vNewValue As OLE_COLOR)
    m_Normal = vNewValue
    PropertyChanged "ColorNormal"
    Settings
    DrawWindow
End Property

Public Property Get ColorLight() As OLE_COLOR
Attribute ColorLight.VB_UserMemId = -513
    ColorLight = m_Light
End Property

Public Property Let ColorLight(ByVal vNewValue As OLE_COLOR)
    m_Light = vNewValue
    PropertyChanged "ColorLight"
    DrawWindow
End Property

Public Property Get ColorDark() As OLE_COLOR
Attribute ColorDark.VB_UserMemId = -510
    ColorDark = m_Dark
End Property

Public Property Let ColorDark(ByVal vNewValue As OLE_COLOR)
    m_Dark = vNewValue
    PropertyChanged "ColorDark"
    DrawWindow
End Property

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "ColorNormal", ColorNormal, vbButtonFace
        .WriteProperty "ColorDark", ColorDark, vb3DShadow
        .WriteProperty "ColorLight", ColorLight, vb3DLight
        .WriteProperty "Caption", Caption, "x"
        .WriteProperty "Font", Font, UserControl.Font
        .WriteProperty "Picture", Picture, Nothing
        .WriteProperty "Style", Style, vbButtonStandard
        .WriteProperty "FlatButtons", FlatButtons, False
        .WriteProperty "Enabled", Enabled, True
        .WriteProperty "Selected", Selected, False
        .WriteProperty "CheckButton", CheckButton, False
        .WriteProperty "ToolTip", ToolTip, ""
    End With
End Sub

Public Property Get Picture() As IPictureDisp
    Set Picture = Img.Picture
End Property

Public Property Set Picture(vNewValue As IPictureDisp)
    Set Img.Picture = vNewValue
    PropertyChanged "Picture"
    Settings
    DrawWindow
End Property

Public Property Get Caption() As String
Attribute Caption.VB_UserMemId = -518
    Caption = lblCaption
End Property

Public Property Let Caption(ByVal vNewValue As String)
    lblCaption = vNewValue
    PropertyChanged "Caption"
    Settings
    DrawWindow
End Property

Public Property Get Font() As StdFont
Attribute Font.VB_UserMemId = -512
    Set Font = lblCaption.Font
End Property

Public Property Set Font(ByVal vNewValue As StdFont)
    Set lblCaption.Font = vNewValue
    PropertyChanged "Font"
    Settings
End Property

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_UserMemId = -514
    Enabled = m_Enabled
End Property

Public Property Let Enabled(ByVal vNewValue As Boolean)
    m_Enabled = vNewValue
    PropertyChanged "Enabled"
    lblCaption.ForeColor = IIf(m_Enabled, vbBlack, vb3DDKShadow)
End Property

Public Property Get Style() As ButtonConstants
    Style = m_Style
End Property

Public Property Let Style(ByVal vNewValue As ButtonConstants)
    m_Style = vNewValue
    PropertyChanged "Style"
    lblCaption.Visible = (vNewValue = vbButtonStandard)
    Img.Visible = Not lblCaption.Visible
End Property

Public Property Get FlatButtons() As Boolean
    FlatButtons = m_Flat
End Property

Public Property Let FlatButtons(ByVal vNewValue As Boolean)
    m_Flat = vNewValue
    PropertyChanged "FlatButtons"
End Property

Public Property Get Selected() As Boolean
    Selected = m_Selected
End Property

Public Property Let Selected(ByVal vNewValue As Boolean)
    m_Selected = vNewValue
    PropertyChanged "Selected"
    If m_Selected And m_CheckButton Then
        DrawWindow stDown
    Else
        DrawWindow stNormal
    End If
End Property

Public Property Get CheckButton() As Boolean
    CheckButton = m_CheckButton
End Property

Public Property Let CheckButton(ByVal vNewValue As Boolean)
    m_CheckButton = vNewValue
    PropertyChanged "CheckButton"
    Selected = m_Selected ' to redraw if Selected = True
End Property

Public Property Get ToolTip() As String
    ToolTip = lblMask.ToolTipText
End Property

Public Property Let ToolTip(ByVal vNewValue As String)
    lblMask.ToolTipText = vNewValue
End Property

Public Property Get Spark() As Boolean
    Spark = m_Spark
End Property

Public Property Let Spark(ByVal vNewValue As Boolean)
    m_Spark = vNewValue
    DrawWindow State
End Property
