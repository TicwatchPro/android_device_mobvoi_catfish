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

# Dalvik VM
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapmaxfree=2m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.heapstartsize=8m

# Expect bootloader
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.expect.bootloader=catfish-37.33.31.33.39

# LCD
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=280

# ro.product.first_api_level indicates the first api level the device has commercially launched on.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=26
