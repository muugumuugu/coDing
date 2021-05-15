VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Muku Fun"
   ClientHeight    =   8835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10845
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8835
   ScaleWidth      =   10845
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frmParticles 
      Caption         =   "&Particles"
      Height          =   2295
      Left            =   4680
      TabIndex        =   12
      Top             =   6360
      Width           =   3255
      Begin VB.TextBox txtPNum 
         Height          =   285
         Left            =   2040
         MaxLength       =   3
         TabIndex        =   16
         Text            =   "300"
         Top             =   960
         Width           =   495
      End
      Begin VB.OptionButton optType2 
         Caption         =   "Type 2 ( balls)"
         Height          =   375
         Left            =   240
         TabIndex        =   14
         Top             =   480
         Width           =   2655
      End
      Begin VB.OptionButton optType1 
         Caption         =   "Type 1 ( small, simple Circles )"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   240
         Value           =   -1  'True
         Width           =   2775
      End
      Begin VB.Label lblPNum 
         Caption         =   "Number of particles:"
         Height          =   255
         Left            =   480
         TabIndex        =   15
         Top             =   960
         Width           =   1455
      End
   End
   Begin VB.Frame frmMovement 
      Caption         =   "&Movement"
      Height          =   2295
      Left            =   120
      TabIndex        =   4
      Top             =   6360
      Width           =   4455
      Begin VB.CheckBox chkGround 
         Caption         =   "Ground Collusion"
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   1800
         Width           =   1575
      End
      Begin ComctlLib.Slider slGravX 
         Height          =   495
         Left            =   120
         TabIndex        =   9
         Top             =   1200
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   873
         _Version        =   327682
         Min             =   -10
      End
      Begin ComctlLib.Slider slPower 
         Height          =   495
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   873
         _Version        =   327682
         SmallChange     =   5
         Max             =   50
         SelStart        =   10
         TickFrequency   =   5
         Value           =   10
      End
      Begin ComctlLib.Slider slGravY 
         Height          =   495
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   873
         _Version        =   327682
         Min             =   -10
         SelStart        =   -2
         Value           =   -2
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "Gravity up/down"
         Height          =   375
         Left            =   3120
         TabIndex        =   10
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "Gravity left/right"
         Height          =   255
         Left            =   3120
         TabIndex        =   8
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "Power Control"
         Height          =   255
         Left            =   3120
         TabIndex        =   6
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "&Stop"
      Height          =   495
      Left            =   9360
      TabIndex        =   2
      Top             =   6480
      Width           =   1215
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "&Run"
      Height          =   495
      Left            =   8040
      TabIndex        =   1
      Top             =   6480
      Width           =   1215
   End
   Begin VB.PictureBox OUTPUT 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      DrawWidth       =   3
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      ForeColor       =   &H00000000&
      Height          =   6135
      Left            =   120
      ScaleHeight     =   405
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   701
      TabIndex        =   0
      Top             =   120
      Width           =   10575
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Click onto the picturebox to change the orign. Or press Shift to make it folllow the mousepointer."
      Height          =   735
      Left            =   8040
      TabIndex        =   3
      Top             =   7080
      Width           =   2535
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'#################################################
'
' That's were everything begins ;)
'
' A particle system, pure VB
' This example shows how to create a basic particle system
' it is not accelerated in any way and does not use DirectX
' or OpenGL.
'
' Author: over (overkillpage@gmx.net)
'
' Comments and suggestions are of course welcome
'
' Greets fly out to AbsoluteB!
'
'#################################################

'Making it going ;) All particle system code inside modParticle
Private Sub cmdStart_Click()

    frmParticles.Enabled = False
    optType1.Enabled = False
    optType2.Enabled = False
    lblPNum.Enabled = False
    txtPNum.Enabled = False
    Animation OUTPUT

End Sub

'Stop the animation
Private Sub cmdStop_Click()

    STOPvar = True
    optType1.Enabled = True
    optType2.Enabled = True
    lblPNum.Enabled = True
    txtPNum.Enabled = True
    frmParticles.Enabled = True

End Sub

'Some basic settings (orign, gravity ...) can be changed by sliders ...
Private Sub Form_Activate()

    XPos = Int(OUTPUT.ScaleWidth / 2)
    YPos = Int(OUTPUT.ScaleHeight / 2)
    Power = 1
    XGrav = 0
    YGrav = 0
    GroundCol = False
    ParticleType = 1
    ParticleNum = 300
    
End Sub

'stopt the animation before unloading
Private Sub Form_Unload(Cancel As Integer)
    
    STOPvar = True
    End

End Sub

'use small particles
Private Sub optType1_Click()

    If optType1.Value = True Then
        ParticleType = 1
        ParticleNum = 300
        txtPNum.Text = 300
    End If
        
    
End Sub

'use ball particles
Private Sub optType2_Click()

    If optType2.Value = True Then
        ParticleType = 2
        ParticleNum = 50
        txtPNum = 50
    End If

End Sub

'set a new orign via mouse input
Private Sub OUTPUT_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

    XPos = X
    YPos = OUTPUT.ScaleHeight - Y

End Sub

Private Sub OUTPUT_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If Shift = 1 Then
        XPos = X
        YPos = OUTPUT.ScaleHeight - Y
    End If

End Sub

'change x gravity via slider control
Private Sub slGravX_Change()

    XGrav = slGravX / 20

End Sub

'change y gravity via slider control
Private Sub slGravY_Change()

    YGrav = slGravY / 20

End Sub

'strength of the effect
Private Sub slPower_Change()

    Power = slPower.Value / 5

End Sub

'check if the input is a number
Private Sub txtPNum_KeyPress(KeyAscii As Integer)
       
    If InStr("0123456789", Chr(KeyAscii)) = False And KeyAscii <> 8 Then KeyAscii = 0
    
End Sub

'if checked particles hit the ground and jump up again
Private Sub chkGround_Click()
    
    GroundCol = chkGround.Value
    
End Sub

'set new particle number
Private Sub txtPNum_KeyUp(KeyCode As Integer, Shift As Integer)
        
        If txtPNum.Text = "" Then ParticleNum = 0 Else ParticleNum = txtPNum.Text

End Sub
