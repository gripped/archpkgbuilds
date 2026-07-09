# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.4.3
pkgrel=1
pkgdesc='A text-mode web browser and pager for Unix-like systems'
arch=(x86_64)
url='https://chawan.net/'
license=(Unlicense)
depends=(
  glibc
  brotli
  libssh2
  openssl
  sh
)
makedepends=(git 'nim>=2.0.0')
source=("$pkgname::git+https://git.sr.ht/~bptato/chawan#tag=v$pkgver")
sha512sums=('b2f9b413156b9a7dcb7cff3e2d24430f4a601d506f56968f5fbcabfe6ef501f79624eb67bdf15e79193d2fc089d0cfdd2dea06b8407fa90a3b878e781e91dd26')
b2sums=('593c5b715159e3a689e7fde415e606f526e537f10f3e4179b9842dfc6896c13c3e8bca0ae906c8ad35bd03451a2611ae6bb5f3c507fc41a1b3e6f474596a67f3')

build() {
  cd "$pkgname"

  export CFLAGS+=" -ffile-prefix-map=$srcdir/="

  make LIBEXECDIR=/usr/lib/chawan
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX='/usr' LIBEXECDIR="$pkgdir/usr/lib/chawan" install
}
