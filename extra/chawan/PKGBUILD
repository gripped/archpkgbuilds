# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.4.2
pkgrel=1
pkgdesc='A text-mode web browser and pager for Unix-like systems'
arch=(x86_64)
url='https://chawan.net/'
license=(Unlicense)
depends=(
  glibc
  libgcc
  brotli
  libssh2
  openssl
  sh
)
makedepends=(git 'nim>=2.0.0')
source=("$pkgname::git+https://git.sr.ht/~bptato/chawan#tag=v$pkgver")
sha512sums=('1795c7a3ac86dbbadd38053e61756eaa8ad555debcc5a360e0101ef353b0d6d2402c6f7cd9ca67511c01ce0094781a7d5d6cf9e04a7928695a5d56cb53ab8f3e')
b2sums=('8851331d69780ccb13abdf575439b9a79e80ec448d88b15bc6073e2b50902d0041eb15d2a2b313a62144715bed816de9ac1cdf214100911cb61cf487fe7ba4cc')

build() {
  cd "$pkgname"

  export CFLAGS+=" -ffile-prefix-map=$srcdir/="

  make LIBEXECDIR=/usr/lib/chawan
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX='/usr' LIBEXECDIR="$pkgdir/usr/lib/chawan" install
}
