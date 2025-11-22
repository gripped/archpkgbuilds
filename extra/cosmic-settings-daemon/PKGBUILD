# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-settings-daemon
pkgver=1.0.0.beta.7
pkgrel=1
pkgdesc='Cosmic settings daemon'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-settings-daemon
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  acpid
  adw-gtk-theme
  alsa-utils
  gcc-libs
  geoclue
  glibc
  libinput
  libpulse
  playerctl
  pop-sound-theme
  systemd-libs
  wireplumber
  xdg-utils
)
makedepends=(
  cargo
  git
  libxkbcommon
  lld
)
optdepends=(
  'pulseaudio-alsa: Media keys support'
)
source=(
  git+https://github.com/pop-os/cosmic-settings-daemon.git#tag=epoch-${pkgver/.beta./-beta.}
  cosmic-settings-daemon-lto.patch
)
b2sums=('f2577a138a9667294eae3c35cecf660faf6f597a2e05e40ddf898a88712b569af74576e3a8f55028c75a2f2fec9a77c2cc1359c8a80fbd3be13fca0b0a2ef713'
        'd08aacbcc5b98304f9a99bc2d6a0072473f4ccd9175dcd558334179561bb2e68c0c339471f6e85b849087108998fb1b17707be9d3c87bd018c75b45b7774e91e')

prepare() {
  cd cosmic-settings-daemon
  patch -Np1 -i ../cosmic-settings-daemon-lto.patch
  cargo fetch --locked
  sed 's/libexec/lib/g' -i Makefile src/main.rs
  sed 's/sudo/wheel/g' -i data/polkit-1/rules.d/cosmic-settings-daemon.rules
}

build() {
  cd cosmic-settings-daemon
  export GEOCLUE_AGENT="/usr/lib/geoclue-2.0/demos/agent"

  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  make ARGS+=" --frozen --release" geoclue_agent='/usr/lib/geoclue-2.0/demos/agent'
}

package() {
  cd cosmic-settings-daemon
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
