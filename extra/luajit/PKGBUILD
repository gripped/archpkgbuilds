# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
pkgver=2.1.1795119671+96f7b29
_commit=${pkgver##*+}
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('glibc' 'libgcc')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('ce9d03b33e4c28492e8dacacf69c6975a0502cf9225957a6b42dc28f92cbbd34')
b2sums=('38532c9d88e6dd56d6707e997b6b9ab8c8d058c734603a171d868904ad660e774cfdf99f1ac3e1377517e02e8d3f9de425689c8ec85292ad0ec959942d5dd764')

build() {
  cd "LuaJIT-${_commit}"*/

  # Avoid early stripping
  make amalg PREFIX=/usr BUILDMODE=dynamic TARGET_STRIP=" @:"
}

check() {
  cd "LuaJIT-${_commit}"*/

  # Make sure that pkgver matches packaged commit
  local _ct=${pkgver##*.}
  test "${_ct%%+*}" == "$(cat .relver)"
}

package() {
  cd "LuaJIT-${_commit}"*/

  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
