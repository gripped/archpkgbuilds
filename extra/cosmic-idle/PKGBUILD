# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-idle
pkgver=1.11.0
pkgrel=1
epoch=1
pkgdesc='Cosmic idle daemon'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-idle
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  libgcc
  glibc
  libxkbcommon
  wayland
)
makedepends=(
  cargo
  clang
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-idle.git#tag=epoch-${pkgver}
)
b2sums=('cd312ae7c10995b1ba79ef13f7bc48c0e8913a9e73a2887d3715a69a8b0c4a7206357beebec1edf600da71e094716056a8a5379e0e4a4222e38c1db0a75acd8c')

prepare() {
  cd $pkgname
  cargo fetch --locked
}

build() {
  cd $pkgname
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  CC=clang just build-release --frozen
}

package() {
  cd $pkgname
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
