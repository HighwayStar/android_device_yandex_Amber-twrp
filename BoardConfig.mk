#
# Copyright 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
DEVICE_PATH := device/yandex/Amber

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

# Platform
TARGET_BOARD_PLATFORM := sdm660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno508
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm660
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Crypto
TW_INCLUDE_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
PLATFORM_SECURITY_PATCH := 2019-07-05


# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# GPT Utils
BOARD_PROVIDES_GPTUTILS := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=1 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_CMDLINE += skip_override androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

TARGET_KERNEL_SOURCE := kernel/yandex/sdm660
TARGET_KERNEL_CONFIG := sdm660-perf_defconfig
TARGET_KERNEL_VERSION := 4.4

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 48318382080
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x04000000
BOARD_FLASH_BLOCK_SIZE := 131072  # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_ROOT_EXTRA_FOLDERS := bt_firmware dsp firmware persist
BOARD_HAS_REMOVABLE_STORAGE := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery/root/etc/recovery.wipe
TARGET_USERIMAGES_USE_EXT4 := true

# A/B device flags
TARGET_NO_KERNEL := false
#TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
AB_OTA_UPDATER := true

# Board Properties
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_SCREEN_BLANK := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TW_USE_TOOLBOX := true

# Add logcat support
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true