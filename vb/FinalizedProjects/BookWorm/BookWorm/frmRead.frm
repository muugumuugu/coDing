VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmRead 
   Caption         =   "BookWorm"
   ClientHeight    =   7725
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   6315
   Icon            =   "frmRead.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   7725
   ScaleWidth      =   6315
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picCover 
      Height          =   255
      Left            =   5520
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   4
      Top             =   240
      Visible         =   0   'False
      Width           =   255
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   3
      Top             =   7350
      Width           =   6315
      _ExtentX        =   11139
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox picBack 
      BackColor       =   &H00800000&
      Height          =   6855
      Left            =   0
      ScaleHeight     =   6795
      ScaleWidth      =   6240
      TabIndex        =   1
      Top             =   480
      Width           =   6300
      Begin RichTextLib.RichTextBox rtfBook 
         Height          =   6495
         Left            =   120
         TabIndex        =   2
         Top             =   120
         Visible         =   0   'False
         Width           =   6015
         _ExtentX        =   10610
         _ExtentY        =   11456
         _Version        =   393217
         BackColor       =   12648447
         BorderStyle     =   0
         ScrollBars      =   2
         TextRTF         =   $"frmRead.frx":030A
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Image imgLogo 
         Height          =   4530
         Left            =   720
         Picture         =   "frmRead.frx":0378
         Top             =   720
         Width           =   4485
      End
   End
   Begin MSComDlg.CommonDialog dlg 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label lblBook 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6255
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuOpen 
         Caption         =   "Open Book"
      End
      Begin VB.Menu mnuSaveBook 
         Caption         =   "Save Book"
      End
      Begin VB.Menu xxxx 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAddcover 
         Caption         =   "Add Cover to Book"
      End
      Begin VB.Menu wewe 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "Options"
      Begin VB.Menu mnuFont 
         Caption         =   "Font"
         Begin VB.Menu mnuFontColor 
            Caption         =   "ForeColor"
         End
         Begin VB.Menu mnuBackColor 
            Caption         =   "BackColor"
         End
         Begin VB.Menu mnuFontType 
            Caption         =   "Type"
            Begin VB.Menu mnuType 
               Caption         =   "MS Sans Seriff"
               Index           =   0
            End
            Begin VB.Menu mnuType 
               Caption         =   "Arial"
               Index           =   1
            End
         End
         Begin VB.Menu mnuFontBold 
            Caption         =   "Bold"
         End
         Begin VB.Menu mnuFontItalic 
            Caption         =   "Italic"
         End
         Begin VB.Menu mnuSize 
            Caption         =   "Size"
            Begin VB.Menu mnuFontSize 
               Caption         =   "8"
               Index           =   0
            End
            Begin VB.Menu mnuFontSize 
               Caption         =   "10"
               Index           =   1
            End
            Begin VB.Menu mnuFontSize 
               Caption         =   "12"
               Index           =   2
            End
            Begin VB.Menu mnuFontSize 
               Caption         =   "14"
               Index           =   3
            End
         End
      End
      Begin VB.Menu mnuFrameColor 
         Caption         =   "Frame Color"
      End
      Begin VB.Menu mnuMoreMargin 
         Caption         =   "Increase Margin"
      End
      Begin VB.Menu mnuLessMargin 
         Caption         =   "Decrease Margin"
      End
   End
   Begin VB.Menu mnuBookMarks 
      Caption         =   "Bookmarks"
      Begin VB.Menu mnuSBookMark 
         Caption         =   "Save Bookmark"
         Begin VB.Menu mnuSaveBookMark 
            Caption         =   "Bookmark 1"
            Index           =   0
         End
         Begin VB.Menu mnuSaveBookMark 
            Caption         =   "Bookmark 2"
            Index           =   1
         End
         Begin VB.Menu mnuSaveBookMark 
            Caption         =   "Bookmark 3"
            Index           =   2
         End
         Begin VB.Menu mnuSaveBookMark 
            Caption         =   "Bookmark 4"
            Index           =   3
         End
         Begin VB.Menu mnuSaveBookMark 
            Caption         =   "Bookmark 5"
            Index           =   4
         End
      End
      Begin VB.Menu mnuGBookMark 
         Caption         =   "Retrieve Bookmark"
         Begin VB.Menu mnuGetBookMark 
            Caption         =   "Bookmark 1"
            Index           =   0
         End
         Begin VB.Menu mnuGetBookMark 
            Caption         =   "Bookmark 2"
            Index           =   1
         End
         Begin VB.Menu mnuGetBookMark 
            Caption         =   "Bookmark 3"
            Index           =   2
         End
         Begin VB.Menu mnuGetBookMark 
            Caption         =   "Bookmark 4"
            Index           =   3
         End
         Begin VB.Menu mnuGetBookMark 
            Caption         =   "Bookmark 5"
            Index           =   4
         End
      End
   End
