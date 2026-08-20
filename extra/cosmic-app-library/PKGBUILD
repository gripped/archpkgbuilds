# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-app-library
pkgver=1.6.0
pkgrel=1
epoch=1
pkgdesc='Cosmic App Library'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-applibrary
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  libxkbcommon
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(git+https://github.com/pop-os/cosmic-applibrary.git#tag=epoch-${pkgver})
b2sums=('5bd4b7f010a6bab321f2c18c055cae479741fcc6969986dee7b2f87fa9569f8a8585214a09992028aa128cd53fca251e9ade7f98fda03f86520dd41b6a82ecc1')

prepare() {
  cd cosmic-applibrary
  cargo fetch --locked
}

build() {
  cd cosmic-applibrary
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-applibrary
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
