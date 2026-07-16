# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-notifications
pkgver=1.3.0
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
b2sums=('00d767c3139c48d94adff9fa4ee8173fc702076c71f57dc7307f6bd3e73c77f42ac2b7ccd9c1c4ded987c5a9dc5bcb35deca54a7bf932cdc0d98f8ddf62e2025')

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
