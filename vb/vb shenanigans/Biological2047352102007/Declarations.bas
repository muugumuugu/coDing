Attribute VB_Name = "Declarations"

'API calls
'--standard blitting, faster than VB's internal PaintPicture method
Public Declare Function BitBlt Lib "gdi32" (ByVal hDstDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
'--for faster pixel setting (than VB's internal PSet and Point methods)
Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Public Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Byte


'Size of the map
Public Const WORLDWIDTH As Long = 499
Public Const WORLDHEIGHT As Long = 499

'Amount of food to generate every round
Public foodGen As Long
'How much energy the food grants
Public foodWorth As Long
'Default starting energy
Public startEnergy As Long
'Regenerate food every (x) number of turns
Public foodRegen As Long

'Mutation values
'Whether or not to allow replication
Public toMultiply As Boolean
'How many turns before organisms are allowed to replicate/reproduce
Public mutateTurns As Long
'How many potential mutations to cause at replication
Public numOfMutations As Long

'Amount of creatures to start with
Public InitialCreatures As Long

'Array of food
Public Food() As Long

'Drawing variables
Public drawDeadCreatures As Boolean

'Standard variables
Public i As Long, j As Long
Public x As Long, y As Long
