# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Benjamin Andresen <benny AT klapmuetz DOT org>
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=rlwrap
pkgver=0.46.1
pkgrel=3
pkgdesc='Adds readline-style editing and history to programs'
arch=('x86_64')
url='https://github.com/hanslub42/rlwrap'
license=('GPL-2.0-only')
depends=(
  'glibc'
  'readline'
  'ncurses'
  'perl'
  'python'
  'python-pexpect'
)
makedepends=('git')
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('1ef45e99c7847741fdc5feede731888c2b141e53f8f84ca2f05caea89a3cf2bb34831b1e16eb6801181ee21d2e9e0ba2cf709c318ade9f3da893fd4783fa8dcb')
b2sums=('faad5651e8a1c52f401cd6d7868bb1962f850a7c4dbe6423a2e9b03a0c2262e8d16f71b38a38cc33490d60ba76b3ea210a64b140ef85466670cf9d2603aa8d7b')

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
