# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Kyuzial <kyuzial@protonmail.com>

pkgname=cosmic-terminal
pkgver=1.0.16
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
b2sums=('f2f5874f14d704e2f24a327c695e6337d07a95d76a0a704c9ac88324608411c76f5065f2ebe3fc69660f07c44281e9ee01fe2e5c31e3e89f9efdd7d55688180d'
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
