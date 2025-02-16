#!/bin/bash -x

source PKGBUILD
test -f RFC-all.tar.gz || wget https://www.rfc-editor.org/rfc/tar/RFC-all.tar.gz
test -f rfc-index.txt || wget https://www.rfc-editor.org/rfc/rfc-index.txt

scp RFC-all.tar.gz sergej@repo.p5n.pp.ru:/home/sergej/public_html/dl/RFC-all-$pkgver.tar.gz
scp rfc-index.txt sergej@repo.p5n.pp.ru:/home/sergej/public_html/dl/rfc-index-$pkgver.txt
