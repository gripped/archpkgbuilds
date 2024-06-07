# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.5.1
pkgrel=1
pkgdesc='Window Manager designed for speed, usability, and consistency'
arch=(x86_64)
url='https://ice-wm.org/'
license=('LGPL-2.0-only')
depends=(alsa-lib imlib2 librsvg libsndfile libxcomposite libxdamage libxinerama libxpm libxrandr)
makedepends=(asciidoctor xorg-mkfontdir)
optdepends=('perl: for icewm-menu-xrandr')
source=("https://github.com/ice-wm/icewm/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=('455b07d53f40ad5ce38c55e4d9537be22d4ef318d3cfbe640c69536b08bb5d3a')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
