VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMenu 
   Caption         =   "Form1"
   ClientHeight    =   7875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5820
   Icon            =   "frmMenu.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7875
   ScaleWidth      =   5820
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog dlg 
      Left            =   2400
      Top             =   2760
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00808080&
      Height          =   7815
      Left            =   0
      ScaleHeight     =   7755
      ScaleWidth      =   1395
      TabIndex        =   0
      Top             =   0
      Width           =   1455
      Begin VB.CommandButton cmdReadBook 
         Caption         =   "ReadBook"
         Height          =   855
         Left            =   120
         Picture         =   "frmMenu.frx":030A
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   1080
         Width           =   1095
      End
      Begin VB.CommandButton cmdOpenBook 
         Caption         =   "Open Book"
         Height          =   855
         Left            =   120
         Picture         =   "frmMenu.frx":0614
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   120
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOpenBook_Click()
Dim sTargetFile As String

Dim Mycheck

dlg.Filter = "Text Files(*.txt)|*.txt|All Files Files (*.*)|*.*"
dlg.DefaultExt = ".txt"
dlg.ShowOpen
sTargetFile = dlg.FileName

If sTargetFile = "" Then Exit Sub

Mycheck = Dir(sTargetFile)
'OpenBook = OpenString(sTargetFile)
'rtfPreview.Text = OpenBook
'Text1 = OpenBook
'rtfPreview.FileName = sTargetFile
rtfPreview.LoadFile sTargetFile
End Sub

Private Sub cmdReadBook_Click()
frmRead.Show
frmRead.rtfBook.TextRTF = Me.rtfPreview.TextRTF
frmRead.Caption = dlg.FileTitle
End Sub

Private Sub cmdSaveBook_Click()
Dim sTargetFile As String

Dim Mycheck

dlg.Filter = "Text Files(*.txt)|*.txt|All Files Files (*.*)|*.*"
dlg.DefaultExt = ".txt"
dlg.ShowSave
sTargetFile = dlg.FileName

If sTargetFile = "" Then Exit Sub

Mycheck = Dir(sTargetFile)

If Mycheck = dlg.FileTitle Then
    Dim Result
    Result = MsgBox("This file already exists. Overrite ?", vbYesNo, "File Exists")
    If Result = vbYes Then
        Kill sTargetFile
    Else
        Exit Sub
    End If
End If

gbCheck = SaveString(sTargetFile, Trim(txtInput.Text))
End Sub
