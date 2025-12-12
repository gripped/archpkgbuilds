# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-idle
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='Cosmic idle daemon'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-idle
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  gcc-libs
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
b2sums=('ed9d1ed95c4a6437b15cbbf72813c560949e6d658cc6f9b50a6937d2979a2935e7874a17beeddbf574ebe2147b4c461d64c4703231abe8b47ee9a299790d984b')

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
