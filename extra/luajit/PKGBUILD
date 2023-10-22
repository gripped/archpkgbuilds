# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=e826d0c101d750fac8334d71e221c50d8dbe236c
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1697887905
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://repo.or.cz/luajit-2.0.git/snapshot/${_commit}.tar.gz")
md5sums=('c4530f5b223752e8da4f25f8503a195f')
sha256sums=('76e9aa90717cf6ba5c8991fa31b03a7c30a2b29ad48f04907199ea53b7078fbe')
b2sums=('9096c3b787728697d5b07a1e7c1f1b120952b48129bfd46e8e8f4db15f3c31c3d9d002f17db4a00fa5ffceb5024309cfdd335ccae17fa8d30b3ea46e16672f4c')

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
