VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MathFunctions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public error As Boolean
Function Cot(ByVal x As Double) As Double
On Error GoTo errr
Cot = 1 / Tan(x)
Exit Function
errr:  error = True
End Function

Function Cosec(ByVal x As Double) As Double
On Error GoTo errr
Cosec = 1 / Sin(x)
Exit Function
errr:  error = True
End Function
Function Sec(ByVal x As Double) As Double
On Error GoTo errr
Sec = 1 / Cos(x)
Exit Function
errr:  error = True
End Function
Function Arcsin(ByVal x As Double) As Double
On Error GoTo errr
Arcsin = Atn(x / Sqr(-x * x + 1))
Exit Function
errr:  error = True
End Function
Function Arccos(ByVal x As Double) As Double
On Error GoTo errr
Arccos = Atn(-x / Sqr(-x * x + 1)) + 2 * Atn(1)
Exit Function
errr:  error = True
End Function
Function ArcSec(ByVal x As Double) As Double
On Error GoTo errr
ArcSec = Atn(x / Sqr(x * x - 1)) + Sgn((x) - 1) * (2 * Atn(1))
Exit Function
errr:  error = True
End Function
Function ArcCosec(ByVal x As Double) As Double
On Error GoTo errr
ArcCosec = Atn(x / Sqr(x * x - 1)) + (Sgn(x) - 1) * (2 * Atn(1))
Exit Function
errr:  error = True
End Function
Function ArcCot(ByVal x As Double) As Double:
ArcCot = Atn(x) + 2 * Atn(1)
End Function
Function Hsin(ByVal x As Double) As Double
On Error GoTo errr
Hsin = (Exp(x) - Exp(-x)) / 2
Exit Function
errr:  error = True
End Function
Function Hcos(ByVal x As Double) As Double
On Error GoTo errr
Hcos = (Exp(x) + Exp(-x)) / 2
Exit Function
errr:  error = True
End Function
Function Htan(ByVal x As Double) As Double
On Error GoTo errr
Htan = (Exp(x) - Exp(-x)) / (Exp(x) + Exp(-x))
Exit Function
errr:  error = True
End Function
Function HSec(ByVal x As Double) As Double
On Error GoTo errr
HSec = 2 / (Exp(x) + Exp(-x))
Exit Function
errr:  error = True
End Function
Function HCosec(ByVal x As Double) As Double
On Error GoTo errr
HCosec = 2 / (Exp(x) - Exp(-x))
Exit Function
errr:  error = True
End Function
Function HCot(ByVal x As Double) As Double
On Error GoTo errr
HCot = (Exp(x) + Exp(-x)) / (Exp(x) - Exp(-x))
Exit Function
errr:  error = True
End Function
Function HArcsin(ByVal x As Double) As Double
On Error GoTo errr
HArcsin = Log(x + Sqr(x * x + 1))
Exit Function
errr:  error = True
End Function
Function HArcCos(ByVal x As Double) As Double
On Error GoTo errr
HArcCos = Log(x + Sqr(x * x - 1))
Exit Function
errr:  error = True
End Function
Function HArctan(ByVal x As Double) As Double
On Error GoTo errr
HArctan = Log(x + Sqr(x * x + 1))
Exit Function
errr:  error = True
End Function
Function HArcsec(ByVal x As Double) As Double
On Error GoTo errr
HArcsec = Log((Sqr(-x * x + 1) + 1) / x)
Exit Function
errr:  error = True
End Function
Function HArcCosec(ByVal x As Double) As Double
On Error GoTo errr
HArcCosec = Log((Sgn(x) * Sqr(x * x + 1) + 1) / x)
Exit Function
errr:  error = True
End Function
Function HArcCot(ByVal x As Double) As Double
On Error GoTo errr
HArcCot = Log((x + 1) / (x - 1)) / 2
Exit Function
errr:  error = True
End Function
Function e() As Double
e = 2.71828182845904
End Function
Function Pi() As Double
Pi = 3.14159265358979
End Function
Function Frac(ByVal x As Double) As Double
Frac = x - Int(x)
End Function
Function LogN(ByVal B As Double, ByVal r As Double) As Double
On Error GoTo errr
LogN = Log(B) / Log(r)
Exit Function
errr:  error = True
End Function

