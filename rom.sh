repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs
# repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
/opt/crave/resync.sh
# repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

# repo init --depth=1 -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs
# repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

rm -rf device/xiaomi/onyx
# rm -rf vendor/xiaomi/onyx
# rm -rf device/xiaomi/onyx-kernel
# rm -rf hardware/xiaomi
# rm -rf packages/apps/XiaomiDolby
# rm -rf vendor/lineage-priv/keys

git clone https://github.com/RisingOS-Revived-devices/android_device_xiaomi_onyx.git -b sixteen device/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/proprietary_vendor_xiaomi_onyx.git -b lineage-23.0 vendor/xiaomi/onyx
git clone https://github.com/poco-f7-onyx/android_device_xiaomi_onyx-kernel.git -b lineage-23.0 device/xiaomi/onyx-kernel
git clone https://github.com/poco-f7-onyx/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/poco-f7-onyx/android_packages_apps_XiaomiDolby.git -b lineage-22.2 packages/apps/XiaomiDolby
git clone https://github.com/poco-f7-onyx/vendor_infinity-priv_keys.git -b main vendor/lineage-priv/keys
rm -rf official/devices
git clone https://github.com/K4LCHAKRA/official_devices_rising.git -b fifteen official/devices
git clone https://github.com/VoltageOS/prebuilts_calyx_datura.git --depth 1 -b 16 prebuilts/calyx/datura
git clone https://gitea.com/goziko32/vendor_gcam.git vendor/mgc

# firewall
cd vendor/rising
curl -s https://github.com/RisingOS-Revived/android_vendor_rising/commit/cbe59b6a406c638e2cbbdcd00cb46fd59beb4565.patch | git am
# wallpaper
# curl -s https://github.com/RisingOS-Revived/android_vendor_rising/commit/1799ee190c5dae0ff78abe7e1792b36b88bc6ac6.patch | git am
cd ../..

cd packages/apps/Settings
curl -s https://github.com/RisingOS-Revived/android_packages_apps_Settings/commit/738648640ca1e99a8dfc31a866b2a4596f67b5d1.patch | git am
curl -s https://github.com/RisingOS-Revived/android_packages_apps_Settings/commit/eb27668750279ebd46143401cc2fa7f893659e26.patch | git am
cd ../../..

source build/make/envsetup.sh
source build/envsetup.sh
source build/make/envsetup.sh
export WITH_GMS=true
# export TARGET_USES_MINI_GAPPS=true
export TARGET_ENABLE_BLUR=true
export TARGET_PREBUILT_LAWNCHAIR_LAUNCHER=true
export TARGET_DEFAULT_PIXEL_LAUNCHER=false
export PERSIST_SYS_DEFAULT_LAUNCHER=0
export PERSIST_SYS_QUICKSWITCH_PIXEL_SHIPPED=1
riseup onyx user
make installclean
rise b
