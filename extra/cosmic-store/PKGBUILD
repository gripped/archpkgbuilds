# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-store
pkgver=1.0.0
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
  gcc-libs
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
  lld
  packagekit
)
optdepends=('packagekit: Native packages support')
source=(
  git+https://github.com/pop-os/cosmic-store.git#tag=epoch-${pkgver}
  cosmic-store-lto.patch
)
b2sums=('7ee49c0f0fd88de024322c97ccd8b98c9cb430ac95cbc624f312593648721df7ed0f015c737ea058bca4736edacc34745ec17164df31cf403a2f62923348e0db'
        'ed4089dd1ded4a87307c50f38af03ff3742bfc54053a668416f713c9b27eb591e608166ce14f2f50f8303aaf06533963fd821d00522b77e7f965827035a7ff11')

prepare() {
  cd cosmic-store
  patch -Np1 -i ../cosmic-store-lto.patch
  cargo fetch --locked
}

build() {
  cd cosmic-store
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-store
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
