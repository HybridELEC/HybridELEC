A dedicated branch to add fake tags to keep releases working after the CoreELEC and EmuELEC branches are actually migrated to https://github.com/7Ji/EmuELEC. 

This is to reduce the repo size of HybridELEC.

For actual commit of the tag, you should check them out on the mentioned repo.

```
commit 421707b13d3e98805c896e489da96d1670007f1e (tag: 9.2-mibox3-1)
Author: 7Ji <pugokushin@gmail.com>
Date:   Sat Apr 23 21:24:47 2022 +0800

    device-trees-amlogic: (mibox3) bump version, remove unneeded device trees
```

```
commit 4e453f53f5d90b86c81435634817ec22cde4118d (tag: 9.2-mibox3-1.1)
Author: 7Ji <pugokushin@gmail.com>
Date:   Mon Apr 25 21:09:21 2022 +0800

    mixbox3/filesystem: added keymap to remap home button
```

```
commit 80d70e954b44976a01c8d22fe8169a3c7c52bb79 (tag: 9.2-mibox3-1.2)
Author: 7Ji <pugokushin@gmail.com>
Date:   Thu Apr 28 21:06:27 2022 +0800

    mibox3/filesystem/enable_usb_boot.sh: fix set_env storeboot
```

```
commit 8566a5d936c0ecdc5a2f9409f44a264bc7172f73 (tag: 9.2-mibox3-1.3)
Author: 7Ji <pugokushin@gmail.com>
Date:   Sat Apr 30 21:30:41 2022 +0800

    mibox3/bootloader: fix storeboot env, quoted content is now properly written
```

```
commit 2fb433c46a4a700b03c54b567792c95fd1c7322c (tag: 9.2-mibox3-1.4)
Author: 7Ji <pugokushin@gmail.com>
Date:   Sat Jul 9 23:30:41 2022 +0800

    busybox/fs-resize: adapt distro name for extreme
```