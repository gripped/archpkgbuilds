# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.4.2
pkgrel=1
pkgdesc='Window Manager designed for speed, usability, and consistency'
arch=(x86_64)
url='https://ice-wm.org/'
license=(LGPL)
depends=(alsa-lib imlib2 librsvg libsndfile libxcomposite libxdamage libxinerama libxpm libxrandr)
makedepends=(asciidoctor xorg-mkfontdir)
optdepends=('perl: for icewm-menu-xrandr')
source=("https://github.com/ice-wm/icewm/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=('b64c4b3e587e201ee4be48e76b5e94ba91fc71392812757d877eb4d4411671e2')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
