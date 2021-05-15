VERSION 5.00
Begin VB.UserControl NewsTicker 
   BackStyle       =   0  'Transparent
   ClientHeight    =   1245
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3045
   ScaleHeight     =   1245
   ScaleWidth      =   3045
   Windowless      =   -1  'True
   Begin VB.Timer Tmr 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   2160
      Top             =   90
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "News Ticker"
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
      Index           =   0
      Left            =   90
      TabIndex        =   0
      Top             =   180
      Width           =   1080
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "News Ticker"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Index           =   1
      Left            =   90
      TabIndex        =   1
      Top             =   450
      Width           =   1080
   End
End
Attribute VB_Name = "NewsTicker"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'
Public Property Get Caption() As String
Attribute Caption.VB_UserMemId = -518
    Caption = lblCaption(0)
End Property

Public Property Let Caption(ByVal vNewValue As String)
    lblCaption(0) = vNewValue
    lblCaption(1) = vNewValue
    '
    Call UserControl_Resize
End Property

Private Sub Tmr_Timer()
    '
    lblCaption(0).Left = lblCaption(0).Left - 30
    lblCaption(1).Left = lblCaption(0).Left
    '
    If (lblCaption(0).Left + lblCaption(0).Width) <= 0 Then
        Call UserControl_Resize
    End If
    '
End Sub

Private Sub UserControl_Resize()
    lblCaption(0).Move ScaleWidth, 0
    lblCaption(1).Move ScaleWidth, 15
End Sub

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_UserMemId = -514
    Enabled = Tmr.Enabled
End Property

Public Property Let Enabled(ByVal vNewValue As Boolean)
    Tmr.Enabled = vNewValue
    Call UserControl_Resize
End Property
