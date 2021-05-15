VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.UserControl WndBuildings 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00008000&
   ClientHeight    =   3255
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4965
   ScaleHeight     =   217
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   331
   Begin ComctlLib.ListView lstBuildings 
      Height          =   2760
      Left            =   3150
      TabIndex        =   3
      Top             =   360
      Width           =   1725
      _ExtentX        =   3043
      _ExtentY        =   4868
      View            =   2
      LabelEdit       =   1
      LabelWrap       =   0   'False
      HideSelection   =   0   'False
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.PictureBox picItem 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   1635
      Left            =   90
      ScaleHeight     =   109
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   199
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   360
      Width           =   2985
   End
   Begin CityBuilder.LineButton cmdClose 
      Height          =   210
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   165
      _ExtentX        =   291
      _ExtentY        =   370
      ColorNormal     =   255
      ColorLight      =   12632319
   End
   Begin VB.Label lblTax 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Rs. 750"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   195
      Index           =   0
      Left            =   1530
      TabIndex        =   19
      Top             =   2700
      Width           =   675
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Tax Income:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   6
      Left            =   90
      TabIndex        =   17
      Top             =   2700
      Width           =   1065
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Days to Build:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   3
      Left            =   90
      TabIndex        =   15
      Top             =   2955
      Width           =   1200
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Cost:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   2
      Left            =   90
      TabIndex        =   14
      Top             =   2415
      Width           =   450
   End
   Begin VB.Label lblDays 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "30 Days"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   195
      Index           =   1
      Left            =   1530
      TabIndex        =   13
      Top             =   2955
      Width           =   705
   End
   Begin VB.Label lblCost 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Rs. 1,000"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   195
      Index           =   1
      Left            =   1530
      TabIndex        =   12
      Top             =   2415
      Width           =   840
   End
   Begin VB.Label lblName 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Town Houses"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   195
      Index           =   1
      Left            =   1530
      TabIndex        =   11
      Top             =   2145
      Width           =   1170
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Building Name:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Index           =   1
      Left            =   90
      TabIndex        =   10
      Top             =   2145
      Width           =   1290
   End
   Begin VB.Label lblDays 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "30 Days"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   1530
      TabIndex        =   9
      Top             =   2970
      Width           =   705
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Days to Build:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   5
      Left            =   90
      TabIndex        =   8
      Top             =   2970
      Width           =   1200
   End
   Begin VB.Label lblCost 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Rs. 1,000"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   1530
      TabIndex        =   7
      Top             =   2430
      Width           =   840
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Cost:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   4
      Left            =   90
      TabIndex        =   6
      Top             =   2430
      Width           =   450
   End
   Begin VB.Label lblName 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Town Houses"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   1530
      TabIndex        =   5
      Top             =   2160
      Width           =   1170
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Building Name:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   90
      TabIndex        =   4
      Top             =   2160
      Width           =   1290
   End
   Begin VB.Shape shpBox 
      BorderColor     =   &H00FFFFFF&
      Height          =   1185
      Left            =   0
      Top             =   0
      Width           =   1635
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackStyle       =   0  'Transparent
      Caption         =   "Buildings"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   240
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2265
   End
   Begin VB.Label lblCaption 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Buildings"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Top             =   15
      Width           =   2265
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Tax Income:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   7
      Left            =   90
      TabIndex        =   18
      Top             =   2715
      Width           =   1065
   End
   Begin VB.Label lblTax 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Rs. 750"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   1
      Left            =   1530
      TabIndex        =   20
      Top             =   2715
      Width           =   675
   End
End
Attribute VB_Name = "WndBuildings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'
' Created by Faraz Azhar [http://www.geocities.com/farazazhar_net/]
'
Const CLR_LIGHT = &H6CB098  ' RGB(152, 176, 108)
Const CLR_NORMAL = &H4C7C68 ' RGB(104, 124, 76)
Const CLR_DARK = &H30583C   ' RGB(60, 88, 48)

Public Event ItemClicked()

Dim mX As Single, mY As Single
Dim m_DefaultX As Single, m_DefaultY As Single
'
Dim bInitialised As Boolean
Dim m_ClearCost As Long, m_Phases As Integer, m_PhaseDays As Integer, _
    m_TaxPayments As Long, m_AllowSelection As String

Private Sub cmdClose_Click()
    UserControl.Extender.Visible = False
End Sub

Private Sub lblCaption_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
    If Index = 0 Then
        If Button = vbLeftButton Then
            mX = X / Screen.TwipsPerPixelX
            mY = Y / Screen.TwipsPerPixelY
        End If
    End If
End Sub

