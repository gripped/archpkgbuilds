# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=xdg-desktop-portal-cosmic
pkgver=1.0.16
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
b2sums=('773f7eb47870fedb382c412493c6c54ef5f4b949bab2c5e02568a6a0c3c0a636ce5217f9ec1da538339ef6c79f37d629193050705308a5d956396d5ee9186919')

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
