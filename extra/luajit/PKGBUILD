# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=b94fbfbee9e7dd0979e35aacea7fcdd43905789b
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1699392533
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://repo.or.cz/luajit-2.0.git/snapshot/${_commit}.tar.gz")
md5sums=('0cb6fc6661b95df5f396af7e14d1e7f5')
sha256sums=('6e75d337e0f2709fd2ed075bc9278470fb3131f3dce91004a8101a5855144c2e')
b2sums=('cc803b117713eb56b69d54126b6f359c1053ca1d3b4adef87a3363435549391bf09495a0d361758a1427edd610e66f2d1e48da4de70c737135af6e6bd588a3a5')

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
