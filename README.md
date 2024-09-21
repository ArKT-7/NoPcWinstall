# No-Pc-Winstall #No-TWRP #No-Other-Device #Self-Install-On-Device
<p align="center"><a href="README.md"><img src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425"></a></p>

- ***`Currently supported Device`***. -
  
| Device Name    | Codename | Status       |
| -------------- | -------- | ------------ |
| Xiaomi Pad 5   | Nabu     | ✅ Available |
More coming soon!
# Running Windows on the Xiaomi Pad 5

## Try out my new script for automatically installing/re-installing Windows on Nabu with only one command in Termux app/adb shell on Nabu — it's currently in early beta stage i'll soon add more things also colors and make the script good looking 😁. I’d love your feedback on any issues or ideas for new features. Share your thoughts with me via the Telegram link below."
[![Telegram](https://img.shields.io/badge/Chat-Telegram-brightgreen.svg?logo=telegram&style=flat-square)](https://telegram.me/ArKT_7)
[![Telegram](https://img.shields.io/badge/Chat-Telegram-brightgreen.svg?logo=telegram&style=flat-square)](https://t.me/ArKT_7)

## ⚠️ Warning
> [!NOTE]
> - We're not responsible for bricked devices, missing recovery partitions, dead xiaomi factoryline workers cowboys, dead pmics, dead ram, dead display ics, dead cpus, any xiaomi shenanigans, dead cats or dogs, nuclear wars or you getting fired because you forgot to boot back into android for the alarm.
> - This project is in development stage, all the files here have been contributed by other users, here you will find a guide with the working files we managed to get. This is a delicate process, do it under your own risk and follow all the steps carefully.

> [!WARNING]
> **IF YOU AREN'T COMFORTABLE MODDING YOUR TABLET OR ITS PARTITION TABLE OR YOU ARE PARANOID OF BRICKING YOUR DEVICE CLICK AWAY NOW!!! YOU HAVE BEEN WARNED, YOU ARE ON YOUR OWN IF YOU BRICK YOUR DEVICE!!! AGAIN! YOU HAVE BEEN WARNED!!!**

---
## Get Started
> [!TIP]
> To open this site quickly, enter this URL: [**bit.ly/arkt7**](https://bit.ly/arkt7).
> 
> It's better if you factory reset(format) your Android device before fresh installing or re-partition install and also make sure to backup data your data


## Prerequisites
- ```A functioning brain (seriously, you'll need to think!)```
  
- ```Unlocked bootloader``` (If your bootloader is locked and you don't know how to unlock it use [this](https://github.com/ArKT-7/won-deployer/blob/main/guide/English/unlock-bootloader-en.md) guide)

- ```Your Device Must be Rooted (guide soon!)```
---
## Files you need to downlaod 
### Put this two file in your Device internal Storage
- [```ARM Windows ESD```](https://arkt-7.github.io/woawin/) (Select - Build:  ```Select Build Number``` and Language:  ```Select your Language```)
    
- [```Nabu_Wininstaller_  .zip```](https://github.com/Kumar-Jy/Windows-in-NABU-Without-PC/releases/tag/Nabu-WinInstaller) (```Download Latest directly by clcicking here - ``` [Nabu-WinInstaller-20092024.zip](https://github.com/Kumar-Jy/Windows-in-NABU-Without-PC/releases/download/Nabu-WinInstaller/Nabu-WinInstaller-20092024.zip))
> [!NOTE]
> - If you are doing partitioning(first time install) or re-partitioning, make sure to download and put these files in your Nabu only after completing the partition process, as the device will be formatted during partitioning so also make sure to backup your data if doing partitioning.

---
## Running the script For Partition/Re-partition or Install Windows

### 1. Install Termux apk
## `>_` [Downlaod Termux app](https://media.githubusercontent.com/media/ArKT-7/NoPcWinstall/main/bin/termux.apk) - [Mirror Link](https://f-droid.org/repo/com.termux_1000.apk)

### 2. Open Termux app and Type
```bash
su
```
### 3. Then Grant Root 

### 4. Copy this command and paste in Termux app
> [!NOTE]
> - Don't run the command twice if it errors or gets canceled while run. Restart your device first, then run it again.
> - If you doing re-partition/Partition and if there is any error then make sure to take a photo before restart
```bash
su -c "mkdir -p /data/data/arkt && chmod 777 /data/data/arkt && cd /data/data/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nopcwinstall -o /data/data/arkt/nopcwinstall && chmod 777 /data/data/arkt/nopcwinstall && su -c "/data/data/arkt/nopcwinstall""
```
> [!NOTE]
> - Copy this command and Paste if upper not work

```bash
su -c "chmod 777 /data/local/tmp && cd /data/local/tmp && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nopcwinstall -o /data/local/tmp/nopcwinstall && chmod 777 /data/local/tmp/nopcwinstall && su -c "/data/local/tmp/nopcwinstall""
```
> [!NOTE]
> - Copy this command and Paste if upper both not work
```bash
mkdir -p ~/arkt && chmod 777 ~/arkt && cd ~/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nopcwinstallaosp -o nopcwinstallaosp && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/bin/busybox -o busybox && chmod 777 nopcwinstallaosp && chmod 777 busybox && su -c "./nopcwinstallaosp"
```

## Now Just Follow the On screen Instruction what it asking and rest just leave it and wait
   - **`Good Luck`**.

> [!IMPORTANT]
> If you faced any error please share the screenshot and error to [@ArKT_7](https://telegram.me/ArKT_7)

---
## Miscellaneous
-  ```WOA HELPER APP``` (for Dualbooting from Android To Windows [Downlaod and Install](https://github.com/Marius586/WoA-Helper-update/releases/tag/WOA))
  
```Official Guides For Xiaomi Pad 5 (Nabu)```

- [Manual with PC](https://github.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/blob/main/guide/English/1-partition-en.md)
  
- [Without PC (TWRP)](https://github.com/Kumar-Jy/Windows-in-NABU-Without-PC/blob/main/guide/Installation.md)

- [Automatic with PC](https://github.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/blob/main/guide/English/won-deployer-install-en.md)

---



## Credits and Thankfull to

- [@Kumar-Jy](https://github.com/Kumar-Jy) - Wininstaller method ([here](https://github.com/Kumar-Jy/Windows-in-NABU-Without-PC))
- [@Kumar-Jy - Wininstaller](https://t.me/wininstaller) - Telegram Group



