@echo off
set "params=%*"&cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/c cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
setlocal enabledelayedexpansion
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/batbox.exe -OutFile '%temp%\batbox.exe'
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/getinput.exe -OutFile '%temp%\getinput.exe'
set "batbox=%temp%\batbox.exe"
set "getinput=%temp%\getinput.exe"
Title Software Download
Mode 48,17
cls
"%Batbox%" /h 0
set "array="
set "array0="
set arrayindex=0
set entry=0
set entries=9
set "entrydata_0=                    Windows                   "
set "entrydata_1=                    Office                    "
set "entrydata_2=                   Adobe CC                   "
set "entrydata_3=                   Adobe CS6                  "
set "entrydata_4=                  StartIsBack                 "
set "entrydata_5=                    Start11                   "
set "func_5=install_start11"
set "entrydata_6=                     Help                     "
set "entrydata_7=                   Defender                   "
set "func_7=defender"
set "entrydata_8=                  W8.0 Certs                  "
set "func_8=install_w8_certs"
set "entrydata_9=                    VMWare                    "

set entries_0=1
set "entrydata_0_0=                Install Windows               "
set "func_0_0=install_windows"
set "entrydata_0_1=               Activate with MAS              "
set "func_0_1=MSActivation"
set "entrydata_0_2=               Activate with KMS              "&rem NOT AVAILABLE

set entries_1=1
set "entrydata_1_0=                Install Office                "
set "func_1_0=install_office"
set "entrydata_1_1=               Activate with MAS              "
set "func_1_1=MSActivation"

set entries_2=4
set "entrydata_2_0=               Install Adobe CC               "
set "func_2_0=CreativeCloud"
set "entrydata_2_1=              Activate with GenP              "
set "func_2_1=GenP"
set "entrydata_2_2=              Activate with GenP3             "
set "func_2_2=GenP3"
set "entrydata_2_3=               Activate with UAP              "
set "func_2_3=UAP"
set "entrydata_2_4=             Activate with AMTEmu             "
set "func_2_4=AMTEmu"

set entries_3=2
set "entrydata_3_0=               Install Adobe CS6              "
set "func_3_0=CreativeSuite6"
set "entrydata_3_1=               Activate with UAP              "
set "func_3_1=UAP"
set "entrydata_3_2=             Activate with AMTEmu             "
set "func_3_2=AMTEmu"

set entries_4=1
set "entrydata_4_0=                Install StartIsBack           "
set "func_4_0=SIB"
set "entrydata_4_1=               Activate StartIsBack           "
set "func_4_1=ActivateSIB"

set entries_6=0
set "entrydata_6_0=                No notes available            "
set "func_6_0=back"


set entries_9=2
set "entrydata_9_0=                 Install VMWare               "
set "func_9_0=install_vmware"
set "entrydata_9_1=                Activate VMWare               "
set "func_9_1=activate_vmware"
set "entrydata_9_2=                 Unlock VMWare                "
set "func_9_2=unlock_vmware"

goto :home

:install_windows
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/windows ^| iex
exit /b

:install_office
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/office ^| iex
exit /b

:MSActivation
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/activate ^| iex
exit /b

:SIB
cls
ver|find "6.2"
if not errorlevel 1 (
  powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://www.startisback.com/StartIsBack_setup.exe -OutFile "%WinDir%\SIB.exe"
  start "" "%WinDir%\SIB.exe"
)
ver|find "6.3"
if not errorlevel 1 (
  powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://www.startisback.com/StartIsBackPlus_setup.exe -OutFile "%WinDir%\SIB.exe"
  start "" "%WinDir%\SIB.exe"
)
ver|find "10.0"
if not errorlevel 1 (
  wmic os get caption /value|findstr /C:"Microsoft Windows 11"
  if errorlevel 1 (
    powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://www.startisback.com/StartIsBackPlusPlus_setup.exe -OutFile "%WinDir%\SIB.exe"
    start "" "%WinDir%\SIB.exe"
  ) else (
    curl https://www.startallback.com/download.php -L -o "%WinDir%\SAB.exe"
    start "" "%WinDir%\SAB.exe"
  )
)
exit /b

:ActivateSIB
wmic os get caption /value|findstr /C:"Microsoft Windows 11"
if errorlevel 1 (
  powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/msimg32.dll -OutFile "${Env:ProgramFiles(x86)}\StartIsBack\msimg32.dll"
  taskkill /f /im explorer.exe
  start explorer
) else (
  curl https://microtoolbox.github.io/StartAllBack_3.x_Patch.exe -o "%temp%\StartAllBack_3.x_Patch.exe"
  start /wait "" "%temp%\StartAllBack_3.x_Patch.exe"
  del /F /Q "%temp%\StartAllBack_3.x_Patch.exe"
)
exit /b

:install_vmware
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://www.vmware.com/go/getworkstation-win -OutFile "%temp%\VMWare_Workstation_Pro.exe"
start /wait "" "%temp%\VMWare_Workstation_Pro.exe"
del /F /Q "%temp%\VMWare_Workstation_Pro.exe"
exit /b

:activate_vmware
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/vmwpkg.exe -OutFile "%temp%\vmwpkg.exe"
start /wait "" "%temp%\vmwpkg.exe"
del /F /Q "%temp%\vmwpkg.exe"
exit /b

:unlock_vmware
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/Unlocker.exe -OutFile "%temp%\Unlocker.exe"
start /wait "" "%temp%\Unlocker.exe"
del /F /Q "%temp%\Unlocker.exe"
exit /b

