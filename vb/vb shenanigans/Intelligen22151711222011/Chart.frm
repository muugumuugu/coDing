VERSION 5.00
Begin VB.Form Chart 
   Caption         =   "Line Chart "
   ClientHeight    =   3540
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13530
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   236
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   902
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   3255
      Left            =   0
      ScaleHeight     =   217
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   901
      TabIndex        =   0
      Top             =   0
      Width           =   13515
   End
   Begin VB.Label Label1 
      Caption         =   "Red=Forward/Reverse Confidence, Blue=Left/Right Cnf., Violet=Combined Cnf., Black=Stored Memories, Green=Stomach Amount"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1140
      TabIndex        =   1
      Top             =   3300
      Width           =   11235
   End
End
Attribute VB_Name = "Chart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
