# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org
# Contributor: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-bg
pkgver=1.0.0.beta.6
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
b2sums=('52f232bef4b4ef94077c243043213030df7187ad395451b6cee1067af46ac3bc6f8f53c0e3faf4a4569c11603df721cd18ebd81a64aa3d8bf566b66aeacd9d76'
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
