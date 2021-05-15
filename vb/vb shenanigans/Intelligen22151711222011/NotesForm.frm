VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form Notes 
   Caption         =   "Program Notes"
   ClientHeight    =   9420
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   12390
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
   ScaleHeight     =   628
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   826
   StartUpPosition =   3  'Windows Default
   Begin RichTextLib.RichTextBox NotesText 
      Height          =   9435
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12375
      _ExtentX        =   21828
      _ExtentY        =   16642
      _Version        =   393217
      ScrollBars      =   3
      TextRTF         =   $"NotesForm.frx":0000
   End
End
Attribute VB_Name = "Notes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



