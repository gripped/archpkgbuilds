# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Benjamin Andresen <benny AT klapmuetz DOT org>
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=rlwrap
pkgver=0.47.1
pkgrel=1
pkgdesc='Adds readline-style editing and history to programs'
arch=(x86_64)
url='https://github.com/hanslub42/rlwrap'
license=(GPL-2.0-only)
depends=(
  glibc
  readline
  ncurses
  perl
  python
  python-pexpect
  libptytty
)
makedepends=(git)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('f2d7b9b9b52b503390859508f9511d1e03b5ce313d2695bc238e23bd72570d0d0ab09701623fee8ad2effee0d40a1e16ba5d05bb0a7cf03347bb1d065f8bcf6e')
b2sums=('c08511b7e33de33ee154ec606faec56da549fd3856d9704b83fe8ce6e292177ae0b4290e428ee98775573cec85b5cab7bb0f6bfb8c70835fd7ab5d868e4ef99e')

prepare() {
  cd "$pkgname"

  autoreconf -vi
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr

  make
}

check() {
  cd "$pkgname"

  make check
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
