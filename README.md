# HybridELEC
A side-by-side dual-bootable fork of both CoreELEC and EmuELEC

## Project layout
The modified CoreELEC and EmuELEC sources reside in the standalone repo https://github.com/7Ji/EmuELEC and are pulled to here as submodules to help shrinking the size of this repo down, and switch to a more sanitized project layout.

The release-only Android+CoreELEC+EmuELEC triple boot burning image is available on its [dedicated branch](https://github.com/7Ji/HybridELEC/tree/android-burning)

As a result of moving most stuffs to other repos and many hacks to remove dangling commits and even fake commits to keep releases working, the old source is pretty much dead and you can't build with the old method and source here. Please wait until I finish the hybridifying of EEv4.6 and CE20.0.

~~The ``hybrid-ng`` branch is only for introduction of the project, and packing the whole image, the corresponding modified CoreELEC and EmuELEC sources reside in ``coreelec-19`` branch and ``emuelec-4.5`` branch. **NEVER** mix the modified CE/EE sources with official sources~~

~~The older Xiaomi mibox3/3c only HybridELEC reside on ``hybrid-1.0`` branch and is in maintainance status. The main ``hybrid-ng`` branch is only for **generic Amlogic-ng** devices~~

## Build
### Each distro
Get into `distros/CoreELEC` and `distros/EmuELEC` and follow their instruction to build modified CE and EE. You can build them at the same time to save some time. Setting the following option in `~/.coreelec/options` could also save some disk space:
```
SOURCES_DIR=/path/to/the/shared/source/folder/of/ce/and/ee
```
The added make target `nopack` is recommended if you only need to pack them into HybridELEC sub-system. This will skip the usual packing steps needed when they're standalone.
```
make nopack
```
### Hybrid
Additional dependencies are needed to pack the two distros into HybridELEC:
```
sudo apt install pigz u-boot-tools squashfs-tools mtools
```
Return to this folder and run the following command to pack them into one flashable image:
```
bash scripts/mkimage
```


## Documentation
Please check the [wiki](https://github.com/7Ji/HybridELEC/wiki) for device support status, image layout, installation guide, how to switch between CoreELEC and EmuELEC, and how to build HybridELEC by yourself, etc
