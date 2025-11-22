# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-applets
pkgver=1.0.0.beta.7
pkgrel=1
pkgdesc='Applets for COSMIC Panel'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-applets
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  dbus
  gcc-libs
  glibc
  libinput
  libpipewire
  libpulse
  libxkbcommon
  systemd-libs
  util-linux
)
makedepends=(
  cargo
  clang
  git
  just
  lld
)
source=(git+https://github.com/pop-os/cosmic-applets.git#tag=epoch-${pkgver/.beta./-beta.})
b2sums=('962abf6018285dcba1d2e2b4a083317149ee224c1d1a40b9301ffb2c7dd294179b279cea236f6be1d21f3f57ce4c0428e4fb7348ec9083aacc67287e0a902e22')

prepare() {
  cd cosmic-applets
  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
  cd cosmic-applets
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-applets
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
