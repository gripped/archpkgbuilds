# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.4.6
pkgrel=1
pkgdesc='Window Manager designed for speed, usability, and consistency'
arch=(x86_64)
url='https://ice-wm.org/'
license=('LGPL-2.0-only')
depends=(alsa-lib imlib2 librsvg libsndfile libxcomposite libxdamage libxinerama libxpm libxrandr)
makedepends=(asciidoctor xorg-mkfontdir)
optdepends=('perl: for icewm-menu-xrandr')
source=("https://github.com/ice-wm/icewm/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=('ab05efe9c8fb2f49733035c0b8d41dc6fa8992f0a64f797c4650841a5d6892c8')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
