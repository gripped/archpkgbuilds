# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-notifications
pkgver=1.11.0
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
b2sums=('ed3c2db18ae989024e515b985d6d06f6e46d5669e6b2d55803cddfbbe027ed552ab9655a2376e71480deb4a57f431746cd0b18005eddec9a60532f0c13d78e18')

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
