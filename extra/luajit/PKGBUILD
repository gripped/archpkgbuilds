# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
pkgver=2.1.1774896198+18b087c
_commit=${pkgver##*+}
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('glibc' 'libgcc')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('88a592afa9907d6b0c6e1e7ac9b39982622e3ca086f0646d4ea89b0e4e81f093')
b2sums=('1bec68c70ed47e21cc94cbd9c5ccfd67e1bf7b10ab9647e13fc2559ab66594e099a4b1afb0e9c0b9e70e98f2c0bdac4dcaeddb2e550fc480b3e6fec1a9806539')

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
