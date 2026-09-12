# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Kyuzial <kyuzial@protonmail.com>

pkgname=cosmic-terminal
pkgver=1.8.0
pkgrel=1
epoch=1
pkgdesc='Cosmic Terminal Emulator'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-term
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  libgcc
  glibc
  libxkbcommon
  wayland
  cosmic-icon-theme
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-term.git#tag=epoch-${pkgver}
  cosmic-terminal-lto.patch
)
b2sums=('c7bac3fda44bcc173a86d74bf543fa0243410dec5dab5df3d9a35916cafec3182c4e103e91abf3174a2131f60f36f9c644f28a0c5d8e45b55b1de0e854dd2bd0'
        '4e28ab726f474f064a99dbb4dc75faa7ddfe00d7f5e238f57ba80ac75e44a2f6ed00ae2f3499fac94d40ec4dd773fc9eeb93c4543f8e63699ba437ba45f8783b')

prepare() {
  cd cosmic-term
  patch -Np1 -i ../cosmic-terminal-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-term
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-term
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
