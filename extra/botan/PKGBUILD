# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>
# Contributor: Hexchain Tong <richard0053@gmail.com>
# Contributor: Jack Lloyd <jack@randombit.net>

pkgname=botan
pkgver=3.7.0
pkgrel=1
pkgdesc='Crypto library written in C++'
arch=(x86_64)
url='https://botan.randombit.net/'
license=(BSD-2-Clause)
depends=(bzip2
         gcc-libs
         glibc
         sqlite
         xz
         zlib)
makedepends=(boost
             python)
optdepends=('boost-libs: for the botan executable'
            'python: for using botan2.py')
source=(https://botan.randombit.net/releases/Botan-${pkgver}.tar.xz{,.asc})
sha256sums=('240849b7330308e095d99d71b5b3c6b2b2448e362c3cb5a664a43fffc650ec0a'
            'SKIP')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC') # Botan Distribution Key

build() {
  cd ${pkgname^}-$pkgver

  ./configure.py \
    --prefix=/usr \
    --with-bzip \
    --with-lzma \
    --with-zlib \
    --with-boost \
    --with-sqlite3 \
    --with-os-feature=getrandom
  make
}

check() {
  cd ${pkgname^}-$pkgver

  LD_LIBRARY_PATH="$PWD" ./botan-test --test-threads=1
}

package() {
  DESTDIR="$pkgdir" make -C ${pkgname^}-$pkgver install
  install -Dm644 ${pkgname^}-$pkgver/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
