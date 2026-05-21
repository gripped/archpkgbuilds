#!/usr/bin/env sh
xprop -root -remove AT_SPI_BUS >/dev/null 2>&1 || true
exec /usr/lib/musescore/mscore "$@"
