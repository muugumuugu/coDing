Attribute VB_Name = "PointsDraw"
Option Explicit

Public Sub DrawP1()

Dim A As Double, B As Double, co As Long, coc(0 To 9) As Long, cocS(0 To 255) As Long, BStp As Integer
Dim Stp As Long, x As Double, y As Double, yen As Long, yst As Long
Dim rad As Double, Size1 As Single, Size2 As Single, Size3 As Single, Size4 As Single
Dim pd As Double
Dim e As Double, m As Double, c2 As Double
    
    If frmBase.chkATime Then LQT = LQT + 1
    If LQT > 148931 Then LQT = 2
    frmBase.txtspm(13) = LQT
    pd = (frmBase.txtspm(2)) / 1000
    If frmBase.chkAvalue Then LQT2 = LQT2 + pd
    frmBase.txtspm(11) = LQT2: frmBase.txtspm(11).Refresh
    rad = LQT2 / 1000
    
    With frmBase
        .txtLQT2 = Format$(Abs(LQT2), "###,###0") & vbCrLf & _
                Format$(Primes(Abs(LQT2)), "###,###,###0") & vbCrLf & _
                Format$(PrK(3, Abs(LQT2)), "####") & vbCrLf & _
                Format$(PrK(2, Abs(LQT2)), "####")
        .txtLQT2.Refresh
        
        .txtLQT = Format$(LQT, "###,###0") & vbCrLf & _
                Format$(Primes(LQT), "###,###,###0") & vbCrLf & _
                Format$(maxViewP, "####") & vbCrLf & _
                Format$(PrK(2, LQT), "####")
         .txtLQT.Refresh
    End With
    
    If frmBase.ChkDraw(4) Then BitBlt picTmp.hdc, 0, 0, 1024, 768, picTmp.hdc, 0, 0, vbBlackness
    
    yen = 148932
    yst = 1
    Size1 = frmBase.txtspm(16)
    Size2 = frmBase.txtspm(17)
    Size3 = frmBase.txtspm(18)
    Size4 = frmBase.txtspm(19)
    
    For B = yst To yen Step 1
    
         BStp = PrK(3, B) * Size1
         Stp = PrK(2, B) * Size2
        
        co = RGB(PrK(2, B), PrK(2, B), PrK(2, B) * 2) Xor _
             RGB(256 - PrK(3, B) * 0.2, 256 - PrK(3, B) * 1.5, 256 - PrK(3, B) * 0.6)
        '''''''''''''''''''''''''''''''''''
'        co = ColTv(PrK(2, B) * 2 + 1)
        
        If frmBase.chkPR(2) And BStp > 0 Then rad = LQT2 / BStp
            
            If frmBase.chkTimeEnable(0) Then
                x = Cos(LQT * Stp * rad) * Stp / (Size3 + 0.5) + 768 '+ 96
                y = Sin(LQT * Stp * rad) * Stp / (Size4 + 0.5) + 512 '+ 96
                SetPixel picTmp.hdc, x, y, co
            End If

            If frmBase.chkTimeEnable(1) Then
                x = Sin(Stp * rad) * Cos(LQT * rad) * Stp + 512
                y = Cos(Stp * rad) * Sin(LQT * rad) * Stp + 384
                SetPixel picTmp.hdc, x, y, co
'                x = Sin(Stp * rad) * Cos(LQT * rad) * Stp + 512
'                y = Cos(Stp * rad) * Sin(LQT * rad) * Stp + 384
'                SetPixel picTmp.hdc, x, y, co
                            
            End If
            
     B = B + PrK(3, (B))
    Next B
            

End Sub
Public Sub DrawP5()

Dim a1 As Double, B As Double, co(0 To 255) As Long, coc(0 To 9) As Long, cocS(0 To 255) As Long, tm As Integer
Dim Tm2 As Long, x As Long, y As Long, yen As Long, yst As Long


    For a1 = 0 To 255
'        co(a1) = RGB(a1 ^ 2 \ 32, a1 ^ 2 \ 48, a1 ^ 2 \ 24)
'        co(a1) = RGB(a1 ^ 2 \ (8 * txtspm(10)), a1 ^ 2 \ (8 * txtspm(10)), a1 ^ 2 \ (8 * txtspm(10)))
        co(a1) = RGB(a1 ^ 2 \ 3, a1 ^ 2 \ 3, a1 ^ 2 \ 2)
    Next a1
    For y = yst To yen Step (PrK(3, LQT)) '* Sin(PrK(3, LQT)) + 1
        
        tm = PrK(3, (y)) * 2
        Tm2 = PrK(2, (y)) * 2
      
'      tm = Sin((PrK(3, (y)) - PrK(2, (y))) * Rad) * (PrK(3, (y)) - PrK(2, (y))) * 3  ''* 4
'      Tm2 = Sin((PrK(2, (y))) * Rad) * (PrK(2, (y))) * 3   '     PrK(2, (y)) * 2
      SetPixel picTmp.hdc, Sin(tm * rad * LQT * rad) * Tm2 + 512, Cos(tm * rad * y * rad) * Tm2 + 384, co(Abs(Tm2) \ 4) Xor ColTp(100)
    Next y
'
'    yen = 148931
'    yst = 1
'
'    For y = yst To yen Step PrK(3, LQT) + 1  '+ PrK(3, LQT) + 1)
'        tm = (PrK(3, (y)) - PrK(2, (y))) ''* 4
'        Tm2 = PrK(2, (y)) * 2
'        SetPixel picTmp.hdc, Cos(LQT * Rad + (y - 256) * Rad) * Tm2 + 512, Sin(LQT * Rad + (y - 256) * Rad) * tm + 384, co(Tm2 \ 4) Xor ColTp(tm \ 4 + 1)
'
''      tm = (PrK(3, (y)) - PrK(2, (y))) * 4 ''* 4
''      Tm2 = PrK(2, (y)) * 4
''      SetPixel picTmp.hdc, Cos(LQT * Rad + (y - 256) * Rad) * tm + 512, Sin(LQT * Rad + (y - 256) * Rad) * tm + 384, co(Tm2 \ 4) 'Xor ColTp(tm \ 4 + 1)
'    Next y
'

End Sub
''
''
'Public Sub DrawP2()
'Dim LAvg As Long, RAvg As Long
'
'If Fst Then InitK: Cof_X = 1: iH = 384    'initial at first time
'
'    ''''''''''''' set parameters variables '''''''''''''
'
'    CycleST
'
'        Cu = frmBase.txtspm(1) + 1
'        Xtmp = frmBase.txtspm(6)
'        z11 = vsY * 4
'        z22 = vsY * 4 '* (Bass / 20 - Treb / 10)
'        z33 = frmBase.txtspm(5) * 4
'        z44 = vsX ' / 2 '* 8
'        zvF = 0: zvT = 1
'        zV = z33   ''''' If frmbase.chkInc is not set Then zV = 1 and not use in loop _
'                          '     Else use  >> Ss?O(x, d) * zV
'        z33 = z33 / 2
'        If frmBase.chkInc.Value <> 0 Then zvF = 1: zvT = 0
'
'    ''''''''''''''''''
'    '''''''''''''''''' set y points of master polyline with data . Pt( , 1) is Master polyline ''''''''''''''''''
'    '''''''''''''''''' x points only set in load in InitK Sub in first time '
''        x=frmBase.txtspm(0)*
'    x2 = (384 - frmBase.txtspm(0) / 2) + frmBase.txtspm(0) / 2 '/ 2
'
'     For x = 0 To 255
'        d = SsPtr - x * Xtmp
'        zV = zvF * (((x + 1) / 32) * z33) + (zvT * zV)
'
'        Pt(255 - x, 1).y = (SsLO(x, d) * zV) - (67 * zV) + x2
'        Pt(256 + x, 1).y = (SsRO(x, d) * zV) - (67 * zV) + x2
'
'     Next x
'
'    p(1).Xx = Cosine((LQT))                   '    p(1).Xx = Cos(LQT * Rad)
'    p(1).Yy = Sine((LQT))                     '    p(1).Yy = Sin(LQT * Rad)
'    p(1).Zz = (Sine((LQT)) - Cosine((LQT))) '/ -0.75                         '    Cosine(Log(LQT) / 4 * LQT + LQT)
'
''     For x = 0 To 511
'''        Pt(x, 1).y = Sin(Pt(x, 1).y * Rad) * 384 '* Cos(LQT * Rad)
'''        Pt(511 - x, 1).x = 0 '(x - 256) * 0.25 + 512 ' Pt(x, 1).x  ' * Pt(x, 1).x * 0.5  '- 512 '* Sin(LQT * Rad)
'''        Pt(x, 1).x = 0
''     Next x
'
'    CycleED
'    Process(12, 1) = Round(tFa, 2)
'
'    '''''''''''''''''' set y points in other polylines with Master polyline ''''''''''''''''''
'    ''''''''''''''''''''''''''''''''''
'
'    CycleST
'  ''''''''''''''''''''''''''
'    bf4 = z22
'    For x2 = 2 To Cu  ' Cu is Count of Scopes
'       z22 = (z22 * 0.95)
'        For x = 0 To 255
'            Pt(255 - x, x2).y = Pt(255 - x, 1).y + z22
'            Pt(256 + x, x2).y = Pt(256 + x, 1).y + z22
'            Pt(255 - x, x2).x = Sin(Pt(255 - x, x2).x * rad) * Cos(Pt(255 - x, x2).y) + 512 - x ' + Pt(255 - x, x2)
'            Pt(256 + x, x2).x = Sin(Pt(256 + x, x2).x * rad) * Cos(Pt(256 + x, x2).y) + 512 + x '+ Pt(256 + x, x2)
'        Next x
'    Next x2
'    ''''''''''''''''''''''''''
'    CycleED
'    Process(13, 1) = Round(tFa, 2)
'
'
'    '''''''''''''''''' find  minY and maxY points of Master polyline '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'    ''''''''''''''''''''''''''''''''''
'    CycleST
'
'    minLY = minY: maxLY = maxY
'    minY = 768: maxY = 0
'
'    For x = 0 To 511
'        If maxY < Pt(x, 2).y Then maxY = Pt(x, 2).y
'        If minY > Pt(x, Cu).y Then minY = Pt(x, Cu).y
'    Next x
'    If maxY < 1 Then maxY = 1
'    If minY > 768 Then minY = 768
'
'    ''''''''''''''''''''''''''''''''''''''''''
'    '''''''''''''''''' Set BaseSub Height for scopes '''''''''''''''''''''''''''''''''''''''
'    ''''''''''''''''''''''''''''''''''
'
'    If frmBase.chkABalance And ((maxY - minY) < (frmBase.txtspm(0) / 2) Or (maxY - minY) > (frmBase.txtspm(0) * 2)) Then frmBase.chkAHeight.Value = 1
'
'    If frmBase.chkAHeight Then
'        If (maxY - minY) > (frmBase.txtspm(0) * 2) Then
'            frmBase.cmdSmaler_Click (5): frmBase.txtspm(5).Refresh
'        ElseIf (maxY - minY) < (frmBase.txtspm(0) / 2) Then
'            frmBase.cmdLarger_Click (5): frmBase.txtspm(5).Refresh
'        End If
'    End If
'
'    minY = minY - (maxY - minY) / 8 - 64
'    maxY = maxY + (maxY - minY) / 8 + 64
'
'
'    Call CycleED
'    Process(15, 1) = Round(tFa, 2)
'
'
'    '''''''''''''''' Clear last polyline if chkCls1 is checked ''''''''''''''''
'    CycleST
'
''        If frmBase.chkCls1 Then BitBlt picBuff.hdc, 0, 0, 1024, 768, picBuff.hdc, 0, 0, vbBlackness
'
'        If frmBase.ChkDraw(4) Then   '''''   last polyline clear
'            picBuff.ForeColor = vbBlack
'            picBuff.FillStyle = vbSolid
'            picBuff.FillColor = vbBlack
'
'           If frmBase.ChkDraw(2) Then
'                For x = 2 To Cu
'                 Polygon picBuff.hdc, PtL(1, x), 255
'                 Polygon picBuff.hdc, PtL(256, x), 255
'                Next x
'           Else
'                For x = 2 To Cu
'                 Polyline picBuff.hdc, PtL(1, x), 255
'                 Polyline picBuff.hdc, PtL(256, x), 255
'                Next x
'           End If
'        End If
'
'    '''''''''''''''' draw Polylines ''''''''''''''''
'        For x = 2 To Cu
'             picBuff.ForeColor = ColTn(x) Xor vbYellow
'             picBuff.FillStyle = vbSolid
'             picBuff.FillColor = ColTn(x) Xor vbYellow
'
'             If frmBase.ChkDraw(2) Then
'                Polygon picBuff.hdc, Pt(1, x), 255
'                Polygon picBuff.hdc, Pt(256, x), 255
'             Else
'                Polyline picBuff.hdc, Pt(1, x), 255
'                Polyline picBuff.hdc, Pt(256, x), 255
'             End If
'        Next x
'
'    '''''''''''''''''' store data for use in next polylines in next frame ''''''''''''''''''
'
'        For x = 2 To Cu
'            CopyMemory PtL(0, x).x, Pt(0, x).x, 4096
'        Next x
'
'    Call CycleED
'    Process(14, 1) = Round(tFa, 2)
'
'End Sub

Public Sub DrawP3()
Dim ct As Long, Z As Single, d As Single, u As Single, x As Single, Xx As Integer
Dim tm1 As Single, Tm2 As Single, Tm3 As Single, Tm4 As Single, m As Long

CycleST

'''''''''''''''''''''''''''''''''''
    p(1).Xx = Cosine((LQT))                   '    p(1).Xx = Cos(LQT * Rad)
    p(1).Yy = Sine((LQT))                     '    p(1).Yy = Sin(LQT * Rad)
    p(1).Zz = (Sine((LQT)) - Cosine((LQT))) '/ -0.75                         '    Cosine(Log(LQT) / 4 * LQT + LQT)
