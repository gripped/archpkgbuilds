# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum
pkgver=4.6.2
pkgrel=2
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
  'python-attrs'
  'python-certifi'
  'python-cryptography'
  'python-dnspython'
  'python-electrum-aionostr'
  'python-electrum-ecc'
  'python-jsonpatch'
  'python-jsonpointer'
  'python-pillow'
  'python-protobuf'
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
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-matplotlib: plot transaction history in graphical mode'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python-qdarkstyle: optional dark theme in graphical mode'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'zbar: QR code reading support'
)
source=(
  "git+https://github.com/spesmilo/electrum.git#tag=$pkgver?signed"
  "git+https://github.com/spesmilo/electrum-locale.git"
  "git+https://github.com/spesmilo/electrum-http.git"
  "$pkgname-remove-runtime-aiorpcx-version-check.patch"
)
sha512sums=('5ef13385ed53ff983d9d88a9f2d8601ffb4cd5c86cf25447bc43e00e8bdeada688cdaec8a0b79927bc05b0207650efedd9c88204014e1639fa98acf2b9f71b76'
            'SKIP'
            'SKIP'
            'e0b904cdb21b0be0abd3f22a721fd12a55be516a6f41ea498e327e6402d8e7a9e0f83f3a31a30e128defce6c9d02369389ee3b2c2ea0ebc31258184cc4241b82')
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

  patch -Np1 -i ../$pkgname-remove-runtime-aiorpcx-version-check.patch
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
  ./contrib/locale/build_locale.sh \
    electrum/locale/locale \
    "$pkgdir/$site_packages/electrum/locale"

  install -vDm644 -t "$pkgdir/usr/share/applications" "electrum.desktop"
  install -vDm644 -t "$pkgdir/usr/share/pixmaps" "electrum/gui/icons/electrum.png"
  install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps" \
   "electrum/gui/icons/electrum.png"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
