VERSION 4.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "R.S.I.S.S.   -   Programmed by Jonathan Johnston"
   ClientHeight    =   5040
   ClientLeft      =   1185
   ClientTop       =   2490
   ClientWidth     =   5535
   Height          =   5445
   Icon            =   "AntSim.frx":0000
   Left            =   1125
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   336
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   369
   Top             =   2145
   Width           =   5655
   Begin VB.CommandButton Command7 
      Caption         =   "@"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5040
      TabIndex        =   17
      Top             =   2040
      Width           =   375
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Help"
      Height          =   375
      Left            =   3840
      TabIndex        =   16
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Add some Food"
      Height          =   375
      Left            =   3840
      TabIndex        =   14
      Top             =   1560
      Width           =   1575
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Add Ant"
      Height          =   375
      Left            =   3840
      TabIndex        =   13
      Top             =   1080
      Width           =   1575
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Add Antlion"
      Height          =   375
      Left            =   3840
      TabIndex        =   12
      Top             =   600
      Width           =   1575
   End
   Begin VB.TextBox Text7 
      Alignment       =   2  'Center
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4800
      TabIndex        =   11
      Text            =   "D. U."
      Top             =   3960
      Width           =   615
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   375
      Left            =   4680
      SmallChange     =   10
      TabIndex        =   10
      Top             =   3960
      Width           =   135
   End
   Begin VB.CommandButton Command2 
      Caption         =   "||"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3720
      TabIndex        =   9
      Top             =   3960
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add Spider"
      Height          =   375
      Left            =   3840
      TabIndex        =   8
      Top             =   120
      Width           =   1575
   End
   Begin VB.TextBox Text6 
      Height          =   285
      Left            =   1800
      TabIndex        =   7
      Text            =   "Display Update"
      Top             =   4680
      Width           =   1575
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   1800
      TabIndex        =   6
      Text            =   "Rate of Evolution"
      Top             =   4320
      Width           =   1575
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   1800
      TabIndex        =   5
      Text            =   "Amount of Ant Food"
      Top             =   3960
      Width           =   1575
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Text            =   "Number of Antlions"
      Top             =   4680
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Text            =   "Number of Spiders"
      Top             =   4320
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Text            =   "Number of Ants"
      Top             =   3960
      Width           =   1575
   End
   Begin VB.Timer Timer2 
      Left            =   1080
      Top             =   0
   End
   Begin VB.PictureBox Display 
      AutoRedraw      =   -1  'True
      Height          =   3825
      Left            =   1800
      ScaleHeight     =   251
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   251
      TabIndex        =   1
      Top             =   4800
      Visible         =   0   'False
      Width           =   3825
   End
   Begin VB.Timer Timer1 
      Left            =   600
      Top             =   0
   End
   Begin VB.CommandButton StartButton 
      Caption         =   "Start"
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   495
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Random Species Interaction and Survival Simulator.   Programmed by: Jonathan Johnston"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Serif"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3720
      TabIndex        =   18
      Top             =   4320
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "Leave values the way they are for default values."
      Height          =   1335
      Left            =   3840
      TabIndex        =   15
      Top             =   2520
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Lop As Double ' for/next loop variable
Private Lop1 As Double ' for/next loop variable

Private Sub NewSpider(Lop)
 SpiderUsed(SpiderAmount) = SpiderAmount
 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).Colour = Int(Rnd * EvolutionRate) + Spiders(SpiderUsed(Lop)).Colour
  If Spiders(SpiderUsed(SpiderAmount)).Colour > 255 Then Spiders(SpiderUsed(SpiderAmount)).Colour = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).Colour = Spiders(SpiderUsed(Lop)).Colour - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Colour < 1 Then Spiders(SpiderUsed(SpiderAmount)).Colour = 1
 End If
 
 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).Strength = Int(Rnd * EvolutionRate) + Spiders(SpiderUsed(Lop)).Strength
  If Spiders(SpiderUsed(SpiderAmount)).Strength > 255 Then Spiders(SpiderUsed(SpiderAmount)).Strength = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).Strength = Spiders(SpiderUsed(Lop)).Strength - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Strength < 1 Then Spiders(SpiderUsed(SpiderAmount)).Strength = 1
 End If
 
 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).Speed = Int(Rnd * EvolutionRate) + Spiders(SpiderUsed(Lop)).Speed
  If Spiders(SpiderUsed(SpiderAmount)).Speed > 255 Then Spiders(SpiderUsed(SpiderAmount)).Speed = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).Speed = Spiders(SpiderUsed(Lop)).Speed - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Speed < 1 Then Spiders(SpiderUsed(SpiderAmount)).Speed = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).Sight = Int(Rnd * EvolutionRate) + Spiders(SpiderUsed(Lop)).Sight
  If Spiders(SpiderUsed(SpiderAmount)).Sight > 255 Then Spiders(SpiderUsed(SpiderAmount)).Sight = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).Sight = Spiders(SpiderUsed(Lop)).Sight - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Sight < 1 Then Spiders(SpiderUsed(SpiderAmount)).Sight = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).Life = Spiders(SpiderUsed(Lop)).Life + Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Life > 255 Then Spiders(SpiderUsed(SpiderAmount)).Life = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).Life = Spiders(SpiderUsed(Lop)).Life - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Life < 1 Then Spiders(SpiderUsed(SpiderAmount)).Life = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).Reproduce = Int(Rnd * EvolutionRate) + Spiders(SpiderUsed(Lop)).Reproduce
  If Spiders(SpiderUsed(SpiderAmount)).Reproduce > 255 Then Spiders(SpiderUsed(SpiderAmount)).Reproduce = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).Reproduce = Spiders(SpiderUsed(Lop)).Reproduce - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Reproduce < 1 Then Spiders(SpiderUsed(SpiderAmount)).Reproduce = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).X = Int(Rnd * EvolutionRate) + Spiders(SpiderUsed(Lop)).X
  If Spiders(SpiderUsed(SpiderAmount)).X > 255 Then Spiders(SpiderUsed(SpiderAmount)).X = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).X = Spiders(SpiderUsed(Lop)).X - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).X < 1 Then Spiders(SpiderUsed(SpiderAmount)).X = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Spiders(SpiderUsed(SpiderAmount)).Y = Int(Rnd * EvolutionRate) + Spiders(SpiderUsed(Lop)).Y
  If Spiders(SpiderUsed(SpiderAmount)).Y > 255 Then Spiders(SpiderUsed(SpiderAmount)).Y = 255
 Else
  Spiders(SpiderUsed(SpiderAmount)).Y = Spiders(SpiderUsed(Lop)).Y - Int(Rnd * EvolutionRate)
  If Spiders(SpiderUsed(SpiderAmount)).Y < 1 Then Spiders(SpiderUsed(SpiderAmount)).Y = 1
 End If

 ' direction
 Spiders(SpiderUsed(SpiderAmount)).Direction = Int(Rnd * 5)
  
