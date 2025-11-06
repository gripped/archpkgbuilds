# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-launcher
pkgver=1.0.0.beta.5
pkgrel=1
pkgdesc='Layer Shell frontend for Pop Launcher'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-launcher
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
  glibc
  libxkbcommon
  pop-launcher
  wayland
)
makedepends=(
  cargo
  clang
  git
  intltool
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-launcher.git#tag=epoch-${pkgver/.beta./-beta.}
  cosmic-launcher-lto.patch
)
b2sums=('27f9077cbadca0301a6a1a56a3b93b7de329b82f7f59b207a154cf03a3a2633301dcb4775a6e074a874cedbbd5773937a0eefcdcd16b896289e940d14b1c4d72'
        'eb4bf64cbec00b5e6c2d3a332b38ec37dca374c0da16882c421fdea296a0c2a5c741ccd357b4d8cc1af6e82e1c06e5363121b6c03344e6af47025535a127fb8b')

prepare() {
  cd cosmic-launcher
  patch -Np1 -i ../cosmic-launcher-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-launcher
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-launcher
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
