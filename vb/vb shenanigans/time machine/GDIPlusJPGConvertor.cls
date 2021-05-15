VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GDIPlusJPGConvertor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Type BITMAPINFOHEADER
   biSize As Long
   biWidth As Long
   biHeight As Long
   biPlanes As Integer
   biBitCount As Integer
   biCompression As Long
   biSizeImage As Long
   biXPelsPerMeter As Long
   biYPelsPerMeter As Long
   biClrUsed As Long
   biClrImportant As Long
End Type

Private Type RGBQUAD
   B As Byte
   G As Byte
   R As Byte
   A As Byte
End Type

Private Type BITMAPINFO
   bmiHeader As BITMAPINFOHEADER
   bmiColors As RGBQUAD
End Type

Private Type GdiplusStartupInput
   GdiplusVersion           As Long
   DebugEventCallback       As Long
   SuppressBackgroundThread As Long
   SuppressExternalCodecs   As Long
End Type

Private Type CLSID
   Data1         As Long
   Data2         As Integer
   Data3         As Integer
   Data4(0 To 7) As Byte
End Type

Private Enum EncoderParameterValueType
   [EncoderParameterValueTypeByte] = 1
   [EncoderParameterValueTypeASCII] = 2
   [EncoderParameterValueTypeShort] = 3
   [EncoderParameterValueTypeLong] = 4
   [EncoderParameterValueTypeRational] = 5
   [EncoderParameterValueTypeLongRange] = 6
   [EncoderParameterValueTypeUndefined] = 7
   [EncoderParameterValueTypeRationalRange] = 8
End Enum

Private Type EncoderParameter
   GUID           As CLSID
   NumberOfValues As Long
   Type           As EncoderParameterValueType
   Value          As Long
End Type

Private Type EncoderParameters
   count     As Long
   Parameter As EncoderParameter
End Type

Private Enum GpStatus
   [OK] = 0
   [GenericError] = 1
   [InvalidParameter] = 2
   [OutOfMemory] = 3
   [ObjectBusy] = 4
   [InsufficientBuffer] = 5
   [NotImplemented] = 6
   [Win32Error] = 7
   [WrongState] = 8
   [Aborted] = 9
   [FileNotFound] = 10
   [ValueOverflow ] = 11
   [AccessDenied] = 12
   [UnknownImageFormat] = 13
   [FontFamilyNotFound] = 14
   [FontStyleNotFound] = 15
   [NotTrueTypeFont] = 16
   [UnsupportedGdiplusVersion] = 17
   [GdiplusNotInitialized ] = 18
   [PropertyNotFound] = 19
   [PropertyNotSupported] = 20
End Enum

Private Type ImageCodecInfo
    ClassID           As CLSID
    FormatID          As CLSID
    CodecName         As Long
    DllName           As Long
    FormatDescription As Long
    FilenameExtension As Long
    MimeType          As Long
    flags             As Long
    Version           As Long
    SigCount          As Long
    SigSize           As Long
    SigPattern        As Long
    SigMask           As Long
End Type

Private Declare Function GdipCreateBitmapFromGdiDib Lib "gdiplus" _
(gdiBitmapInfo As BITMAPINFO, gdiBitmapData As Any, Bitmap As Long) As GpStatus

Private Declare Function GdiplusStartup Lib "gdiplus" (token As Long, inputbuf As GdiplusStartupInput, Optional ByVal outputbuf As Long = 0) As GpStatus
Private Declare Function GdiplusShutdown Lib "gdiplus" (ByVal token As Long) As GpStatus
Private Declare Function GdipSaveImageToFile Lib "gdiplus" (ByVal image As Long, ByVal FileName As String, clsidEncoder As CLSID, encoderParams As Any) As GpStatus
Private Declare Function GdipGetImageEncodersSize Lib "gdiplus" (numEncoders As Long, Size As Long) As GpStatus
Private Declare Function GdipGetImageEncoders Lib "gdiplus" (ByVal numEncoders As Long, ByVal Size As Long, encoders As Any) As GpStatus
Private Declare Function GdipDisposeImage Lib "gdiplus" (ByVal image As Long) As GpStatus
Private Declare Function CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal cb As Long) As Long
Private Declare Function CLSIDFromString Lib "ole32" (ByVal lpszProgID As Long, pCLSID As CLSID) As Long
Private Declare Function lstrlenW Lib "kernel32" (ByVal psString As Any) As Long
Private Const EncoderQuality As String = "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}"
Private GdIHandle As Long

