Attribute VB_Name = "modASCII"

Public Function Make(SPicture As String, Result As String, L2D As String, Size As Single, Detail As Byte, Reminder As Boolean)
On Error Resume Next
    Dim Over() As Long
    Dim i As Integer
    Dim j As Integer
    Dim k As Integer
    Dim l As Integer
    
    Dim ctr As Long
    
    Dim PixelGroup() As Long
    Dim PixelPicture() As Long
    Dim PPicture() As Long
    Dim PGroup1() As Long
    Dim PGroup2() As Long
    Dim PGroup() As Long
    Dim BAWPicture() As Long
    
    Dim L2Dscale() As Integer
    
    Dim L2DChart() As String
    
    Dim NextChar As String
    Dim BUF As String
    
    Dim Percent As Single
    
    Load frmPicture
    'frmPicture.Show
    With frmPicture
        !picSource.Picture = LoadPicture(SPicture)
        
        !lblTest.FontSize = Detail
        
        'Incorperate 'Size'
        If Size = 1 Then GoTo AfterSize
        ReDim PixelPicture(!picSource.Width - 1, !picSource.Height - 1)
        For i = 0 To !picSource.Width - 1
            For j = 0 To !picSource.Height - 1
                PixelPicture(i, j) = GetPixel(!picSource.hdc, i, j)
                DoEvents
            Next j
            frmASCII.Caption = "ASCII Pictures - " & CLng(i * CLng(100) / !picSource.Width / 2) & "% - Resizing Picture"
        Next i
        
        !picSource.Width = !picSource.Width * Size
        !picSource.Height = !picSource.Height * Size
        
        For i = 0 To UBound(PixelPicture, 1) * Size
            For j = 0 To UBound(PixelPicture, 2) * Size
                SetPixel !picSource.hdc, i, j, PixelPicture(Int(i / Size), Int(j / Size))
                DoEvents
            Next j
            frmASCII.Caption = "ASCII Pictures - " & CLng(50 + i * 100 / !picSource.Width / 4) & "% - Resizing Picture"
        Next i
        
        
        
AfterSize:
        
        !picSource.Height = Int(!picSource.Height / !lblTest.Height) * !lblTest.Height
        !picSource.Width = Int(!picSource.Width / !lblTest.Width) * !lblTest.Width
        
        ReDim PixelPicture((!picSource.Width / !lblTest.Width) - 1, (!picSource.Height / !lblTest.Height) - 1)
        
        ReDim BAWPicture((!picSource.Width / !lblTest.Width) - 1, (!picSource.Height / !lblTest.Height) - 1)
        
        ReDim PixelGroup(!lblTest.Width - 1, !lblTest.Height - 1)
        
        For i = 0 To !picSource.Width / !lblTest.Width - 1
            For j = 0 To !picSource.Height / !lblTest.Height - 1
                
                For k = 0 To !lblTest.Width - 1
                    For l = 0 To !lblTest.Height - 1
                        PixelGroup(k, l) = GetPixel(!picSource.hdc, i * !lblTest.Width + k, j * !lblTest.Height + l)
                    Next l
                Next k
                
                ctr = -1
                For k = 0 To UBound(PixelGroup, 1)
                    For l = 0 To UBound(PixelGroup, 2)
                        ctr = ctr + 1
                    Next l
                Next k
                ReDim PGroup(ctr)
                ctr = -1
                For k = 0 To UBound(PixelGroup, 1)
                    For l = 0 To UBound(PixelGroup, 2)
                        ctr = ctr + 1
                        PGroup(ctr) = PixelGroup(k, l)
                    Next l
                Next k
                
                PixelPicture(i, j) = AverageColours(PGroup)
                
            Next j
            frmASCII.Caption = "ASCII Pictures - " & CLng(i * 100 / !picSource.Width / 2) & "% - Checking Picture"
        Next i
        
        For i = 0 To UBound(PixelPicture, 1)
            For j = 0 To UBound(PixelPicture, 2)
                
                BAWPicture(i, j) = MakeBAW(PixelPicture(i, j))
            Next j
            frmASCII.Caption = "ASCII Pictures - " & CLng(50 + i * CLng(100) / !picSource.Width / 2) & "% - Checking Picture"
        Next i
        
        Open Result For Output As #1
            Select Case UCase(GetExt(Result))
            Case "RTF"
                Print #1, "{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Lucida Console;}}"
                Print #1, "\viewkind4\uc1\pard\f0\fs" & Detail * 2
            Case Else
                If Reminder Then
                    Print #1, "To properly view this picture, set the font to 'Lucida Console' and size to " & Detail & "."
                    Print #1, "Or choose another font where the following lines appear the same length:"
                    Print #1, "|abcdefABCDEFG|"
                    Print #1, "|!%@%^#$%&^()'|"
                    'Blank Lines
                    Print #1,
                    Print #1,
                    Print #1,
                End If
            End Select
            
            L2D = StrReverse(L2D)
            
            ReDim L2Dscale(Len(L2D))
            ReDim L2DChart(Len(L2D) - 1)
            
            For i = 1 To Len(L2D) ' - 1
                L2Dscale(i) = i * (255 / Len(L2D))
                If i = Len(L2D) Then L2Dscale(i) = 256
            Next i
            For i = 0 To Len(L2D) - 1
                L2DChart(i) = Mid(L2D, i + 1, 1)
            Next i
            
            frmASCII!cmdMake.ZOrder 1
            BUF = ""
            
            For j = 0 To UBound(BAWPicture, 2) 'Y
                For i = 0 To UBound(BAWPicture, 1) 'X
                    DoEvents
                    For k = 0 To Len(L2D) - 1
                        If RedC(BAWPicture(i, j)) >= L2Dscale(k) And RedC(BAWPicture(i, j)) < L2Dscale(k + 1) Then
                            BUF = BUF & L2DChart(k)
                            GoTo AfterL2D
                        End If
                    Next k
AfterL2D:
                Next i
                frmASCII.Caption = "ASCII Pictures - " & CLng(j * CLng(100) / UBound(BAWPicture, 2)) & "% - Creating Picture"
                frmASCII!Progress.Value = CLng(j * CLng(100) / UBound(BAWPicture, 2)) '!picSource.Width)
                Select Case UCase(GetExt(Result))
                Case "RTF"
                    Print #1, BUF & "\par"
                Case "TXT"
                    Print #1, BUF
                Case "HTM" Or "HTML"
                    Print #1, BUF & "<BR>"
                End Select
                BUF = ""
            Next j
            
            Select Case UCase(GetExt(Result))
            Case "RTF"
                Print #1, "}"
            End Select
            
        Close #1
        
        frmASCII.Caption = "ASCII Pictures"
        If MsgBox("The ASCII picture has been successfully created. Would you like to view it?", vbYesNo + vbDefaultButton1, "ASCII Pictures") = vbYes Then
            StartDoc Result
        End If
        frmASCII!cmdMake.ZOrder 0
    End With
    
    Unload frmPicture
End Function
