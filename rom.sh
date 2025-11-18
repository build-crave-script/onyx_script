repo init -u https://github.com/Evolution-X/manifest -b bka-q1-los --git-lfs
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

rm -rf device/qcom/sepolicy_vndr/sm8750
git clone https://github.com/K4LCHAKRA/android_device_qcom_sepolicy_vndr.git -b lineage-23.0-caf-sm8750 device/qcom/sepolicy_vndr/sm8750

git clone https://github.com/RisingOS-Revived-devices/android_device_xiaomi_onyx.git -b qpr1 device/xiaomi/onyx
git clone https://github.com/RisingOS-Revived-devices/proprietary_vendor_xiaomi_onyx.git -b qpr1 vendor/xiaomi/onyx
git clone https://github.com/RisingOS-Revived-devices/android_device_xiaomi_onyx-kernel.git -b lineage-23.0 device/xiaomi/onyx-kernel
git clone https://github.com/poco-f7-onyx/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/poco-f7-onyx/android_packages_apps_XiaomiDolby.git -b lineage-22.2 packages/apps/XiaomiDolby
git clone https://gitea.com/goziko32/vendor_gcam.git vendor/mgc

. build/envsetup.sh
lunch lineage_onyx-bp3a-userdebug
m evolution