End Sub

Private Sub NewAnt(Lop)
 AntUsed(AntAmount) = AntAmount
 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).Colour = Int(Rnd * EvolutionRate) + Ants(AntUsed(Lop)).Colour
  If Ants(AntUsed(AntAmount)).Colour > 255 Then Ants(AntUsed(AntAmount)).Colour = 255
 Else
  Ants(AntUsed(AntAmount)).Colour = Ants(AntUsed(Lop)).Colour - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Colour < 1 Then Ants(AntUsed(AntAmount)).Colour = 1
 End If
 
 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).Strength = Int(Rnd * EvolutionRate) + Ants(AntUsed(Lop)).Strength
  If Ants(AntUsed(AntAmount)).Strength > 255 Then Ants(AntUsed(AntAmount)).Strength = 255
 Else
  Ants(AntUsed(AntAmount)).Strength = Ants(AntUsed(Lop)).Strength - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Strength < 1 Then Ants(AntUsed(AntAmount)).Strength = 1
 End If
 
 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).Speed = Int(Rnd * EvolutionRate) + Ants(AntUsed(Lop)).Speed
  If Ants(AntUsed(AntAmount)).Speed > 255 Then Ants(AntUsed(AntAmount)).Speed = 255
 Else
  Ants(AntUsed(AntAmount)).Speed = Ants(AntUsed(Lop)).Speed - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Speed < 1 Then Ants(AntUsed(AntAmount)).Speed = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).Sight = Int(Rnd * EvolutionRate) + Ants(AntUsed(Lop)).Sight
  If Ants(AntUsed(AntAmount)).Sight > 255 Then Ants(AntUsed(AntAmount)).Sight = 255
 Else
  Ants(AntUsed(AntAmount)).Sight = Ants(AntUsed(Lop)).Sight - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Sight < 1 Then Ants(AntUsed(AntAmount)).Sight = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).Life = Ants(AntUsed(Lop)).Life + Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Life > 255 Then Ants(AntUsed(AntAmount)).Life = 255
 Else
  Ants(AntUsed(AntAmount)).Life = Ants(AntUsed(Lop)).Life - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Life < 1 Then Ants(AntUsed(AntAmount)).Life = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).Reproduce = Int(Rnd * EvolutionRate) + Ants(AntUsed(Lop)).Reproduce
  If Ants(AntUsed(AntAmount)).Reproduce > 255 Then Ants(AntUsed(AntAmount)).Reproduce = 255
 Else
  Ants(AntUsed(AntAmount)).Reproduce = Ants(AntUsed(Lop)).Reproduce - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Reproduce < 1 Then Ants(AntUsed(AntAmount)).Reproduce = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).X = Int(Rnd * EvolutionRate) + Ants(AntUsed(Lop)).X
  If Ants(AntUsed(AntAmount)).X > 255 Then Ants(AntUsed(AntAmount)).X = 255
 Else
  Ants(AntUsed(AntAmount)).X = Ants(AntUsed(Lop)).X - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).X < 1 Then Ants(AntUsed(AntAmount)).X = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Ants(AntUsed(AntAmount)).Y = Int(Rnd * EvolutionRate) + Ants(AntUsed(Lop)).Y
  If Ants(AntUsed(AntAmount)).Y > 255 Then Ants(AntUsed(AntAmount)).Y = 255
 Else
  Ants(AntUsed(AntAmount)).Y = Ants(AntUsed(Lop)).Y - Int(Rnd * EvolutionRate)
  If Ants(AntUsed(AntAmount)).Y < 1 Then Ants(AntUsed(AntAmount)).Y = 1
 End If

 ' direction
 Ants(AntUsed(AntAmount)).Direction = Int(Rnd * 5)
  
