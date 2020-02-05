#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, device/oneplus/sm8150-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/oneplus/hotdog/hotdog-vendor.mk)

# Vendor properties
-include $(LOCAL_PATH)/vendor_props.mk

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk

# A/B
AB_OTA_PARTITIONS += \
    odm \
    product \
    recovery \
    vbmeta_system
	
# Initialize 5G Modem
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modem/bin/mdm_helper:$(TARGET_COPY_OUT_VENDOR)/bin/mdm_helper \
    $(LOCAL_PATH)/modem/bin/mdm_helper_proxy:$(TARGET_COPY_OUT_VENDOR)/bin/mdm_helper_proxy \
    $(LOCAL_PATH)/modem/bin/ks:$(TARGET_COPY_OUT_VENDOR)/bin/ks \
    $(LOCAL_PATH)/modem/bin/oemnvbkdaemon:$(TARGET_COPY_OUT_VENDOR)/bin/oemnvbkdaemon \
    $(LOCAL_PATH)/modem/bin/init.mdm.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mdm.sh \
    $(LOCAL_PATH)/modem/lib/libmdmdetect.so:$(TARGET_COPY_OUT_VENDOR)/lib/libmdmdetect.so \
    $(LOCAL_PATH)/modem/lib/liboemnvbk_img_helper.so:$(TARGET_COPY_OUT_VENDOR)/lib/liboemnvbk_img_helper.so \
    $(LOCAL_PATH)/modem/lib64/libmdmdetect.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmdmdetect.so \
    $(LOCAL_PATH)/modem/lib64/liboemnvbk_img_helper.so:$(TARGET_COPY_OUT_VENDOR)/lib64/liboemnvbk_img_helper.so \
    $(LOCAL_PATH)/modem/lib64/libmdmimgload.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmdmimgload.so

	
# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_pahu.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_pahu.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

# Camera
PRODUCT_PACKAGES += \
    vendor.lineage.camera.motor@1.0 \
    vendor.lineage.camera.motor@1.0-service.oneplus_msmnile \
    OnePlusCameraHelper

# Device init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.display.hotdog.rc

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