Private Sub lblCaption_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lLeft As Single, lTop As Single
    If Index = 0 Then
        If Button = vbLeftButton Then
            '
            lLeft = UserControl.Extender.Left - (mX - (X / Screen.TwipsPerPixelX))
            lTop = UserControl.Extender.Top - (mY - (Y / Screen.TwipsPerPixelY))
            ' validate
            If (lLeft >= 0) And ((lLeft + ScaleWidth) <= Board.Width) Then
                UserControl.Extender.Left = lLeft
            End If
            If (lTop >= Board.Top) And ((lTop + 4) <= Board.ScaleHeight) Then
                UserControl.Extender.Top = lTop
            End If
        End If
    End If
End Sub

Private Sub lstBuildings_DblClick()
    If Not lstBuildings.selectedItem Is Nothing Then
        Call cmdClose_Click
    End If
End Sub

Private Sub lstBuildings_ItemClick(ByVal Item As ComctlLib.ListItem)
    Dim pBld As PictureBox, sBuilding As String, lIndex As Integer
    Dim sName As String, sPic As String, lCost As Long, lTime As Long
    '
    sName = Item
    sBuilding = Item.Key
    sPic = INIReadValue(App.Path & "\data\buildings.ini", sBuilding, "FullView", "")
    lCost = INIReadValue(App.Path & "\data\buildings.ini", sBuilding, "BuildCost", 0, True)
    m_TaxPayments = INIReadValue(App.Path & "\data\buildings.ini", sBuilding, "TaxPayment", 0, True)
    '
    m_PhaseDays = INIReadValue(App.Path & "\data\buildings.ini", sBuilding, "PhaseDays", 0, True)
    m_Phases = INIReadValue(App.Path & "\data\buildings.ini", sBuilding, "Phases", 0, True)
    '
    lTime = m_PhaseDays * (m_Phases - 1)
    '
    m_ClearCost = INIReadValue(App.Path & "\data\buildings.ini", sBuilding, "ClearCost", 0, True)
    m_AllowSelection = INIReadValue(App.Path & "\data\buildings.ini", sBuilding, "AllowSelection", "")
    '
    Set pBld = Texture(sPic)
    '
    picItem.Cls
    picItem.Line (0, 0)-(picItem.ScaleWidth - 1, picItem.ScaleHeight - 1), CLR_LIGHT, B
    TransparentBlt picItem.hDC, Int((picItem.ScaleWidth - pBld.ScaleWidth) / 2), Int((picItem.ScaleHeight - pBld.ScaleHeight) / 2), pBld.ScaleWidth, pBld.ScaleHeight, _
                        pBld.hDC, 0, 0, pBld.ScaleWidth, pBld.ScaleHeight, vbGreen
    '
    lblName(0) = sName: lblName(1) = lblName(0)
    lblCost(0) = "Rs. " & FormatNumber(lCost, 0, , vbFalse, vbTrue): lblCost(1) = lblCost(0)
    lblTax(0) = "Rs. " & FormatNumber(m_TaxPayments, 0, , vbFalse, vbTrue) & "/month": lblTax(1) = lblTax(0)
    lblDays(0) = lTime & " days": lblDays(1) = lblDays(0)
    '
    If UserControl.Extender.Visible Then RaiseEvent ItemClicked
    '
End Sub

Private Sub UserControl_GotFocus()
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_Initialize()
    Width = 4965
    Height = 3255
    '
    With cmdClose
        .ColorNormal = CLR_NORMAL
        .ColorLight = CLR_LIGHT
        .ColorDark = CLR_DARK
    End With
    picItem.BackColor = CLR_DARK
    '
    lblName(0) = "": lblName(1) = ""
    lblCost(0) = "": lblCost(1) = ""
    lblTax(0) = "": lblTax(1) = ""
    lblDays(0) = "": lblDays(1) = ""
    '
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    UserControl.Extender.ZOrder 0
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        DefaultX = .ReadProperty("DefaultX", 20)
        DefaultY = .ReadProperty("DefaultY", 20)
    End With
    '
    If (UserControl.Ambient.UserMode) Then
        UserControl.Extender.Left = DefaultX
        UserControl.Extender.Top = DefaultY
    End If
    '
End Sub

Private Sub UserControl_Resize()
    Width = 4965
    Height = 3255
    lblCaption(0).Width = ScaleWidth
    lblCaption(1).Width = ScaleWidth
    '
    shpBox.Move 0, 0, ScaleWidth, ScaleHeight
    '
    DrawWindow
    '
End Sub

Private Sub UserControl_Show()
    '
    If (UserControl.Ambient.UserMode) And bInitialised = False Then LoadBuildingsData
    '
    DrawWindow
    MyTimer 100
    '
    shpBox.ZOrder 0
    shpBox.Visible = True
    cmdClose.Spark = True
    MyTimer 100
    '
    cmdClose.Spark = False
    shpBox.Visible = False
End Sub

