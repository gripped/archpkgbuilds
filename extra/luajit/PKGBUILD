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
_commit=68354f444728ef99bb51bb4d86e8f1b40853a898
# The patch version is the timestamp of the above git commit; obtain via:
#   $ curl -s https://api.github.com/repos/LuaJIT/LuaJIT/commits/v2.1 | jq -r '.commit.committer.date | fromdate'
_ct=1762386122
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('94486eaed3ba6467a7ffce9e88a01d1c84b167f0d72750d0bf89856a8e766d33')
b2sums=('c047b8bf326c3f35229a1b0af2c133a87f4c6fe2742ebbcc95f22b9fd281c69d0c8d412ea8dffafee33122bc5d02c837b9804ff3edf5ec655ea6cee07afbb9c1')

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
