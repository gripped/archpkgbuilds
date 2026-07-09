# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-bg
pkgver=1.2.0
pkgrel=1
epoch=1
pkgdesc='COSMIC session service which applies backgrounds to displays'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-bg
license=(MPL-2.0)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
  glibc
  libxkbcommon
)
makedepends=(
  clang
  cargo
  git
  just
  lld
  nasm
)
source=(
  git+https://github.com/pop-os/cosmic-bg.git#tag=epoch-${pkgver}
)
b2sums=('3d330c6729f45ffc8fa5a2a026977e7b3e3eae36c7e294e7c792812f11f667700bd20218cb6c80bedcd01ac4db9aa7aabeab9dca7074c4c5c8c19df6d9d6b7e4')

prepare() {
  cd cosmic-bg
  cargo fetch --locked
}

build() {
  cd cosmic-bg
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-bg
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
