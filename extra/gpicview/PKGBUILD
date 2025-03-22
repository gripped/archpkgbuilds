# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=gpicview
pkgver=0.2.6
pkgrel=1
pkgdesc='Lightweight image viewer'
arch=('x86_64')
url='https://www.lxde.org/'
license=('GPL2')
groups=('lxde')
depends=('gtk3')
makedepends=('intltool')
replaces=('gpicview-gtk3')
source=("https://github.com/lxde/gpicview/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'gpicview.appdata.xml')
sha256sums=('1b7be0045b82592cf79c7a7761d4f905d36c7c36b480d39219fe0bdb960a4a58'
            'dab79b2be536005044cc5edcc4f47e9f407a5fcf3126110a1ef2ab65c873dbf7')

prepare() {
  cd $pkgname-$pkgver

  # Apply only one main category
  sed -i '/^Categories=/ s/Utility;//' gpicview.desktop.in

  autoreconf -vif
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk3
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
