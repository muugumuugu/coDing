Attribute VB_Name = "Mdx8"
'parte grafica
Global DX As New DirectX8
Global D3DX As New D3DX8
'////////////////////////////////
'//////PARTE GRAFICA////////////
'//////////////////////////////
Global D3D As Direct3D8  'direct 3d
Global device As Direct3DDevice8  'spazio in cui si rappresenta
Global dSprite As D3DXSprite 'gestisce gli sprite
Global matWorld As D3DMATRIX 'rappresenta il mondo
Global matView As D3DMATRIX 'rappresenta la camera
Global matProj As D3DMATRIX 'rappresenta come la camera rappresenta il mondo
Global Const rad1 = 3.14 / 180 'il pi greco
     



Sub CreaSchermo(dxWidth As Long, dxHeight As Long, Fhwnd As Long)
'qui si crea lo schermo
    Dim D3DWindow As D3DPRESENT_PARAMETERS 'descrive la vista
    Set D3D = DX.Direct3DCreate() 'crea D3d
'imposto le variabili di creazione dello schermo( lezione uno)
    D3DWindow.SwapEffect = D3DSWAPEFFECT_FLIP
    D3DWindow.BackBufferCount = 1
    D3DWindow.BackBufferFormat = D3DFMT_R5G6B5 'colore
    D3DWindow.BackBufferWidth = dxWidth
    D3DWindow.BackBufferHeight = dxHeight
    D3DWindow.hDeviceWindow = Fhwnd  'proprietà hwnd della finestra rischiesta nel codice
    D3DWindow.EnableAutoDepthStencil = 1
    D3DWindow.AutoDepthStencilFormat = D3DFMT_D16 '16 bit Z-Buffer
   
    'crea device
    Set device = D3D.CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, Fhwnd, D3DCREATE_SOFTWARE_VERTEXPROCESSING, D3DWindow)
'Fino a qui è rimasto tutto uguale queste ultime righe di codice sono la novità

    'setta il tipo di vertice
    device.SetVertexShader D3DFVF_VERTEX Or D3DFVF_TEX1

    'disattiva la luce
    device.SetRenderState D3DRS_LIGHTING, 0
    device.SetRenderState D3DRS_SHADEMODE, D3DSHADE_GOURAUD
    'attiva lo z buffer
    device.SetRenderState D3DRS_ZENABLE, 1
    'qualità texture
    device.SetTextureStageState 0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR
    device.SetTextureStageState 0, D3DTSS_MINFILTER, D3DTEXF_LINEAR
    'crea il controllo 2D
    Set dSprite = D3DX.CreateSprite(device)
    ' The World Matrix
    D3DXMatrixIdentity matWorld
    device.SetTransform D3DTS_WORLD, matWorld

    'The View Matrix
    D3DXMatrixLookAtLH matView, MakeVector(0, 0, -30), MakeVector(0, 0, 0), MakeVector(0, 1, 0)
    device.SetTransform D3DTS_VIEW, matView

    'The projection Matrix
    D3DXMatrixPerspectiveFovLH matProj, 45 * rad1, 1, 1, 1000
    device.SetTransform D3DTS_PROJECTION, matProj


End Sub
'
Public Sub muoviObj(scalaX As Single, scalaY As Single, scalaZ As Single, angleX As Long, angleY As Long, angleZ As Long, posX As Single, posY As Single, posZ As Single)
    Dim CosRx As Single, CosRy As Single, CosRz As Single
    Dim SinRx As Single, SinRy As Single, SinRz As Single
    Dim mat1 As D3DMATRIX
    '
    rad = 3.14 / 180
    CosRx = Cos(angleX * rad) 'Used 6x
    CosRy = Cos(angleY * rad) 'Used 4x
    CosRz = Cos(angleZ * rad) 'Used 4x
    SinRx = Sin(angleX * rad) 'Used 5x
    SinRy = Sin(angleY * rad) 'Used 5x
    SinRz = Sin(angleZ * rad) 'Used 5x
  With mat1

    .m11 = (scalaX * CosRy * CosRz)
    .m12 = (scalaX * CosRy * SinRz)
    .m13 = -(scalaX * SinRy)
    '
    .m21 = -(scalaY * CosRx * SinRz) + (scalaY * SinRx * SinRy * CosRz)
    .m22 = (scalaY * CosRx * CosRz) + (scalaY * SinRx * SinRy * SinRz)
    .m23 = (scalaY * SinRx * CosRy)
    '
    .m31 = (scalaZ * SinRx * SinRz) + (scalaZ * CosRx * SinRy * CosRz)
    .m32 = -(scalaZ * SinRx * CosRz) + (scalaZ * CosRx * SinRy * SinRz)
    .m33 = (scalaZ * CosRx * CosRy)
    '
    .m41 = posX
    .m42 = posY
    .m43 = posZ
    .m44 = 1#
  End With
device.SetTransform D3DTS_WORLD, mat1
End Sub

'crea il vettore
Function MakeVector(x As Single, y As Single, z As Single) As D3DVECTOR
    MakeVector.x = x
    MakeVector.y = y
    MakeVector.z = z
End Function
'crea il vertice
Function CreaD3Dv(x As Single, y As Single, z As Single, nx As Single, ny As Single, nz As Single, tu As Single, tv As Single) As D3DVERTEX
    CreaD3Dv.x = x
    CreaD3Dv.y = y
    CreaD3Dv.z = z
    CreaD3Dv.tu = tu
    CreaD3Dv.tv = tv
    CreaD3Dv.nx = nx
    CreaD3Dv.ny = ny
    CreaD3Dv.nz = nz
End Function

Function creaTex(filesrc As String, ColorKey As Long, Optional coloreK As Boolean = False) As Direct3DTexture8
    If coloreK Then
        Set creaTex = D3DX.CreateTextureFromFileEx(device, filesrc, D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_UNKNOWN, D3DPOOL_MANAGED, D3DX_FILTER_POINT, D3DX_FILTER_POINT, ColorKey, ByVal 0, ByVal 0)
    Else
        Set creaTex = D3DX.CreateTextureFromFile(device, filesrc)
    End If
End Function

Sub termina(Optional spegni As Boolean = True)
        Set DX = Nothing
        Set D3D = Nothing
        Set device = Nothing
        Set dSprite = Nothing
        
        If spegni Then End
End Sub



