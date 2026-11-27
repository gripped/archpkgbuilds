#!/bin/sh
export ELECTRON_FORCE_IS_PACKAGED=1
exec @ELECTRON@ /usr/lib/sable/app.asar "$@"
