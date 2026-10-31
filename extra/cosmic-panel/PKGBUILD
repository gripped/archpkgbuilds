# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-panel
pkgver=1.11.0
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
b2sums=('f7be75812eb9ba645515fbbac2939c9ab9c3a24bf6a894b68b3189e4e4800a80100e424972175377f5b9412a2ea122bdff4595ed826636d350f755d05dbe1674')

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
