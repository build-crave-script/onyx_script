repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/romgharti/stable_releases.git -b waterlily -g default,-mips,-darwin,-notdefault
# /opt/crave/resync.sh
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

rm -rf device/xiaomi/onyx
# rm -rf vendor/xiaomi/onyx
# rm -rf device/xiaomi/onyx-kernel
# rm -rf hardware/xiaomi
# rm -rf packages/apps/XiaomiDolby

git clone https://github.com/poco-f7-onyx/android_device_xiaomi_onyx.git -b bliss device/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/proprietary_vendor_xiaomi_onyx.git -b lineage-23.0 vendor/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/android_device_xiaomi_onyx-kernel.git -b lineage-23.0 device/xiaomi/onyx-kernel
git clone https://github.com/poco-f7-onyx/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/poco-f7-onyx/android_packages_apps_XiaomiDolby.git -b lineage-22.2 packages/apps/XiaomiDolby

. build/envsetup.sh
blissify onyx
