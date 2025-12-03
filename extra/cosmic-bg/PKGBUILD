# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-bg
pkgver=1.0.0.beta.9
pkgrel=1
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
  git+https://github.com/pop-os/cosmic-bg.git#tag=epoch-${pkgver/.beta./-beta.}
  cosmic-bg-lto.patch
)
b2sums=('49247dee32b9f60be065f03751111d4ee30194f64508fd12672648aee5213a596c48d68ba53657f1ed01b2f75cbcb5310fc462f0c6d1514099b5c532bb728a8f'
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
