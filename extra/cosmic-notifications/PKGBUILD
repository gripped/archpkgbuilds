# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-notifications
pkgver=1.6.0
pkgrel=1
epoch=1
pkgdesc='Layer Shell notifications daemon which integrates with COSMIC'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-notifications
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  libxkbcommon
  wayland
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-notifications.git#tag=epoch-${pkgver}
)
b2sums=('1560688629d483b5df1dc0f394d299950818e82aca1b2fbfb1fb6c5c266b6b01c7efbbfadaf4dbaa9616481da3ae2022646b69723aa0306bab8be0af74395349')

prepare() {
  cd cosmic-notifications
  cargo fetch --locked
}

build() {
  cd cosmic-notifications
  # Fix LLVM crash
  export RUST_MIN_STACK=33554432
  just build-release --frozen
}

package() {
  cd cosmic-notifications
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
