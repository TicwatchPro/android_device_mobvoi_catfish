#Read the arguments passed to the script
config="$1"

LOG_TAG=" init.upgrate-nanohub-fw"
LOG_NAME="${0}:"

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$@"
}

failed ()
{
  loge "$1: exit code $2"
  exit $2
}

get_target_info()
{
  target_nanohub_fw_ver=`cat /vendor/firmware/nanohub.full.version`

  target_hwType=`echo ${target_nanohub_fw_ver% hw ver:*}`
  target_hwType=`echo ${target_hwType#*hw type: }`
  target_hwVer=`echo ${target_nanohub_fw_ver% bl ver:*}`
  target_hwVer=`echo ${target_hwVer#* hw ver: }`
  target_variantVer=`echo ${target_nanohub_fw_ver#* variant ver: }`

  logi "target_hwType: $target_hwType, target_hwVer: $target_hwVer, target_variantVer: $target_variantVer"
}

get_current_info()
{
  geted_nanohub_fw_ver=`cat /sys/class/nanohub/nanohub/firmware_version`
  logi "geted fw version: $geted_nanohub_fw_ver"

  current_hwType=`echo ${geted_nanohub_fw_ver% hw ver:*}`
  current_hwType=`echo ${current_hwType#*hw type: }`
  current_hwVer=`echo ${geted_nanohub_fw_ver% bl ver:*}`
  current_hwVer=`echo ${current_hwVer#* hw ver: }`
  current_variantVer=`echo ${geted_nanohub_fw_ver#* variant ver: }`
  logi "current_hwType: $current_hwType, current_hwVer: $current_hwVer, current_variantVer: $current_variantVer"
 }

upgrade_fw_by_sysfs()
{
  echo 1 > /sys/class/nanohub/nanohub/download_bl
  geted_nanohub_fw_ver=`cat /sys/class/nanohub/nanohub/firmware_version`
  current_variantVer=`echo ${geted_nanohub_fw_ver#* variant ver: }`
  if [ "$current_variantVer" == "$target_variantVer" ]; then
    logi "target variant version $target_variantVer is same as geted variant version $current_variantVer, upgrade successful."
  else
    loge "target variant version $$target_variantVer is different as geted variant version $current_variantVer, upgrade failed. "
  fi
}

upgrade_fw_by_nanoapp_cmd()
{
  /vendor/bin/nanoapp_cmd download
  geted_nanohub_fw_ver=`cat /sys/class/nanohub/nanohub/firmware_version`
  current_variantVer=`echo ${geted_nanohub_fw_ver#* variant ver: }`
  if [ "$current_variantVer" == "$target_variantVer" ]; then
    logi "target variant version $target_variantVer is same as geted variant version $current_variantVer, upgrade successful."
  else
    loge "target variant version $$target_variantVer is different as geted variant version $current_variantVer, upgrade failed. "
  fi
}

upgrade_nanohub_fw ()
{
  if [ "$current_hwType" == "$target_hwType" ]; then
      if [ "$current_hwVer" == "$target_hwVer" ]; then
          if [ "$current_variantVer" == "$target_variantVer" ]; then
            logi "target variant version is same as geted variant version: $current_variantVer, no need to upgrade."
          else
            loge "hw version is not same. target: $target_variantVer, geted: $current_variantVer. try to upgrade."
            upgrade_fw_by_nanoapp_cmd
            #upgrade_fw_by_sysfs
         fi
      else
        loge "hw version is not same. target: $target_hwVer, geted: $current_hwVer"
      fi
  else
    loge "hw type is not same. target: $target_hwType, geted: $current_hwType"
  fi
}

case "$config" in
    "onboot")
        get_target_info
        get_current_info
        if [ -z "$target_hwType" ] || [ -z "$target_hwVer" ] || [ -z "$target_variantVer" ]; then
          loge "target firmware infomation is not right, please add them in init.common.nanohub.rc"
        else
          if [ -z "$current_hwType" ] || [ -z "$current_hwVer" ] || [ -z "$current_variantVer" ]; then
            loge "get current firmware information failed, force to update."
            upgrade_fw_by_nanoapp_cmd
          else
            upgrade_nanohub_fw
          fi
        fi
        exit 0
esac
