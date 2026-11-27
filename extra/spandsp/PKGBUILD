# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=spandsp
pkgname=(
  spandsp
  spandsp-docs
)
pkgver=3.1.1
pkgrel=1
pkgdesc='Low-level signal processing library that modulates and demodulates signals commonly used in telephony'
arch=(x86_64)
url='https://github.com/freeswitch/spandsp'
license=(LGPL-2.1-only)
depends=(
  glibc
  libjpeg-turbo
  libtiff
)
makedepends=(
  docbook-xsl
  doxygen
  git
)
source=("git+https://github.com/freeswitch/spandsp#tag=v$pkgver")
b2sums=(ec185e4a60bb64b1ce59ac9af66f80bed878d4c20bc31de12960abc085a8059a985f5ea2c40852e7896bd11e3fb55f42ed51a4c6c567b364932116797c4a0c08)

prepare() {
  cd $pkgbase
  autoreconf -fiv
}

build() {
  cd $pkgbase
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-doc
  make
}

package_spandsp() {
  provides=(libspandsp.so)

  cd $pkgbase
  make DESTDIR="$pkgdir" install
}

package_spandsp-docs() {
  pkgdesc='Developer documentation for spandsp'
  depends=()

  cd $pkgbase
  install -dm755 "$pkgdir/usr/share/doc/$pkgbase"
  cp -r doc/api/html "$pkgdir/usr/share/doc/$pkgbase/"
}
