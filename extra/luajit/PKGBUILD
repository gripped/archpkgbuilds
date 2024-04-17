# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=d06beb0480c5d1eb53b3343e78063950275aa281
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1710088188
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
md5sums=('9869aaa8061f43d8f9dedb67d4379e66')
sha256sums=('6abd146a1dfa240a965748f63221633446affa2a715e3eb03879136e3efb95f4')
b2sums=('28da36e4a845b12e4f3bd05d0e4b1cdc6fe33a2b6ffd161bb313201b969ac47d0cec95a4a8211eb6fd84a650edb7d2005b410cb1f8fdabefbf421e4b856e8040')

build() {
  cd "LuaJIT-${_commit}"

  # Avoid early stripping
  make amalg PREFIX=/usr BUILDMODE=dynamic TARGET_STRIP=" @:"
}

check() {
  cd "LuaJIT-${_commit}"

  # Make sure that _ct was updated
  test "${_ct}" == "$(cat .relver)"
}

package() {
  cd "LuaJIT-${_commit}"

  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
