# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-osd
pkgver=1.0.0.beta.7
pkgrel=1
pkgdesc='COSMIC On-Screen Display'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-osd
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  gcc-libs
  glibc
  libinput
  libpipewire
  libpulse
  libxkbcommon
  sound-theme-freedesktop
  systemd-libs
  wayland
)
makedepends=(
  cargo
  clang
  git
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-osd.git#tag=epoch-${pkgver/.beta./-beta.}
)
b2sums=('519be0b51f93d4ea5b0d7a2de7cedcf0ec9dc8f2f5c1b6510336545a53d4131c06cbb542399dfc8d2b47e5a3b06ff514740a7aa33ce3def7a873ec267c8ceb2a')

prepare() {
  cd cosmic-osd
  cargo fetch --locked
  sed 's|libexec|lib/polkit-1|g' -i Makefile src/subscriptions/polkit_agent_helper.rs
}

build() {
  cd cosmic-osd
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  make ARGS+=" --frozen --release"
}

package() {
  cd cosmic-osd
  make prefix='/usr' DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
