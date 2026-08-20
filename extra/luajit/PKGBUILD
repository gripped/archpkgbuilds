# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
pkgver=2.1.1787165859+1ee778a
_commit=${pkgver##*+}
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('glibc' 'libgcc')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('512cdb23dafa39c6247763ae15f29341734b1596067b067db0c0387bbebc7c55')
b2sums=('3e2cb9fad02fc9c734833c9df134fa3b0fb09b5341a64f48c2fe072e4b0fd6a7e00ec4dec464fb05a9b915d74acad4084a55d564ffd7a0f889f1ae2184cebf93')

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
