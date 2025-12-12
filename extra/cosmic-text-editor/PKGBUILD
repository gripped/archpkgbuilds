# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-text-editor
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='Text editor for the COSMIC desktop'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-edit
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  gcc-libs
  glibc
  libxkbcommon
  wayland
)
makedepends=(
  cargo
  git
  git-lfs
  just
  mold
)
source=(
  git+https://github.com/pop-os/cosmic-edit.git#tag=epoch-${pkgver}
  cosmic-text-editor-lto.patch
)
b2sums=('f7233368401f8a4da2257d0a3a5a87b1442284a208fda14d9f2b2f498818aa09e86231e812cffaef02b199a4a23cb96496cb907e964a787101531a4f2c505316'
        'd0ac6a0caa849a4445812f574787c5f99e42e73dbc53dcbf0c0a212cc97382dcd3cdbce58f6203fb2d920fc45d4a0a4b5d086308bcb5e2a92b86f1bebf1dd6da')

prepare() {
  cd cosmic-edit
  patch -Np1 -i ../cosmic-text-editor-lto.patch
  cargo fetch --locked

  git lfs install --local
  git remote add network-origin https://github.com/pop-os/cosmic-edit
  git lfs fetch network-origin
  git lfs checkout
}

build() {
  cd cosmic-edit
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  just build-release --frozen
}

package() {
  cd cosmic-edit
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
