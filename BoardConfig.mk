#
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_KERNEL_VERSION := 4.9

# Inherit from common msm8953-common
-include device/xiaomi/msm8953-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/tissot

# Display
TARGET_SCREEN_DENSITY := 440

# Filesystem
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# HALs
QCOM_SOONG_NAMESPACE := $(DEVICE_PATH)/qcom-caf
DEVICE_SPECIFIC_AUDIO_PATH := $(DEVICE_PATH)/qcom-caf/audio
DEVICE_SPECIFIC_DISPLAY_PATH := $(DEVICE_PATH)/qcom-caf/display
DEVICE_SPECIFIC_MEDIA_PATH := $(DEVICE_PATH)/qcom-caf/media


# Kernel
TARGET_KERNEL_CONFIG := tissot_defconfig

# Partitions
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55087422464 # 25765059584 - 16384


# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/enable_dt2w"

# RIL
ENABLE_VENDOR_RIL_SERVICE := true
TARGET_USES_OLD_MNC_FORMAT := true

# Security Patch Level
VENDOR_SECURITY_PATCH := 2020-05-05

# Shims
TARGET_LD_SHIM_LIBS := \
    /vendor/lib64/hw/gf_fingerprint.goodix.default.so|fakelogprint.so \
    /vendor/lib64/libgf_ca.so|fakelogprint.so \
    /vendor/lib64/libgf_hal.so|fakelogprint.so \
    /vendor/lib64/hw/fingerprint.fpc.default.so|fakelogprint.so

# Inherit the proprietary files
-include vendor/xiaomi/tissot/BoardConfigVendor.mk
