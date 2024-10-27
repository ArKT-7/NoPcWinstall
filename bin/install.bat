@echo off
setlocal enabledelayedexpansion

:: Set console mode
mode 800

echo.
echo ============================================================
echo            Welcome to Windows Installation on ARM64 
echo ============================================================
echo.
echo.
echo ============================================================
echo             Searching for the index value 
echo                 of "Windows Image"...
echo ============================================================
echo.

:: Initialize variables
set imageFile=
set targetDrive=

:: Loop through all drives to find the Windows folder
for %%G in (C D E F G H I J K L M N O P Q R S T U V W Y Z) do (
    if exist %%G:\Windows\System32 (
        set targetDrive=%%G:
        set "flashboot=%%G:\installer\sta.exe -n -p %%G:\boot.img"
        goto :found
    )
)

:: Loop through all drives to find the boot file
for %%G in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%G:\boot.img (
        set targetDrive=%%G:
	set "flashboot=%%G:\installer\sta.exe -n -p %%G:\boot.img"
    )
)

No windows installation found
echo Take picture of error, force Reboot and ask for help...
call %flashboot%
pause
exit /b 1

:found
echo.
echo ============================================================
echo           Windows drive set to %targetDrive%
echo           Debug: targetDrive is set to "%targetDrive%"
echo           flashboot path test 2 : "%flashboot%"
echo ============================================================
echo.

move /y "%targetDrive%\*.lnk" "%targetDrive%\Users\Default\Desktop" 2>nul

echo.
echo ============================================================
echo           Assigning drive letter for 
echo                  bootloader...
echo ============================================================
echo.

:: List all volumes and find the FAT32 volume with label containing ESP
set foundESP=false
for /f "tokens=2,3,4 delims= " %%A in ('echo list volume ^| diskpart ^| findstr /I "FAT32" ^| findstr /I "ESP"') do (
    set VolumeNumber=%%A
    set foundESP=true
    goto :volFound
)

:: If no FAT32 ESP volume found, search for PE
if not !foundESP! == true (
    echo No FAT32 ESP volume found. Searching for PE...
    for /f "tokens=2,3,4 delims= " %%B in ('echo list volume ^| diskpart ^| findstr /I "FAT32" ^| findstr /I "PE"') do (
        set VolumeNumber=%%B
        goto :volFound
    )
)

:: If neither ESP nor PE was found, search for any FAT32 volume of at least 300 MB
if not defined VolumeNumber (
    echo No FAT32 ESP or PE volume found. Searching for any FAT32 volume with at least 300 MB...
    for /f "tokens=2,3,4,5 delims= " %%C in ('echo list volume ^| diskpart ^| findstr /I "FAT32"') do (
        set volumeSize=%%D
        set unit=%%E
        if "!unit!"=="MB" if !volumeSize! GEQ 300 (
            set VolumeNumber=%%C
            goto :volFound
        )
    )
)

if not defined VolumeNumber (
    echo No FAT32 ESP or PE or required Minium 300mb volume found.
    echo Take picture of error, force Reboot and ask for help.
    call %flashboot%
    pause
    exit /b 1
)

:volFound
echo Found FAT32 volume with ESP or PE, Volume Number %VolumeNumber%

:: Format the volume, assign the drive letter S, and label it "ESPNABU"
(
    echo select volume %VolumeNumber%
    echo format fs=fat32 quick label=ESPNABU
    echo assign letter=S
) | diskpart

echo.
echo ============================================================
echo           %VolumeNumber% has been formatted with FAT32,
echo           Assigned letter S, and labeled "ESPNABU".
echo ============================================================
echo.
echo.
echo ============================================================
echo           Creating bootloader file...
echo ============================================================
echo.
bcdboot %targetDrive%\windows /s S: /f UEFI

echo.
echo.
echo ==========================================================
echo           Now performing driver installation...
echo ==========================================================

:: Searching for an XML file in the target directory and renaming it to sog.xml
set xmlFound=false
for %%F in (%targetDrive%\installer\Driver\definitions\Desktop\ARM64\Internal\*.xml) do (
    ren "%%F" sog.xml
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
echo XML file found and renamed to sog.xml.

:continue
call "X:\DriverInstaller\DriverInstaller.lnk"

echo.
echo ==========================================================
echo Installation Completd.Rebooting in Windows in 5 seconds. 
echo This script is written by Kumar-Jy, telegram : @kumar_jy
echo
echo This script is modified by Github : ArKT-7, telegram : @kumar_jy
echo ==========================================================
shutdown /r /t 5

echo.
echo ==========================================================
echo           Cleaning Installation File........
echo ==========================================================
cd %targetDrive%
rmdir /s /q "%targetDrive%\installer"
