
#
# Copyright 2017 The LineageOS Project
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

# mt6752 platform boardconfig
LOCAL_PATH := device/lenovo/aio_otfp

include device/lenovo/aio_otfp/configs/board.mk

MTK_K64_SUPPORT := yes

# Platform
TARGET_BOARD_PLATFORM := mt6752

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_BOARD_PLATFORM_GPU := mali-t760mp2
TARGET_USES_64_BIT_BINDER := true

# Architecture Extensions
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_VFP := true

# Ashmem
# DISABLE_ASHMEM_TRACKING := true

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive 
BOARD_KERNEL_OFFSET := 0x00080000
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)
TARGET_KERNEL_SOURCE := kernel/lenovo/aio_otfp
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := aio_otfp_n_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_PROTECT1IMAGE_PARTITION_SIZE:=10485760
BOARD_PROTECT2IMAGE_PARTITION_SIZE:=10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=2684354560
BOARD_CACHEIMAGE_PARTITION_SIZE:=444596224
BOARD_USERDATAIMAGE_PARTITION_SIZE:=1237319680
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_MTK_CAMERA_WRAPPER := true
MTK_MEDIA_PROFILES := true
BOARD_USES_MTK_MEDIA_PROFILES := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# RIL
BOARD_PROVIDES_RILD := true
BOARD_RIL_CLASS := ../../../device/lenovo/aio_otfp/ril
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES += libhealthd.mt6752

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
BOARD_DISABLE_HW_ID_MATCH_CHECK := true
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DMTK_AOSP_ENHANCEMENT
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE -DMTK_AOSP_ENHANCEMENT

# CM hardware
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Enable dex-preoptimization
WITH_DEXPREOPT := false
# DONT_DEXPREOPT_PREBUILTS := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# LED Path
BOARD_RED_LED_PATH	:= "/sys/class/leds/test-led"
BOARD_GREEN_LED_PATH	:= "/sys/class/leds/greenled"

# Offline Charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode
 
# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
# TWRP-specific
ifeq ($(RECOVERY_VARIANT), twrp)
DEVICE_RESOLUTION := 1080x1920
DEVICE_SCREEN_WIDTH := 1080
DEVICE_SCREEN_HEIGHT := 1920
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
endif

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# SELinux
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy

# Seccomp filter
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp
