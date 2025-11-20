# repo init -u https://github.com/Evolution-X/manifest -b bka-q1-los --git-lfs
repo init -u https://github.com/Evolution-X/manifest -b bka-q1 --git-lfs
/opt/crave/resync.sh
# repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

rm -rf device/xiaomi/onyx
rm -rf vendor/xiaomi/onyx
rm -rf device/xiaomi/onyx-kernel
rm -rf hardware/xiaomi
rm -rf packages/apps/XiaomiDolby

cd hardware/lineage/compat
curl -s https://github.com/Evolution-X/hardware_lineage_compat/commit/694015f2b507bce7b550e09a93d511ba778242aa.patch | git am
cd ../../..

cd device/qcom/sepolicy_vndr/sm8750
curl -s https://github.com/LineageOS/android_device_qcom_sepolicy_vndr/commit/465ea3447408e581a04203413bb4a2a072398b50.patch | git am
curl -s https://github.com/LineageOS/android_device_qcom_sepolicy_vndr/commit/fb64189b72f40faaf0cd56b061979d6d00491c32.patch | git am
curl -s https://github.com/LineageOS/android_device_qcom_sepolicy_vndr/commit/2945f4274ac27fec19bb8eefc6a911b5351998ec.patch | git am
curl -s https://github.com/LineageOS/android_device_qcom_sepolicy_vndr/commit/18486d4d22ac90be70e37da3783f00c58cb41fa9.patch | git am
cd ../../../..

git clone https://github.com/RisingOS-Revived-devices/android_device_xiaomi_onyx.git -b qpr1 device/xiaomi/onyx
git clone https://github.com/RisingOS-Revived-devices/proprietary_vendor_xiaomi_onyx.git -b qpr1 vendor/xiaomi/onyx
git clone https://github.com/RisingOS-Revived-devices/android_device_xiaomi_onyx-kernel.git -b lineage-23.0 device/xiaomi/onyx-kernel
git clone https://github.com/poco-f7-onyx/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/poco-f7-onyx/android_packages_apps_XiaomiDolby.git -b lineage-22.2 packages/apps/XiaomiDolby
git clone https://gitea.com/goziko32/vendor_gcam.git vendor/mgc

. build/envsetup.sh
lunch lineage_onyx-bp3a-userdebug
m evolution
