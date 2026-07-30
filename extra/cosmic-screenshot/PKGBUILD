# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-screenshot
pkgver=1.5.0
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
b2sums=('c100c2c795cb5c90ee6417cb52c3fa4feac321bac0295989372c5c69d58def089bc721057bef5d0cdfe02768241fbc53487e3d6f6df10cb23f1e563a59d0a2fa')

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
