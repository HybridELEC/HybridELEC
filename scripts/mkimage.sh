#!/bin/bash

die() {
    printf 'ERROR: '
    echo $*
    exit 1
}

DIR_BUILD="build.HybridELEC-$DEVICE"
DIR_SYSTEM="$DIR_BUILD/system"
DIR_STORAGE="$DIR_BUILD/storage"
DIR_PARTITIONS="$DIR_BUILD/partitions"
DIR_TARGET='target'

echo 'Initializing build dir...'
for DIR in "$DIR_BUILD" "$DIR_SYSTEM" "$DIR_STORAGE" "$DIR_STORAGE/coreelec" "$DIR_STORAGE/emuelec" "$DIR_PARTITIONS"; do
    rm -rf "$DIR" || die "Failed to remove existing build dir '$DIR'"
    mkdir -p "$DIR" || die "Failed to create dir '$DIR'"
done
mkdir -p "$DIR_TARGET" || die 'Failed to create target dir'

# Basic partition layout
IMAGE_SYSTEM="$DIR_PARTITIONS/system.part"
IMAGE_STORAGE="$DIR_PARTITIONS/storage.part"
IMAGE_TARGET="$DIR_TARGET/HybridELEC-$DEVICE-CE_${HYBRID_VERSION_CE}_EE_$HYBRID_VERSION_EE.img"

echo 'Allocating disk space for image...'
truncate -s 2G "$IMAGE_SYSTEM" || die 'Failed to allocate disk space for partition 1 (system/HYBRIDELEC)'
truncate -s 32M "$IMAGE_STORAGE" || die 'Failed to allocate disk space for partition 2 (storage/STORAGE)'
truncate -s 2084M "$IMAGE_TARGET" || die 'Failed to allocate disk space for whole image'  # A 4M gap is leaved in case of faulty SD cards

echo 'Creating partition layout...'
parted -s "$IMAGE_TARGET" mklabel MSDOS || die 'Failed to create partition table'
parted -s "$IMAGE_TARGET" mkpart primary fat32 4MiB 2052MiB || die 'Failed to create partition in partition table'
parted -s "$IMAGE_TARGET" mkpart primary ext4 2052MiB 100% || die 'Failed to create partition in partition table'

# Storage partition
echo 'Populating storage partition...'
touch "$DIR_STORAGE/.please_resize_me" || die 'Failed to create fs-resize mark'
fakeroot mkfs.ext4 -m 0 -L 'STORAGE' -d "$DIR_STORAGE" "$IMAGE_STORAGE" || die 'Failed to create image for storage partition'

# System partition
echo 'Populating system partition...'
mkfs.vfat -F 32 -n 'HYBRIDELEC' "$IMAGE_SYSTEM" || die 'Failed to create fat32 on system partition'

echo 'Generating startup scripts...'
# System content
mkimage -A arm64 -O linux -T script -C none -d 'bootloader/aml_autoscript.src' "$DIR_SYSTEM/aml_autoscript" || die "Failed to generate aml_autoscript"
mkimage -A arm64 -O linux -T script -C none -d 'bootloader/Generic_cfgload.src' "$DIR_SYSTEM/cfgload" || die "Failed to generate cfgload"

DIR_BUILD_CE="build.CoreELEC-$DEVICE.arm-19"
DIR_BUILD_EE="build.EmuELEC-$DEVICE.aarch64-4"

DIR_DTB_SUFFIX='image/system/usr/share/bootloader/device_trees'
DIR_DTB_CE="$DIR_BUILD_CE/$DIR_DTB_SUFFIX"
DIR_DTB_EE="$DIR_BUILD_EE/$DIR_DTB_SUFFIX"

echo 'Copying device-trees...'
cp -ra "$DIR_DTB_CE" "$DIR_SYSTEM/ce_device_trees" || die 'Failed to copy CE dtb'
cp -ra "$DIR_DTB_EE" "$DIR_SYSTEM/ee_device_trees" || die 'Failed to copy EE dtb'

FILE_CE_BASE=$DIR_TARGET/CoreELEC-$DEVICE.arm-$HYBRID_VERSION_CE-hybrid
FILE_EE_BASE=$DIR_TARGET/EmuELEC-$DEVICE.aarch64-$HYBRID_VERSION_EE-hybrid
FILE_KERNEL_CE="$FILE_CE_BASE.kernel"
FILE_SYSTEM_CE="$FILE_CE_BASE.system"
FILE_KERNEL_EE="$FILE_EE_BASE.kernel"
FILE_SYSTEM_EE="$FILE_EE_BASE.system"

echo 'Copying kernel and system images...'
cp -a "$FILE_KERNEL_CE" "$DIR_SYSTEM/ce_kernel.img" || die 'Failed to copy CE kernel'
cp -a "$FILE_SYSTEM_CE" "$DIR_SYSTEM/ce_SYSTEM" || die 'Failed to copy CE system image'
cp -a "$FILE_KERNEL_EE" "$DIR_SYSTEM/ee_kernel.img" || die 'Failed to copy EE kernel'
cp -a "$FILE_SYSTEM_EE" "$DIR_SYSTEM/ee_SYSTEM" || die 'Failed to copy EE system image'

echo 'Creating md5sums...'
for FILE in "$DIR_SYSTEM/ce_kernel.img" "$DIR_SYSTEM/ce_SYSTEM" "$DIR_SYSTEM/ee_kernel.img" "$DIR_SYSTEM/ee_SYSTEM"; do
    md5sum "$FILE" > "$FILE.md5" || die "Failed to calculate md5sum of '$FILE'"
done

echo 'Mcopying files into system partition..'
mcopy -i "$IMAGE_SYSTEM" "$DIR_SYSTEM"/* :: || die 'Failed to populate the system partition'
echo 'Checking if fat32 on system partition is ok...'
fsck.vfat -an "$IMAGE_SYSTEM" || die 'Failed to fsck the system partition'

echo 'Merging partitions into whole image...'
dd if="$IMAGE_SYSTEM" of="$IMAGE_TARGET" bs=1M seek=4 || die 'Failed to write system partition into whole image'
dd if="$IMAGE_STORAGE" of="$IMAGE_TARGET" bs=1M seek=2052 || die 'Failed to write storage partition into whole image'

echo 'Compressing image...'
pigz -9v "$IMAGE_TARGET" || die 'Failed to compress image'

echo 'Everything done'