End Sub
Private Sub NewAntLion(Lop)
 AntLionUsed(AntLionAmount) = AntLionAmount
 If Int(Rnd * 2) >= 1 Then
  AntLions(AntLionUsed(AntLionAmount)).Colour = Int(Rnd * EvolutionRate) + AntLions(AntLionUsed(Lop)).Colour
  If AntLions(AntLionUsed(AntLionAmount)).Colour > 255 Then AntLions(AntLionUsed(AntLionAmount)).Colour = 255
 Else
  AntLions(AntLionUsed(AntLionAmount)).Colour = AntLions(AntLionUsed(Lop)).Colour - Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).Colour < 1 Then AntLions(AntLionUsed(AntLionAmount)).Colour = 1
 End If
 
 If Int(Rnd * 2) >= 1 Then
  AntLions(AntLionUsed(AntLionAmount)).Strength = Int(Rnd * EvolutionRate) + AntLions(AntLionUsed(Lop)).Strength
  If AntLions(AntLionUsed(AntLionAmount)).Strength > 255 Then AntLions(AntLionUsed(AntLionAmount)).Strength = 255
 Else
  AntLions(AntLionUsed(AntLionAmount)).Strength = AntLions(AntLionUsed(Lop)).Strength - Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).Strength < 1 Then AntLions(AntLionUsed(AntLionAmount)).Strength = 1
 End If
 
 If Int(Rnd * 2) >= 1 Then
  AntLions(AntLionUsed(AntLionAmount)).Size = Int(Rnd * EvolutionRate) + AntLions(AntLionUsed(Lop)).Size
  If AntLions(AntLionUsed(AntLionAmount)).Size > 255 Then AntLions(AntLionUsed(AntLionAmount)).Size = 255
 Else
  AntLions(AntLionUsed(AntLionAmount)).Size = AntLions(AntLionUsed(Lop)).Size - Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).Size < 1 Then AntLions(AntLionUsed(AntLionAmount)).Size = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  AntLions(AntLionUsed(AntLionAmount)).Life = AntLions(AntLionUsed(Lop)).Life + Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).Life > 255 Then AntLions(AntLionUsed(AntLionAmount)).Life = 255
 Else
  AntLions(AntLionUsed(AntLionAmount)).Life = AntLions(AntLionUsed(Lop)).Life - Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).Life < 1 Then AntLions(AntLionUsed(AntLionAmount)).Life = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  AntLions(AntLionUsed(AntLionAmount)).Reproduce = Int(Rnd * EvolutionRate) + AntLions(AntLionUsed(Lop)).Reproduce
  If AntLions(AntLionUsed(AntLionAmount)).Reproduce > 255 Then AntLions(AntLionUsed(AntLionAmount)).Reproduce = 255
 Else
  AntLions(AntLionUsed(AntLionAmount)).Reproduce = AntLions(AntLionUsed(Lop)).Reproduce - Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).Reproduce < 1 Then AntLions(AntLionUsed(AntLionAmount)).Reproduce = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  AntLions(AntLionUsed(AntLionAmount)).X = Int(Rnd * EvolutionRate) + AntLions(AntLionUsed(Lop)).X
  If AntLions(AntLionUsed(AntLionAmount)).X > 255 Then AntLions(AntLionUsed(AntLionAmount)).X = 255
 Else
  AntLions(AntLionUsed(AntLionAmount)).X = AntLions(AntLionUsed(Lop)).X - Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).X < 1 Then AntLions(AntLionUsed(AntLionAmount)).X = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  AntLions(AntLionUsed(AntLionAmount)).Y = Int(Rnd * EvolutionRate) + AntLions(AntLionUsed(Lop)).Y
  If AntLions(AntLionUsed(AntLionAmount)).Y > 255 Then AntLions(AntLionUsed(AntLionAmount)).Y = 255
 Else
  AntLions(AntLionUsed(AntLionAmount)).Y = AntLions(AntLionUsed(Lop)).Y - Int(Rnd * EvolutionRate)
  If AntLions(AntLionUsed(AntLionAmount)).Y < 1 Then AntLions(AntLionUsed(AntLionAmount)).Y = 1
 End If

 End Sub

Private Sub NewFood(Lop)
 FoodUsed(FoodAmount) = FoodAmount
 If Int(Rnd * 2) >= 1 Then
  Food(FoodUsed(FoodAmount)).Colour = Int(Rnd * EvolutionRate) + Food(FoodUsed(Lop)).Colour
  If Food(FoodUsed(FoodAmount)).Colour > 255 Then Food(FoodUsed(FoodAmount)).Colour = 255
 Else
  Food(FoodUsed(FoodAmount)).Colour = Food(FoodUsed(Lop)).Colour - Int(Rnd * EvolutionRate)
  If Food(FoodUsed(FoodAmount)).Colour < 1 Then Food(FoodUsed(FoodAmount)).Colour = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Food(FoodUsed(FoodAmount)).Life = Food(FoodUsed(Lop)).Life + Int(Rnd * EvolutionRate)
  If Food(FoodUsed(FoodAmount)).Life > 255 Then Food(FoodUsed(FoodAmount)).Life = 255
 Else
  Food(FoodUsed(FoodAmount)).Life = Food(FoodUsed(Lop)).Life - Int(Rnd * EvolutionRate)
  If Food(FoodUsed(FoodAmount)).Life < 1 Then Food(FoodUsed(FoodAmount)).Life = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Food(FoodUsed(FoodAmount)).Reproduce = Int(Rnd * EvolutionRate) + Food(FoodUsed(Lop)).Reproduce
  If Food(FoodUsed(FoodAmount)).Reproduce > 255 Then Food(FoodUsed(FoodAmount)).Reproduce = 255
 Else
  Food(FoodUsed(FoodAmount)).Reproduce = Food(FoodUsed(Lop)).Reproduce - Int(Rnd * EvolutionRate)
  If Food(FoodUsed(FoodAmount)).Reproduce < 1 Then Food(FoodUsed(FoodAmount)).Reproduce = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Food(FoodUsed(FoodAmount)).X = Int(Rnd * EvolutionRate) + Food(FoodUsed(Lop)).X
  If Food(FoodUsed(FoodAmount)).X > 255 Then Food(FoodUsed(FoodAmount)).X = 255
 Else
  Food(FoodUsed(FoodAmount)).X = Food(FoodUsed(Lop)).X - Int(Rnd * EvolutionRate)
  If Food(FoodUsed(FoodAmount)).X < 1 Then Food(FoodUsed(FoodAmount)).X = 1
 End If

 If Int(Rnd * 2) >= 1 Then
  Food(FoodUsed(FoodAmount)).Y = Int(Rnd * EvolutionRate) + Food(FoodUsed(Lop)).Y
  If Food(FoodUsed(FoodAmount)).Y > 255 Then Food(FoodUsed(FoodAmount)).Y = 255
 Else
  Food(FoodUsed(FoodAmount)).Y = Food(FoodUsed(Lop)).Y - Int(Rnd * EvolutionRate)
  If Food(FoodUsed(FoodAmount)).Y < 1 Then Food(FoodUsed(FoodAmount)).Y = 1
 End If

