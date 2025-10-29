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
_commit=8518c0b40b1734901de888a0a363450c0709d3f8
# The patch version is the timestamp of the above git commit; obtain via:
#   $ curl -s https://api.github.com/repos/LuaJIT/LuaJIT/commits/v2.1 | jq -r '.commit.committer.date | fromdate'
_ct=1761727121
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('2dd2e805aa6172e9470e0739f88bc844933331e9be65eb7b1e52d5548fc41425')
b2sums=('384dc4fdd4be49e55e6abbc8aaa7ccb7eb6ac258fabde1838fafca014c73199902c8c28dda82466eaf2ea9ae28c025232952d7a0c8550979e34a52d4221cca37')

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
