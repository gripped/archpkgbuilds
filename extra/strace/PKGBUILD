# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Ctonributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace
pkgver=6.18
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
sha256sums=('0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325'
            'SKIP')
validpgpkeys=(
  '296D6F29A020808E8717A8842DB5BD89A340AEB7' # Dmitry V. Levin <ldv@altlinux.org>
  '7BECFE3AF7B280BB52FF77F104BA4521C996DDE1' # Dmitry V. Levin <ldv@strace.io>
)

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-libunwind --enable-mpers=check
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
