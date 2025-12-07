#!/sbin/sh
#
# ADDOND_VERSION=1
#
# /system/addon.d/31-hail.sh
# During an Android upgrade, this script backs up Hail.apk,
# located in either /product/priv-app/ or /system/product/priv-app/,
# the partitions are formatted and reinstalled, then the file is restored.
#
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
product/priv-app/Hail/Hail.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac

