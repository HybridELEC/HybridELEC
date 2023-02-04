# HybridELEC Android + CoreELEC + EmuELEC burning image

Release-only branch for the HybridELEC **Android + CoreELEC + EmuELEC** USB burning image.   

The source code cannot be released since these are modified from the stock/custom Android firmware, and releasing the decompiled source is against the license.

The burning images only contain the un-modified Android system firmware, the un-modified latest CoreELEC stable firmware, and the un-modified latest EmuELEC stable firmware. So you will see the CoreELEC/EmuELEC marked as **official** inside the system, but **do not seek for help from CoreELEC/EmuELEC since these images are not released directly by them, and would bother them and waste their precious time/labour**.

Send an e-mail to pugokushin@gmail.com if you want to remove a certain firmware for a device.

## Rebooter
The firmware will only deploy the systems side-by-side, but being **un-modified and as-is** means you will have to adjust the bootup environment to switch the system. If you need a GUI easy-to-use rebooter, check https://github.com/7Ji/HybridELEC_Rebooter

## Devices

*in the order of first supported -> latest supported*

### HK1 Rbox X4

[Download from Github release](../../releases/tag/hk1-rbox-x4)

|SoC family|SoC name|Brand|Model|
|-|-|-|-|
|SC2|S905X4|HK1|Rbox X4|

|System|Version|
|-|-|
|Android|ah212.HK1RBOX-X4_1000M_11.2022.03.05.13.49|
|CoreELEC|CoreELEC-Amlogic-ne.arm-20.0-Nexus|
|EmuELEC|EmuELEC-Amlogic-ng.aarch64-4.6|

Partition layout in the firmware: [DTB partitions](https://7ji.github.io/ampart-web-reporter/?dsnapshot=ce_system::213909504:2%20ee_system::1111490560:2%20frp::2097152:1%20factory::8388608:17%20vendor_boot_a::25165824:1%20tee::33554432:1%20logo::8388608:1%20misc::2097152:1%20dtbo_a::2097152:1%20cri_data::8388608:2%20param::16777216:2%20odm_ext_a::16777216:1%20oem_a::33554432:1%20boot_a::67108864:1%20rsv::16777216:1%20metadata::16777216:1%20vbmeta_a::2097152:1%20vbmeta_system_a::2097152:1%20super::2415919104:1%20ce_storage::4294967296:4%20ee_storage::4294967296:4%20userdata::-1:4)

### BesTV R3300L

[Download from Github release](../../releases/tag/bestv-r3300l)

|SoC family|SoC name|Brand|Model|
|-|-|-|-|
|GXL|S905L|BesTV|R3300L|

|System|Version|
|-|-|
|Android|[v7.5] (MXQ) Aidan's ROM [S905X] [P212, P214 & P242] MXQ Pro 4K 1GB 2GB+ (720pUI & 210DPI)|
|CoreELEC|CoreELEC-Amlogic-ng.arm-20.0-Nexus|
|EmuELEC|EmuELEC-Amlogic-ng.aarch64-4.6|

*To use -ng version of CoreELEC & EmuELEC, the Android firmware must be at least 7.1, Aidan's firmware is preferred since it's Android 7.1.2, and Milton's Android 6.0 firmware is deprecated due to this, otherwise I'll have to stick the non-ng version both CE and EE dropped support*

Partition layout in the firmware: [DTB partitions](https://7ji.github.io/ampart-web-reporter/?dsnapshot=ce_system::239075328:2%20ee_system::1111490560:2%20logo::33554432:1%20recovery::33554432:1%20rsv::8388608:1%20tee::8388608:1%20crypt::33554432:1%20misc::33554432:1%20boot::33554432:1%20system::2147483648:1%20cache::536870912:2%20ce_storage::536870912:4%20ee_storage::1073741824:4%20data::-1:4)


### HK1 Box

[Download from Github release](../../releases/tag/hk1-box)

|SoC family|SoC name|Brand|Model|
|-|-|-|-|
|SM1|S905X3|HK1|Box|

|System|Version|
|-|-|
|Android|u219.HK1_BOX_1000M_9.0.2020.11.16.11.05|
|CoreELEC|CoreELEC-Amlogic-ng.arm-20.0-Nexus|
|EmuELEC|EmuELEC-Amlogic-ng.aarch64-4.6|

*Additional modification was made to `boot` and `recovery` partition to shift the hard-coded `root=/dev/mmcblk18` to `root=/dev/mmcblk20`, so the Android system in this image is not technically un-modified*

Partition layout in the firmware: [DTB partitions](https://7ji.github.io/ampart-web-reporter/?dsnapshot=ce_system::239075328:2%20ee_system::1111490560:2%20logo::8388608:1%20recovery::25165824:1%20misc::8388608:1%20dtbo::8388608:1%20cri_data::8388608:2%20param::16777216:2%20boot::16777216:1%20rsv::16777216:1%20metadata::16777216:1%20vbmeta::2097152:1%20tee::33554432:1%20vendor::335544320:1%20odm::134217728:1%20system::1946157056:1%20product::134217728:1%20cache::1174405120:2%20ce_storage::4294967296:4%20ee_storage::4294967296:4%20data::-1:4)