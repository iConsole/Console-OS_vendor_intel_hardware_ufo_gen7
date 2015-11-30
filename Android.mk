LOCAL_PATH := $(call my-dir)

# Maintain the default to gen7 until the build targets
# are sorted out.
UFO_ENABLE_GEN ?= gen7

ifeq ($(strip $(UFO_ENABLE_GEN)),gen7)
ifeq ($(USE_INTEL_UFO_DRIVER),true)
ifneq ($(BOARD_HAVE_GEN_GFX_SRC),true)

ifeq ($(HAL_AUTODETECT),true)
BASE_GFX_DIR := ufo_byt
LOCAL_MODULE_PATH_32_GFX_LIB := $(TARGET_OUT_VENDOR)/gfx/$(BASE_GFX_DIR)/lib
LOCAL_MODULE_PATH_64_GFX_LIB := $(TARGET_OUT_VENDOR)/gfx/$(BASE_GFX_DIR)/lib64
LOCAL_MODULE_PATH_GFX_BIN := $(TARGET_OUT_VENDOR)/gfx/$(BASE_GFX_DIR)/bin
include $(LOCAL_PATH)/$(TARGET_ARCH)/gen7.mk
include $(LOCAL_PATH)/ufo_autodetect_links.mk
else
LOCAL_MODULE_PATH_32_GFX_LIB :=
LOCAL_MODULE_PATH_64_GFX_LIB :=
LOCAL_MODULE_PATH_GFX_BIN :=
include $(LOCAL_PATH)/$(TARGET_ARCH)/gen7.mk
endif # HAL_AUTODETECT

endif # BOARD_HAVE_GEN_GFX_SRC 
endif # USE_INTEL_UFO_DRIVER
endif # UFO_ENABLE_GEN
