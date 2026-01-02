# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=xdg-desktop-portal-cosmic
pkgver=1.0.1
pkgrel=1
epoch=1
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
  git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git#tag=epoch-${pkgver}
)
b2sums=('566802c5d85a6fe40dcd46bdb2855411c559ef2a8b35f16d5413f82a0d934a9be5d7445918861a5969d926400c2b3ed3774c22d91401951d3c339be3a58c6c79')

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
