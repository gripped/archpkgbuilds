# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=xdg-desktop-portal-cosmic
pkgver=1.0.13
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
  mold
)
provides=(xdg-desktop-portal-impl)
source=(
  git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git#tag=epoch-${pkgver}
)
b2sums=('9463627ca9f8d9558e020af34503e47e8afe9ca7a575b0812e898578e477540d96e58b352878094b5d4c10bbfd875552027a26f4960c28d0cb982ae358739503')

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
