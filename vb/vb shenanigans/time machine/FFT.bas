Attribute VB_Name = "FFT"
Option Explicit

Public DevHandle As Long
Public InData(0 To 511) As Byte
Public Stro(0 To 255) As Stereo
Public FFTStro(0 To 255) As FFTStereo
Public Inited As Boolean
Public MinHeight As Long, MinWidth As Long

Public Type WaveFormatEx
    FormatTag As Integer
    Channels As Integer
    SamplesPerSec As Long
    AvgBytesPerSec As Long
    BlockAlign As Integer
    BitsPerSample As Integer
    ExtraDataSize As Integer
End Type

Public Type WaveHdr
    lpData As Long
    dwBufferLength As Long
    dwBytesRecorded As Long
    dwUser As Long
    dwFlags As Long
    dwLoops As Long
    lpNext As Long
    Reserved As Long
End Type

Public Type WAVEINCAPS
    ManufacturerID As Integer
    ProductID As Integer
    DriverVersion As Long
    ProductName(1 To 32) As Byte
    Formats As Long
    Channels As Integer
    Reserved As Integer
End Type




Public Declare Function waveInAddBuffer Lib "winmm" (ByVal InputDeviceHandle As Long, ByVal WaveHdrPointer As Long, ByVal WaveHdrStructSize As Long) As Long
Public Declare Function waveInPrepareHeader Lib "winmm" (ByVal InputDeviceHandle As Long, ByVal WaveHdrPointer As Long, ByVal WaveHdrStructSize As Long) As Long
Public Declare Function waveInUnprepareHeader Lib "winmm" (ByVal InputDeviceHandle As Long, ByVal WaveHdrPointer As Long, ByVal WaveHdrStructSize As Long) As Long

Public Declare Function waveInGetNumDevs Lib "winmm" () As Long
Public Declare Function waveInGetDevCaps Lib "winmm" Alias "waveInGetDevCapsA" (ByVal uDeviceID As Long, ByVal WaveInCapsPointer As Long, ByVal WaveInCapsStructSize As Long) As Long

Public Declare Function waveInOpen Lib "winmm" (WaveDeviceInputHandle As Long, ByVal WhichDevice As Long, ByVal WaveFormatExPointer As Long, ByVal CallBack As Long, ByVal CallBackInstance As Long, ByVal Flags As Long) As Long
Public Declare Function waveInClose Lib "winmm" (ByVal WaveDeviceInputHandle As Long) As Long

Public Declare Function waveInStart Lib "winmm" (ByVal WaveDeviceInputHandle As Long) As Long
Public Declare Function waveInReset Lib "winmm" (ByVal WaveDeviceInputHandle As Long) As Long
Public Declare Function waveInStop Lib "winmm" (ByVal WaveDeviceInputHandle As Long) As Long

Type Stereo
    L As Integer
    R As Integer
End Type

Type FFTStereo
    L As Single
    R As Single
End Type

 
Private Const angelNumerator# = 6.283185307179
Private Const NumSamples& = 256
Private Const NumBits& = 8
Private ReversedBits&(0 To NumSamples - 1)

Private ImagOut(0 To NumSamples - 1) As FFTStereo, iScale!(511)
Private i&, j&, k&, n&, BlockSize&, BlockEnd&, Fl&
Private TR!, TI!, AR!, AI!, Deltaangel#, DeltaAr#, Alpha#, Beta#
Private ii&, iii&, jj As Byte, Rev&
 
Private tmp As Double, tmp2 As Double, tmp3 As Double, Xx As Double, xScale As Double, xl As Double, xr As Double
Private K1 As Double, SumFreq As Double

Public Sub FFTAudio(RealIn() As Stereo, RealOut() As FFTStereo)

  If Fl = 0 Then
    Fl = 1
    For ii = LBound(ReversedBits) To UBound(ReversedBits)
      iii = ii: Rev = 0
      For jj = 0 To NumBits - 1
        Rev = (Rev * 2) Or (iii And 1): iii = iii \ 2
      Next jj
      ReversedBits(ii) = Rev
    Next ii
    For i = 0 To 511: iScale(i) = (1 + (i ^ 1.2) / 80): Next
  End If

  For i = 0 To (NumSamples - 1)
    j = ReversedBits(i)
    RealOut(j).L = RealIn(i).L
    RealOut(j).R = RealIn(i).R
  Next i
  Erase ImagOut: BlockEnd = 1: BlockSize = 2

  Do While BlockSize <= NumSamples
    
    Deltaangel = angelNumerator / BlockSize
    Alpha = Sin(0.5 * Deltaangel)
    Alpha = 2# * Alpha * Alpha
    Beta = Sin(Deltaangel)

    For i = 0 To NumSamples - 1 Step BlockSize
      AR = 1!: AI = 0!
      For j = i To i + BlockEnd - 1
        k = j + BlockEnd
        'Left
        TR = AR * RealOut(k).L - AI * ImagOut(k).L
        TI = AI * RealOut(k).L + AR * ImagOut(k).L
        RealOut(k).L = RealOut(j).L - TR: RealOut(j).L = RealOut(j).L + TR
        ImagOut(k).L = ImagOut(j).L - TI: ImagOut(j).L = ImagOut(j).L + TI
        'Right
        TR = AR * RealOut(k).R - AI * ImagOut(k).R
        TI = AI * RealOut(k).R + AR * ImagOut(k).R
        RealOut(k).R = RealOut(j).R - TR: RealOut(j).R = RealOut(j).R + TR
        ImagOut(k).R = ImagOut(j).R - TI: ImagOut(j).R = ImagOut(j).R + TI

        DeltaAr = Alpha * AR + Beta * AI
        AI = AI - (Alpha * AI - Beta * AR)
        AR = AR - DeltaAr
      Next j
    Next i

    BlockEnd = BlockSize
    BlockSize = BlockSize * 2
  
  Loop
  
  For i = 0 To 255
    With RealOut(i)
      .L = iScale(i) * (.L * .L + RealOut(255 - i).L * RealOut(255 - i).L)
      .R = iScale(i) * (.R * .R + RealOut(255 - i).R * RealOut(255 - i).R)
    End With
  Next i

