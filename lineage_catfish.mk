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

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mini.mk)

# Inherit launched with Oreo
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Inherit from catfish device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := mobvoi
PRODUCT_DEVICE := catfish
PRODUCT_MANUFACTURER := mobvoi
PRODUCT_NAME := lineage_catfish
PRODUCT_MODEL := TicWatch Pro

PRODUCT_GMS_CLIENTID_BASE := android-mobvoi
TARGET_VENDOR := mobvoi
TARGET_VENDOR_PRODUCT_NAME := catfish
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="catfish-user 9 PWDD.190617.074 6586999 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := mobvoi/catfish/catfish:9/PWDD.190617.074/6586999:user/release-keys
