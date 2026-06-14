# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-bg
pkgver=1.0.16
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
  cosmic-bg-lto.patch
)
b2sums=('c91eb4531d30e50301bd9e17df23a11d4af752dba525cc76bb66a85ee1ac0c66d8aa67282f458cb9f32b079f954553e817d186e78cb1eaf914558410106cb117'
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
