# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libssc
pkgver=0.4.3
pkgrel=1
pkgdesc='Library for exposing Qualcomm Sensor Core sensors to Linux'
arch=(x86_64)
url='https://libssc.dylanvanassche.be/'
license=(GPL-3.0-or-later)
depends=(glib2
         glibc
         libgcc
         libqmi
         libqrtr-glib
         protobuf-c)
makedepends=(git
             meson)
source=(git+https://codeberg.org/DylanVanAssche/libssc#tag=v$pkgver)
sha256sums=('cc8151de802f37568e696623ee4bc0f526607bbbf0e2d40b3c01ade5c87cca6f')

build() {
  meson build $pkgname \
    --prefix=/usr \
    --libexecdir=lib
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
