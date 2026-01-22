# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.3.3
pkgrel=1
pkgdesc='A text-mode web browser and pager for Unix-like systems'
arch=(x86_64)
url='https://chawan.net/'
license=(Unlicense)
depends=(
  glibc
  gcc-libs
  brotli
  libssh2
  openssl
  sh
)
makedepends=(git 'nim>=2.0.0')
source=("$pkgname::git+https://git.sr.ht/~bptato/chawan#tag=v$pkgver")
sha512sums=('b66d36a61a471942cc023f61d15e8763380b3579b9e6a7fa6d3d1175075c25c33ffc1d828705182a6bc7c6fcb64f6dd90810bf5fe18b7d1881908ba80eddf165')
b2sums=('f2dead54bd2e6c7b8035578632c8c34e8897426793ece848f70f02594f36524d04c80cb48dd37d4a06ac498c968339cbc7675175507a901954106b89bc70d3e8')

build() {
  cd "$pkgname"

  export CFLAGS+=" -ffile-prefix-map=$srcdir/="

  make LIBEXECDIR=/usr/lib/chawan
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX='/usr' LIBEXECDIR="$pkgdir/usr/lib/chawan" install
}
