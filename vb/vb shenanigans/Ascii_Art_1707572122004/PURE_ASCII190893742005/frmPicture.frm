VERSION 5.00
Begin VB.Form frmPicture 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   72
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   72
   LinkTopic       =   "Form1"
   ScaleHeight     =   6
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   6
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picSource 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   612
      Left            =   0
      ScaleHeight     =   51
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   71
      TabIndex        =   0
      Top             =   0
      Width           =   852
   End
   Begin VB.Label lblTest 
      AutoSize        =   -1  'True
      Caption         =   "H"
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   156
      Left            =   1080
      TabIndex        =   1
      Top             =   0
      Width           =   96
   End
End
Attribute VB_Name = "frmPicture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
