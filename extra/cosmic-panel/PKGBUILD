# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-panel
pkgver=1.7.0
pkgrel=1
epoch=1
pkgdesc='XDG Shell Wrapper Panel for Cosmic'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-panel
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
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
  git+https://github.com/pop-os/cosmic-panel.git#tag=epoch-${pkgver}
)
b2sums=('65594573aaf1ca44c1150b992e0d2683a9216c1bfec30f37f200188e9f50e3e79cab11a137c7af1d53503fcdae5c954730d7acf4a5faf039605740f075529805')

prepare() {
  cd cosmic-panel
  cargo fetch --locked
}

build() {
  cd cosmic-panel
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-panel
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