End Sub




Private Sub SortSpiderList()
Lop1 = 0
For Lop = 1 To SpiderAmount
 Lop1 = Lop1 + 1
 If SpiderUsed(Lop1) = 0 Then Lop1 = Lop1 + 1
 SpiderUsed(Lop) = SpiderUsed(Lop1)
Next Lop
End Sub


Private Sub SortAntList()
Lop1 = 0
For Lop = 1 To AntAmount
 Lop1 = Lop1 + 1
 If AntUsed(Lop1) = 0 Then Lop1 = Lop1 + 1
 If Lop1 > 1001 Then Lop1 = 1001
 AntUsed(Lop) = AntUsed(Lop1)
Next Lop
End Sub

Private Sub SortFoodList()
Lop1 = 0
For Lop = 1 To FoodAmount
 Lop1 = Lop1 + 1
 If FoodUsed(Lop1) = 0 Then Lop1 = Lop1 + 1
 FoodUsed(Lop) = FoodUsed(Lop1)
Next Lop
End Sub


Private Sub UpdateDisplay()

 For Lop = 1 To FoodAmount ' ant food
  X = Food(FoodUsed(Lop)).X
  Y = Food(FoodUsed(Lop)).Y
  Colour = Food(FoodUsed(Lop)).Colour
  Life = Food(FoodUsed(Lop)).Life
  display.FillStyle = 0
  display.FillColor = RGB(0, Colour, 0)
  display.Circle (X, Y), Int(Life / 100), RGB(0, Colour, 0)
  FoodRECT(Lop).Left = X - Abs(Colour - Habitat.Colour) / 30
  FoodRECT(Lop).Top = Y - Abs(Colour - Habitat.Colour) / 30
  FoodRECT(Lop).Right = X + Abs(Colour - Habitat.Colour) / 30
  FoodRECT(Lop).Bottom = Y + Abs(Colour - Habitat.Colour) / 30
  display.FillStyle = 1
  display.Line (FoodRECT(Lop).Left, FoodRECT(Lop).Top)-(FoodRECT(Lop).Right, FoodRECT(Lop).Bottom), RGB(0, Colour, 0), B
 Next Lop
 For Lop = 1 To AntLionAmount ' antlions
  X = AntLions(AntLionUsed(Lop)).X
  Y = AntLions(AntLionUsed(Lop)).Y
  Colour = AntLions(AntLionUsed(Lop)).Colour
  Strength = AntLions(AntLionUsed(Lop)).Strength
  Colour = AntLions(AntLionUsed(Lop)).Colour
  Life = Food(FoodUsed(Lop)).Life
  display.FillStyle = 0
  display.FillColor = RGB(Colour, 0, Colour)
  display.Circle (X, Y), Int(Strength / 100), RGB(Colour, 0, Colour)
  AntLionRECT(Lop).Left = X - Colour / 20
  AntLionRECT(Lop).Top = Y - Colour / 20
  AntLionRECT(Lop).Right = X + Colour / 20
  AntLionRECT(Lop).Bottom = Y + Colour / 20
  display.FillStyle = 1
  display.Line (AntLionRECT(Lop).Left, AntLionRECT(Lop).Top)-(AntLionRECT(Lop).Right, AntLionRECT(Lop).Bottom), RGB(Colour, 0, Colour), B
 Next Lop

For Lop = 1 To AntAmount 'ants
 X = Ants(AntUsed(Lop)).X
 Y = Ants(AntUsed(Lop)).Y
 Colour = Ants(AntUsed(Lop)).Colour
 Sight = Ants(AntUsed(Lop)).Sight
 Colour = Ants(AntUsed(Lop)).Colour
 Life = Ants(AntUsed(Lop)).Life
 display.FillStyle = 0
 display.FillColor = RGB(0, 0, Colour)
 display.Circle (X, Y), Int(Sight / 100), RGB(0, 0, Colour)
 AntSightRECT(Lop).Left = X - Sight / 40
 AntSightRECT(Lop).Top = Y - Sight / 40
 AntSightRECT(Lop).Right = X + Sight / 40
 AntSightRECT(Lop).Bottom = Y + Sight / 40
 
 AntRECT(Lop).Left = X - Abs(Colour - Habitat.Colour) / 30
 AntRECT(Lop).Top = Y - Abs(Colour - Habitat.Colour) / 30
 AntRECT(Lop).Right = X + Abs(Colour - Habitat.Colour) / 30
 AntRECT(Lop).Bottom = Y + Abs(Colour - Habitat.Colour) / 30

 display.FillStyle = 1
 display.Line (AntSightRECT(Lop).Left, AntSightRECT(Lop).Top)-(AntSightRECT(Lop).Right, AntSightRECT(Lop).Bottom), RGB(0, 0, Colour), B
 display.Line (AntRECT(Lop).Left, AntRECT(Lop).Top)-(AntRECT(Lop).Right, AntRECT(Lop).Bottom), RGB(0, 0, Colour), B
 Ants(AntUsed(Lop)).Life = Ants(AntUsed(Lop)).Life - 0.01
 If Life <= 0 Then
  AntUsed(Lop) = 0
  AntOpen(Lop) = 0
 End If
