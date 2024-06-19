# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: bender02 at gmx dot com

_pkgbasename=nettle
pkgname=lib32-$_pkgbasename
pkgver=3.10
pkgrel=1
pkgdesc="A low-level cryptographic library (32-bit)"
arch=('x86_64')
url="https://www.lysator.liu.se/~nisse/nettle/"
license=('LGPL-3.0-or-later OR GPL-2.0-or-later')
depends=('lib32-glibc' 'lib32-gmp' $_pkgbasename=$pkgver)
makedepends=(gcc-multilib)
provides=('libnettle.so' 'libhogweed.so')
source=(https://ftp.gnu.org/gnu/nettle/$_pkgbasename-$pkgver.tar.gz{,.sig})
sha256sums=('b4c518adb174e484cb4acea54118f02380c7133771e7e9beb98a0787194ee47c'
            'SKIP')
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller <nisse@lysator.liu.se>

build() {
  cd $_pkgbasename-$pkgver

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --enable-shared --with-include-path=/usr/lib32/gmp
  make
}

check() {
  cd $_pkgbasename-$pkgver
  make -k check
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir/" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
