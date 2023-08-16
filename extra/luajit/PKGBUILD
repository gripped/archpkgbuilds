# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=luajit
# LuaJIT has abandoned versioned releases and now advises using git HEAD
# https://github.com/LuaJIT/LuaJIT/issues/665#issuecomment-784452583
_commit=72efc42ef2258086a9cb797c676e2916b0a9e7e1
pkgver="2.1.0.beta3.r505.g${_commit::8}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('x86_64')
url='https://luajit.org/'
license=('MIT')
depends=('gcc-libs')
source=("LuaJIT-${_commit}.tar.gz::https://repo.or.cz/luajit-2.0.git/snapshot/${_commit}.tar.gz")
md5sums=('aafb18bc642caa2eca493f0d68988658')
sha256sums=('1dfd39f44645347680a17efc090f4437f795e88f2d297035937bd6c2d02aa7eb')
b2sums=('cc647e3b5ffbde7fb9f3a9840a399103ea23434673a82b8d429179f162cac7762a338d39d73216d67fa58e3d610d4dac637e3540bad1fefb8c0167c61b60f961')

build() {
  cd "luajit-2.0-${_commit::7}"
  # Avoid early stripping
  make amalg PREFIX=/usr BUILDMODE=dynamic TARGET_STRIP=" @:"
}

package() {
  cd "luajit-2.0-${_commit::7}"

  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"

  ln -sf luajit-2.1.0-beta3 "$pkgdir/usr/bin/luajit"
}