Next Lop
For Lop = 1 To SpiderAmount ' spiders
 X = Spiders(SpiderUsed(Lop)).X
 Y = Spiders(SpiderUsed(Lop)).Y
 Colour = Spiders(SpiderUsed(Lop)).Colour
 Sight = Spiders(SpiderUsed(Lop)).Sight
 Colour = Spiders(SpiderUsed(Lop)).Colour
 Life = Spiders(SpiderUsed(Lop)).Life
 display.FillStyle = 0
 display.FillColor = RGB(Colour, Colour, 0)
 display.Circle (X, Y), Int(Sight / 100), RGB(Colour, Colour, 0)
 SpiderSightRECT(Lop).Left = X - Sight / 40
 SpiderSightRECT(Lop).Top = Y - Sight / 40
 SpiderSightRECT(Lop).Right = X + Sight / 40
 SpiderSightRECT(Lop).Bottom = Y + Sight / 40
 
 SpiderRECT(Lop).Left = X - Colour / 30
 SpiderRECT(Lop).Top = Y - Colour / 30
 SpiderRECT(Lop).Right = X + Colour / 30
 SpiderRECT(Lop).Bottom = Y + Colour / 30

 display.FillStyle = 1
 display.Line (SpiderSightRECT(Lop).Left, SpiderSightRECT(Lop).Top)-(SpiderSightRECT(Lop).Right, SpiderSightRECT(Lop).Bottom), RGB(Colour, Colour, 0), B
Next Lop
Form1.Picture = display.Image
display.Cls
Text1 = AntAmount
Text2 = SpiderAmount
Text3 = AntLionAmount
Text4 = FoodAmount
Text6 = Cycles
End Sub

Private Sub Command1_Click()
 SpiderAmount = SpiderAmount + 1
 Spiders(SpiderAmount).Colour = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).Strength = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).Speed = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).Sight = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).Life = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).Reproduce = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).X = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).Y = Int(Rnd * 255) + 1
 Spiders(SpiderAmount).Direction = Int(Rnd * 5)
 SpiderUsed(SpiderAmount) = SpiderAmount
End Sub

Private Sub Command2_Click()
If Command2.Caption = "||" Then
 Timer1.Interval = 0
 Timer2.Interval = 0
 Command2.Caption = "|>"
Else
 Timer1.Interval = UpdateCount
 Timer2.Interval = 1
 Command2.Caption = "||"
End If
End Sub

Private Sub Command3_Click()
 AntLionAmount = AntLionAmount + 1
 AntLions(AntLionAmount).Colour = Int(Rnd * 255) + 1
 AntLions(AntLionAmount).Strength = Int(Rnd * 255) + 1
 AntLions(AntLionAmount).Size = Int(Rnd * 255) + 1
 AntLions(AntLionAmount).Life = Int(Rnd * 255) + 1
 AntLions(AntLionAmount).Reproduce = Int(Rnd * 255) + 1
 AntLions(AntLionAmount).X = Int(Rnd * 255) + 1
 AntLions(AntLionAmount).Y = Int(Rnd * 255) + 1
 AntLionUsed(AntLionAmount) = AntLionAmount
End Sub

Private Sub Command4_Click()
 AntAmount = AntAmount + 1
 Ants(AntAmount).Colour = Int(Rnd * 255) + 1
 Ants(AntAmount).Strength = Int(Rnd * 255) + 1
 Ants(AntAmount).Speed = Int(Rnd * 255) + 1
 Ants(AntAmount).Sight = Int(Rnd * 255) + 1
 Ants(AntAmount).Life = Int(Rnd * 255) + 1
 Ants(AntAmount).Reproduce = Int(Rnd * 255) + 1
 Ants(AntAmount).X = Int(Rnd * 255) + 1
 Ants(AntAmount).Y = Int(Rnd * 255) + 1
 Ants(AntAmount).Direction = Int(Rnd * 5)
 AntUsed(AntAmount) = AntAmount
End Sub


Private Sub Command5_Click()
 FoodAmount = FoodAmount + 1
 Food(FoodAmount).Colour = Int(Rnd * 255) + 1
 Food(FoodAmount).Life = Int(Rnd * 255) + 1
 Food(FoodAmount).Reproduce = Int(Rnd * 255) + 1
 Food(FoodAmount).X = Int(Rnd * 255) + 1
 Food(FoodAmount).Y = Int(Rnd * 255) + 1
 FoodUsed(FoodAmount) = FoodAmount
End Sub


