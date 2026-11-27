#!/bin/bash

. PKGBUILD

FILE=$(wget -qO - https://addons.mozilla.org/api/v5/addons/addon/adblock-plus/ | jq .current_version.file.url | cut -d/ -f7)

sed -i "s|_file=.*|_file=$FILE|" PKGBUILD
updpkgsums
