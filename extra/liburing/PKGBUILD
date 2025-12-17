# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=liburing
pkgver=2.13
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
sha512sums=('d343f241b4ed12d74e290ecba0f00f28ccff73c183370a020cbb4fc1f5e75f26883f72d282a6559f597c6aa51545d0c3e946897abcde7da8fb7ff6c2e19fe546')
b2sums=('9a59d1c2bb774932c08929d9edc4c81e2298ba736239871a50088243fdc440c8d7b292b7220a48b7cf13fdf3d5f294f2b6fab7157a49208c24dde7ed188a5c57')
validpgpkeys=(C0FC392DCADE26D975FA5E4AF7D358FB2971E0A6)  # Jens Axboe <axboe@kernel.dk>

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
