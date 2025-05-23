# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Benjamin Andresen <benny AT klapmuetz DOT org>
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=rlwrap
pkgver=0.46.2
pkgrel=1
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
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('e36d7850ad85126ae18d3c571e848a627618d8ba51e7a88bec7d8de23022fd090b38e56a3e1a9f744f05be832f3c9eac5ecc306fbd068be1691b48303b8b4450')
b2sums=('cf31e37b1fc5b65ca35b6e714cf02b4f50ee751b49989dcf0a9b3183ee71a97c6d8c2d8ccb863817a41367b9befae0cce340dae16da6740ba1dd5db2d0bd7aca')

prepare() {
  cd "$pkgname"

  # FTBFS for gcc15
  # https://github.com/hanslub42/rlwrap/issues/195
  git cherry-pick --no-commit e26de78cb6312ddeb2de42b2cc25835ca7ea830d

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
