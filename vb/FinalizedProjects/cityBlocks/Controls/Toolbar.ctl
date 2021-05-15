VERSION 5.00
Begin VB.UserControl Toolbar 
   Alignable       =   -1  'True
   AutoRedraw      =   -1  'True
   ClientHeight    =   1665
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8340
   ScaleHeight     =   111
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   556
   Begin CityBuilder.LineButton Btn 
      Height          =   285
      Index           =   0
      Left            =   90
      TabIndex        =   0
      Top             =   90
      Visible         =   0   'False
      Width           =   285
      _ExtentX        =   503
      _ExtentY        =   503
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Style           =   1
      FlatButtons     =   -1  'True
   End
   Begin VB.Line Line1 
      X1              =   192
      X2              =   396
      Y1              =   54
      Y2              =   54
   End
   Begin VB.Line Line2 
      X1              =   186
      X2              =   420
      Y1              =   96
      Y2              =   96
   End
End
Attribute VB_Name = "Toolbar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar
'
Public Enum ButtonType
    tbrNormal
    tbrPlaceholder
    tbrButtonGroup
End Enum
Public Enum ButtonValues
    tbrUnpressed
    tbrPressed
End Enum

Public Event ButtonClick(ByVal Key As String, State As ButtonValues)

Dim m_DontRaiseEvent As Boolean

Private Sub Btn_Click(Index As Integer)
    '
    ' Check if this is a part of a button group
    If Btn(Index).CheckButton Then
        ' Switch off other buttons in the group
        Dim lIndex As Integer
        ' unselect all other buttons on the left side
        For lIndex = (Index - 1) To 1 Step -1
            If Btn(lIndex).Width = 6 Then Exit For  ' this is a Placeholder.
            If Btn(lIndex).CheckButton Then Btn(lIndex).Selected = False
        Next
        ' unselect all other buttons on the right side
        For lIndex = (Index + 1) To Btn.UBound
            If Btn(lIndex).Width = 6 Then Exit For  ' this is a Placeholder.
            If Btn(lIndex).CheckButton Then Btn(lIndex).Selected = False
        Next
    End If
    '
    If m_DontRaiseEvent = False Then
        PlaySound "BEEP"
        RaiseEvent ButtonClick(Btn(Index).Tag, IIf(Btn(Index).Selected, tbrPressed, tbrUnpressed))
    End If
End Sub

Private Sub UserControl_Initialize()
    With UserControl
        .BackColor = RGB(132, 132, 132)
        .AutoRedraw = True
        Line (0, 0)-(0, Height), RGB(168, 168, 168)
    End With
    With Btn(0)
        .ColorNormal = RGB(132, 132, 132)
        .ColorLight = RGB(168, 168, 168)
        .ColorDark = RGB(100, 100, 100)
    End With
End Sub

Private Sub UserControl_Resize()
    '
    UserControl.Height = 26 * Screen.TwipsPerPixelY
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
        .X2 = ScaleWidth
        .Y1 = ScaleHeight - 1
        .Y2 = ScaleHeight - 1
        .BorderColor = RGB(100, 100, 100)
    End With
End Sub

Public Sub AddButton(ByVal ButtonType As ButtonType, Optional ByVal Key As String, _
                     Optional ByVal Picture As StdPicture, Optional ByVal ToolTip As String)
    Dim lIndex As Integer
    '
    lIndex = Btn.UBound + 1
    Load Btn(lIndex)
    With Btn(lIndex)
        .Left = IIf(lIndex = 1, 0, Btn(lIndex - 1).Left + Btn(lIndex - 1).Width + 2)
        .Width = IIf(ButtonType = tbrPlaceholder, 6, 22)
        .Height = 22
        .Top = 2
        .CheckButton = (ButtonType = tbrButtonGroup)
        Set .Picture = Picture
        .Visible = (ButtonType <> tbrPlaceholder)
        .Tag = Key
        .ToolTip = ToolTip
    End With
End Sub

Public Property Get ButtonSelected(ByVal Key As String) As Boolean
    Dim lIndex As Integer
    For lIndex = 1 To Btn.UBound
        If UCase(Btn(lIndex).Tag) = UCase(Key) Then
            ButtonSelected = Btn(lIndex).Selected
            Exit For
        End If
    Next
End Property

Public Property Let ButtonSelected(ByVal Key As String, ByVal vNewValue As Boolean)
    Dim lIndex As Integer
    For lIndex = 1 To Btn.UBound
        If UCase(Btn(lIndex).Tag) = UCase(Key) Then
            Btn(lIndex).Selected = vNewValue
            Exit For
        End If
    Next
End Property

Public Sub ButtonClick(Key As String, Optional bDontRaiseEvent As Boolean = False)
    Dim lIndex As Integer
    For lIndex = 1 To Btn.UBound
        If UCase(Btn(lIndex).Tag) = UCase(Key) Then
            '
            m_DontRaiseEvent = bDontRaiseEvent
                Btn(lIndex).Selected = True
                Call Btn_Click(lIndex)
            m_DontRaiseEvent = False
            Exit For
            '
        End If
    Next
End Sub

Public Sub SelectNone()
    Dim lIndex As Integer
    For lIndex = 1 To Btn.UBound
        If Btn(lIndex).CheckButton And Btn(lIndex).Selected Then
            Btn(lIndex).Selected = False
        End If
    Next
End Sub

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
