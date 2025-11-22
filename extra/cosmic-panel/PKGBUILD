# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-panel
pkgver=1.0.0.beta.7
pkgrel=1
pkgdesc='XDG Shell Wrapper Panel for Cosmic'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-panel
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
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-panel.git#tag=epoch-${pkgver/.beta./-beta.}
)
b2sums=('e538ae481f19761927db0c3ad77ff256d2811c8c23dedcf566580c2595145436293e637dce9981aae69c39adad7ad0bda246608e555e9f958464f7eefc8b21bf')

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
