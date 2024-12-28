# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=sugar-datastore
pkgver=0.121
pkgrel=2
pkgdesc="Sugar datastore service"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('GPL')
depends=('dbus-python' 'python-gobject' 'python-xapian')
source=(https://download.sugarlabs.org/sources/sucrose/glucose/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('6c38b10cf0e294a9c5d9d00d291aa9be9b8e85e3045dc6f71a54ab3792880bb4')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -vif
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
