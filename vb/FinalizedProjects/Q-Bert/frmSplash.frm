VERSION 5.00
Begin VB.Form frmSplash 
   BackColor       =   &H00000000&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4260
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   7860
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4260
   ScaleWidth      =   7860
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Line1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   1800
      Picture         =   "frmSplash.frx":000C
      ScaleHeight     =   375
      ScaleWidth      =   1095
      TabIndex        =   3
      Top             =   1920
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.PictureBox PicII 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   4800
      Picture         =   "frmSplash.frx":0570
      ScaleHeight     =   1455
      ScaleWidth      =   1695
      TabIndex        =   2
      Top             =   1440
      Width           =   1695
   End
   Begin VB.PictureBox picBert 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   3000
      Picture         =   "frmSplash.frx":0FBA
      ScaleHeight     =   1695
      ScaleWidth      =   1455
      TabIndex        =   1
      Top             =   1320
      Width           =   1455
   End
   Begin VB.PictureBox picQ 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   120
      Picture         =   "frmSplash.frx":25BA
      ScaleHeight     =   1695
      ScaleWidth      =   1695
      TabIndex        =   0
      Top             =   1320
      Width           =   1695
   End
   Begin VB.Timer tmr1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   240
      Top             =   720
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'This is the Splash Form for Q-Bert II
'I made this way before I started programming
'Q-Bert II seriously, but I think it's rather
'cool so I left it in.

Private Sub ExitSplash()
tmr1.Enabled = False
frmGame.Show
Unload Me
End Sub


Private Sub Form_Click()
ExitSplash
End Sub

'''''''''''''''''''''''''''''''''''''''''''''
'           Private Sub Form_Load()         '
'           initialize everything, set all  '
'           pic's to begin status and start!'
'''''''''''''''''''''''''''''''''''''''''''''
Private Sub Form_Load()
'Line1 is a picture box that is the '-'
'It starts out hidden
Line1.Visible = False
'picQ is Q, picBert Bert and picII II
'They are all hidden at first
picQ.Visible = False
picBert.Visible = False
PicII.Visible = False
'These are calculations that took me a long time
'and a couple of sheets of paper, but it's a good
'starting point for the pictures
picQ.LEFT = 960
picQ.Top = 2040
picQ.Height = 15
picQ.Width = 15
picBert.LEFT = 4320
picBert.Top = 2040
picBert.Height = 15
picBert.Width = 255
PicII.LEFT = 6960
PicII.Top = 2040
PicII.Height = 15
PicII.Width = 255
'now begin the animation!
tmr1.Enabled = True
End Sub

Private Sub Line1_Click()
ExitSplash
End Sub

Private Sub picBert_Click()
ExitSplash
End Sub


Private Sub PicII_Click()
ExitSplash
End Sub


Private Sub picQ_Click()
ExitSplash
End Sub


Private Sub tmr1_Timer()

Static Counter As Integer

Select Case Counter
    'if its the Q's turn to expand
    Case Is < 10: picQ.Visible = True
                  'make sure
                  'it's visible
                  'add a fixed amount of
                  'height and width
                  'all pre-calculated (it
                  'wasn't easy)
                  picQ.Height = picQ.Height + 168
                  picQ.Width = picQ.Width + 168
                  'If you make it bigger, it still
                  'has to stay centered
                  picQ.LEFT = picQ.LEFT - (168 / 2)
                  picQ.Top = picQ.Top - (168 / 2)
                  'if it's fully expanded
                  If Counter = 9 Then
                    PlaySound INTROBANG
                  End If
                  'wait a while while only the Q's here
    Case Is < 20: DoEvents
    
    'if its the Bert's turn to expand
    Case Is < 30: 'make sure
                  'it's visible
                  'add a fixed amount of
                  'height and width
                  'all pre-calculated (it
                  'wasn't easy)
                  picBert.Visible = True
                  picBert.Height = picBert.Height + 168
                  'If you make it bigger, it still
                  'has to stay centered
                  picBert.Top = picBert.Top - (168 / 2)
                  picBert.Width = picBert.Width + 276
                  picBert.LEFT = picBert.LEFT - (276 / 2)
                  'if it's fully expanded
                  If Counter = 29 Then
                    PlaySound INTROBANG
                  End If
                  
    Case Is < 40: 'wait a while while the Q Bert's here
                  DoEvents
    
    'if its the II's turn to expand
    Case Is < 50: 'make sure
                  'it's visible
                  'add a fixed amount of
                  'height and width
                  'all pre-calculated (it
                  'wasn't easy)
                  PicII.Visible = True
                  PicII.Height = PicII.Height + 168
                  PicII.Width = PicII.Width + 120
                  'If you make it bigger, it still
                  'has to stay centered
                  PicII.Top = PicII.Top - (168 / 2)
                  PicII.LEFT = PicII.LEFT - (120 / 2)
                  If Counter = 49 Then
                    PlaySound INTROBANG
                  End If
                  
    Case Is < 62: 'wait a while while the Q Bert II's here
                  DoEvents
    
    'now its time for the line to flash
    'wait a couple of ticks's every time, then
    'make it invisible for one tick, the visible
    'for more ticks, and so on
    'I find that the drum neatly matches the line
    'flashing
    Case 62: Line1.Visible = True
             'start playing the drum sound
             PlaySound INTRODRUM
             
    Case 64: Line1.Visible = False
    
    Case 67: Line1.Visible = True
    
    Case 69: Line1.Visible = False
    
    Case 70: Line1.Visible = True
    
    Case 72: Line1.Visible = False
    
    Case 73: Line1.Visible = True
    
    'now wait a bit. Q-Bert II is placed
    Case Is < 90: DoEvents
    
    'Then start the main Game Form up!
    Case Else
    frmGame.Show
    Unload Me
End Select

'count 1 on to the number of ticks
Counter = Counter + 1
End Sub
