repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs
# repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh
# repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

rm -rf device/xiaomi/onyx
# rm -rf vendor/xiaomi/onyx
# rm -rf device/xiaomi/onyx-kernel
# rm -rf hardware/xiaomi
# rm -rf packages/apps/XiaomiDolby

git clone https://github.com/poco-f7-onyx/android_device_xiaomi_onyx.git -b ros device/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/proprietary_vendor_xiaomi_onyx.git -b lineage-23.0 vendor/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/android_device_xiaomi_onyx-kernel.git -b lineage-23.0 device/xiaomi/onyx-kernel
git clone https://github.com/poco-f7-onyx/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/poco-f7-onyx/android_packages_apps_XiaomiDolby.git -b lineage-22.2 packages/apps/XiaomiDolby
# git clone https://github.com/poco-f7-onyx/vendor_infinity-priv_keys.git -b main vendor/infinity-priv/keys

source build/make/envsetup.sh
source build/envsetup.sh
source build/make/envsetup.sh
export WITH_GMS=true
export TARGET_USES_MINI_GAPPS=true
export TARGET_ENABLE_BLUR=true
export TARGET_PREBUILT_LAWNCHAIR_LAUNCHER=true
export TARGET_DEFAULT_PIXEL_LAUNCHER=false
export PERSIST_SYS_DEFAULT_LAUNCHER=0  
export PERSIST_SYS_QUICKSWITCH_PIXEL_SHIPPED=1
riseup onyx user
make installclean
rise b
