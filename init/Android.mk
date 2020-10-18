LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(RECOVERY_VARIANT),twrp)
LOCAL_CPPFLAGS += -DNO_PRODUCT_OVERRIDE
endif

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
LOCAL_CFLAGS := -Wall
LOCAL_SRC_FILES := init_catfish.cpp
LOCAL_MODULE := libinit_catfish

include $(BUILD_STATIC_LIBRARY)
