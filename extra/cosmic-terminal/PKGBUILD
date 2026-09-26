# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Kyuzial <kyuzial@protonmail.com>

pkgname=cosmic-terminal
pkgver=1.9.0
pkgrel=1
epoch=1
pkgdesc='Cosmic Terminal Emulator'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-term
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  libgcc
  glibc
  libxkbcommon
  wayland
  cosmic-icon-theme
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-term.git#tag=epoch-${pkgver}
  cosmic-terminal-lto.patch
)
b2sums=('59d3295a0e2e3054d688bb20f8f4a78c7c9276bf1d31a0fc75861daacf398c19ce938eafc1604f23e897625f3ece71154f10c645a44b8e1c723f9387c3215143'
        '4e28ab726f474f064a99dbb4dc75faa7ddfe00d7f5e238f57ba80ac75e44a2f6ed00ae2f3499fac94d40ec4dd773fc9eeb93c4543f8e63699ba437ba45f8783b')

prepare() {
  cd cosmic-term
  patch -Np1 -i ../cosmic-terminal-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-term
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-term
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
