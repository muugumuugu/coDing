VERSION 5.00
Begin VB.Form Circuit 
   Caption         =   "Full Circuit"
   ClientHeight    =   10680
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9540
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   712
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   636
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox DelaysCheck 
      Caption         =   "Delays"
      Height          =   315
      Left            =   60
      TabIndex        =   6
      Top             =   1980
      Width           =   1095
   End
   Begin VB.HScrollBar BotSizeScroll 
      Height          =   255
      Left            =   60
      Max             =   100
      Min             =   1
      TabIndex        =   3
      Top             =   9000
      Value           =   50
      Width           =   1095
   End
   Begin VB.CommandButton BitMapCommand 
      Caption         =   "BitMap"
      Height          =   375
      Left            =   60
      TabIndex        =   2
      ToolTipText     =   "Saves a Bitmap image of the circuit to the BitMaps folder."
      Top             =   480
      Width           =   1095
   End
   Begin VB.HScrollBar CircuitSizeScroll 
      Height          =   255
      Left            =   60
      Max             =   2
      TabIndex        =   1
      Top             =   1380
      Width           =   1095
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   10665
      Left            =   1200
      ScaleHeight     =   711
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   554
      TabIndex        =   0
      Top             =   0
      Width           =   8310
   End
   Begin VB.Label Dialog 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   60
      TabIndex        =   7
      Top             =   60
      Width           =   1095
   End
   Begin VB.Label CircuitSizeLabel 
      Alignment       =   2  'Center
      Caption         =   "Size = x1"
      Height          =   195
      Left            =   60
      TabIndex        =   5
      Top             =   1140
      Width           =   1095
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Bot Size"
      Height          =   315
      Left            =   60
      TabIndex        =   4
      Top             =   8760
      Width           =   1095
   End
End
Attribute VB_Name = "Circuit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FolderPath As String

Private Sub BotSizeScroll_Change()
   Call Intelligence.CalculateCirBotXY
End Sub
Private Sub BitMapCommand_Click()
 Dialog = "SAVING"
 Dialog.Refresh
 Dim FSO
 Set FSO = CreateObject("Scripting.FileSystemObject")
                       FolderPath = App.Path & "\BitMaps"
  If FSO.FolderExists(FolderPath) = False Then MkDir FolderPath
    
  If Intelligence.Lobes = 1 Then
'    SavePicture Picture1.Image, FolderPath & "\CircuitOneLobe" & Format(2 ^ CircuitSizeScroll) & "x.Bmp"
'    SavePicture Picture1.Image, FolderPath & "\CircuitOneLobe" & Format(2 ^ CircuitSizeScroll) & "x.Bmp"
    FolderPath = FolderPath & "\CircuitOneLobe"
  Else
'    SavePicture Picture1.Image, FolderPath & "\CircuitTwoLobe" & Format(2 ^ CircuitSizeScroll) & "x.Bmp"
'    SavePicture Picture1.Image, FolderPath & "\CircuitTwoLobe" & Format(2 ^ CircuitSizeScroll) & "x.Bmp"
    FolderPath = FolderPath & "\CircuitTwoLobe"
  End If
  If DelaysCheck = 1 Then
    FolderPath = FolderPath & "Delays"
  End If
    FolderPath = FolderPath & Format(2 ^ CircuitSizeScroll) & "x.Bmp"
    SavePicture Picture1.Image, FolderPath
 Dialog = ""
 Dialog.Refresh
End Sub

Private Sub CircuitSizeScroll_Change()
' Dialog = "ReSizing"
 Dialog = "SIZING"
 Dialog.Refresh
   CircuitSizeLabel = "Size = x" & Format(2 ^ CircuitSizeScroll)
   Call Intelligence.CalculateCirBotXY
   Call Intelligence.DrawFullCircuit
End Sub

Private Sub DelaysCheck_Click()
   Call Intelligence.DrawFullCircuit
End Sub
