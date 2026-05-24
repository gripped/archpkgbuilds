#!/usr/bin/sh
export DISABLE_AUTO_UPDATES=1
exec @ELECTRON@ /usr/lib/feishin/app.asar "$@"
