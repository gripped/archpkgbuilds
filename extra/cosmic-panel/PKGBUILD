# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-panel
pkgver=1.0.11
pkgrel=1
epoch=1
pkgdesc='XDG Shell Wrapper Panel for Cosmic'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-panel
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
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-panel.git#tag=epoch-${pkgver}
)
b2sums=('e70e592266182fece77c2dc8ea77fe5c103a240c82a2b218bf2a65728440b2411c1e07d8a0c4d8b5f0a01e232e4dff7e5e45fb462125f55dc93db85c92ff4892')

prepare() {
  cd cosmic-panel
  cargo fetch --locked
}

build() {
  cd cosmic-panel
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-panel
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
