# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-files
pkgver=1.6.0
pkgrel=1
epoch=1
pkgdesc='File manager for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-files
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  libgcc
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
  git+https://github.com/pop-os/cosmic-files.git#tag=epoch-${pkgver}
  cosmic-files-lto.patch
)
b2sums=('292140521e6b98d4f96da2701dd040c3c19d7a6990cf9c38a4867b67a29020c8b2395e3069f592a14920dcd26c4b003c53db67b88cce8c13d13ae5d655ec8236'
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
