Attribute VB_Name = "modDXSound"
Option Explicit
'
' Sound coding is from "Greg's Pool 3D",
' By Grzegorz Holdys (Wroclaw, Poland) Email: gregor@kn.pl
'

'DirectX8 objects:
Private m_DX                    As New DirectX8

'Sounds:
Private m_DirectSound8          As DirectSound8
Private m_DSBeep                As DirectSoundSecondaryBuffer8
Private m_DSError               As DirectSoundSecondaryBuffer8
Private m_DSBlast               As DirectSoundSecondaryBuffer8
Private m_DSBuild               As DirectSoundSecondaryBuffer8
Private m_DSIncome              As DirectSoundSecondaryBuffer8
Private m_DSMONSTER_Foot1       As DirectSoundSecondaryBuffer8
Private m_DSMONSTER_Foot2       As DirectSoundSecondaryBuffer8
Private m_DSMONSTER_Siren       As DirectSoundSecondaryBuffer8
Private m_DSMONSTER_Destroy     As DirectSoundSecondaryBuffer8

'-------------------------------------------------------------
' Name: SetupSounds()
' Desc: Loads sound files into buffers
' By  : Grzegorz Holdys (Wroclaw, Poland) Email: gregor@kn.pl
'-------------------------------------------------------------
Public Sub SetupSounds()
    
    ' Create a default DirectSound object:
    Set m_DirectSound8 = m_DX.DirectSoundCreate(vbNullString)
    ' Set the cooperation level:
    m_DirectSound8.SetCooperativeLevel frmMain.hWnd, DSSCL_PRIORITY
    
    ' Create and fill in the buffer description structure...
    Dim dsBufDesc As DSBUFFERDESC
    dsBufDesc.lFlags = DSBCAPS_CTRLVOLUME
    ' Create the sound buffers from ".wav" files. If any file is missing, just skip it:
    On Error Resume Next
    Set m_DSBeep = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Beep.wav", dsBufDesc)
    Set m_DSError = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Error.wav", dsBufDesc)
    Set m_DSBuild = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Construct.wav", dsBufDesc)
    Set m_DSBlast = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Blast.wav", dsBufDesc)
    Set m_DSIncome = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Income.wav", dsBufDesc)
    Set m_DSMONSTER_Foot1 = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Foot1.wav", dsBufDesc)
    Set m_DSMONSTER_Foot2 = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Foot2.wav", dsBufDesc)
    Set m_DSMONSTER_Siren = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Siren.wav", dsBufDesc)
    Set m_DSMONSTER_Destroy = m_DirectSound8.CreateSoundBufferFromFile(App.Path & "\Sounds\Destroy.wav", dsBufDesc)
End Sub

Public Sub PlaySound(ByVal SoundName As String)
    Dim dsBuffer As DirectSoundSecondaryBuffer8
    '
    If m_SoundEffects = False Then Exit Sub
    '
    Select Case SoundName
        Case "BEEP"
            Set dsBuffer = m_DSBeep
        Case "BLAST"
            Set dsBuffer = m_DSBlast
        Case "BUILD"
            Set dsBuffer = m_DSBuild
        Case "INCOME"
            Set dsBuffer = m_DSIncome
            If dsBuffer.GetStatus = DSBSTATUS_PLAYING Then Exit Sub
        Case "ERROR"
            Set dsBuffer = m_DSError
        Case "FOOT1"
            Set dsBuffer = m_DSMONSTER_Foot1
        Case "FOOT2"
            Set dsBuffer = m_DSMONSTER_Foot2
        Case "SIREN"
            Set dsBuffer = m_DSMONSTER_Siren
        Case "DESTROY"
            Set dsBuffer = m_DSMONSTER_Destroy
    End Select

    If Not (dsBuffer Is Nothing) Then
        With dsBuffer
            .SetVolume 0
            .stop
            .SetCurrentPosition 0
            .play DSBPLAY_DEFAULT
        End With
    End If
End Sub

Public Sub CleanupSounds()
    Set m_DirectSound8 = Nothing
    Set m_DSBeep = Nothing
    Set m_DSError = Nothing
    Set m_DSBlast = Nothing
    Set m_DSBuild = Nothing
    Set m_DX = Nothing
End Sub
