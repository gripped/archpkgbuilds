# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-notifications
pkgver=1.7.0
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
b2sums=('d73f476adc8babd726c45d864435a89c35a219a60d8ddc0876edafee023051d0f49232bc70b113fc6aeb63913f97bc8a9ea083e8828cae1d9866dc347331fc33')

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
