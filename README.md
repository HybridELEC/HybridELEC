# HybridELEC / 融合ELEC
Side-by-side dual-bootable CoreELEC and EmuELEC on USB/SD branch.  
USB/SD用的CoreELEC+EmuELEC双启动镜像分支

For triple-bootable Android+CE+EE USB buring image, check the [Android burning branch][android burning branch]  
要找安卓+CE+EE三系统线刷包，请到[安卓线刷分支][android burning branch]

[android burning branch]: https://github.com/7Ji/HybridELEC/tree/android-burning

## Project layout / 项目布局
The modified CoreELEC and EmuELEC sources reside in [the standalone repo][7ji_ee_repo] and are pulled to here as submodules  
修改过的CoreELEC和EmuELEC源码位于[单独的仓库][7ji_ee_repo]中，且作为子摸块拉取到这里

[7ji_ee_repo]: https://github.com/7Ji/EmuELEC

## Installation / 安装
For this `hybird-ng` branch, go to the release page to find the newest release named in the `HybridELEC-Amlogic-ng-CE_20.0-Nexus_EE_v4.6` style. (**DO NOT download Android burning images named in other styles, they're for complete different branchs**)  
要安装此`hybrid-ng`分支，到发布页找到最新的名称为`HybridELEC-Amlogic-ng-CE_20.0-Nexus_EE_v4.6`样式的发布（**不要下载其他命名格式的安卓刷机包，它们是其他分支用的**）

Decompress the image and burn it to USB/SD drive, as how you would do it for CoreELEC and EmuELEC  
解压镜像并烧录到USB/SD驱动器，和你对CE/EE做的一样

Open the partition with label `HYBRIDELEC`, do the following things：  
打开卷标`HYBRIDELEC`的分区，做以下调整：
 1. Find an appropriate device tree for CoreELEC under `ce_device_trees`, copy it to `ce_dtb.img` in the root folder  
 在`ce_device_trees`下面找到CoreELEC应该用的设备树，复制到根目录下，改名为`ce_dtb.img`
 2. Find an appropriate device tree for EmuELEC under `ee_device_trees`, copy it to `ee_dtb.img` in the root folder  
 在`ee_device_trees`下面找到CoreELEC应该用的设备树，复制到根目录下，改名为`ee_dtb.img`
 3. Edit `hybrid.ini` and set the system you want to boot into, `ce` for CoreELEC, `ee` for EmuELEC. The default is already set to CoreELEC. For booting to EmuELEC, set it to like this:  
 编辑`hybrid.ini`设置你想启动到的系统，`ce`是CoreELEC，`ee`是EmuELEC。默认已经设置为CoreELEC。要想启动到EmuELEC，设置成下面这样：
    ```
    hybrid_distro=ee
    ```
    *This will also decide the partition layout: If you boot into CoreELEC first, there won't be a dedicated `EEROMS` partition; if you boot into EmuELEC first, there will be a dedicated `EEROMS` partition  
    这个选项也会影响分区布局：如果你首次启动到的是CoreELEC，不会有单独的`EEROMS`分区；如果你首次启动到的是EmuELEC，会有单独的`EEROMS`分区*

Hold the reset button with the drive plugged in, and power on the box  
保持驱动器插入，按住reset键，给盒子上电

## Swtich / 切换
Note this branch uses the **same** bootup setting script as CoreELEC/EmuELEC, so the order is the same *among different drives*, i.e. you can't change the following order:  
注意本分支和CoreELEC/EmuELEC使用相同的启动设置脚本，所以*不同驱动器之间*的顺序是相同的
```
official CoreELEC/ official EmuELEC/ HybirdELEC on SD
                         |
                         v
official CoreELEC/ official EmuELEC/ HybridELEC on USB
                         |
                         v
official CoreELEC/ official EmuELEC/ HybridELEC on eMMC                         
```
What you could change is which one (CE/EE) inside HybridELEC that should be booted into  
你能改的是HybridELEC内启动的是的哪一个（CE/EE）
### CoreELEC -> EmuELEC
1. Make sure you're at the main menu of Kodi  
确定你在Kodi主菜单
2. Click the power plug icon in the upper-left corner, under CoreELEC logo  
点击左上角，CoreELEC logo下面的电源图标
3. Click `Reboot to Hybrid/EE`  
点击`Reboot to Hybrid/EE`

### EmuELEC -> CoreELEC
1. Make sure you're at the main menu of EmulationStation  
确定你在EmulationStation主菜单
2. Press the SELECT button you **set** (not neccessarily the SELECT button on your controller)  
按你**设定**的SELECT键（不一定是你手柄上的SELECT键）
3. Click `Reboot to Hybrid/CE`  
点击`Reboot to Hybrid/CE`

### Outside of systems / 系统外
If you want to change the OS without booting the box, you can just edit the file `hybrid.ini` inside the `HYBRIDELEC` partition, setting it to `hybrid_distro=ce` to boot into CoreELEC; setting it to `hybrid_distro=ee` to boot into EmuELEC  
如果你想不启动盒子而更改系统，你可以编辑`HYBRIDELEC`分区里的`hybrid.ini`文件，设置为`hybrid_distro=ce`则启动到CoreELEC，设置为`hybrid_distro=ce`则启动到EmuELEC


## Update / 更新
The update functionality is completely removed from both distros, and it's impossible to update. You only way to update this is to do a manual re-installation.   
两个系统中的更新功能都已完全移除，且不可能更新。唯一更新的方式是整个重装

This is acceptable in my opinion as this branch will only realese when **both CE and EE** release their stable realeaes, which barely happen even in a year.  
以我的观点，这是可以接受的，因为本分支只有当**CE和EE均**更新新的稳定版以后才会更新，而一年里甚至都发不了这么一次。

## Build / 构建
### Get source / 获取源码
Clone this project and also its submodules  
克隆本项目和子模块
```
git clone https://github.com/7Ji/HybridELEC --single-branch
cd HybridELEC
git submodule init
git submodule update
```
### Both distros / 子系统
Get into `distros/CoreELEC` and `distros/EmuELEC` and follow their instruction to build modified CE and EE. You can build them at the same time to save some time. Setting the following option in `~/.coreelec/options` could also save some disk space:
```
SOURCES_DIR=/path/to/the/shared/source/folder/of/ce/and/ee
```
The added make target `nopack` is recommended if you only need to pack them into HybridELEC sub-system. This will skip the usual packing steps needed when they're standalone.
```
make nopack
```
### Combining / 合并
_Additional dependencies are needed to pack the two distros into HybridELEC:_
```
sudo apt install pigz u-boot-tools squashfs-tools mtools
```
After you've built both distros, return to this folder and run the following command to pack them into one flashable image:
```
bash scripts/mkimage
```


## Documentation
Please check the [wiki](https://github.com/7Ji/HybridELEC/wiki) for device support status, image layout, installation guide, how to switch between CoreELEC and EmuELEC, and how to build HybridELEC by yourself, etc
