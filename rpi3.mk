USE_OEM_TV_APP := true
$(call inherit-product, device/google/atv/products/atv_base.mk)

PRODUCT_NAME := rpi3
PRODUCT_DEVICE := rpi3
PRODUCT_BRAND := Android
PRODUCT_MODEL := Raspberry Pi 3
PRODUCT_MANUFACTURER := brcm

# Set screen size and densities
PRODUCT_AAPT_CONFIG := normal tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Dalvik heap config
include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

# Required system packages
PRODUCT_PACKAGES += \
    audio.primary.$(TARGET_PRODUCT) \
    audio.usb.default \
    gralloc.$(TARGET_PRODUCT) \
    hwcomposer.$(TARGET_PRODUCT) \
    libGLES_mesa \
    wpa_supplicant \
    wpa_supplicant.conf

# Required application packages
PRODUCT_PACKAGES += \
    Browser2 \
    Launcher2 \
    LeanbackLauncher \
    Settings

# Overwrite the define in order to set our files first
PRODUCT_COPY_FILES := \
    device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
    device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.bin:root/lib/firmware/brcm/brcmfmac43430-sdio.bin \
    $(LOCAL_PATH)/firmware/brcm/brcmfmac43430-sdio.txt:root/lib/firmware/brcm/brcmfmac43430-sdio.txt \
    $(LOCAL_PATH)/firmware/brcm/BCM43430A1.hcd:root/lib/firmware/brcm/BCM43430A1.hcd \
    $(LOCAL_PATH)/fstab.rpi3:root/fstab.rpi3 \
    $(LOCAL_PATH)/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/init.rpi3.rc:root/init.rpi3.rc \
    $(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/rpi3_core_hardware.xml:system/etc/permissions/rpi3_core_hardware.xml \
    $(LOCAL_PATH)/ueventd.rpi3.rc:root/ueventd.rpi3.rc \
    $(PRODUCT_COPY_FILES)

DEVICE_PACKAGE_OVERLAYS := device/brcm/rpi3/overlay
PRODUCT_CHARACTERISTICS := tv
PRODUCT_LOCALES := en_US,ko_KR,ja_JP,zh_CN,hi_IN,en_GB,de_DE,fr_FR,it_IT,ru_RU,es_ES,pt_PT
