# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-notifications
pkgver=1.0.0.beta.9
pkgrel=1
pkgdesc='Layer Shell notifications daemon which integrates with COSMIC'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-notifications
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
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
  git+https://github.com/pop-os/cosmic-notifications.git#tag=epoch-${pkgver/.beta./-beta.}
)
b2sums=('589b75132c55eaf50d263be0669e064c534e08282700260413f2584b60f508be056400fa7cc72f8149c244f383c48b6f0a9d409a3cebc8eba1464887bba3e138')

prepare() {
  cd cosmic-notifications
  cargo fetch --locked
}

build() {
  cd cosmic-notifications
  just build-release --frozen
}

package() {
  cd cosmic-notifications
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
