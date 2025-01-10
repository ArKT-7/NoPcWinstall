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
  
- ```Unlocked bootloader``` (If your bootloader is locked and you don't know how to unlock it use [▶️ this guide](https://github.com/ArKT-7/won-deployer/blob/main/guide/English/unlock-bootloader-en.md)

- ```Your Device Must be Rooted root it using any device using my new site ``` [▶️ one click root](https://arkt-7.github.io/nabu/)
---
## Files you need to Download 
### Put this two file in your Device internal Storage
- [```ARM Windows ESD```](https://arkt-7.github.io/woawin/) (Select - Build:  ```Select Build Number``` and Language:  ```Select your Language```)
    
- [```Nabu_WinInstaller_R7_261224.zip```](https://github.com/Kumar-Jy/Windows-in-NABU-Without-PC/releases/tag/Nabu-WinInstaller) (```Download Latest directly by clcicking here - ``` [Nabu_WinInstaller_R7_261224.zip](https://drive.google.com/file/d/1E84a1FdF9enRu3VbJQ-4sjwyFlN9Axcs/view?usp=sharing))
> [!NOTE]
> - If you are doing partitioning(first time install) or re-partitioning, make sure to download and put these files in your Nabu only after completing the partition process, as the device will be formatted during partitioning so also make sure to backup your data if doing partitioning.

---
## Running the script For Partition/Re-partition or Install Windows

### 1. Install Termux apk
## `>_` [Downlaod Termux app](https://f-droid.org/repo/com.termux_1000.apk)

### 2. Open Termux app and Type
```bash
su
```
### 3. Then Grant Root 

### 4. Copy this command and paste in Termux app for Xiamoi Pad 5
> [!NOTE]
> - Don't run the command twice if it errors or gets canceled while run. Restart your device first, then run it again.
> - If you doing re-partition/Partition and if there is any error then make sure to take a photo before restart
```bash
su -c "mkdir -p /data/data/arkt && chmod 777 /data/data/arkt && cd /data/data/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nabuwinstall -o /data/data/arkt/nabuwinstall && chmod 777 /data/data/arkt/nabuwinstall && su -c "/data/data/arkt/nabuwinstall""
```
> [!NOTE]
> - Copy this command and Paste if upper not work

```bash
su -c "chmod 777 /data/local/tmp && cd /data/local/tmp && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nabuwinstall -o /data/local/tmp/nabuwinstall && chmod 777 /data/local/tmp/nabuwinstall && su -c "/data/local/tmp/nabuwinstall""
```
> [!NOTE]
> - Copy this command and Paste if upper both not work
```bash
mkdir -p ~/arkt && chmod 777 ~/arkt && cd ~/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nabuwinstallaosp -o nabuwinstallaosp && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/bin/busybox -o busybox && chmod 777 nabuwinstallaosp && chmod 777 busybox && su -c "./nabuwinstallaosp"
```
> [!WARNING]
> - this command used wimlib-imagex to install, you may get error - but it faster than all
> - well you can try this, just in case if you get any error contact in Telegram
```bash
su -c "mkdir -p /data/data/arkt && chmod 777 /data/data/arkt && cd /data/data/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nabuwimlib -o /data/data/arkt/nabuwimlib && chmod 777 /data/data/arkt/nabuwimlib && su -c "/data/data/arkt/nabuwimlib""
```

## Now Just Follow the On screen Instruction what it asking and rest just leave it and wait
   - **`Good Luck`**.


<!-- 
### 4. Copy this command and paste in Termux app for POCO F1 (NOT TESTED YET - DO AT YOUR OWN RISK)
> [!NOTE]
> - Don't run the command twice if it errors or gets canceled while run. Restart your device first, then run it again.
> - If you doing re-partition/Partition and if there is any error then make sure to take a photo before restart
```bash
su -c "mkdir -p /data/data/arkt && chmod 777 /data/data/arkt && cd /data/data/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/f1winstall -o /data/data/arkt/f1winstall && chmod 777 /data/data/arkt/f1winstall && su -c "/data/data/arkt/f1winstall""
```
> [!NOTE]
> - Copy this command and Paste if upper not work

```bash
su -c "chmod 777 /data/local/tmp && cd /data/local/tmp && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/f1winstall -o /data/local/tmp/f1winstall && chmod 777 /data/local/tmp/f1winstall && su -c "/data/local/tmp/f1winstall""
```
> [!NOTE]
> - Copy this command and Paste if upper both not work
```bash
mkdir -p ~/arkt && chmod 777 ~/arkt && cd ~/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/f1winstallaosp -o f1winstallaosp && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/bin/busybox -o busybox && chmod 777 f1winstallaosp && chmod 777 busybox && su -c "./f1winstallaosp"
```

## Now Just Follow the On screen Instruction what it asking and rest just leave it and wait
   - **`Good Luck`**.
-->
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

## Support My Work

#### If you find my projects helpful, consider supporting my work! Your contributions will help me keep developing and sharing useful resources.

<p align="left">
  <a href="https://www.buymeacoffee.com/ArKT" target="_blank">
    <img src="https://github.com/ArKT-7/Temp-files/blob/main/assets/buymecoffee.png" alt="Buy Me A Coffee" style="height: 60px !important; width: 217px !important;">
  </a>
  <a href="https://www.paypal.me/arkt7" target="_blank">
    <img src="https://github.com/ArKT-7/Temp-files/blob/main/assets/Paypal.png" alt="Donate with PayPal" style="height: 60px !important; width: 217px !important;">
  </a>
</p>




## Credits and Thankfull to

- [@Kumar-Jy](https://github.com/Kumar-Jy) - Wininstaller method ([here](https://github.com/Kumar-Jy/WinInstaller))
- [@Kumar-Jy - Wininstaller](https://t.me/wininstaller) - Telegram support Group
<!-- 
```bash
mkdir -p ~/arkt && chmod 777 ~/arkt && cd ~/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/testa -o testa && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/bin/busybox -o busybox && chmod 777 testa && chmod 777 busybox && su -c "./testa"
```


```bash
su -c "mkdir -p /data/data/arkt && chmod 777 /data/data/arkt && cd /data/data/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/testlib -o /data/data/arkt/testlib && chmod 777 /data/data/arkt/testlib && su -c "/data/data/arkt/testlib""
```
- lol test codes

```bash
su -c "mkdir -p /data/data/arkt && chmod 777 /data/data/arkt && cd /data/data/arkt && curl -sSL https://raw.githubusercontent.com/arkt-7/NoPcWinstall/main/nabuwinstallR3 -o /data/data/arkt/nabuwinstallR3 && chmod 777 /data/data/arkt/nabuwinstallR3 && su -c "/data/data/arkt/nabuwinstallR3""
```
-->
