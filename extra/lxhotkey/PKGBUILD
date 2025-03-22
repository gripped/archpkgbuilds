# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgbase=lxhotkey
pkgname=(lxhotkey lxhotkey-gtk3)
pkgver=0.1.2
pkgrel=1
pkgdesc='Keyboard shortcuts configurator (part of LXDE)'
arch=('x86_64')
license=('GPL2')
url='https://lxde.org/'
depends=('gtk2' 'gtk3' 'libfm')
makedepends=('intltool')
source=(https://github.com/lxde/lxhotkey/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f32686d298d86ae1e97c9e3d27ba1f01b6a0f17dbbbbd67dfbf82e7c0080c592')

prepare() {
  cd $pkgbase-$pkgver
  ./autogen.sh
}

build() {
  # GTK+ 2 version
  [ -d gtk2 ] || cp -r $pkgbase-$pkgver gtk2
  cd gtk2
  ./configure --sysconfdir=/etc --prefix=/usr --with-gtk=2
  make

  cd "$srcdir"
  # GTK+ 3 version
  [ -d gtk3 ] || cp -r $pkgbase-$pkgver gtk3
  cd gtk3
  ./configure --sysconfdir=/etc --prefix=/usr --with-gtk=3
  make
}

package_lxhotkey() {
  groups=('lxde')
  depends=('gtk2' 'libfm')

  cd gtk2
  make DESTDIR="$pkgdir" install
}

package_lxhotkey-gtk3() {
  groups=('lxde-gtk3')
  pkgdesc+=' (GTK+ 3 version)'
  depends=('gtk3' 'libfm' 'libunistring')
  conflicts=('lxhotkey')

  cd gtk3
  make DESTDIR="$pkgdir" install
}
