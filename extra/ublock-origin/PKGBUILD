# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=(
  firefox-ublock-origin
  thunderbird-ublock-origin
  ublock-origin
)
pkgbase=ublock-origin
pkgver=1.74.0
pkgrel=1
pkgdesc='Efficient blocker add-on for various browsers. Fast, potent, and lean'
arch=(any)
url=https://github.com/gorhill/uBlock
license=(GPL-3.0-or-later)
makedepends=(
  git
  python
  strip-nondeterminism
  zip
)
source=("git+$url.git#commit=$pkgver?signed")
b2sums=('ee857b32fd865201100795a797360ffbc9190525e29451182535107ce3e0db90fbde1d85b67256cab88ee9c26ed52b6b69f7e0e8b72ee15f28d0594d2423def0')
validpgpkeys=(91BFC93FDEC1D00C365C061EF5630CAE62A14316) # gorhill

prepare() {
  local dest=dist/build/uAssets

  cd uBlock
  sed -i "s/ \$(assets)//" Makefile
  git clone --depth 1 --branch master https://github.com/uBlockOrigin/uAssets $dest/main
  git clone --depth 1 --branch gh-pages https://github.com/uBlockOrigin/uAssets $dest/prod
}

build() {
  cd uBlock
  ./tools/make-chromium.sh
  ./tools/make-firefox.sh all
  ./tools/make-thunderbird.sh all

  cd dist/build
  strip-nondeterminism -t zip uBlock0.*.xpi
}

package_ublock-origin() {
  pkgdesc+=' (unpacked webextension)'
  provides=(chromium-ublock-origin)
  replaces=(chromium-ublock-origin)

  cd uBlock/dist/build/uBlock0.chromium
  install -d "$pkgdir"/usr/lib/$pkgbase
  cp -r -- * "$pkgdir"/usr/lib/$pkgbase
}

package_firefox-ublock-origin() {
  groups=(firefox-addons)

  cd uBlock/dist/build
  install -Dm644 uBlock0.firefox.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/uBlock0@raymondhill.net.xpi
}

package_thunderbird-ublock-origin() {
  groups=(thunderbird-addons)

  cd uBlock/dist/build
  install -Dm644 uBlock0.thunderbird.xpi \
    "$pkgdir"/usr/lib/thunderbird/extensions/uBlock0@raymondhill.net.xpi
}
