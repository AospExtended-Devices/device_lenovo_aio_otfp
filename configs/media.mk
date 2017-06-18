# Audio
PRODUCT_PACKAGES += \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix \
    libtinycompress \
    libtinyalsa \
    audio.a2dp.default \
    audio_policy.default \
    libtinycompress \
	libtinyxml

# Codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml