# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265
pkgver=1.0.13
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64)
url='https://github.com/strukturag/libde265'
license=(LGPL3)
depends=(gcc-libs
         glibc)
makedepends=(ffmpeg
             qt5-base
             sdl)
optdepends=('ffmpeg: for sherlock265'
            'qt5-base: for sherlock265'
            'sdl: dec265 YUV overlay output')
source=(https://github.com/strukturag/libde265/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('b921bc90521f28914bbf0c638c436b79831857ca4f7af1f3dd4ce2228bf40cfd')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

# Remove useless tests binary
  rm "$pkgdir"/usr/bin/tests
}
