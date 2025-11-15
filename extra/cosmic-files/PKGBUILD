# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-files
pkgver=1.0.0.beta.6
pkgrel=1
pkgdesc='File manager for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-files
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
  glib2
  glibc
  gvfs
  libxkbcommon
  xdg-utils
)
makedepends=(
  cargo
  clang
  git
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-files.git#tag=epoch-${pkgver/.beta./-beta.}
  cosmic-files-lto.patch
)
b2sums=('c5bf77ed2c7de9ddbf72242341228613bf59a6c23207bff389f1197eb383ac565d328dfc9f244c63cb4fec79e184aff493dd5765e02cca300fcdd48dd7481cd1'
        '105231f886affb3274d18bbe95d0fc27ba33cb557245ca567caccc9b0f5fbae0b7d92a81c0b2784130659e81b73e374ac735f8ad9b06adad18b4e4fd227164b5')

prepare() {
  cd cosmic-files
  patch -Np1 -i ../cosmic-files-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-files
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  CC=clang just build-release --frozen
}

package() {
  cd cosmic-files
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
