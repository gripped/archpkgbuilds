# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=diffutils
pkgver=3.11
pkgrel=1
pkgdesc='Utility programs used for creating patch files'
arch=('x86_64')
url='https://www.gnu.org/software/diffutils'
license=('GPL-3.0-or-later')
depends=('glibc' 'bash')
validpgpkeys=('155D3FC500C834486D1EEA677FD9FCCB000BEEEE') # Jim Meyering
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
