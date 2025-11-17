repo init -u https://github.com/Evolution-X/manifest -b bka-q1 --git-lfs
/opt/crave/resync.sh
# repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

rm -rf device/xiaomi/onyx
rm -rf vendor/xiaomi/onyx
rm -rf device/xiaomi/onyx-kernel
rm -rf hardware/xiaomi
rm -rf packages/apps/XiaomiDolby

git clone https://github.com/poco-f7-onyx/android_device_xiaomi_onyx.git -b lineage-23.0 device/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/proprietary_vendor_xiaomi_onyx.git -b lineage-23.0 vendor/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/android_device_xiaomi_onyx-kernel.git -b lineage-23.0 device/xiaomi/onyx-kernel
git clone https://github.com/poco-f7-onyx/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/poco-f7-onyx/android_packages_apps_XiaomiDolby.git -b lineage-22.2 packages/apps/XiaomiDolby
git clone https://github.com/poco-f7-onyx/vendor_infinity-priv_keys.git -b main vendor/infinity-priv/keys

. build/envsetup.sh
lunch lineage_onyx-bp3a-userdebug
