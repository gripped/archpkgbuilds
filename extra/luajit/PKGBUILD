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
_commit=864e78d66cb21335823c7782fa21beae8e7914b0
# The patch version is the timestamp of the above git commit; obtain via:
#   $ curl -s https://api.github.com/repos/LuaJIT/LuaJIT/commits/v2.1 | jq -r '.commit.committer.date | fromdate'
_ct=1761623958
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('dd873123d81adad407f4d8598a902958fade53c6e1b0db44f67c82cf04c1bfc3')
b2sums=('516ca07fda48be98949d8132cf7c13a53938d4ba6df238e20cf4c2ff3d7999615b0b16bc3a6f49582277a0219adcbacf5ee21525249cdee169e0b2cbc9158219')

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
