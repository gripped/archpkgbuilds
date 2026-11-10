# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: graysky <graysky@archlinux.us>
# Contributor: <kastor@fobos.org.ar>

pkgname=lrzip
epoch=1
pkgver=0.7.3
pkgrel=1
pkgdesc='Multi-threaded compression with rzip/lzma, lzo, and zpaq'
url='https://github.com/ckolivas/lrzip'
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=(
  'bash'
  'bzip2'
  'glibc'
  'lz4'
  'lzo'
  'zlib'
)
makedepends=('git')
install=lrzip.install
source=("git+https://github.com/ckolivas/lrzip#tag=v${pkgver}")
sha256sums=('c03b81cf3794209edba67ede1f665f62684d268141e078936848fe059d1e4585')

prepare() {
  cd "${pkgname}"
  autoreconf -fi
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr
  make
}

check() {
  make -C "${pkgname}" -k check
}

package() {
  make -C "${pkgname}" DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
