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

|dsnapshot|partitions|
|-|-|
|decimal|`ce_system::213909504:2 ee_system::1111490560:2 frp::2097152:1 factory::8388608:17 vendor_boot_a::25165824:1 tee::33554432:1 logo::8388608:1 misc::2097152:1 dtbo_a::2097152:1 cri_data::8388608:2 param::16777216:2 odm_ext_a::16777216:1 oem_a::33554432:1 boot_a::67108864:1 rsv::16777216:1 metadata::16777216:1 vbmeta_a::2097152:1 vbmeta_system_a::2097152:1 super::2415919104:1 ce_storage::4294967296:4 ee_storage::4294967296:4 userdata::-1:4`
|hex|`ce_system::0xcc00000:2 ee_system::0x42400000:2 frp::0x200000:1 factory::0x800000:17 vendor_boot_a::0x1800000:1 tee::0x2000000:1 logo::0x800000:1 misc::0x200000:1 dtbo_a::0x200000:1 cri_data::0x800000:2 param::0x1000000:2 odm_ext_a::0x1000000:1 oem_a::0x2000000:1 boot_a::0x4000000:1 rsv::0x1000000:1 metadata::0x1000000:1 vbmeta_a::0x200000:1 vbmeta_system_a::0x200000:1 super::0x90000000:1 ce_storage::0x100000000:4 ee_storage::0x100000000:4 userdata::-1:4`
|human|`ce_system::204M:2 ee_system::1060M:2 frp::2M:1 factory::8M:17 vendor_boot_a::24M:1 tee::32M:1 logo::8M:1 misc::2M:1 dtbo_a::2M:1 cri_data::8M:2 param::16M:2 odm_ext_a::16M:1 oem_a::32M:1 boot_a::64M:1 rsv::16M:1 metadata::16M:1 vbmeta_a::2M:1 vbmeta_system_a::2M:1 super::2304M:1 ce_storage::4G:4 ee_storage::4G:4 userdata::-1:4`

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

|dsnapshot|partitions|
|-|-|
|decimal|`ce_system::239075328:2 ee_system::1111490560:2 logo::33554432:1 recovery::33554432:1 rsv::8388608:1 tee::8388608:1 crypt::33554432:1 misc::33554432:1 boot::33554432:1 system::2147483648:1 cache::536870912:2 ce_storage::536870912:4 ee_storage::1073741824:4 data::-1:4`
|hex|`ce_system::0xe400000:2 ee_system::0x42400000:2 logo::0x2000000:1 recovery::0x2000000:1 rsv::0x800000:1 tee::0x800000:1 crypt::0x2000000:1 misc::0x2000000:1 boot::0x2000000:1 system::0x80000000:1 cache::0x20000000:2 ce_storage::0x20000000:4 ee_storage::0x40000000:4 data::-1:4`
|human|`ce_system::228M:2 ee_system::1060M:2 logo::32M:1 recovery::32M:1 rsv::8M:1 tee::8M:1 crypt::32M:1 misc::32M:1 boot::32M:1 system::2G:1 cache::512M:2 ce_storage::512M:4 ee_storage::1024M:4 data::-1:4`


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

|dsnapshot|partitions|
|-|-|
|decimal|`ce_system::239075328:2 ee_system::1111490560:2 logo::8388608:1 recovery::25165824:1 misc::8388608:1 dtbo::8388608:1 cri_data::8388608:2 param::16777216:2 boot::16777216:1 rsv::16777216:1 metadata::16777216:1 vbmeta::2097152:1 tee::33554432:1 vendor::335544320:1 odm::134217728:1 system::1946157056:1 product::134217728:1 cache::1174405120:2 ce_storage::4294967296:4 ee_storage::4294967296:4 data::-1:4`
|hex|`ce_system::0xe400000:2 ee_system::0x42400000:2 logo::0x800000:1 recovery::0x1800000:1 misc::0x800000:1 dtbo::0x800000:1 cri_data::0x800000:2 param::0x1000000:2 boot::0x1000000:1 rsv::0x1000000:1 metadata::0x1000000:1 vbmeta::0x200000:1 tee::0x2000000:1 vendor::0x14000000:1 odm::0x8000000:1 system::0x74000000:1 product::0x8000000:1 cache::0x46000000:2 ce_storage::0x100000000:4 ee_storage::0x100000000:4 data::-1:4`
|human|`ce_system::228M:2 ee_system::1060M:2 logo::8M:1 recovery::24M:1 misc::8M:1 dtbo::8M:1 cri_data::8M:2 param::16M:2 boot::16M:1 rsv::16M:1 metadata::16M:1 vbmeta::2M:1 tee::32M:1 vendor::320M:1 odm::128M:1 system::1856M:1 product::128M:1 cache::1120M:2 ce_storage::4G:4 ee_storage::4G:4 data::-1:4`