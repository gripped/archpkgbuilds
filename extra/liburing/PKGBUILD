# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=liburing
pkgver=2.11
pkgrel=1
pkgdesc="Linux-native io_uring I/O access library"
arch=(x86_64)
url="https://git.kernel.dk/cgit/liburing"
license=(
  'GPL-2.0-only WITH Linux-syscall-note OR MIT'
  LGPL-2.0-or-later
  MIT
)
makedepends=(git)
provides=(
  liburing.so
  liburing-ffi.so
)
source=("git+https://git.kernel.dk/liburing.git?signed#tag=$pkgname-$pkgver")
sha512sums=('79e45ff6cdc0193481e0701a3d70772d669a3a56dedf68aa73c7a89077869f22f58613e38e451176ee1b50a33f0a30cd3eacf0055a5eebf44280064122914cf1')
validpgpkeys=(C0FC392DCADE26D975FA5E4AF7D358FB2971E0A6)  # Jens Axboe <axboe@kernel.dk>

prepare() {
  cd liburing
  git cherry-pick -n 6836160ae6ae9fdc20d703de55162bfc97169542 # Build fix for samba
}

build() {
  local configure_options=(
    --prefix=/usr
    --mandir=/usr/share/man
  )

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname
  install -vDm 644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
