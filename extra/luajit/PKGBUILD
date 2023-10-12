# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=656ecbcf8f669feb94e0d0ec4b4f59190bcd2e48
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1696795921
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://repo.or.cz/luajit-2.0.git/snapshot/${_commit}.tar.gz")
md5sums=('08c98a8980af6621c65e1fbb0282332e')
sha256sums=('6f94e1e29c764ce8bc84c972bb424073b3ea5014c0fa99b7ca20902edfcbba20')
b2sums=('4d172a4be79e462c230ce7c9a0681f282983dc8db76dabcc1d24de637ae3adb3de4cda73d44dd6ab8ef540cc9c8c6719fedc94112e6f2ea8a3faedca0f1ac9ee')

build() {
  cd "luajit-2.0-${_commit::7}"

  # Avoid early stripping
  make amalg PREFIX=/usr BUILDMODE=dynamic TARGET_STRIP=" @:"
}

check() {
  cd "luajit-2.0-${_commit::7}"

  # Make sure that _ct was updated
  test "${_ct}" == "$(cat .relver)"
}

package() {
  cd "luajit-2.0-${_commit::7}"

  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