Private Sub Command6_Click()
Label1.Caption = "Click one of the add buttons if a species goes extinct."
MsgBox "The green are ant Food the blue are Ants the Yellow are Spiders and the Purple are Antlions.  The Antlions eat everything that comes near them, the spiders eat the ants, and the Ants eat the food, (the food doesn't eat).  The boxes around them are certain attributes on the food the boxes represent how close the food matches it's habitat (the backround), on ants and spiders it is there sight, ants also adapt to match the habitat so the spiders can't find them, the Antlions is colour (in a newer version the prey will run from its preditor when it see's it).  The object is to see how stable the world remains.  In the first value box is the amount of Ants in the second the amount of spiders in the third the amount of AntLions in the fourth the amount of Food the fifth is currently empty but in the sixth is the number of cycles since the sim was started.", 0, "READ ME"
End Sub

Private Sub Command7_Click()
Label1.Caption = "Programmed by: Jonathan Johnston.      If you find any bugs please report them to: Shadfurman@hotmail.com"
End Sub

Private Sub Form_Load()
AntAmount = 10 'set the initial amount of ants
SpiderAmount = 5 'set the initial amount of spiders
AntLionAmount = 5 'set the init. amount of antlions
FoodAmount = 100 'set the initial amount of food
EvolutionRate = 20 'set the max offset amount from a parents attributes
UpdateCount = 1
End Sub

Private Sub StartButton_Click()
' Placed here is all the init code.

'variables amount of slots open

Randomize Timer
' set attributes
For Lop = 1 To AntAmount
 Ants(Lop).Colour = Int(Rnd * 255) + 1
 Ants(Lop).Strength = Int(Rnd * 255) + 1
 Ants(Lop).Speed = Int(Rnd * 255) + 1
 Ants(Lop).Sight = Int(Rnd * 255) + 1
 Ants(Lop).Life = Int(Rnd * 255) + 1
 Ants(Lop).Reproduce = Int(Rnd * 255) + 1
 Ants(Lop).X = Int(Rnd * 255) + 1
 Ants(Lop).Y = Int(Rnd * 255) + 1
 Ants(Lop).Direction = Int(Rnd * 5)
 AntUsed(Lop) = Lop
Next Lop
For Lop = 1 To SpiderAmount
 Spiders(Lop).Colour = Int(Rnd * 255) + 1
 Spiders(Lop).Strength = Int(Rnd * 255) + 1
 Spiders(Lop).Speed = Int(Rnd * 255) + 1
 Spiders(Lop).Sight = Int(Rnd * 255) + 1
 Spiders(Lop).Life = Int(Rnd * 255) + 1
 Spiders(Lop).Reproduce = Int(Rnd * 255) + 1
 Spiders(Lop).X = Int(Rnd * 255) + 1
 Spiders(Lop).Y = Int(Rnd * 255) + 1
 Spiders(Lop).Direction = Int(Rnd * 5)
 SpiderUsed(Lop) = Lop
Next Lop
For Lop = 1 To AntLionAmount
 AntLions(Lop).Colour = Int(Rnd * 255) + 1
 AntLions(Lop).Strength = Int(Rnd * 255) + 1
 AntLions(Lop).Size = Int(Rnd * 255) + 1
 AntLions(Lop).Life = Int(Rnd * 255) + 1
 AntLions(Lop).Reproduce = Int(Rnd * 255) + 1
 AntLions(Lop).X = Int(Rnd * 255) + 1
 AntLions(Lop).Y = Int(Rnd * 255) + 1
 AntLionUsed(Lop) = Lop
Next Lop
For Lop = 1 To FoodAmount
 Food(Lop).Colour = Int(Rnd * 255) + 1
 Food(Lop).Life = Int(Rnd * 255) + 1
 Food(Lop).Reproduce = Int(Rnd * 255) + 1
 Food(Lop).X = Int(Rnd * 255) + 1
 Food(Lop).Y = Int(Rnd * 255) + 1
 FoodUsed(Lop) = Lop
Next Lop
Habitat.Colour = Int(Rnd * 255) + 1

Timer1.Interval = 2000
Timer2.Interval = 1
StartButton.Visible = False

display.FillStyle = 0
display.BackColor = RGB(Habitat.Colour, Habitat.Colour, Habitat.Colour)
Text7 = UpdateCount
VScroll1.Value = UpdateCount
UpdateDisplay
End Sub


Private Sub Text1_Change()
AntAmount = Text1
End Sub

Private Sub Text1_Click()
Text1 = AntAmount
End Sub


Private Sub Text2_Change()
SpiderAmount = Text2
End Sub


Private Sub Text2_Click()
Text2 = SpiderAmount
End Sub


Private Sub Text3_Change()
AntLionAmount = Text3
End Sub


Private Sub Text3_Click()
Text3 = AntLionAmount
End Sub


Private Sub Text4_Change()
FoodAmount = Text4
End Sub

Private Sub Text4_Click()
Text4 = FoodAmount
End Sub


Private Sub Text5_Change()
EvolutionRate = Text5
End Sub


Private Sub Text5_Click()
Text5 = EvolutionRate
End Sub


Private Sub Text6_Change()
UpdateCount = Text6
End Sub


Private Sub Text6_Click()
Text6 = UpdateCount
End Sub


Private Sub Text7_Click()
Text7 = UpdateCount
End Sub

Private Sub Text7_LostFocus()
UpdateCount = Text7
VScroll1.Value = Text7

End Sub


Private Sub Timer1_Timer()
UpdateDisplay
End Sub



