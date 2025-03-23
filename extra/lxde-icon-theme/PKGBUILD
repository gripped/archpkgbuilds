# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxde-icon-theme
pkgver=0.5.2
pkgrel=1
pkgdesc="LXDE default icon theme based on nuoveXT2"
arch=('any')
url="https://lxde.org/"
license=('GPL')
groups=('lxde' 'lxde-gtk3')
depends=('gtk-update-icon-cache')
source=(https://github.com/lxde/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('5b71da247ba25ddcd991a3a184ca5ac92f40b7676766e1e59437067a20f7ecf7')

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
