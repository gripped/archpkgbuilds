# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=xdg-desktop-portal-cosmic
pkgver=1.6.0
pkgrel=1
epoch=1
pkgdesc='A backend implementation for xdg-desktop-portal for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/xdg-desktop-portal-cosmic
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
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
  just
  mold
)
provides=(xdg-desktop-portal-impl)
source=(
  git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git#tag=epoch-${pkgver}
)
b2sums=('957c81d444ae18a7c2af791a3fa191abbaa9e5d3600a87b65b5b0305acd7a70612aaf8b2a3e7b97b5a13cf8f5ec7fae0fddcaae8634a9e7ae94e1228042dbcfa')

prepare() {
  cd xdg-desktop-portal-cosmic
  cargo fetch --locked
}

build() {
  cd xdg-desktop-portal-cosmic
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  CARGO_NET_OFFLINE=true just build
}

package() {
  cd xdg-desktop-portal-cosmic
  just rootdir="${pkgdir}" prefix='/usr' libexecdir='/usr/lib' install
}

# vim: ts=2 sw=2 et:
