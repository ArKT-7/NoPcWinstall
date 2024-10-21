@echo off
setlocal enabledelayedexpansion

:: Set console mode
mode 800


echo ==========================================================
echo Searching for the index value of "Windows drive"...
echo ==========================================================
echo.

:: Initialize variables
set targetDrive=

:: Loop through all drives to find the Windows folder
for %%G in (C D E F G H I J K L M N O P Q R S T U V W Y Z) do (
    if exist %%G:\Windows\System32 (
        set targetDrive=%%G:
        goto :found
    )
)

echo Windows folder not found on any drive. Installation failed.
pause
exit /b

:found
echo.
echo ==========================================================
echo Target drive set to %targetDrive%
echo ==========================================================
echo.

echo ==========================================================
echo Assigning drive letter for bootloader...
echo ==========================================================
echo.

:: Initialize variable
set foundESP=false

:: List all volumes and find the FAT32 volume with label containing ESP
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

:: If no ESP or PE is found, search for an unnamed FAT32 volume
if not defined VolumeNumber (
    echo No FAT32 ESP or PE volume found. Searching for unnamed FAT32 volume...
    for /f "tokens=2,3,4 delims= " %%C in ('echo list volume ^| diskpart ^| findstr /I "FAT32" ^| findstr /V "ESP" ^| findstr /V "PE"') do (
        set VolumeNumber=%%C
        goto :volFound
    )
)

:: If no FAT32 volume is found
if not defined VolumeNumber (
    echo No FAT32 ESP, PE, or unnamed FAT32 volume found.
    (
    echo list vol
    echo list part
    echo exit
    ) | diskpart
    exit /b 1
)

:volFound
echo Found FAT32 volume, Volume Number %VolumeNumber%

:: Format the volume, assign the drive letter S, and label it "ESPNABU"
(
    echo select volume %VolumeNumber%
    echo format fs=fat32 quick label=ESPNABU
    echo assign letter=S
) | diskpart

echo.
echo Volume has been formatted with FAT32, assigned to S, and labeled "ESPNABU".
echo.
echo ==========================================================
echo Creating bootloader file...
echo ==========================================================
echo.

bcdboot %targetDrive%\windows /s S: /f UEFI

echo.
echo ==========================================================
echo Windows installation process completed!
echo ==========================================================
echo.
echo ==========================================================
echo Now performing driver installation...
echo ==========================================================
call "%targetDrive%\installer\Driver\DriverInstaller.lnk"

echo.
echo ==========================================================
echo Rebooting in 5 seconds...
echo ==========================================================
echo.

echo this script is written by https://gitHub.com/Kumar-Jy and Modified by °⊥⋊ɹ∀° https://gitHub.com/ArKT-7

shutdown /r /f /t 5
echo.
echo ==========================================================
echo Removing installer directory...
echo ==========================================================
cd %targetDrive%\
rmdir /s /q "%targetDrive%\installer"