# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-store
pkgver=1.0.15
pkgrel=1
epoch=1
pkgdesc='Cosmic App Store'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-store
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  archlinux-appstream-data
  cosmic-icon-theme
  flatpak
  libgcc
  glib2
  glibc
  libxkbcommon
  openssl
  wayland
)
makedepends=(
  cargo
  git
  just
  mold
)
source=(
  git+https://github.com/pop-os/cosmic-store.git#tag=epoch-${pkgver}
  cosmic-store-lto.patch
)
b2sums=('a71050ddd663d55de4a13bcf747059c9685da439496cbf99cdc019c03bb7fb9afae77549af8382e3e239a4de46886fb595d38468ef88d88a954f50a015fa3c3f'
        'ed4089dd1ded4a87307c50f38af03ff3742bfc54053a668416f713c9b27eb591e608166ce14f2f50f8303aaf06533963fd821d00522b77e7f965827035a7ff11')

prepare() {
  cd cosmic-store
  patch -Np1 -i ../cosmic-store-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-store
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd cosmic-store
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
