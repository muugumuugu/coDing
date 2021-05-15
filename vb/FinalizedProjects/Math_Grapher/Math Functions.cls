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
Option Explicit
Public Error As Boolean
Function Cot(ByVal x As Double) As Double
On Error GoTo errr
Cot = 1 / Tan(x)
Exit Function
errr:  Error = True
End Function

Function Csc(ByVal x As Double) As Double
On Error GoTo errr
Csc = 1 / Sin(x)
Exit Function
errr:  Error = True
End Function
Function Sec(ByVal x As Double) As Double
On Error GoTo errr
Sec = 1 / Cos(x)
Exit Function
errr:  Error = True
End Function
Function Asin(ByVal x As Double) As Double
On Error GoTo errr
Asin = Atn(x / Sqr(-x * x + 1))
Exit Function
errr:  Error = True
End Function
Function Acos(ByVal x As Double) As Double
On Error GoTo errr
Acos = Atn(-x / Sqr(-x * x + 1)) + 2 * Atn(1)
Exit Function
errr:  Error = True
End Function
Function ASec(ByVal x As Double) As Double
On Error GoTo errr
ASec = Atn(x / Sqr(x * x - 1)) + Sgn((x) - 1) * (2 * Atn(1))
Exit Function
errr:  Error = True
End Function
Function ACsc(ByVal x As Double) As Double
On Error GoTo errr
ACsc = Atn(x / Sqr(x * x - 1)) + (Sgn(x) - 1) * (2 * Atn(1))
Exit Function
errr:  Error = True
End Function
Function ACot(ByVal x As Double) As Double:
ACot = Atn(x) + 2 * Atn(1)
End Function
Function Atan(ByVal x As Double) As Double:
Atan = Atn(x)
End Function
Function sinh(ByVal x As Double) As Double
On Error GoTo errr
sinh = (Exp(x) - Exp(-x)) / 2
Exit Function
errr:  Error = True
End Function
Function cosh(ByVal x As Double) As Double
On Error GoTo errr
cosh = (Exp(x) + Exp(-x)) / 2
Exit Function
errr:  Error = True
End Function
Function tanh(ByVal x As Double) As Double
On Error GoTo errr
tanh = (Exp(x) - Exp(-x)) / (Exp(x) + Exp(-x))
Exit Function
errr:  Error = True
End Function
Function Sech(ByVal x As Double) As Double
On Error GoTo errr
Sech = 2 / (Exp(x) + Exp(-x))
Exit Function
errr:  Error = True
End Function
Function Csch(ByVal x As Double) As Double
On Error GoTo errr
Csch = 2 / (Exp(x) - Exp(-x))
Exit Function
errr:  Error = True
End Function
Function Coth(ByVal x As Double) As Double
On Error GoTo errr
Coth = (Exp(x) + Exp(-x)) / (Exp(x) - Exp(-x))
Exit Function
errr:  Error = True
End Function
Function Asinh(ByVal x As Double) As Double
On Error GoTo errr
Asinh = Log(x + Sqr(x * x + 1))
Exit Function
errr:  Error = True
End Function
Function ACosh(ByVal x As Double) As Double
On Error GoTo errr
ACosh = Log(x + Sqr(x * x - 1))
Exit Function
errr:  Error = True
End Function
Function Atanh(ByVal x As Double) As Double
On Error GoTo errr
Atanh = Log(x + Sqr(x * x + 1))
Exit Function
errr:  Error = True
End Function
Function Asech(ByVal x As Double) As Double
On Error GoTo errr
Asech = Log((Sqr(-x * x + 1) + 1) / x)
Exit Function
errr:  Error = True
End Function
Function ACsch(ByVal x As Double) As Double
On Error GoTo errr
ACsch = Log((Sgn(x) * Sqr(x * x + 1) + 1) / x)
Exit Function
errr:  Error = True
End Function
Function ACoth(ByVal x As Double) As Double
On Error GoTo errr
ACoth = Log((x + 1) / (x - 1)) / 2
Exit Function
errr:  Error = True
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
Function LogN(ByVal r As Double, ByVal b As Double) As Double
On Error GoTo errr
LogN = Log(b) / Log(r)
Exit Function
errr:  Error = True
End Function
Function Lg(ByVal x As Double) As Double
On Error GoTo errr
Lg = Log(x) / Log(10)
Exit Function
errr:  Error = True
End Function
Function Ln(ByVal x As Double) As Double
On Error GoTo errr
Ln = Log(x)
Exit Function
errr:  Error = True
End Function

