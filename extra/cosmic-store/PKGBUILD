# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-store
pkgver=1.0.11
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
b2sums=('ede6a66f7b3d62a87b9b59ee53faccb8042d74cf9c06834848e3287884de89be0a09744b6ab3fec6c3f30ce13a9417b205f3a8259de21db99d9897bf2ebed7ce'
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
