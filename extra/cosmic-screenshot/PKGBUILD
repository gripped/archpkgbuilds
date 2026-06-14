# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-screenshot
pkgver=1.0.16
pkgrel=1
epoch=1
pkgdesc='Utility for capturing screenshots via XDG Desktop Portal'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-screenshot
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  xdg-desktop-portal-cosmic
)
makedepends=(
  cargo
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-screenshot.git#tag=epoch-${pkgver}
)
b2sums=('f5fb8bd088d7dbca36b6422fc71055dabb3c9f1a1d2a68e6d90bc8ac240095fcafb05f5e8475baf2389cd580d5441983888d2a3c36b169d113ded96f08b61a2d')

prepare() {
  cd cosmic-screenshot
  cargo fetch --locked
}

build() {
  cd cosmic-screenshot
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-screenshot
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
