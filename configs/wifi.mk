# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    libwifi-hal-mt66xx \
    lib_driver_cmd_mt66xx

PRODUCT_COPY_FILES += \
    device/lenovo/aio_otfp/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lenovo/aio_otfp/prebuilt/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/lenovo/aio_otfp/prebuilt/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf