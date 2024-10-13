# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=xorg-xkbprint
pkgver=1.0.7
pkgrel=1
pkgdesc="Generates a PostScript description of an XKB keyboard description"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/app/xkbprint"
license=('LicenseRef-xkbprint')
depends=('libxkbfile' 'libx11' 'glibc')
makedepends=('xorg-util-macros')
groups=('xorg-apps')
source=(https://xorg.freedesktop.org/archive/individual/app/xkbprint-${pkgver}.tar.xz{,.sig})
sha512sums=('52f803ba85b053408dfff400f47ae9461954430665a12257a99b9775e26dd7192a97b979de949b9c4532936c9bfcc181a773de41514a122973f05d676dee6476'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  cd xkbprint-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd xkbprint-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
