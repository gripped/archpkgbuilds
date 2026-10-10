#!/bin/sh
# Wrapper to start PeerBanHelper with the packaged layout.

APP_DIR=/usr/share/java/peerbanhelper
LIB_DIR=/usr/lib/peerbanhelper
JAVA_BIN="${PEERBANHELPER_JAVA_BIN:-/usr/bin/java}"

if [ "$(id -u)" -eq 0 ] || [ "$(id -un)" = "peerbanhelper" ]; then
    DEFAULT_DATADIR="/var/lib/peerbanhelper"
    DEFAULT_CONFIGDIR="/var/lib/peerbanhelper/config"
    DEFAULT_LOGSDIR="/var/log/peerbanhelper"
else
    DEFAULT_DATADIR="${XDG_DATA_HOME:-$HOME/.local/share}/peerbanhelper"
    DEFAULT_CONFIGDIR="${XDG_CONFIG_HOME:-$HOME/.config}/peerbanhelper"
    DEFAULT_LOGSDIR="${XDG_STATE_HOME:-$HOME/.local/state}/peerbanhelper/logs"
fi

exec "${JAVA_BIN}" \
    --enable-native-access=ALL-UNNAMED \
    -Dorg.sqlite.lib.path="${LIB_DIR}" \
    -Dflatlaf.nativeLibraryPath="${LIB_DIR}" \
    -XX:+UseCompactObjectHeaders \
    -Dpbh.release=arch \
    -Dpbh.datadir="${PEERBANHELPER_DATADIR:-$DEFAULT_DATADIR}" \
    -Dpbh.configdir="${PEERBANHELPER_CONFIGDIR:-$DEFAULT_CONFIGDIR}" \
    -Dpbh.logsdir="${PEERBANHELPER_LOGSDIR:-$DEFAULT_LOGSDIR}" \
    -Dpbh.log.level="${PEERBANHELPER_LOG_LEVEL:-WARN}" \
    -Djdk.attach.allowAttachSelf=true \
    -XX:MaxRAMPercentage="${PEERBANHELPER_MAX_RAM_PERCENT:-85.0}" \
    -Xmx"${PEERBANHELPER_MAX_HEAP:-1G}" \
    -XX:SoftMaxHeapSize="${PEERBANHELPER_SOFT_MAX_HEAP:-386M}" \
    -XX:+UseG1GC \
    -XX:G1PeriodicGCInterval="${PEERBANHELPER_G1_PERIODIC_GC_INTERVAL:-60000}" \
    -XX:MaxHeapFreeRatio="${PEERBANHELPER_MAX_HEAP_FREE_RATIO:-15}" \
    -XX:MinHeapFreeRatio="${PEERBANHELPER_MIN_HEAP_FREE_RATIO:-5}" \
    -Xss512k \
    -XX:+UseStringDeduplication \
    -XX:-ShrinkHeapInSteps \
    ${PEERBANHELPER_JAVA_OPTS:-} \
    -jar "${APP_DIR}/peerbanhelper.jar" \
    ${PEERBANHELPER_OPTS:-} \
    "$@"
