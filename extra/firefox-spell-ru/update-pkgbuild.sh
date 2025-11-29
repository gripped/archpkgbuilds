#!/bin/bash

. PKGBUILD

FILE=$(wget -qO - https://addons.mozilla.org/en-US/firefox/addon/russian-spellchecking-dic-3703/versions/ | \
	grep -oP "https://addons.mozilla.org/firefox/downloads/file/\d+/russian_spellchecking_dic_3703-$pkgver.xpi" | cut -d/ -f7)

sed -i "s|_file=.*|_file=$FILE|" PKGBUILD
updpkgsums
