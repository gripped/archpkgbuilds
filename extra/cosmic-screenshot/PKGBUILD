# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-screenshot
pkgver=1.0.12
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
b2sums=('1d777f5bdb3934a2e18b05cf9bc0f55658ffa8ef41c05195f20211305ec1e6563c0010841c5074d97367ef926e52e39221d36d8da2b0a571fceeed1f55724a6d')

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
