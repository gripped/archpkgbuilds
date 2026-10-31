# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum
pkgver=4.8.3
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
url="https://electrum.org"
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'python'
  'python-aiohttp'
  'python-aiohttp-socks'
  'python-aiorpcx'
  'python-certifi'
  'python-cryptography'
  'python-dnspython'
  'python-electrum-aionostr'
  'python-electrum-ecc'
  'python-jsonpatch'
  'python-jsonpointer'
  'python-pillow'
  'python-pyaes'
  'python-pyqt6'
  'python-qrcode'
  'qt6-declarative'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pycryptodomex'
  'python-pytest'
)
optdepends=(
  # Moved to AUR - dead project/upstream
  # 'python-btchip: BTChip hardware wallet support'
  'python-cbor2: Jade hardware wallet support'
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-matplotlib: plot transaction history in graphical mode'
  'python-objgraph: memory leak debugging'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python-pygments: HTML stack traces for debugging'
  'python-pyserial: Jade hardware wallet support'
  'python-qdarkstyle: optional dark theme in graphical mode'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'qt6-multimedia: camera QR code scanning in the QML interface'
  'zxing-cpp: QR code reading support'
)
source=(
  "git+https://github.com/spesmilo/electrum.git#tag=$pkgver?signed"
  "git+https://github.com/spesmilo/electrum-locale.git"
  "git+https://github.com/spesmilo/electrum-http.git"
)
b2sums=('5c90971a88e5b165e574d9869832bffc9d1bab4fb5667701495fb8c775a219f23286c01f6ba24c1c70f730e8757eee17401f9b68b29488ebbdadae64abb5250c'
        'SKIP'
        'SKIP')
validpgpkeys=(
  '6694D8DE7BE8EE5631BED9502BD5824B7F9470E6' # Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>
  '4AD64339DFA05E20B3F6AD51E7B748CDAF5E5ED9' # SomberNight <somber.night@protonmail.com>
)

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.electrum/locale.url \
    "$srcdir/electrum-locale"
  git config submodule.electrum/plugins/payserver/www.url "$srcdir/electrum-http"
  git -c protocol.file.allow=always submodule update

  # Ignore generated stats.json when rebuilding translations in place.
  sed -i 's|for i in \*; do|for i in */; do|' contrib/locale/build_locale.sh

  # Ship only compiled translations and their completion statistics.
  cat >> MANIFEST.in <<'EOF'
prune electrum/locale
recursive-include electrum/locale *.mo stats.json
EOF
}

build() {
  cd $pkgname
  ./contrib/locale/build_locale.sh electrum/locale/locale electrum/locale/locale
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  pytest --ignore=electrum/locale/llm_proofreader
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/applications" "electrum.desktop"
  install -vDm644 -t "$pkgdir/usr/share/metainfo" "org.electrum.electrum.metainfo.xml"
  install -vDm644 -t "$pkgdir/usr/share/pixmaps" "electrum/gui/icons/electrum.png"
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps" \
   "electrum/gui/icons/electrum.png"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
