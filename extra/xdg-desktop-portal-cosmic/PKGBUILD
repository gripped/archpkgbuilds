# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=xdg-desktop-portal-cosmic
pkgver=1.0.0.beta.6
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/xdg-desktop-portal-cosmic
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
  glibc
  libpipewire
  libxkbcommon
  mesa
  wayland
  xdg-desktop-portal
)
makedepends=(
  cargo
  clang
  git
  mold
)
provides=(xdg-desktop-portal-impl)
source=(
  git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git#tag=epoch-${pkgver/.beta./-beta.}
)
b2sums=('5b104336bfc26621f6444a7d9e502ddbaddccdc0624ce430e2e522bfd158f27b7a007d26fffefb65c62d007cf06349954c6b39df4f14a7574be25ec1bbaddc75')

prepare() {
  cd xdg-desktop-portal-cosmic
  cargo fetch --locked
}

build() {
  cd xdg-desktop-portal-cosmic
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  make ARGS+=" --frozen --release"
}

package() {
  cd xdg-desktop-portal-cosmic
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
