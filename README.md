# HybridELEC
A side-by-side dual-bootable minor fork of both CoreELEC and EmuELEC, enjoy the beauty of both CoreELEC and EmuELEC without continously eject and insert different SD cards/USB drive! Switch the OS with simple one-click GUI operation!

## Project layout
The ``hybrid-ng`` branch is only for introduction of the project, and packing the whole image, the corresponding modified CoreELEC and EmuELEC sources reside in ``coreelec-19`` branch and ``emuelec-4.5`` branch. **NEVER** mix the modified CE/EE sources with official sources

## Installation
1. Download a full image (*.img.gz) from releases page
2. Decompress the image, to get a .img file (if you are using BalenaEtcher you can skip this step and use the .img.gz file directly, you can also pipe decompression with writing process if you're using Linux)
2. Flash the full image to any USB drive/SD card you want to use  
    1. A SDXC card with U3/A2 mark is suggested if you want best experience of EmuELEC
    2. A USB 3.0 pendrive with at least 10MB/s random I/O is suggested if you don't want a chokey experience (An opposite example is Kinston's DT 100G3, this sucker takes almost half an hour to setup, and running games later feels like hell)
    3. A spin-drive or high-performance NVMe drive in an enclosure is not suggested as it may overburn the limited power supply capacity on the box and fry it. The capacitor in my box makes a dangerous noice when I use a Samsung 960 EVO in a USB3.2 NVME-UAS enclosure, and I'm sure you don't want to hear it.
4. Open the HYBRIDELEC partition and do some tweaks
    1. Find a corresponding dtb in ce_device_trees, place it as ce_dtb.img in the root folder
    2. Find a corresponding dtb in ee_device_trees, place it as ee_dtb.img in the root folder
    3. ~~Optionally create a ``.no_eeroms`` file in the root folder if you don't want a dedicated EEROMS partition (this will only work on >4GB drives, as it won't be created at all for <=4GB drives)~~ not implemented yet
5. Eject the drive, and plug it onto a powered off compatible Amlogic box
6. Hold the reset button and plug the power


## Device support status
1. All devices supported by the generic Amlogic-ng image of **BOTH** CoreELEC and EmuELEC are **SUPPORTED**
2. Devices that need specialized images are **UNSUPPORTED** since I don't have any of them for validation (Odroid N2, Odroid C4, etc)
3. All Xiaomi devices with supported SoCs are however **UNSUPPORTED** due to their [half-ass mofications](https://github.com/7Ji/ampart/issues/1)
4. Phicomm N1 and similiar devices are **UNSUPPORTED** due to its incompatible bootup mechanism and [unwillingness to help with development from N1 owners](https://emuelec.discourse.group/t/unable-to-boot-emuelec-4-5-on-phicomm-n1-s905d/1137/18)


## Differences to official CE/EE
CoreELEC and EmuELEC kernel and system images are mostly provided AS-IS, which means there's basically no extra advantages/disadvantags other than supporting side-by-side dual-boot, but there are some noticable tweaks other than the bootup process modification

**Some minor yet important changes were made to make dual-boot possible and therefore official CE/EE kernel/system images can't be mixed with HE kernel/system images**
1. CoreELEC (from official CE)
    1. ceemmc is removed. This is due to the different partiton layout than official CoreELEC images, and ceemmc is hard-coded for 512M system partition. 
    2. A button "Reboot to EmuELEC" is added in the kodi power button menu
2. EmuELEC (from official EE)
    1. A button "REBOOT TO COREELEC" is added in the EmulationStation quick access menu
    2. A [fs-resize fix](https://github.com/EmuELEC/EmuELEC/commit/bf4536c55951820dc30eee8d4232550799bb962d) is backported
    3. ~~Creation of EEROMS partition can be optionally disabled by creating a '.noeeroms' file in system partition before the first bootup. We've already combined two systems' userdatas to one partition and I guess you would want to combine more things.~~ This is not implemented yet
3. Both
    1. Storage partition is mounted to /data instead of /storage, a corresponding subfolder is bind-mounted to /storage
    2. fs-resize will check for .please-resize-me under /data instead of under /storage
    3. Auto-updates are disabled and can't be enabled since this is a community build
    3. **ALL** installation to emmc methods are removed


## Image layout
The image of HybridELEC has a different layout from both CE and EE. Inside of it is a MSDOS partition table with two partitions (mountpoint is in bracket):
- **HYBRIDELEC** (=>**/flash**): 2G fat32 partition that contains kernel and system images, the files/folders with * mark does not exist and should be created by user
    - **ce_kernel.img** kernel for modified CoreELEC, abootimg V0
    - **ee_kernel.img** kernel for modified EmuELEC, abootimg V0
    - **ce_SYSTEM** (=>**/**) squashfs system image for modified CoreELEC, lzo level 9
    - **ee_SYSTEM** (=>**/**) squashfs system image for modified EmuELEC, lzo level 9
    - **ce_dtb.img*** dtb for modified CoreELEC
    - **ee_dtb.img*** dtb for modified EmuELEC
    - **ce_device_trees** this contains all device trees for CE
    - **ee_device_trees** this contains all device trees for EE
 - **STORAGE** (=>**/data**): <=2G (with dedicated ROMS partition) or auto-filling ext4 partition that contains userdata
    - **coreelec** (=>**/storage**), a folder that contains userdata of modified CoreELEC
    - **emuelec** (=>**/storage**), a folder that contains userdata of modified EmuELEC  
    */data is available in user space, thus making modification of the other OS you're not currently booting more easily. You can rm -rf /data/emuelec from CoreELEC side to easily factory-reset EmuELEC, and vice-versa*
 - **EEROMS** (=>**/storage/roms**, EE only): auto-filling fat32 or user-defined partition that contains roms, only created if drive >4G ~~can be omitted~~


## Build by yourself
````
# clone the repo
git clone https://github.com/7Ji/HybridELEC
cd HybridELEC

# set some shared environment variables
export PROJECT=Amlogic-ce
export DEVICE=Amlogic-ng

# optionally set builder name
export BUILDER_NAME=7Ji

# checkout the CoreELEC branch
git checkout coreelec-19

# set version for CoreELEC
export HYBRID_VERSION_CE=19.4-Matrix
export CUSTOM_VERSION=${HYBRID_VERSION_CE}-hybrid

# build CE kernel and system images
make system

# checkout the EmuELEC branch
git checkout emuelec-4.5

# set version for EmuELEC
export HYBRID_VERSION_EE=v4.5
export CUSTOM_VERSION=${HYBRID_VERSION_EE}-hybrid

# build EE kernel and system images
make system

# get back to the main branch
git checkout hybrid-ng

# combine the image
make
````



## Release Routine
HybridELEC provide multiple types of releases and will be released in different routines: 

1. CoreELEC update tarboll: This will be released after a stable release of CoreELEC being published by Team CoreELEC. -rc (release candidate) ones are **NOT** considerd to be stable releases. e.g. 19.4, 19.5, **without -rc suffix**  
2. EmuELEC update tarboll: This will be released after a stable release of EmuELEC being published by Team Emuelec. e.g. v4.5, v4.6
3. Full system image: This will only be released if the last released full system image is too old (judging by myself)

If you can't find a full system image for the latest CoreELEC + EmuELEC, you can always flash an older full system image and extract corresponding contents from update tarbolls, thus making your own latest full image.

Please note I'm just a single person and I need to prepare for a big exam at the end of the year so I don't have that much time to keep an eye on CE and EE every single day. So big releases could be missed.