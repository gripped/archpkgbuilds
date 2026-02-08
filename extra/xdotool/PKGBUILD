# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Rttommy <rttommy@gmail.com>

pkgname=xdotool
pkgver=4.20251130.1
pkgrel=1
pkgdesc="Command-line X11 automation tool"
arch=('x86_64')
url="https://www.semicomplete.com/projects/xdotool/"
license=('BSD-3-Clause')
depends=(
  'glibc'
  'libx11'
  'libxinerama'
  'libxkbcommon'
  'libxtst'
)
checkdepends=(
  'procps-ng'
  'ruby-minitest'
  'xorg-fonts-misc'
  'xorg-mkfontscale'
  'xorg-server-xvfb'
  'xorg-setxkbmap'
  'xorg-xdpyinfo'
  'xorg-xprop'
  'xorg-xwininfo'
  'xterm'
)
source=("https://github.com/jordansissel/xdotool/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('6495a6cd172213a668ca5072676b1969c35f5ee4bf927ad89eac323d878cb25fa85ab56e7079d562c1915277b6196a5286000fb51ceb2603f710c3d65a2ab524')

build() {
  cd $pkgname-$pkgver
  make WITHOUT_RPATH_FIX=1
}

check() {
  cd $pkgname-$pkgver
  # Reduce noise by ensure tests have access to correct fonts
  cp -vr /usr/share/fonts/misc ./fonts
  mkfontdir ./fonts
  make -C t test-xvfb-nowm XSERVER="Xvfb -ac -screen 0 1280x768x24 -fp $PWD/fonts"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr INSTALLMAN=/usr/share/man install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT
}