End Sub


Public Sub DrawFFT()
    xScale = 1 / 11111

    Xx = 0
    For i = 1 To 23
        xl = 0: xr = 0
          For j = 1 To CLng(1.194 ^ i)
                With FFTStro(Xx)
                  xl = xl + .L: xr = xr + .R
                End With
                If Xx < 255 Then Xx = Xx + 1
          Next j
          If i <> 1 And i < 18 Then
                FFtL(i - 1) = CDbl(Sqr(xl * xScale))
                FFtR(i - 1) = CDbl(Sqr(xr * xScale))
                frmBase.PicFFT.Line (2 + i, 70)-(2 + i, 70 - FFtL(i - 1)), vbWhite Or ColVGr + FFtL(i - 1) * 2 'Xor (260 * FFtL(i - 1))
                frmBase.PicFFT.Line (39 - i, 70)-(39 - i, 70 - FFtR(i - 1)), vbWhite Or ColVGr + FFtR(i - 1) * 2 'Xor (260 * FFtR(i - 1))
                
                frmBase.PicFFT.Line (2 + i, 72)-(2 + i, 72 + FFtL(i - 1) / 3), vbWhite And ColVGr + FFtL(i - 1) * 2 'Xor (260 * FFtL(i - 1))
                frmBase.PicFFT.Line (39 - i, 72)-(39 - i, 72 + FFtR(i - 1) / 3), vbWhite And ColVGr + FFtR(i - 1) * 2 'Xor (260 * FFtR(i - 1))
          End If
    Next i

 ''''''''''''''''''''''''''''''''''''''''''''''''''
    LBass = Bass
    LMidl = Midl
    LTreb = Treb
    LFreq = Freq
    
    Bass = 0: BassL = 0: BassR = 0
    Midl = 0: MidlL = 0: MidlR = 0
    Treb = 0: TrebL = 0: TrebR = 0
    Freq = 0: FreqL = 0: FreqR = 0
 '''''''''''''''

        For i = 1 To 16
            FreqL = FreqL + FFtL(i)    'Sum left Freq
            FreqR = FreqR + FFtR(i)    'Sum Right Freq
            Freq = Freq + ((FFtL(i) + FFtR(i)) * 0.5)
        Next i
    FreqL = FreqL / 16
    FreqR = FreqR / 16
    Freq = Freq / 16
            
 ''''''''''''''''
        For i = 1 To 3
            BassL = BassL + FFtL(i)
            BassR = BassR + FFtR(i)
        Next i
    BassL = BassL / 3
    BassR = BassR / 3
    Bass = (BassL + BassR) / 2
 '''''''''''''''
        For i = 4 To 11
            MidlL = MidlL + FFtL(i)
            MidlR = MidlR + FFtR(i)
        Next i
    MidlL = MidlL / 8
    MidlR = MidlR / 8
    Midl = (MidlL + MidlR) / 2
 '''''''''''''''
        For i = 12 To 16
            TrebL = TrebL + FFtL(i)
            TrebR = TrebR + FFtR(i)
        Next i
    TrebL = TrebL / 5
    TrebR = TrebR / 5
    Treb = (TrebR + TrebL) / 2
 '''''''''''''''
   
    SumFreq = (Bass + Midl + Treb) + 1

    K1 = (100 * (1 / SumFreq))
    Bass = (Bass) * K1
    Midl = (Midl) * K1
    Treb = (Treb) * K1
    BassL = (BassL) * K1
    MidlL = (MidlL) * K1
    TrebL = (TrebL) * K1
    BassR = (BassR) * K1
    MidlR = (MidlR) * K1
    TrebR = (TrebR) * K1
    
    ABass = ((ABass) + Bass) / 2
    AMidl = ((AMidl) + Midl) / 2
    ATreb = ((ATreb) + Treb) / 2
    AFreq = (ABass + AMidl + ATreb) / 3
    

End Sub