Public Sub SaveDIB(picW As Long, picH As Long, PtrToDIB As Long, destFilename As String, JPGQuality As Long)
'PtrToDIB = DIBPtr
'picW   = picWidth
'picH   = picHeight
Dim uHeader    As BITMAPINFOHEADER
Dim uInfo      As BITMAPINFO
Dim gplRet     As Long
Dim hImg       As Long
Dim uEncCLSID  As CLSID
Dim uEncParams As EncoderParameters
Dim hBmp As Long
   
   '-- Prepare struct
   With uInfo.bmiHeader
       .biSize = Len(uInfo.bmiHeader)
       .biPlanes = 1
       .biBitCount = 32
       .biWidth = picW
       .biHeight = picH
   End With
   
   '-- Create bitmap from DIB
   gplRet = GdipCreateBitmapFromGdiDib(uInfo, ByVal PtrToDIB, hImg)
    
   GetEncoderClsID "image/jpeg", uEncCLSID
   uEncParams.count = 1
   With uEncParams.Parameter
       .NumberOfValues = 1
       .Type = [EncoderParameterValueTypeLong]
       .GUID = DEFINE_GUID(EncoderQuality)
       .Value = VarPtr(JPGQuality)
   End With
   gplRet = GdipSaveImageToFile(hImg, StrConv(destFilename, vbUnicode), uEncCLSID, uEncParams)
   gplRet = GdipDisposeImage(hImg)
End Sub

Private Function DEFINE_GUID(ByVal sGuid As String) As CLSID
    Call CLSIDFromString(StrPtr(sGuid), DEFINE_GUID)
End Function

Private Function GetEncoderClsID(strMimeType As String, ClassID As CLSID)
    Dim Num As Long, Size As Long, i As Long
    Dim ICI()    As ImageCodecInfo
    Dim Buffer() As Byte
    GetEncoderClsID = -1
    Call GdipGetImageEncodersSize(Num, Size)
    If (Size = 0) Then Exit Function
    ReDim ICI(1 To Num) As ImageCodecInfo
    ReDim Buffer(1 To Size) As Byte
    Call GdipGetImageEncoders(Num, Size, Buffer(1))
    Call CopyMemory(ICI(1), Buffer(1), (Len(ICI(1)) * Num))
    For i = 1 To Num
        If (StrComp(PtrToStrW(ICI(i).MimeType), strMimeType, vbTextCompare) = 0) Then
            ClassID = ICI(i).ClassID
            GetEncoderClsID = i
            Exit For
        End If
    Next
    Erase ICI
    Erase Buffer
End Function

Private Function PtrToStrW(ByVal lpsz As Long) As String
    Dim sOut As String
    Dim lLen As Long
    lLen = lstrlenW(lpsz)
    If (lLen > 0) Then
        sOut = StrConv(String$(lLen, vbNullChar), vbUnicode)
        Call CopyMemory(ByVal sOut, ByVal lpsz, lLen * 2)
        PtrToStrW = StrConv(sOut, vbFromUnicode)
    End If
End Function

Private Sub Class_Initialize()
    Dim GpInput As GdiplusStartupInput
    GpInput.GdiplusVersion = 1
    If (GdiplusStartup(GdIHandle, GpInput)) <> [OK] Then
        MsgBox "Error loading GDI+!", vbCritical
        Class_Terminate
    End If
End Sub

Private Sub Class_Terminate()
    GdiplusShutdown GdIHandle
End Sub