Private Sub DrawWindow()
    '
    Cls
    '
    UserControl.BackColor = CLR_NORMAL
    '
    ' NOTE: The following coordinates are for vbPixel scalemode only.
    SetLine 0, 0, ScaleWidth, 0, CLR_LIGHT
    SetLine 0, 13, ScaleWidth, 13, CLR_DARK
    SetLine 0, 14, ScaleWidth, 14, CLR_LIGHT
    SetLine 0, ScaleHeight - 1, ScaleWidth, ScaleHeight - 1, CLR_DARK
    SetLine 0, 14, 0, ScaleHeight - 1, CLR_LIGHT
    '
    SetLine 10, 0, 10, 13, CLR_DARK
    SetLine 11, 0, 11, 13, CLR_LIGHT
    SetLine 12, 1, 12, 13, CLR_DARK
    SetLine 12, 1, ScaleWidth, 1, CLR_DARK
    SetLine 13, 12, ScaleWidth - 1, 12, CLR_LIGHT
    SetLine ScaleWidth - 2, 2, ScaleWidth - 2, 12, CLR_LIGHT
    '
    SetLine ScaleWidth - 1, 0, ScaleWidth - 1, ScaleHeight, CLR_DARK
    '
    lblCaption(0).ZOrder 0
    cmdClose.ZOrder 0
    shpBox.ZOrder 0
    '
End Sub

Private Sub SetLine(X1, Y1, X2, Y2, Clr)
    Line (X1, Y1)-(X2, Y2), Clr
End Sub

Public Sub ShowWindow()
    UserControl.Extender.ZOrder 0
    If UserControl.Extender.Visible Then
        Call UserControl_Show
    Else
        UserControl.Extender.Visible = True
    End If
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "DefaultX", DefaultX, 20
        .WriteProperty "DefaultY", DefaultY, 20
    End With
End Sub

Public Property Get DefaultX() As Single
    DefaultX = m_DefaultX
End Property

Public Property Let DefaultX(ByVal vNewValue As Single)
    m_DefaultX = vNewValue
    PropertyChanged "DefaultX"
End Property

Public Property Get DefaultY() As Single
    DefaultY = m_DefaultY
End Property

Public Property Let DefaultY(ByVal vNewValue As Single)
    m_DefaultY = vNewValue
    PropertyChanged "DefaultY"
End Property

Public Sub LoadBuildingsData()
    '
    If bInitialised Then Exit Sub
    '
    Dim lIndex As Long, lCount As Long, lSel As Long
    Dim sName As String, iTm As ComctlLib.ListItem
    '
    ' Load parks
    lCount = INIReadValue(App.Path & "\data\buildings.ini", "Buildings", "Parks", 0, True)
    '
    For lIndex = 1 To lCount
        sName = INIReadValue(App.Path & "\data\buildings.ini", "Park" & lIndex, "Name", "")
        Set iTm = lstBuildings.ListItems.Add(, "Park" & lIndex, sName)
        iTm.Tag = "Park"
    Next
    '
    ' Load houses
    lCount = INIReadValue(App.Path & "\data\buildings.ini", "Buildings", "Houses", 0, True)
    '
    For lIndex = 1 To lCount
        sName = INIReadValue(App.Path & "\data\buildings.ini", "House" & lIndex, "Name", "")
        Set iTm = lstBuildings.ListItems.Add(, "House" & lIndex, sName)
        iTm.Tag = "House"
        If lIndex = 1 Then lSel = iTm.Index
    Next
    '
    ' Load offices
    lCount = INIReadValue(App.Path & "\data\buildings.ini", "Buildings", "Offices", 0, True)
    For lIndex = 1 To lCount
        sName = INIReadValue(App.Path & "\data\buildings.ini", "Office" & lIndex, "Name", "")
        Set iTm = lstBuildings.ListItems.Add(, "Office" & lIndex, sName)
        iTm.Tag = "Office"
    Next
    '
    If lstBuildings.ListItems.Count Then
        lstBuildings.ListItems(lSel).Selected = True
        Call lstBuildings_ItemClick(lstBuildings.ListItems(lSel))
    End If
    '
    bInitialised = True
    '
End Sub

Public Property Get BuildingName() As String
    BuildingName = lblName(0)
End Property

Public Property Get BuildingType() As String
    BuildingType = lstBuildings.selectedItem.Tag
End Property

Public Property Get Cost() As Long
    Cost = CLng(Mid(lblCost(0), 5))
End Property

Public Property Get ClearCost() As Long
    ClearCost = m_ClearCost
End Property

Public Property Get Phases() As Integer
    Phases = m_Phases
End Property

Public Property Get PhaseDays() As Integer
    PhaseDays = m_PhaseDays
End Property

Public Property Get Textures() As Collection
    Dim lIndex As Integer
    '
    Set Textures = New Collection
    For lIndex = 1 To m_Phases
        Textures.Add INIReadValue(App.Path & "\data\buildings.ini", lstBuildings.selectedItem.Key, ("Texture" & lIndex), 0)
    Next
    '
End Property

Public Property Get TaxPayments() As Long
    TaxPayments = m_TaxPayments
End Property

Public Property Get AllowSelection() As String
    AllowSelection = m_AllowSelection
End Property

