# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=which
pkgver=2.22
pkgrel=1
pkgdesc='A utility to show the full path of commands'
arch=('x86_64')
url='https://savannah.gnu.org/projects/which/'
license=('GPL-3.0-or-later')
depends=('glibc' 'bash')
# gpg key is using deprecated md5 algo, do not use
# check if a new one is issued in the next release
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9f85cde3f2c257021b8508f756704bee6002fa8f5680297d30f186cc1f342af5')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
