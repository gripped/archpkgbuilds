# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
pkgver=2.1.1764593432+6f21cb8
_commit=${pkgver##*+}
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('36f17de095af6088dd9a1591f92a2e093af0fc0c93e6fbd2d87e27a3c8a4ff3f')
b2sums=('64068df0d0888c2297ed12ddf833bf5f13cee268ece706cbb9e6189c7cd432a4421ab6507b2a3f3aac797664595de99f92f22a7f0319c7ae94e838f5583336bd')

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
