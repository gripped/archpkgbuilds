# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-settings
pkgver=1.0.0.beta.5
pkgrel=1
pkgdesc='The settings application for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-settings
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  accountsservice
  adw-gtk-theme
  cosmic-icon-theme
  cosmic-randr
  fontconfig
  gcc-libs
  glibc
  iso-codes
  libinput
  libpipewire
  libpulse
  libxkbcommon
  networkmanager
  nm-connection-editor
  pipewire-pulse
  systemd-libs
  ttf-opensans
  wayland
)
makedepends=(
  cargo
  clang
  git
  just
  lld
)
optdepends=('power-profiles-daemon: power profiles support')
source=(git+https://github.com/pop-os/cosmic-settings.git#tag=epoch-${pkgver/.beta./-beta.})
b2sums=('1e4c525590234a34871fd7038029917a619993694b79496b6e195186d2679be2eb561e936570ec22cb2fc734d870d756f66a4c24959e932b0185eafb61adfa07')

prepare() {
  cd cosmic-settings
  cargo fetch --locked
}

build() {
  cd cosmic-settings
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-settings
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
