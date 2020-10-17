#
# Copyright (C) 2020 Tipz Team
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

DEVICE_PATH := device/mobvoi/catfish

TARGET_COPY_SYSTEM_ETC := $(TARGET_COPY_OUT_SYSTEM)/etc

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    audio.primary.msm8909 \
    audio.r_submix.default

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_effects.conf:$(TARGET_OUT_VENDOR_ETC)/audio_effects.conf \
    $(DEVICE_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_SYSTEM_ETC)/audio_platform_info.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy.conf:$(TARGET_OUT_VENDOR_ETC)/audio_policy.conf \
    $(DEVICE_PATH)/configs/audio/mixer_paths_msm8909_pm8916.xml:$(TARGET_OUT_VENDOR_ETC)/mixer_paths_msm8909_pm8916.xml \
    $(DEVICE_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_OUT_VENDOR_ETC)/sound_trigger_mixer_paths.xml \
    $(DEVICE_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_OUT_VENDOR_ETC)/sound_trigger_platform_info.xml

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    bluetooth.default.so \
    libbt-hci \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Boot animation
TARGET_SCREEN_HEIGHT := 400
TARGET_SCREEN_WIDTH := 400

# Display
PRODUCT_PACKAGES += \
    gralloc.msm8909 \
    hwcomposer.msm8909 \
    memtrack.msm8909

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# GPS configurations
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/gps.conf:$(TARGET_OUT_VENDOR_ETC)/gps.conf \
    $(DEVICE_PATH)/configs/gps/gps.xml:$(TARGET_OUT_VENDOR_ETC)/gps.xml

# Keyboard
PRODUCT_PACKAGES += \
    LatinIME

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/fts_ts.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/fts_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/qpnp_pon.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/qpnp_pon.kl

# Media configurations
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_SYSTEM_ETC)/media_codecs.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_SYSTEM_ETC)/media_codecs_google_audio.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_google_telephony.xml:$(TARGET_COPY_SYSTEM_ETC)/media_codecs_google_telephony.xml \
    $(DEVICE_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_SYSTEM_ETC)/media_profiles.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_V1_0.dtd:$(TARGET_COPY_SYSTEM_ETC)/media_profiles_V1_0.dtd

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.1-impl \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci

# NFC configurations
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-hal-st.conf:$(TARGET_OUT_VENDOR_ETC)/libnfc-hal-st.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_OUT_VENDOR_ETC)/libnfc-nci.conf \

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.screen.portrait.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.screen.portrait.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.connectionservice.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/android.software.connectionservice.xml \
    frameworks/native/data/etc/wearable_core_hardware.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/wearable_core_hardware.xml \
    $(DEVICE_PATH)/configs/permissions/com.google.clockwork.hardware.sensor.llob.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/com.google.clockwork.hardware.sensor.llob.xml \
    $(DEVICE_PATH)/configs/permissions/com.google.wearable.hardware.sensor.heartrate.fitness.xml:$(TARGET_COPY_SYSTEM_ETC)/permissions/com.google.wearable.hardware.sensor.heartrate.fitness.xml

# Rootdir
PRODUCT_PACKAGES += \
    fstab.catfish \
    init.catfish.rc \
    init.common.rc \
    init.qcom.usb.rc \
    init.target.rc \
    init.foreground.sh \
    init.qcom.audio.sh \
    init.qcom.nanohub.rc \
    init.usb.configfs.rc \
    ueventd.catfish.rc

# Wi-Fi configurations
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/bcmdhd.cal:$(TARGET_OUT_VENDOR_ETC)/wifi/bcmdhd.cal \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_OUT_VENDOR_ETC)/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_OUT_VENDOR_ETC)/wifi/wpa_supplicant.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_OUT_VENDOR_ETC)/wifi/wpa_supplicant_overlay.conf \

# System Properties
$(call inherit-product, device/mobvoi/catfish/system_prop.mk)
