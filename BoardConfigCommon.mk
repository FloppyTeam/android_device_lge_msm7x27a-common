# Copyright 2016 The Android Open Source Project
# Copyright 2016 TeamHacklG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/lge/msm7x27a-common/BoardConfigVendor.mk

# Vendor
BOARD_VENDOR := lge

# Compiler Optimization
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := 7x27
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Low RAM settings
MALLOC_IMPL := dlmalloc

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_NEON := true
TARGET_ARCH_LOWMEM := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# cortex-a9 is used to take advantage of NEON optimizations
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon

# Optimisations used by Qualcomm
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/lge/SKernel
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x1200000
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Compiler flags
TARGET_GLOBAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a9
TARGET_GLOBAL_CPPFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a9
COMMON_GLOBAL_CFLAGS += -DUSE_MDP3
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480
TARGET_GLOBAL_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_UIDS
COMMON_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# QCOM Display Stuff
BOARD_USES_QCOM_HARDWARE := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_QCOM_DISPLAY_VARIANT := caf
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_QCOM_BSP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_NO_INITLOGO := true

# Media 
TARGET_QCOM_MEDIA_VARIANT := caf

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_HAS_QACT := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# Graphics
USE_OPENGL_RENDERER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_NO_HW_VSYNC := false
TARGET_DOESNT_USE_FENCE_SYNC := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_USES_OPENGLES_FOR_SCREEN_CAPTURE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Light
TARGET_PROVIDES_LIBLIGHT := true

# Hardware
BOARD_HARDWARE_CLASS := device/lge/msm7x27a-common/cmhw

# SEPolicy
BOARD_SEPOLICY_DIRS += device/lge/msm7x27a-common/sepolicy
BOARD_SEPOLICY_UNION += \
       untrusted_app.te \
       vold.te \
	file_contexts \
	app.te \
	bluetooth.te \
	device.te \
	domain.te \
	drmserver.te \
	file.te \
	hci_init.te \
	healthd.te \
	init.te \
	init_shell.te \
	keystore.te \
	kickstart.te \
	mediaserver.te \
	netd.te \
	rild.te \
	surfaceflinger.te \
	system.te \
	ueventd.te \
	wpa_supplicant.te

# WLAN
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_EXT_MODULE_PATH             := "/system/lib/modules/librasdioif.ko"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_EXT_MODULE_NAME             := "librasdioif"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
WIFI_DRIVER_FW_PATH_PARAM        := "/data/misc/wifi/fwpath"

# Webkit
PRODUCT_PACKAGES += \
    libwebcore  

ENABLE_WEBGL := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_ARCH_LOWMEM := true
TARGET_WEBKIT_USE_MORE_MEMORY  := true
TARGET_FORCE_CPU_UPLOAD  := true
TARGET_USES_JELLYBEAN_BASEBAND := true

# Add h/w acceleration in browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

HWUI_COMPILE_FOR_PERF := true

PRODUCT_PROPERTY_OVERRIDES += \
       ro.ksm.default=1
