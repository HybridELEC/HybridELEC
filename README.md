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

|SoC family|SoC name|OEM|Model|
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