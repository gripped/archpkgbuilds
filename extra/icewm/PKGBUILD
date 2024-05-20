# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.5.0
pkgrel=1
pkgdesc='Window Manager designed for speed, usability, and consistency'
arch=(x86_64)
url='https://ice-wm.org/'
license=('LGPL-2.0-only')
depends=(alsa-lib imlib2 librsvg libsndfile libxcomposite libxdamage libxinerama libxpm libxrandr)
makedepends=(asciidoctor xorg-mkfontdir)
optdepends=('perl: for icewm-menu-xrandr')
source=("https://github.com/ice-wm/icewm/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=('3e5dc6b4a8768f40e5c0e967bf686fab6a7f7b290816f3e82d518a4cd8cbcd48')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
