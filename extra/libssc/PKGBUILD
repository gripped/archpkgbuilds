# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libssc
pkgver=0.4.1
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
sha256sums=('255ca0d329c83de8b676b89e1d9e7de243988817083bfc7d7cadf90398e1eedb')

build() {
  meson build $pkgname \
    --prefix=/usr
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
