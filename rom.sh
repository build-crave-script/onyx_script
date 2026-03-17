
repo init -u https://github.com/VoltageOS/manifest.git -b 16.2 --git-lfs
/opt/crave/resync.sh
# repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

rm -rf device/xiaomi/onyx
rm -rf vendor/xiaomi/onyx
rm -rf device/xiaomi/onyx-kernel
rm -rf hardware/xiaomi
rm -rf packages/apps/XiaomiDolby
rm -rf packages/apps/GameBar

# device tree
git clone https://github.com/onyx-voltage/android_device_xiaomi_onyx.git -b bliss device/xiaomi/onyx

# vendor tree
git clone https://gitlab.com/romgharti/proprietary_vendor_xiaomi_onyx.git -b lineage-23.2 vendor/xiaomi/onyx

# kernel device tree
git clone https://github.com/BlissRoms-Devices/android_device_xiaomi_onyx-kernel.git -b lineage-23.2 device/xiaomi/onyx-kernel

# hardware tree
git clone https://github.com/BlissRoms-Devices/android_hardware_xiaomi.git -b onyx hardware/xiaomi

# GameBar app
git clone https://github.com/poco-f7-onyx/packages_apps_GameBar.git -b lineage-23.2 packages/apps/GameBar

# Lunaris Dolby app
git clone https://github.com/poco-f7-onyx/packages_apps_LunarisDolby.git -b 16.0 packages/apps/LunarisDolby

. build/envsetup.sh
brunch onyx
# m precompiled_sepolicy -j$(nproc)
