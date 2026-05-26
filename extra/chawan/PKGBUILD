# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan
pkgver=0.4.1
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
sha512sums=('f449beb6597642f3d1eb05c8ef5b8572e531b901e511c758b694843e64deacffb8fc230b6b9ca0538778508fa6f6df7399e4c73193f9210ab2c634d6e815d089')
b2sums=('253c43fd86e5f720a502360f7b41344171614358e369e1a1ab395e66525d56be12f4817ad218161ea0f827c631c5450218119217497fd05d1c2109406b2422f7')

build() {
  cd "$pkgname"

  export CFLAGS+=" -ffile-prefix-map=$srcdir/="

  make LIBEXECDIR=/usr/lib/chawan
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX='/usr' LIBEXECDIR="$pkgdir/usr/lib/chawan" install
}