Private Sub Timer2_Timer()
'   ANTS
For Lop = 1 To AntAmount
 ' diminish ant life
 Ants(AntUsed(Lop)).Life = Ants(AntUsed(Lop)).Life - 1
 If Ants(AntUsed(Lop)).Life <= 0 Then
  AntUsed(Lop) = 0
  If AntAmount > 0 Then AntDeathCount = AntDeathCount + 1
 End If
 'move ants
 If Ants(AntUsed(Lop)).Direction = 1 Then
  Ants(AntUsed(Lop)).X = Ants(AntUsed(Lop)).X - Ants(AntUsed(Lop)).Speed / 100
  If Ants(AntUsed(Lop)).X < 1 Then Ants(AntUsed(Lop)).Direction = 4
 End If
 If Ants(AntUsed(Lop)).Direction = 2 Then
  Ants(AntUsed(Lop)).Y = Ants(AntUsed(Lop)).Y - Ants(AntUsed(Lop)).Speed / 100
  If Ants(AntUsed(Lop)).Y < 1 Then Ants(AntUsed(Lop)).Direction = 3
 End If
 If Ants(AntUsed(Lop)).Direction = 3 Then
  Ants(AntUsed(Lop)).Y = Ants(AntUsed(Lop)).Y + Ants(AntUsed(Lop)).Speed / 100
  If Ants(AntUsed(Lop)).Y > 254 Then Ants(AntUsed(Lop)).Direction = 2
 End If
 If Ants(AntUsed(Lop)).Direction = 4 Then
  Ants(AntUsed(Lop)).X = Ants(AntUsed(Lop)).X + Ants(AntUsed(Lop)).Speed / 100
  If Ants(AntUsed(Lop)).X > 254 Then Ants(AntUsed(Lop)).Direction = 1
 End If
 'detect and collect for food
 For Lop1 = 1 To FoodAmount ' detect food
  If IntersectRect(tempRECT, AntSightRECT(AntUsed(Lop)), FoodRECT(FoodUsed(Lop1))) = 1 Then 'detect food
   'head to food
   Direction = 0
   If Ants(AntUsed(Lop)).X < Food(FoodUsed(Lop1)).X Then Ants(AntUsed(Lop)).X = Ants(AntUsed(Lop)).X + Ants(AntUsed(Lop)).Speed / 100
   If Ants(AntUsed(Lop)).Y < Food(FoodUsed(Lop1)).Y Then Ants(AntUsed(Lop)).Y = Ants(AntUsed(Lop)).Y + Ants(AntUsed(Lop)).Speed / 100
   If Ants(AntUsed(Lop)).Y > Food(FoodUsed(Lop1)).Y Then Ants(AntUsed(Lop)).Y = Ants(AntUsed(Lop)).Y - Ants(AntUsed(Lop)).Speed / 100
   If Ants(AntUsed(Lop)).X > Food(FoodUsed(Lop1)).X Then Ants(AntUsed(Lop)).X = Ants(AntUsed(Lop)).X - Ants(AntUsed(Lop)).Speed / 100
   ' detect collision with food
   If Abs(Ants(AntUsed(Lop)).X - Food(FoodUsed(Lop1)).X) <= Ants(AntUsed(Lop)).Speed Then
    If Abs(Ants(AntUsed(Lop)).Y - Food(FoodUsed(Lop1)).Y) <= Ants(AntUsed(Lop)).Speed Then
     Ants(AntUsed(Lop)).Direction = Int(Rnd * 5)
     Ants(AntUsed(Lop)).Life = Ants(AntUsed(Lop)).Life + Food(FoodUsed(Lop1)).Life
     If Ants(AntUsed(Lop)).Life > 255 Then Ants(AntUsed(Lop)).Life = 255
     FoodUsed(Lop1) = 0
     If FoodAmount > 0 Then FoodDeathCount = FoodDeathCount + 1
    End If
   End If
  End If
 Next Lop1
 
 'make baby ants
 If AntAmount < 1000 Then
  If Int(Rnd * Ants(AntUsed(Lop)).Reproduce) > Int(Rnd * 5000) Then
   AntAmount = AntAmount + 1
   NewAnt Lop
  End If
 End If

Next Lop

