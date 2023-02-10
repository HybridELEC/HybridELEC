defenv
# Global stuffs
setenv bootfromnand 0
setenv upgrade_step 2
setenv ab 0
setenv ce_on_emmc "no"
# SD booting
setenv boot_from_sd_mainline 'if fatload mmc 0 1020000 s905_autoscript; then autoscr 1020000; fi'
setenv boot_from_sd_coreelec_read_cfg 'if fatload mmc 0:1 ${loadaddr} cfgload; then setenv device mmc; setenv devnr 0; setenv partnr 1; autoscr ${loadaddr}; fi'
setenv boot_from_sd_coreelec_read_dtb 'if fatload mmc 0 ${dtb_mem_addr} dtb.img; then else store dtb read $dtb_mem_addr; fi'
setenv boot_from_sd_coreelec 'run boot_from_sd_coreelec_read_cfg; if fatload mmc 0 ${loadaddr} kernel.img; then run boot_from_sd_coreelec_read_dtb; setenv bootargs ${bootargs} bootfromsd; bootm; fi'
setenv boot_from_sd 'if mmcinfo; then run boot_from_sd_mainline; run boot_from_sd_coreelec; fi'
# USB booting
setenv boot_from_usb_mainline 'for usbdev in 0 1 2 3; do if fatload usb ${usbdev} 1020000 s905_autoscript; then autoscr 1020000; fi; done'
setenv boot_from_usb_coreelec_read_cfg 'if fatload usb 0:1 ${loadaddr} cfgload; then setenv device usb; setenv devnr 0; setenv partnr 1; autoscr ${loadaddr}; fi'
setenv boot_from_usb_coreelec_read_dtb 'if fatload usb 0 ${dtb_mem_addr} dtb.img; then else store dtb read $dtb_mem_addr; fi'
setenv boot_from_usb_coreelec 'run boot_from_usb_coreelec_read_cfg; if fatload usb 0 ${loadaddr} kernel.img; then run boot_from_usb_coreelec_read_dtb; setenv bootargs ${bootargs} bootfromusb; bootm; fi'
setenv boot_from_usb 'if usb start; then run boot_from_usb_mainline; run boot_from_usb_coreelec; fi'
# eMMC booting
setenv boot_from_emmc_mainline 'if fatload mmc 1 1020000 emmc_autoscript; then autoscr 1020000; fi;'
setenv boot_from_emmc_coreelec_read_cfg 'for p in 1 2 3 4 5 6 7 8 9 A B C D E F 10 11 12 13 14 15 16 17 18; do if fatload mmc 1:${p} ${loadaddr} cfgload; then setenv device mmc; setenv devnr 1; setenv partnr ${p}; setenv ce_on_emmc "yes"; autoscr ${loadaddr}; fi; done;'
setenv boot_from_emmc_coreelec 'run boot_from_emmc_coreelec_read_cfg'
setenv boot_from_emmc 'run boot_from_emmc_mainline; run boot_from_emmc_coreelec'
# Entry point
setenv bootcmd 'if test ${bootfromnand} = 1; then setenv bootfromnand 0; saveenv; else run boot_from_sd; run boot_from_usb; run boot_from_emmc; fi; run storeboot'

saveenv
sleep 1
reboot