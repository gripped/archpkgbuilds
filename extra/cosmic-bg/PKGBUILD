# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-bg
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='COSMIC session service which applies backgrounds to displays'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-bg
license=(MPL-2.0)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
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
  cosmic-bg-lto.patch
)
b2sums=('1055aae76c14e0c32cf074e277d5bf9782cdfef11bec8010b9a138564dbaa1ef8b32f90247124a2741552a054cecf9f72a16392b182a21eaa93c4ca85f691b2d'
        '425c8b386f69d6b4b7883235f822089bb8b596043b1ef5616ff13768ab7afa5a0db55b0cff9c64f264abc60dd6c11f137069c0c8273135b8203054db3ff87c83')

prepare() {
  cd cosmic-bg
  patch -Np1 -i ../cosmic-bg-lto.patch
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
