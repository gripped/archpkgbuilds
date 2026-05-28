# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-panel
pkgver=1.0.14
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
b2sums=('aa63acbdab3a6fd4fc580239e67eeb6db833c1d2dbe89d006fab20407945b4fd52b3559e38812326867b5da757361591c1f7e379520b07f8a8e64bf53182e3bf')

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
