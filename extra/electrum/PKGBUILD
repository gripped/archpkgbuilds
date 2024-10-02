# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum
pkgver=4.5.5
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
url="https://electrum.org"
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'libsecp256k1'
  'python'
  'python-aiohttp'
  'python-aiohttp-socks'
  'python-aiorpcx'
  'python-attrs'
  'python-certifi'
  'python-cryptography'
  'python-dnspython'
  'python-jsonpatch'
  'python-pillow'
  'python-protobuf'
  'python-pyaes'
  'python-pyqt5'
  'python-qrcode'
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
  'python-pyqt6'
  'python-pytest'
  'qt6-declarative'
)
optdepends=(
  'python-btchip: BTChip hardware wallet support'
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-matplotlib: plot transaction history in graphical mode'
  'zbar: QR code reading support'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'python-qdarkstyle: optional dark theme in graphical mode'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
)
source=(
  "git+https://github.com/spesmilo/electrum.git#tag=$pkgver?signed"
  "git+https://github.com/spesmilo/electrum-locale.git"
  "git+https://github.com/spesmilo/electrum-http.git"
)
sha512sums=('3ff5ca9d339ba6106f579268d9b24523aa6c041da5bd2471a51646b09edd12fc69108929a3ce8adb6c536bfbbb5cda91b63b53e4600428b56a2f1f0ecb7c7fd3'
            'SKIP'
            'SKIP')
validpgpkeys=('6694D8DE7BE8EE5631BED9502BD5824B7F9470E6') # Thomas Voegtlin (https://electrum.org) <thomasv@electrum.org>

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.contrib/deterministic-build/electrum-locale.url \
    "$srcdir/electrum-locale"
  git config submodule.electrum/plugins/payserver/www.url "$srcdir/electrum-http"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vdm755 "$pkgdir/$site_packages/electrum"
  ./contrib/build_locale.sh \
    contrib/deterministic-build/electrum-locale/locale \
    "$pkgdir/$site_packages/electrum/locale"

  install -vDm644 -t "$pkgdir/usr/share/applications" "electrum.desktop"
  install -vDm644 -t "$pkgdir/usr/share/pixmaps" "electrum/gui/icons/electrum.png"
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps" \
   "electrum/gui/icons/electrum.png"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
