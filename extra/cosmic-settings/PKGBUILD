# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-settings
pkgver=1.0.0.beta.4
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
_tag=ffdd122bf820fc717abe825dd3fcfba0edd46a42
source=(git+https://github.com/pop-os/cosmic-settings.git#tag=${_tag})
b2sums=('74d86241394168444e3850aa7460f27ed97fbd9c9855c85a6a7318cfb624ff865e83fd3b5ee72f2d53917fe5a0fe821ded1301a7d1078999c5f23b42eefbd218')

prepare() {
  cd cosmic-settings
  cargo fetch --locked
}

pkgver() {
  cd cosmic-settings
  git describe --tags | sed 's/^epoch-//; s/-/./g'
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
