@echo off
if "%1" neq "nofont" (
    reg add "HKCU\Console" /v FontSize /t REG_DWORD /d 0x00220000 /f >nul 2>&1
    reg add "HKCU\Console" /v WindowSize /t REG_DWORD /d 0x00190050 /f >nul 2>&1
    reg add "HKCU\Console" /v WindowPosition /t REG_DWORD /d 0x00000000 /f >nul 2>&1
    start "" /wait cmd /c "%~f0" nofont
    exit /b
)
setlocal enabledelayedexpansion
echo Copyright (C) 2025-26 https://github.com/ArKT-7, https://github.com/Kumar-jy
mode 800
echo.
echo ==============================================================
echo        Welcome to Windows Installation in Xiaomi Pad 5
echo ==============================================================
echo                  Version: NoPcWinstall-V4
echo                 Made by: ArKT and Kumar_Jy
echo     Drivers And UEFI: Project-Aloha,map220v,remtrik And idk
echo ==============================================================
echo.
set flashboot=
set targetDrive=
for %%G in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%G:\installer\install.bat (
		set flashboot=%%G:\installer\sta.exe -p %%G:\boot.img -n 
		set targetDrive=%%G:
        goto :found
    )
)
echo install.bat not found.
echo Take picture of error, force Reboot and ask for help...
pause
exit /b 1
:found
if exist %targetDrive%\Windows\Explorer.exe (
    echo Windows is already installed.
    goto :formatAndAssign
)
echo.
echo ==============================================================
echo                Searching for the index value
echo                    of "Windows Image"...
echo ==============================================================
echo.
set imageFile=
for %%G in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%G:\installer\install.esd (
        set imageFile=%%G:\installer\install.esd
        goto :found
    ) else if exist %%G:\installer\install.wim (
	set imageFile=%%G:\installer\install.wim
        goto :found
    )
)
echo Neither ESD nor WIM file found on any drive.
echo Take picture of error, force Reboot and ask for help...
call %flashboot%
pause
exit /b 1
:found
echo.
echo ==============================================================
echo          Image file found at %imageFile%
echo                  Windows drive set to %targetDrive%
echo ==============================================================
echo.
echo ==============================================================
echo     Searching index of Windows in the following order...
echo               1.  Windows 11 Pro
echo               2.  Windows 11 IoT Enterprise LTSC
echo               3.  Windows 11 Enterprise
echo               4.  Windows 11 Home
echo               5.  Windows 10 Pro
echo               6.  Windows 10 Home
echo ==============================================================
echo.
set index=
set Name=""
for /f "tokens=2 delims=: " %%i in ('dism /Get-WimInfo /WimFile:%imageFile% ^| findstr /i /c:"Index :"') do (
    set currentIndex=%%i
    for /f "tokens=*" %%j in ('dism /Get-WimInfo /WimFile:%imageFile% /Index:%%i ^| findstr /i /c:"Name : Windows 11 Pro"') do (
        set index=%%i
        set Name="Windows 11 Pro"
        goto :indexFound
    )
)
if "%index%"=="" echo "Windows 11 Pro not found in the image file."
if "%index%"=="" (
    for /f "tokens=2 delims=: " %%i in ('dism /Get-WimInfo /WimFile:%imageFile% ^| findstr /i /c:"Index :"') do (
        set currentIndex=%%i
        for /f "tokens=*" %%j in ('dism /Get-WimInfo /WimFile:%imageFile% /Index:%%i ^| findstr /i /c:"Name : Windows 11 IoT Enterprise LTSC"') do (
            set index=%%i
            set Name="Windows 11 IoT Enterprise LTSC"
            goto :indexFound
        )
    )
)
if "%index%"=="" echo "Windows 11 IoT Enterprise LTSC not found in the image file."
if "%index%"=="" (
    for /f "tokens=2 delims=: " %%i in ('dism /Get-WimInfo /WimFile:%imageFile% ^| findstr /i /c:"Index :"') do (
        set currentIndex=%%i
        for /f "tokens=*" %%j in ('dism /Get-WimInfo /WimFile:%imageFile% /Index:%%i ^| findstr /i /c:"Name : Windows 11 Enterprise"') do (
            set index=%%i
            set Name="Windows 11 Enterprise"
            goto :indexFound
        )
    )
)
if "%index%"=="" echo "Windows 11 Enterprise not found in the image file."
if "%index%"=="" (
    for /f "tokens=2 delims=: " %%i in ('dism /Get-WimInfo /WimFile:%imageFile% ^| findstr /i /c:"Index :"') do (
        set currentIndex=%%i
        for /f "tokens=*" %%j in ('dism /Get-WimInfo /WimFile:%imageFile% /Index:%%i ^| findstr /i /c:"Name : Windows 11 Home"') do (
            set index=%%i
            set Name="Windows 11 Home"
            goto :indexFound
        )
    )
)
if "%index%"=="" echo "Windows 11 Home not found in the image file."
if "%index%"=="" (
    for /f "tokens=2 delims=: " %%i in ('dism /Get-WimInfo /WimFile:%imageFile% ^| findstr /i /c:"Index :"') do (
        set currentIndex=%%i
        for /f "tokens=*" %%j in ('dism /Get-WimInfo /WimFile:%imageFile% /Index:%%i ^| findstr /i /c:"Name : Windows 10 Pro"') do (
            set index=%%i
            set Name="Windows 10 Pro"
            goto :indexFound
        )
    )
)
if "%index%"=="" echo "Windows 10 Pro not found in the image file."
if "%index%"=="" (
    for /f "tokens=2 delims=: " %%i in ('dism /Get-WimInfo /WimFile:%imageFile% ^| findstr /i /c:"Index :"') do (
        set currentIndex=%%i
        for /f "tokens=*" %%j in ('dism /Get-WimInfo /WimFile:%imageFile% /Index:%%i ^| findstr /i /c:"Name : Windows 10 Home"') do (
            set index=%%i
            set Name="Windows 10 Home"
            goto :indexFound
        )
    )
)
if "%index%"=="" (
    echo "Index not found for the specified Windows version."
    echo "Please check your Windows image and restart installation."
    call %flashboot%
    pause
    exit /b
)
:indexFound
echo ==============================================================
echo         Index value %index% found for %Name%
echo         starting windows installation...
echo ==============================================================
echo.
echo Applying image to %targetDrive%...
dism /Apply-Image /ImageFile:%imageFile% /Index:%index% /ApplyDir:%targetDrive%
echo Image applied successfully!
echo.
:formatAndAssign
echo ==============================================================
echo           Assigning drive letter for bootloader...
echo ==============================================================
echo.
set foundESP=false
for /f "tokens=2,3,4 delims= " %%A in ('echo list volume ^| diskpart ^| findstr /I "FAT32" ^| findstr /I "ESP"') do (
    set VolumeNumber=%%A
    set foundESP=true
    goto :volFound
)
if not !foundESP! == true (
    echo No FAT32 ESP volume found. Searching for PE...
    for /f "tokens=2,3,4 delims= " %%B in ('echo list volume ^| diskpart ^| findstr /I "FAT32" ^| findstr /I "PE"') do (
        set VolumeNumber=%%B
        goto :volFound
    )
)
if not defined VolumeNumber (
    echo No FAT32 ESP or PE volume found.
    echo Take picture of error, force Reboot and ask for help.
    call %flashboot%
    pause
    exit /b 1
)
:volFound
echo Found FAT32 volume with ESP or PE, Volume Number %VolumeNumber%
(
    echo select volume %VolumeNumber%
    echo format fs=fat32 quick label=ESPNABU
    echo assign letter=S
) | diskpart
echo.
echo ==============================================================
echo          Volume No. %VolumeNumber% has been formatted with FAT32,
echo            Assigned letter S, and labeled ESPNABU.
echo ==============================================================
echo.
echo.
echo ==============================================================
echo                   Creating bootloader file...
echo ==============================================================
echo.
bcdboot %targetDrive%\windows /s S: /f UEFI
echo.
echo ==============================================================
echo           Windows installation process completed!
echo ==============================================================
echo.
echo.
echo ==============================================================
echo             Now performing driver installation...
echo ==============================================================
set xmlFound=false
for %%F in (%targetDrive%\installer\Driver\definitions\Desktop\ARM64\Internal\*.xml) do (
    ren "%%F" arkt.xml
    set xmlFound=true
    goto :fileFound
)
if "!xmlFound!"=="false" (
    echo No XML files found in %targetDrive%\installer\Driver\definitions\Desktop\ARM64\Internal\.
    %flashboot%
    pause
    exit /b 1
)
:fileFound
echo XML file found and renamed to arkt.xml.
:continue
call "X:\DriverInstaller\DriverInstaller.lnk"
echo.
echo ==============================================================
echo Installation is Completed. Rebooting in Windows in 5 seconds.
echo ==============================================================
shutdown /r /t 5
echo.
echo ==============================================================
echo               Cleaning Installation File....
echo ==============================================================
cd %targetDrive%
rmdir /s /q "%targetDrive%\installer"