# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Ctonributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace
pkgver=6.16
pkgrel=1
pkgdesc='A diagnostic, debugging and instructional userspace tracer'
arch=(x86_64)
url='https://strace.io/'
license=(LGPL-2.1-or-later)
depends=(
  glibc
  libunwind
)
source=("https://github.com/strace/strace/releases/download/v$pkgver/strace-$pkgver.tar.xz"{,.asc})
sha256sums=('3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa'
            'SKIP')
validpgpkeys=('296D6F29A020808E8717A8842DB5BD89A340AEB7') # Dmitry V. Levin <ldv@altlinux.org>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-libunwind
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
