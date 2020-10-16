DEVICE_PATH := device/mobvoi/catfish
BOARD_VENDOR := mobvoi

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

-include vendor/mobvoi/catfish/BoardConfigVendor.mk