'''''''''''''''''''''''''''''''''''
    For ct = 1 To 6
    
        If ct Mod 3 = 0 Then
            p(1).y = p(1).Yy
            p(1).x = p(1).Zz
        ElseIf ct Mod 3 = 1 Then
            p(1).y = p(1).Zz
            p(1).x = p(1).Xx
        ElseIf ct Mod 3 = 2 Then
            p(1).y = p(1).Xx
            p(1).x = p(1).Yy
        End If
     ''''''''''''''''''''''''''''''''''''''''''''
     ''''''''''''''''''''''''''''''''''''''''''''
     
        For x = 1 To PrK(3, LQT) '32 '* 2
            If ct Mod 3 = 0 Then
              p(ct).Pt(x).y = Cos((Log(ABass + 1) * x * LQT) * rad) * (256 \ Log(ct + 1)) * p(1).Yy + 384 '+ 192 * Sin(LQT * Rad) ^ 3
              p(ct).Pt(x).x = Sin((Log(ABass + 1) * x * LQT) * rad) * (256 \ Log(ct + 1)) * p(1).Xx + 512 '+ 256 * Cos(LQT * Rad) ^ 3
            ElseIf ct Mod 3 = 1 Then
              p(ct).Pt(x).y = Cos((Log(ABass + 1) + x * LQT) * rad) * (256 \ Log(ct + 1)) * p(1).Yy + 384 '+ 192 * Sin(LQT * Rad) ^ 3
              p(ct).Pt(x).x = Sin((Log(ABass + 1) + x * LQT) * rad) * (256 \ Log(ct + 1)) * p(1).Zz + 512 '+ 256 * Cos(LQT * Rad) ^ 3
            ElseIf ct Mod 3 = 2 Then
              p(ct).Pt(x).y = Cos((Log(ABass + 1) + x * LQT) * rad) * (256 \ Log(ct + 1)) * p(1).Zz + 384 '+ 192 * Sin(LQT * Rad) ^ 3
              p(ct).Pt(x).x = Sin((Log(ABass + 1) + x * LQT) * rad) * (256 \ Log(ct + 1)) * p(1).Xx + 512 '+ 256 * Cos(LQT * Rad) ^ 3
            End If
        Next x
    
    Next ct
    '''''''''''''''''''''''''''''''
    CycleED
    Process(16, 1) = Round(tFa, 2)
    CycleST
    
    If frmBase.ChkDraw(5) Then
    picTmp.ForeColor = vbBlack
    
    For ct = 1 To 6
        Polyline picTmp.hdc, p(ct).PtL(1), PrK(3, LQT)
    Next ct
    
    End If
    '''''''''''''''''''''''''''''''
        
    For ct = 1 To 6
      picTmp.ForeColor = ColTn(ct) 'Xor ColTp(ct) ' Xor vbBlack
      Polyline picTmp.hdc, p(ct).Pt(1), PrK(3, LQT)
    Next ct
    '''''''''''''''''''''''''''''''
    
    For ct = 1 To 6
        CopyMemory p(ct).PtL(1).x, p(ct).Pt(1).x, 2048
    Next ct

    lastSTP = PrK(2, LQT)
    
    CycleED
    Process(18, 1) = Round(tFa, 2)
    
End Sub
'
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'
'
Public Sub DrawP4()
Dim ct As Long, Z As Single, d As Single, u As Single, x As Single, Xx As Integer
Dim tm1 As Single, Tm2 As Single, Tm3 As Single, Tm4 As Single, m As Long


    p(1).Col = p(1).Col + p(1).ColV * Cos((BassL - BassR) * (BassR - BassL)) * 2
    If p(1).Col >= 255 Or p(1).Col <= 0 Then p(1).ColV = -p(1).ColV

     p(1).Tmz = Cos((p(1).Col * rad))
     p(1).Zm = Sin((LQT * rad) * (LQT * rad) * rad)
     p(1).mx = p(1).Col * p(1).Zm
     p(1).mY = p(1).Col * p(1).Zm

     p(1).x = Cos(LQT * rad) * p(1).Tmz
     p(1).y = Sin(LQT * rad) * p(1).Tmz
     p(1).Xx = Sin(LQT * rad) * p(1).Tmz
     p(1).Yy = Cos(LQT * rad) * p(1).Tmz

     p(1).Tm2 = (1 + -2 * frmBase.chkP4Opt(0))
     p(1).Tm4 = (1 + -2 * frmBase.chkP4Opt(1))
     p(1).tm1 = p(1).Tmz * p(1).Tm2                'rotate +-z
     p(1).Tm3 = p(1).Tmz * p(1).Tm4              'rotate -+z


    p(1).Xx = Cos(LQT * rad)
    p(1).Yy = Sin(LQT * rad)
    p(1).Zz = (p(1).Xx) - (p(1).Yy)

    For ct = 30 To 43 Step 1
            If ct Mod 5 = 0 Then
               p(1).y = p(1).Yy
               p(1).x = p(1).Xx
            ElseIf ct Mod 5 = 1 Then
               p(1).y = p(1).Zz
               p(1).x = p(1).Xx
            ElseIf ct Mod 5 = 2 Then
               p(1).y = p(1).Yy
               p(1).x = p(1).Zz
            ElseIf ct Mod 5 = 3 Then
               p(1).y = p(1).Zz
               p(1).x = p(1).Yy
            Else
               p(1).y = p(1).Xx
               p(1).x = p(1).Zz
            End If
     ''''''''''''''''''''''''''''''''''''''''''''
     ''''''''''''''''''''''''''''''''''''''''''''

            For Xx = 1 To maxViewP
              p(ct).Pt(Xx).y = Sin(2 + Xx + LQT * rad * p(1).Tm2) * ((ct - 10) * 8) * (1 + -2 * (Xx Mod 2)) * (p(1).y) + 384      '* (1 + -2 * (Xx Mod 2))
              p(ct).Pt(Xx).x = Cos(Xx + LQT * rad * p(1).Tm4) * ((ct - 10) * 8) * (1 + -2 * (Xx Mod 2)) * (p(1).x) + 512       '* (1 + -2 * (Xx Mod 2))
            Next Xx

    Next ct
    '''''''''''''''''''''''''''''''

    If frmBase.ChkDraw(7) Then
       picTmp.ForeColor = vbBlack
       For ct = 30 To 43
         Polyline picTmp.hdc, p(ct).PtL(1), maxViewP
       Next ct
    End If
    '''''''''''''''''''''''''''''''

    For ct = 30 To 43
      picTmp.ForeColor = ColTn(ct - 29) And (ColTp(1) Xor vbWhite)
      Polyline picTmp.hdc, p(ct).Pt(1), maxViewP
    Next ct
    '''''''''''''''''''''''''''''''

    For ct = 30 To 43
        CopyMemory p(ct).PtL(1).x, p(ct).Pt(1).x, 1024 * 2
    Next ct


End Sub
'
'
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'
'Public Sub DrawP4()
'Dim ct As Integer, Z As Integer, d As Single, u As Single
'
'    P3P.Col = P3P.Col + P3P.ColV * Cos((BassL - BassR) * (BassR - BassL) / 2)
'    If P3P.Col > 255 Or P3P.Col < 0 Then P3P.ColV = -P3P.ColV
'
'    P4P.Tmz = Sin((P4P.Col) * Rad) * 0.78    '    z = Sin((LQT) * Rad)
'    P4P.Zm = Sin((LQT) * Rad)
'    P4P.x = Cos((LQT) * Rad) * Sin((P4P.Col) * Rad) * 0.78
'    P4P.y = Sin((LQT) * Rad) * Cos((P4P.Col) * Rad) * 0.78
'    P4P.xx = Cos((LQT) * Rad) * Cos((P4P.Col) * Rad) * 0.78
'    P4P.yy = Sin((LQT) * Rad) * Sin((P4P.Col) * Rad) * 0.78
'    P4P.Tm2 = (1 + -2 * frmBase.chkP4Opt(0))               'Height
'    P4P.Tm4 = (1 + -2 * frmBase.chkP4Opt(1))               'width
'    P4P.tm1 = P4P.Tmz * P4P.Tm2 * PI                                 'rotate +-z
'    P4P.Tm3 = P4P.Tmz * P4P.Tm4 * PI                                 'rotate -+z
'
''    For ct = 0 To 511
'''        Pt(ct, 18).Y = Sin(ct + P4P.tm1) * Pt(ct, 1).Y * P4P.Y + 384
'''        Pt(ct, 18).x = Cos(ct + P4P.tm3) * Pt(ct, 1).x * P4P.x + 512
''
'''        Pt(ct, 19).Y = Sin(ct + P3P.tm1) * Pt(ct, 1).Y * P3P.yy + 384
'''        Pt(ct, 19).x = Cos(ct + P3P.tm3) * Pt(ct, 1).x * P3P.xx + 512
''    Next ct
'
'    For ct = 0 To 511
'         Z = Z + d
'        Pt(ct, 18).y = Sin(ct * Rad * PI * (Treb - Bass)) / _
'                       ((PI * MidlL + 1) / (1 + Treb / 1.5)) * _
'                       (Pt(ct, 1).y * 0.75) + 384 + 384 * P4P.y
'
'        Pt(ct, 18).x = Cos(ct * Rad * PI * (Bass - Treb)) / _
'                       ((PI * MidlR + 1) / (1 + Bass / 1.5)) * _
'                       (Pt(ct, 1).x * 1) + 512 + 512 * P4P.xx
''        Pt(ct, 18).Y = Sin(ct + P4P.tm1) * Pt(ct, 1).Y * P4P.Y + 384
''        Pt(ct, 18).x = Cos(ct + P4P.tm3) * Pt(ct, 1).x * P4P.x + 512
'
'    Next ct
'
'        If frmBase.ChkDraw(7) Then
'            picTmp.ForeColor = vbBlack
'            Polyline picTmp.hdc, PtL(32, 18), 32
'            Polyline picTmp.hdc, PtL(128, 18), 128
'        End If
'        picTmp.ForeColor = ColTp(1) Xor ColTn(1) ' ColTp(1) Xor vbCyan
'        Polyline picTmp.hdc, Pt(32, 18), 32
'        picTmp.ForeColor = ColTp(1) Xor ColTn(1) ' ColTp(1) Xor vbMagenta
'        Polyline picTmp.hdc, Pt(128, 18), 128
'
'    CopyMemory PtL(0, 18).x, Pt(0, 18).x, 4096
'
'End Sub
'
'
