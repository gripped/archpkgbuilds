# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-comp
pkgver=1.0.0.beta.7
pkgrel=1
pkgdesc='Compositor for the COSMIC desktop environment'
arch=(x86_64)
url='https://github.com/pop-os/cosmic-comp'
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  fontconfig
  gcc-libs
  glibc
  libdisplay-info
  libseat.so
  libinput
  libxcb
  libxkbcommon
  mesa
  pixman
  systemd-libs
  wayland
)
makedepends=(
  cargo
  git
  lld
)
source=(git+https://github.com/pop-os/cosmic-comp.git#tag=epoch-${pkgver/.beta./-beta.})
b2sums=('90e40355458fd83dd79bdfde715ac1b53e29f29a53329156cd475a44bc6324ed23852e638df51ee2e918de08e3040d900bf4e8a92f50ecd629ba63125ba49cc3')

prepare() {
  cd cosmic-comp

  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-comp
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  make ARGS+=" --frozen --release"
}

package() {
  cd cosmic-comp
  make prefix='/usr' libexecdir='/usr/lib' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
