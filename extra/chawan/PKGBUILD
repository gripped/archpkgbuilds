# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.4.4
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
sha512sums=('1be025ec068bae88d6de7fa8f48da8123b52ced8e58e22acdfdfa07310728ff577e4a451b5ee6d9ca4370af29882490c323efb4b8b11e45cc3026e9ba44d5dca')
b2sums=('928c8c729e9fbe4c218139a245b4b7bfe35226f43d6e523adeac53a89c03aa99b6a56af35bff7a539271ad46311ffa8941ca96b154c318e18de943ba5e49911c')

build() {
  cd "$pkgname"

  export CFLAGS+=" -ffile-prefix-map=$srcdir/="

  make LIBEXECDIR=/usr/lib/chawan
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX='/usr' LIBEXECDIR="$pkgdir/usr/lib/chawan" install
}
