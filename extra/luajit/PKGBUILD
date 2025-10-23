# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
# LuaJIT has a "rolling release" where you should follow git HEAD; retrieve latest via:
#   $ curl -s https://api.github.com/repos/LuaJIT/LuaJIT/commits/v2.1 | jq -r .sha
_commit=25a61a182166fec06f1a1a025eb8fabbb6cf483e
# The patch version is the timestamp of the above git commit; obtain via:
#   $ curl -s https://api.github.com/repos/LuaJIT/LuaJIT/commits/v2.1 | jq -r '.commit.committer.date | fromdate'
_ct=1760617492
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('3fca2bb5068d7150d324a34eaac555757b8ce94f15565e0a0552373f7534081e')
b2sums=('ce513b0aa0dee0e7e4c968129ba42572a44d47b277f77714df6574db975b5c30066ea1e37eff6920c89dc530154c1258495df000138a02d3b0ae7aeece01cb5c')

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
