Attribute VB_Name = "Module1"
Declare Function IntersectRect Lib "user32" (lpDestRect As RECT, lpSrc1Rect As RECT, lpSrc2Rect As RECT) As Long

Public Type Settings
 Colour As Integer
End Type
Public Type Ant
 Colour As Integer
 Strength As Integer
 Speed As Integer
 Sight As Integer
 Life As Single
 Reproduce As Integer
 X As Single
 Y As Single
 Direction As Byte
End Type
Public Type Spider
 Colour As Integer
 Strength As Integer
 Speed As Integer
 Sight As Integer
 Life As Single
 Reproduce As Integer
 X As Single
 Y As Single
 Direction As Byte
End Type
Public Type AntLion
 Colour As Integer
 Strength As Integer
 Size As Integer
 Life As Single
 Reproduce As Integer
 X As Single
 Y As Single
End Type
Public Type AntFood
 Colour As Integer
 Life As Single
 Reproduce As Integer
 X As Single
 Y As Single
End Type
Public Type RECT
 Left As Long
 Top As Long
 Right As Long
 Bottom As Long
End Type

Public Habitat As Settings
Public Ants(1001) As Ant
Public Spiders(1001) As Spider
Public AntLions(1001) As AntLion
Public Food(1001) As AntFood

Public AntOpen(1001) As Integer
Public AntOpenLength As Long
Public SpiderOpen(1001) As Integer
Public SpiderOpenLength As Long
Public AntLionOpen(1001) As Integer
Public AntLionOpenLength As Long
Public FoodOpen(1001) As Integer
Public FoodOpenLength As Long

Public AntUsed(1101) As Integer
Public SpiderUsed(1101) As Integer
Public AntLionUsed(1101) As Integer
Public FoodUsed(1101) As Integer
Public tempSortList(1101) As Integer

Public AntSightRECT(1001) As RECT
Public SpiderSightRECT(1001) As RECT
Public AntRECT(1001) As RECT
Public SpiderRECT(1001) As RECT
Public AntLionRECT(1001) As RECT
Public FoodRECT(1001) As RECT

Public tempRECT As RECT

Public AntAmount As Integer
Public SpiderAmount As Integer
Public AntLionAmount As Integer
Public FoodAmount As Integer
Public FoodUpdate As Byte
Public AntLionUpdate As Byte
Public EvolutionRate As Byte
Public SpiderDeathCount As Long
Public AntDeathCount As Long
Public FoodDeathCount As Long
Public AntLionDeathCount As Long
Public Cycles As Long
Public UpdateCount As Integer