:defender
powershell Add-MpPreference -ExclusionPath '%WinDir%\dcontrol.exe' >nul 2>&1
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/dcontrol.exe -OutFile "%WinDir%\dcontrol.exe"
powershell Add-MpPreference -ExclusionPath '%WinDir%\dcontrol.exe' >nul 2>&1
start "" "%WinDir%\dcontrol.exe"
exit /b

:CreativeCloud
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/adobe_cc ^| iex
exit /b

:CreativeSuite6
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/adobe_cs6 ^| iex
exit /b

:GenP
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/adobe_genp ^| iex
exit /b

:GenP3
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/adobe_genp3 ^| iex
exit /b

:AMTEmu
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/adobe_amtemu ^| iex
exit /b

:UAP
cls
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';irm https://microtoolbox.github.io/adobe_uap ^| iex
exit /b

:install_w8_certs
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/Windows8-RT-KB3004394-x64.msu -OutFile "${Env:temp}\Windows8-RT-KB3004394-x64.msu"
start /wait "" "%temp%\Windows8-RT-KB3004394-x64.msu"
exit /b

:install_start11
powershell [System.Net.ServicePointManager]::SecurityProtocol = 'TLS12';iwr https://microtoolbox.github.io/Start11.exe  -OutFile "${Env:WinDir}\Start11.exe"
start "" "%WinDir%\Start11.exe"
exit /b

:back
set /a arrayindex=arrayindex-1
if !arrayindex! LSS 0 set arrayindex=0
call set array=%%array!arrayindex!%%
set entry=0
cls
goto :home








:home
"%batbox%" /g 0 0
set /a centerentries=entries%array%-7
if %entry% LSS 7 (
  set /a entrystart=0
  set /a entryend=15
) else if %entry% GEQ %centerentries% (
  set /a entrystart=entries%array%-15
  set /a entryend=entries%array%
) else (
  set /a entrystart=entry-7
  set /a entryend=entry+8
)
if %entrystart% LSS 0 set entrystart=0
if %entryend% GTR %entries!array!% set entryend=%entries!array!%
for /l %%i in (%entrystart%,1,%entryend%) do (
  if not %%i GTR !entries%array%! if "%%i"=="%entry%" (
    "%Batbox%" /c 0x70 /a 124 /d "!entrydata%array%_%%i!" /a 124 /c 0x07
  ) else (
    "%Batbox%" /c 0x07 /a 124 /d "!entrydata%array%_%%i!" /a 124 /c 0x07
  )
)
"%batbox%" /g 0 16 /d "Arrows=Navigate               Enter=Ok Esc=Back"
call :getinput
rem mshta.exe vbscript:Execute^("MsgBox ""Input type: %input%, %key%""&Chr(13)&Chr(10)&""Input pos: %row%,%col%"", vbOkOnly, ""title"""^)^(window.close^)
if "%input%"=="0" (
if "%key%"=="295" (
  ::Enter Menu
  if DEFINED entries%array%_%entry% (
    set "array=%array%_%entry%"
    set /a arrayindex=arrayindex+1
    set "array%arrayindex%=%array%"
    set entry=0
    cls
  ) else if DEFINED func%array%_%entry% (
    call :!func%array%_%entry%!
    cls
  )
  cls
) else if "%key%"=="13" (
  ::Enter Menu
  if DEFINED entries%array%_%entry% (
    set "array=%array%_%entry%"
    set /a arrayindex=arrayindex+1
    set "array%arrayindex%=%array%"
    set entry=0
    cls
  ) else if DEFINED func%array%_%entry% (
    call :!func%array%_%entry%!
    cls
  )
  cls
) else if "%key%"=="296" (
  ::Down
  if not "%entry%"=="!entries%array%!" set /a entry=entry+1
) else if "%key%"=="293" (
  ::Exit Menu
  set /a arrayindex=arrayindex-1
  if !arrayindex! LSS 0 set arrayindex=0
  call set array=%%array!arrayindex!%%
  set entry=0
  cls
) else if "%key%"=="294" (
  ::Up
  if not "%entry%"=="0" set /a entry=entry-1
) else if "%key%"=="27" (
  ::Exit Menu or App
  if "!array!"=="" exit /b
  set /a arrayindex=arrayindex-1
  if !arrayindex! LSS 0 set arrayindex=0
  call set array=%%array!arrayindex!%%
  set entry=0
  cls
)) else if "%input%"=="1" (
  ::Left Click, Enter/Move
  set /a _entry=entrystart+row
  if "!_entry!"=="!entry!" (
    if DEFINED entries%array%_%entry% (
      set "array=%array%_%entry%"
      set /a arrayindex=arrayindex+1
      set "array%arrayindex%=%array%"
      set entry=0
      cls
    ) else if DEFINED func%array%_%entry% (
      call :!func%array%_%entry%!
    )
  ) else (
    set "entry=!_entry!
  )
  set "_entry="
  call set "_entries=%%entries!array!%%"
  if !entry! GTR !_entries! set entry=!_entries!
  set "_entries="
  goto :home
)
goto :home

:getinput
"%temp%\getinput.exe"
if %errorlevel% gtr 0 (
    set input=0
    set key=%errorlevel%
) else (
    set /A "input=-%errorlevel%, row=input >> 16, col=input & 0xFFFF"
    if !col! lss 32768 (
        set input=1
    ) else (
        set /A col-=32768
        set input=2
    )
)
exit /b
