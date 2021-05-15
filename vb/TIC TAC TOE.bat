: SOF
@echo off
cls
color 6

:: Variable Start
set /a V_BOT=0
set /a V_PLAYER=0
set V_TURN=.
set V_TURN_S=.
set V_BOT_RNG=1
set V_1=.
set V_2=.
set V_3=.
set V_4=.
set V_5=.
set V_6=.
set V_7=.
set V_8=.
set V_9=.
set V_WLT=TIE
:: Variable End
goto T1

:: Function Start
: Draw
  echo.
  echo              Play Area
  echo "          %V_7%  |  %V_8%  |  %V_9%          "
  echo "         ---------------         "
  echo "          %V_4%  |  %V_5%  |  %V_6%          "
  echo "         ---------------         "
  echo "          %V_1%  |  %V_2%  |  %V_3%          "
  echo.
  goto Start2

: Bot_Move
  set /a V_BOT_RNG=%random% %%10 +1
  if %V_5% equ . if %V_BOT_RNG% geq 7 set /a V_BOT_RNG=5
  :: Defence
  if %V_1% equ X if %V_2% equ X if %V_3% equ . set /a V_BOT_RNG=3
  if %V_1% equ X if %V_2% equ . if %V_3% equ X set /a V_BOT_RNG=2
  if %V_1% equ . if %V_2% equ X if %V_3% equ X set /a V_BOT_RNG=1
  if %V_4% equ X if %V_5% equ X if %V_6% equ . set /a V_BOT_RNG=6
  if %V_4% equ X if %V_5% equ . if %V_6% equ X set /a V_BOT_RNG=5
  if %V_4% equ . if %V_5% equ X if %V_6% equ X set /a V_BOT_RNG=4
  if %V_7% equ X if %V_8% equ X if %V_9% equ . set /a V_BOT_RNG=9
  if %V_7% equ X if %V_8% equ . if %V_9% equ X set /a V_BOT_RNG=8
  if %V_7% equ . if %V_8% equ X if %V_9% equ X set /a V_BOT_RNG=7
  if %V_1% equ X if %V_4% equ X if %V_7% equ . set /a V_BOT_RNG=7
  if %V_1% equ X if %V_4% equ . if %V_7% equ X set /a V_BOT_RNG=4
  if %V_1% equ . if %V_4% equ X if %V_7% equ X set /a V_BOT_RNG=1
  if %V_2% equ X if %V_5% equ X if %V_8% equ . set /a V_BOT_RNG=8
  if %V_2% equ X if %V_5% equ . if %V_8% equ X set /a V_BOT_RNG=5
  if %V_2% equ . if %V_5% equ X if %V_8% equ X set /a V_BOT_RNG=2
  if %V_3% equ X if %V_6% equ X if %V_9% equ . set /a V_BOT_RNG=9
  if %V_3% equ X if %V_6% equ . if %V_9% equ X set /a V_BOT_RNG=6
  if %V_3% equ . if %V_6% equ X if %V_9% equ X set /a V_BOT_RNG=3
  if %V_1% equ X if %V_5% equ X if %V_9% equ . set /a V_BOT_RNG=9
  if %V_1% equ X if %V_5% equ . if %V_9% equ X set /a V_BOT_RNG=5
  if %V_1% equ . if %V_5% equ X if %V_9% equ X set /a V_BOT_RNG=1
  if %V_3% equ X if %V_5% equ X if %V_7% equ . set /a V_BOT_RNG=7
  if %V_3% equ X if %V_5% equ . if %V_7% equ X set /a V_BOT_RNG=5
  if %V_3% equ . if %V_5% equ X if %V_7% equ X set /a V_BOT_RNG=3
  :: Offence
  if %V_1% equ O if %V_2% equ O if %V_3% equ . set /a V_BOT_RNG=3
  if %V_1% equ O if %V_2% equ . if %V_3% equ O set /a V_BOT_RNG=2
  if %V_1% equ . if %V_2% equ O if %V_3% equ O set /a V_BOT_RNG=1
  if %V_4% equ O if %V_5% equ O if %V_6% equ . set /a V_BOT_RNG=6
  if %V_4% equ O if %V_5% equ . if %V_6% equ O set /a V_BOT_RNG=5
  if %V_4% equ . if %V_5% equ O if %V_6% equ O set /a V_BOT_RNG=4
  if %V_7% equ O if %V_8% equ O if %V_9% equ . set /a V_BOT_RNG=9
  if %V_7% equ O if %V_8% equ . if %V_9% equ O set /a V_BOT_RNG=8
  if %V_7% equ . if %V_8% equ O if %V_9% equ O set /a V_BOT_RNG=7
  if %V_1% equ O if %V_4% equ O if %V_7% equ . set /a V_BOT_RNG=7
  if %V_1% equ O if %V_4% equ . if %V_7% equ O set /a V_BOT_RNG=4
  if %V_1% equ . if %V_4% equ O if %V_7% equ O set /a V_BOT_RNG=1
  if %V_2% equ O if %V_5% equ O if %V_8% equ . set /a V_BOT_RNG=8
  if %V_2% equ O if %V_5% equ . if %V_8% equ O set /a V_BOT_RNG=5
  if %V_2% equ . if %V_5% equ O if %V_8% equ O set /a V_BOT_RNG=2
  if %V_3% equ O if %V_6% equ O if %V_9% equ . set /a V_BOT_RNG=9
  if %V_3% equ O if %V_6% equ . if %V_9% equ O set /a V_BOT_RNG=6
  if %V_3% equ . if %V_6% equ O if %V_9% equ O set /a V_BOT_RNG=3
  if %V_1% equ O if %V_5% equ O if %V_9% equ . set /a V_BOT_RNG=9
  if %V_1% equ O if %V_5% equ . if %V_9% equ O set /a V_BOT_RNG=5
  if %V_1% equ . if %V_5% equ O if %V_9% equ O set /a V_BOT_RNG=1
  if %V_3% equ O if %V_5% equ O if %V_7% equ . set /a V_BOT_RNG=7
  if %V_3% equ O if %V_5% equ . if %V_7% equ O set /a V_BOT_RNG=5
  if %V_3% equ . if %V_5% equ O if %V_7% equ O set /a V_BOT_RNG=3
  :: Random
  echo RNG %V_BOT_RNG%
  if %V_BOT_RNG% equ 1 (
    if %V_1% equ . (
      set /a V_BOT+=1
      set V_1=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 2 (
    if %V_2% equ . (
      set /a V_BOT+=1
      set V_2=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 3 (
    if %V_3% equ . (
      set /a V_BOT+=1
      set V_3=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 4 (
    if %V_4% equ . (
      set /a V_BOT+=1
      set V_4=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 5 (
    if %V_5% equ . (
      set /a V_BOT+=1
      set V_5=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 6 (
    if %V_6% equ . (
      set /a V_BOT+=1
      set V_6=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 7 (
    if %V_7% equ . (
      set /a V_BOT+=1
      set V_7=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 8 (
    if %V_8% equ . (
      set /a V_BOT+=1
      set V_8=O&& goto Start
    ) else goto Bot_Move
  )
  if %V_BOT_RNG% equ 9 (
    if %V_9% equ . (
      set /a V_BOT+=1
      set V_9=O&& goto Start
    ) else goto Bot_Move
  )
goto Start

: Check_Win
  If %V_1% equ X if %V_2% equ X if %V_3% equ X set V_WLT=WIN! && set /a V_PLAYER=5
  If %V_4% equ X if %V_5% equ X if %V_6% equ X set V_WLT=WIN! && set /a V_PLAYER=5
  If %V_7% equ X if %V_8% equ X if %V_9% equ X set V_WLT=WIN! && set /a V_PLAYER=5
  If %V_1% equ X if %V_4% equ X if %V_7% equ X set V_WLT=WIN! && set /a V_PLAYER=5
  If %V_2% equ X if %V_5% equ X if %V_8% equ X set V_WLT=WIN! && set /a V_PLAYER=5
  If %V_3% equ X if %V_6% equ X if %V_9% equ X set V_WLT=WIN! && set /a V_PLAYER=5
  If %V_1% equ X if %V_5% equ X if %V_9% equ X set V_WLT=WIN! && set /a V_PLAYER=5
  If %V_3% equ X if %V_5% equ X if %V_7% equ X set V_WLT=WIN! && set /a V_PLAYER=5

  If %V_1% equ O if %V_2% equ O if %V_3% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
  If %V_4% equ O if %V_5% equ O if %V_6% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
  If %V_7% equ O if %V_8% equ O if %V_9% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
  If %V_1% equ O if %V_4% equ O if %V_7% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
  If %V_2% equ O if %V_5% equ O if %V_8% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
  If %V_3% equ O if %V_6% equ O if %V_9% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
  If %V_1% equ O if %V_5% equ O if %V_9% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
  If %V_3% equ O if %V_5% equ O if %V_7% equ O set V_WLT=LOSE! && set /a V_PLAYER=5
exit /b

: T1
  set /a V_TURN=%random% %%10000
  if %V_TURN% lss 5000 set V_TURN_S=P
  if %V_TURN% geq 5000 set V_TURN_S=B
goto Start

:: Function End

: Start
  cls
  echo.
  if %V_Player% gtr 0 echo                               [0] - RESTART
  if %V_PLAYER% equ 0 echo                               [0] - EXIT
  echo               LEGEND
  echo "          7  |  8  |  9          "
  echo "         ---------------         "
  echo "          4  |  5  |  6          "
  echo "         ---------------         "
  echo "          1  |  2  |  3          "
  echo.
  goto Draw
: Start2
  call:Check_Win

  if %V_PLAYER% lss 5 echo  Press 1-9 for placement.
  echo.
  if %V_PLAYER% equ 5 echo     %V_WLT% && echo. && echo        PRESS ANY KEY TO RESTART. && pause >nul && goto SOF
  if %V_BOT% equ 5 echo     %V_WLT% && echo. && echo        PRESS ANY KEY TO RESTART. && pause >nul && goto SOF

  if %V_PLAYER% equ %V_BOT% set V_TURN=%V_TURN_S%
  if %V_PLAYER% lss %V_BOT% set V_TURN=P
  if %V_PLAYER% gtr %V_BOT% set V_TURN=B
  if %V_TURN% equ B goto Bot_Move

  choice /c 1234567890 /n>nul
  if %errorlevel% equ 10 (
    if %V_PLAYER% geq 1 goto SOF
    if %V_PLAYER% equ 0 goto EOF
  )
  if %errorlevel% equ 1 (
    If %V_1% equ . (
      set /a V_Player+=1
      set V_1=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 2 (
    If %V_2% equ . (
      set /a V_Player+=1
      set V_2=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 3 (
    If %V_3% equ . (
      set /a V_Player+=1
      set V_3=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 4 (
    If %V_4% equ . (
      set /a V_Player+=1
      set V_4=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 5 (
    If %V_5% equ . (
      set /a V_Player+=1
      set V_5=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 6 (
    If %V_6% equ . (
      set /a V_Player+=1
      set V_6=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 7 (
    If %V_7% equ . (
      set /a V_Player+=1
      set V_7=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 8 (
    If %V_8% equ . (
      set /a V_Player+=1
      set V_8=X&& goto Start
    )else echo invalid pick! && goto Start2
  )
  if %errorlevel% equ 9 (
    If %V_9% equ . (
      set /a V_Player+=1
      set V_9=X&& goto Start
    )else echo invalid pick! && goto Start2
  )

: EOF
cls
echo.
echo Exiting...
color
exit /b