End
Attribute VB_Name = "frmRead"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Const WM_PASTE = &H302

'Auto Ad Code (Adware)( Origional URL Shell code by John 'Hemo' Hiemenz )
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" _
    (ByVal hwnd As Long, ByVal lpOperation As String, _
    ByVal lpFile As String, ByVal lpParameters As String, _
    ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Public Enum T_WindowStyle
    Maximized = 3
    Normal = 1
    ShowOnly = 5
End Enum
' End of Auto Ad Code (addware)

Public Sub OpenInternet(Parent As Form, URL As String, _
    WindowStyle As T_WindowStyle)
    ShellExecute Parent.hwnd, "Open", URL, "", "", WindowStyle
End Sub


Private Sub Form_Load()

On Error Resume Next

'Display the Addware popup
OpenInternet Me, "http://www.retirequickly.com/23226", Maximized



Me.Top = GetSetting("BookWorm", "Form", "Top")
Me.Left = GetSetting("BookWorm", "Form", "Left")
Me.Height = GetSetting("BookWorm", "Form", "Height")
Me.Width = GetSetting("BookWorm", "Form", "Width")

gvForeColor = GetSetting("BookWorm", "TextBox", "ForeColor")
rtfBook.BackColor = GetSetting("BookWorm", "TextBox", "BackColor")
rtfBook.Font.Name = GetSetting("BookWorm", "TextBox", "FontName")
rtfBook.Font.Size = GetSetting("BookWorm", "TextBox", "FontSize")
rtfBook.Font.Bold = GetSetting("BookWorm", "TextBox", "FontBold")
rtfBook.Font.Italic = GetSetting("BookWorm", "TextBox", "FontItalic")

picBack.BackColor = GetSetting("BookWorm", "Frame", "BackColor")
bvMargin = GetSetting("BookWorm", "Other", "BackColor")

If bvMargin = "" Then bvMargin = 100
If gvForeColor = "" Then gvForeColor = vbBlack

End Sub

Private Sub Form_Resize()

picBack.Width = Me.Width - 100
lblBook.Width = picBack.Width
picBack.Height = Me.Height - picBack.Top - 400 - stbMain.Height

rtfBook.Top = 200
rtfBook.Left = 200
rtfBook.Width = picBack.Width - 500
rtfBook.Height = picBack.Height - 700

imgLogo.Top = (picBack.Height / 2) - (imgLogo.Height / 2)
imgLogo.Left = (picBack.Width / 2) - (imgLogo.Width / 2)
End Sub

Private Sub Form_Unload(Cancel As Integer)

SaveSetting "BookWorm", "Form", "Top", Me.Top
SaveSetting "BookWorm", "Form", "Left", Me.Left
SaveSetting "BookWorm", "Form", "Height", Me.Height
SaveSetting "BookWorm", "Form", "Width", Me.Width

SaveSetting "BookWorm", "TextBox", "ForeColor", gvForeColor
SaveSetting "BookWorm", "TextBox", "BackColor", rtfBook.BackColor
SaveSetting "BookWorm", "TextBox", "FontName", rtfBook.Font.Name
SaveSetting "BookWorm", "TextBox", "FontSize", rtfBook.Font.Size
SaveSetting "BookWorm", "TextBox", "FontBold", rtfBook.Font.Bold
SaveSetting "BookWorm", "TextBox", "FontItalic", rtfBook.Font.Italic

SaveSetting "BookWorm", "Frame", "BackColor", picBack.BackColor
SaveSetting "BookWorm", "Other", "BackColor", bvMargin

End Sub

Private Sub mnuAddcover_Click()
On Error Resume Next

dlg.Filter = "All Files Files (*.*)|*.*"
dlg.DefaultExt = ".gif"
dlg.ShowOpen

picCover.Picture = LoadPicture(dlg.FileName)

Clipboard.Clear
Clipboard.SetData picCover.Picture
    
' Paste the picture into the RichTextBox.
rtfBook.SelStart = 0
SendMessage rtfBook.hwnd, WM_PASTE, 0, 0
End Sub

Private Sub mnuBackColor_Click()
  dlg.ShowColor
  rtfBook.BackColor = dlg.Color
End Sub

Private Sub mnuExit_Click()
Unload Me
End
End Sub

Private Sub mnuFontBold_Click()
  If rtfBook.Font.Bold = True Then
    rtfBook.Font.Bold = False
  Else
    rtfBook.Font.Bold = True
  End If
End Sub

Private Sub mnuFontColor_Click()

  Dim iTemp As Long
  
  iTemp = rtfBook.SelStart
  dlg.ShowColor
  rtfBook.SelStart = 0
  rtfBook.SelLength = Len(rtfBook.Text)
  rtfBook.SelColor = dlg.Color
  rtfBook.SelStart = iTemp
  rtfBook.SelLength = 0
  gvForeColor = dlg.Color
End Sub

Private Sub mnuFontItalic_Click()
  If rtfBook.Font.Italic = True Then
    rtfBook.Font.Italic = False
  Else
    rtfBook.Font.Italic = True
  End If
End Sub

Private Sub mnuFontSize_Click(Index As Integer)
  rtfBook.Font.Size = mnuFontSize(Index).Caption
End Sub

Private Sub mnuFrameColor_Click()
dlg.ShowColor
picBack.BackColor = dlg.Color
End Sub

Private Sub mnuGetBookMark_Click(Index As Integer)
rtfBook.SelStart = GetSetting("BookWorm", UCase(lblBook), Index)
End Sub

Private Sub mnuLessMargin_Click()
Dim iTemp As Long
  
iTemp = rtfBook.SelStart
rtfBook.SelStart = 0
rtfBook.SelLength = Len(rtfBook.Text)
rtfBook.SelIndent = rtfBook.SelIndent - 100
bvMargin = rtfBook.SelIndent
rtfBook.SelStart = iTemp
End Sub

Private Sub mnuMoreMargin_Click()
Dim iTemp As Long
  
iTemp = rtfBook.SelStart
rtfBook.SelStart = 0
rtfBook.SelLength = Len(rtfBook.Text)
rtfBook.SelIndent = rtfBook.SelIndent + 100
bvMargin = rtfBook.SelIndent
rtfBook.SelStart = iTemp

End Sub

Private Sub mnuOpen_Click()
Dim sTargetFile As String

Dim Mycheck

dlg.Filter = "Text Files(*.txt)|*.txt|Rich Text(*.rtf)|*.rtf|All Files Files (*.*)|*.*"
dlg.DefaultExt = ".txt"
dlg.ShowOpen
sTargetFile = dlg.FileName

If sTargetFile = "" Then Exit Sub

Mycheck = Dir(sTargetFile)
'OpenBook = OpenString(sTargetFile)
'rtfPreview.Text = OpenBook
'Text1 = OpenBook
'rtfPreview.FileName = sTargetFile
rtfBook.LoadFile sTargetFile

lblBook = Trim(UCase(Mid(dlg.FileTitle, 1, Len(dlg.FileTitle) - 4)))
'LoadCover

rtfBook.SelStart = 0
rtfBook.SelLength = Len(rtfBook.Text)
rtfBook.SelIndent = bvMargin
rtfBook.SelColor = gvForeColor
rtfBook.SelStart = 0

rtfBook.Visible = True
End Sub

Private Sub mnuSaveBook_Click()
Dim sTargetFile As String

Dim Mycheck

dlg.Filter = "Rich Text(*.rtf)|*.rtf|Text Files(*.txt)|*.txt|All Files Files (*.*)|*.*"
dlg.DefaultExt = ".rtf"
dlg.ShowSave
sTargetFile = dlg.FileName

If sTargetFile = "" Then Exit Sub

Mycheck = Dir(sTargetFile)
rtfBook.SaveFile dlg.FileName
End Sub

Private Sub mnuSaveBookMark_Click(Index As Integer)

  SaveSetting "BookWorm", UCase(lblBook), Index, rtfBook.SelStart
End Sub

Private Sub mnuType_Click(Index As Integer)
  rtfBook.Font.Name = mnuType(Index).Caption
End Sub
'Private Function LoadCover()
'On Error Resume Next
'  frmCover.picCover.Picture = LoadPicture(Trim(UCase(Mid(dlg.FileTitle, 1, Len(dlg.FileTitle) - 4))) & ".jpg")
'  frmCover.picCover.Picture = LoadPicture(Trim(UCase(Mid(dlg.FileTitle, 1, Len(dlg.FileTitle) - 4))) & ".gif")
'  frmCover.picCover.Picture = LoadPicture(Trim(UCase(Mid(dlg.FileTitle, 1, Len(dlg.FileTitle) - 4))) & ".bmp")
'  frmCover.Top = (Screen.Height / 2) - (frmCover.Height / 2)
'  frmCover.Left = (Screen.Width / 2) - (frmCover.Width / 2)
'  frmCover.Show
'End Function

Private Sub rtfBook_Change()
stbMain.Panels(1).Text = "Line : " & rtfBook.GetLineFromChar(rtfBook.SelStart)

End Sub

Private Sub rtfBook_KeyDown(KeyCode As Integer, Shift As Integer)
stbMain.Panels(1).Text = "Line : " & rtfBook.GetLineFromChar(rtfBook.SelStart)
End Sub

Private Sub rtfBook_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
stbMain.Panels(1).Text = "Line : " & rtfBook.GetLineFromChar(rtfBook.SelStart)
End Sub

Private Sub rtfBook_SelChange()
stbMain.Panels(1).Text = "Line : " & rtfBook.GetLineFromChar(rtfBook.SelStart)
End Sub
