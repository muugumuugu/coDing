VERSION 5.00
Begin VB.Form Form2 
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000009&
   Caption         =   "Explanation"
   ClientHeight    =   3360
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6885
   ForeColor       =   &H00FF0000&
   LinkTopic       =   "Form2"
   ScaleHeight     =   3360
   ScaleWidth      =   6885
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
Dim t As String
t = "Lorentz Chaos Differential equations" & vbCr
t = t & "           ---------------" & vbCr
t = t & "This program lets you play with the Lorentz differential equations" & vbCr
t = t & "so that you can experience that a minute change in de starting" & vbCr
t = t & "can cause unpredictable changes in the endresult."
t = t & "Because the figure is  3-dimensional, you can rotate the figure in space" & vbCr
t = t & "with the larger scrollbar at the bottom"
t = t & vbCr
t = t & "With the other scrollbars you can change:" & vbCr
t = t & "  1) The starting values for the iterations." & vbCr
t = t & "  2) The parameters R, S and B of the differential equations."
t = t & "Some values give one attractor, other give two attractors." & vbCr
t = t & "These equations lay at the basis of 'the butterfly hypothesis' :" & vbCr
t = t & "A butterfly flapping his wings in Argentina, can cause a hurricane in the USA!" & vbCr
t = t & "and the graphical solution resembles a butterfly too..." & vbCr
t = t & vbCr & "Have fun!!!" & vbCr
t = t & vbCr & "by Christine Daniels"
Print t

End Sub


