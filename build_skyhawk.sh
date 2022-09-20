#!/bin/bash

# configure some default settings for the build
Default_Settings() {

    export TARGET_DEVICE="m10lte"
    export SHRP_PATH="device/samsung/m10lte"
    export SHRP_DEVICE_CODE="m10lte"
    export SHRP_MAINTAINER=youssefnone
    export SHRP_EDL_MODE=0
    export SHRP_EXTERNAL="/external_sdcard"
    export SHRP_INTERNAL="/sdcard"
    export SHRP_OTG="/usb-otg"
    export SHRP_FLASH=1
    export SHRP_CUSTOM_FLASHLIGHT=true
    export SHRP_FONP_1="/sys/class/camera/flash/rear_torch_flash"
    export SHRP_FLASH_MAX_BRIGHTNESS=255
    export SHRP_REC="/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY"
    export SHRP_AB=false
    export SHRP_REC_TYPE=Treble
    export SHRP_DEVICE_TYPE=A/B
    export INC_IN_REC_ADDON_4=true
    export SHRP_STATUSBAR_RIGHT_PADDING=48
    export SHRP_STATUSBAR_LEFT_PADDING=48
    export SHRP_EXPRESS=true
    export LZMA_RAMDISK_TARGETS="recovery"

}

# build the project
do_build() {
  Default_Settings

  # compile it
  . build/envsetup.sh
  
  lunch omni_"$TARGET_DEVICE"-eng
  
  mka recoveryimage
}

# --- main --- #
do_build
#
