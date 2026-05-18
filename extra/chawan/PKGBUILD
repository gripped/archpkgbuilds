# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.4.0
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
sha512sums=('4cdf182ff9e77f20c11847276175af07440d49e14fbbf89a854422dccd8faa87f244e1b48cb070e4801f25f0230bc8c9b8b23e05b2a6e33bf157104a40b5da42')
b2sums=('66277593c118b89d9d8e18a05fa66a7fd729c25986be3655af2ae69ea288d8a6e0a6b1ca720a169aaa23bb2719775a1fbe81858f4e9798a3f972d27e9624aa08')

build() {
  cd "$pkgname"

  export CFLAGS+=" -ffile-prefix-map=$srcdir/="

  make LIBEXECDIR=/usr/lib/chawan
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX='/usr' LIBEXECDIR="$pkgdir/usr/lib/chawan" install
}
