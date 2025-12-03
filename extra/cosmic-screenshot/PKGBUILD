# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-screenshot
pkgver=1.0.0.beta.9
pkgrel=1
pkgdesc='Utility for capturing screenshots via XDG Desktop Portal'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-screenshot
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
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
  git+https://github.com/pop-os/cosmic-screenshot.git#tag=epoch-${pkgver/.beta./-beta.}
)
b2sums=('7db7e7d0164a3d973728403e5f07157fcae614b48968856ab52c56d00dde14a51cefaf906a7e3c676b55efef563bb7ac3d01002834c6ee79a9c929a625736d20')

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