'       SPIDERS
For Lop = 1 To SpiderAmount
 'diminish spiders life
 Spiders(SpiderUsed(Lop)).Life = Spiders(SpiderUsed(Lop)).Life - 1
 If Spiders(SpiderUsed(Lop)).Life <= 0 Then
  SpiderUsed(Lop) = 0
  If SpiderAmount > 0 Then SpiderDeathCount = SpiderDeathCount + 1
 End If

 'move spiders
 If Spiders(SpiderUsed(Lop)).Direction = 1 Then
  Spiders(SpiderUsed(Lop)).X = Spiders(SpiderUsed(Lop)).X - Spiders(SpiderUsed(Lop)).Speed / 100
  If Spiders(SpiderUsed(Lop)).X < 1 Then Spiders(SpiderUsed(Lop)).Direction = 4
 End If
 If Spiders(SpiderUsed(Lop)).Direction = 2 Then
  Spiders(SpiderUsed(Lop)).Y = Spiders(SpiderUsed(Lop)).Y - Spiders(SpiderUsed(Lop)).Speed / 100
  If Spiders(SpiderUsed(Lop)).Y < 1 Then Spiders(SpiderUsed(Lop)).Direction = 3
 End If
 If Spiders(SpiderUsed(Lop)).Direction = 3 Then
  Spiders(SpiderUsed(Lop)).Y = Spiders(SpiderUsed(Lop)).Y + Spiders(SpiderUsed(Lop)).Speed / 100
  If Spiders(SpiderUsed(Lop)).Y > 254 Then Spiders(SpiderUsed(Lop)).Direction = 2
 End If
 If Spiders(SpiderUsed(Lop)).Direction = 4 Then
  Spiders(SpiderUsed(Lop)).X = Spiders(SpiderUsed(Lop)).X + Spiders(SpiderUsed(Lop)).Speed / 100
  If Spiders(SpiderUsed(Lop)).X > 254 Then Spiders(SpiderUsed(Lop)).Direction = 1
 End If
 
 'detect and consume ants
 For Lop1 = 1 To AntAmount ' detect ant
  If IntersectRect(tempRECT, SpiderSightRECT(SpiderUsed(Lop)), AntRECT(AntUsed(Lop1))) = 1 Then 'detect ants
   'head to ant
   Direction = 0
   If Spiders(SpiderUsed(Lop)).X < Ants(AntUsed(Lop1)).X Then Spiders(SpiderUsed(Lop)).X = Spiders(SpiderUsed(Lop)).X + Spiders(SpiderUsed(Lop)).Speed / 100
   If Spiders(SpiderUsed(Lop)).Y < Ants(AntUsed(Lop1)).Y Then Spiders(SpiderUsed(Lop)).Y = Spiders(SpiderUsed(Lop)).Y + Spiders(SpiderUsed(Lop)).Speed / 100
   If Spiders(SpiderUsed(Lop)).Y > Ants(AntUsed(Lop1)).Y Then Spiders(SpiderUsed(Lop)).Y = Spiders(SpiderUsed(Lop)).Y - Spiders(SpiderUsed(Lop)).Speed / 100
   If Spiders(SpiderUsed(Lop)).X > Ants(AntUsed(Lop1)).X Then Spiders(SpiderUsed(Lop)).X = Spiders(SpiderUsed(Lop)).X - Spiders(SpiderUsed(Lop)).Speed / 100
   ' detect collision with ant
   If Abs(Spiders(SpiderUsed(Lop)).X - Ants(AntUsed(Lop1)).X) <= Spiders(SpiderUsed(Lop)).Speed Then
    If Abs(Spiders(SpiderUsed(Lop)).Y - Ants(AntUsed(Lop1)).Y) <= Spiders(SpiderUsed(Lop)).Speed Then
     Spiders(SpiderUsed(Lop)).Direction = Int(Rnd * 5)
     Spiders(SpiderUsed(Lop)).Life = Spiders(SpiderUsed(Lop)).Life + Ants(AntUsed(Lop1)).Life
     If Spiders(SpiderUsed(Lop)).Life > 255 Then Spiders(SpiderUsed(Lop)).Life = 255
     AntUsed(Lop1) = 0
    End If
   End If
  End If
 Next Lop1
 
 'make baby spiders
 If SpiderAmount < 1000 Then
  If Int(Rnd * Spiders(SpiderUsed(Lop)).Reproduce) > Int(Rnd * 5000) Then
   SpiderAmount = SpiderAmount + 1
   NewSpider Lop
  End If
 End If

Next Lop

For Lop = 1 To FoodAmount ' grow more food
 If FoodAmount < 1000 Then
  If Int(Rnd * Food(FoodUsed(Lop)).Reproduce) > Int(Rnd * 10000) Then
   FoodAmount = FoodAmount + 1
   NewFood Lop
  End If
 End If
Next Lop

For Lop = 1 To AntLionAmount ' make baby antlions
 AntLions(AntLionUsed(Lop)).Life = AntLions(AntLionUsed(Lop)).Life - 1
 If AntLions(AntLionUsed(Lop)).Life <= 0 Then
  AntLionUsed(Lop) = 0
  If AntLionAmount > 0 Then AntLionDeathCount = AntLionDeathCount + 1
 End If
 If AntLionAmount < 1000 Then
  If Int(Rnd * AntLions(AntLionUsed(Lop)).Reproduce) > Int(Rnd * 5000) Then
   AntLionAmount = AntLionAmount + 1
   NewAntLion Lop
  End If
 End If
 For Lop1 = 1 To AntAmount
  If IntersectRect(tempRECT, AntRECT(AntUsed(Lop)), AntLionRECT(FoodUsed(Lop1))) = 1 Then 'detect food
   AntUsed(Lop) = 0
   If AntAmount > 0 Then AntDeathCount = AntDeathCount + 1
  End If
 Next Lop1
 For Lop1 = 1 To SpiderAmount
  If IntersectRect(tempRECT, AntRECT(AntUsed(Lop)), AntLionRECT(FoodUsed(Lop1))) = 1 Then 'detect food
   SpiderUsed(Lop) = 0
   If SpiderAmount > 0 Then SpiderDeathCount = SpiderDeathCount + 1
  End If
 Next Lop1
Next Lop

' resort lists if needed
If AntDeathCount > 0 Then
 AntAmount = AntAmount - AntDeathCount
 AntDeathCount = 0
 SortAntList
End If
If SpiderDeathCount > 0 Then
 SpiderAmount = SpiderAmount - SpiderDeathCount
 SpiderDeathCount = 0
 SortSpiderList
End If
If FoodDeathCount > 0 Then
 FoodAmount = FoodAmount - FoodDeathCount
 FoodDeathCount = 0
 SortFoodList
End If
Cycles = Cycles + 1
'Text5 = Cycles
End Sub

Private Sub VScroll1_Change()
UpdateCount = VScroll1.Value
Text7 = VScroll1.Value
End Sub


