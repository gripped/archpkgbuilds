# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-text-editor
pkgver=1.0.0.beta.4
pkgrel=1
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
_tag=73446cdafc99d45a5b7c1eb8ba179e4201c22900
source=(
  git+https://github.com/pop-os/cosmic-edit.git#tag=${_tag}
  cosmic-text-editor-lto.patch
)
b2sums=('163e070e16670cf67c2c8333d532160db789bf88de8f16097fd9b5925e36cb1cbbc92c76c7395d4235ba6750c6b9037e4693ebb19f410c4a2f0b2fbb84b89fb0'
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

pkgver() {
  cd cosmic-edit
  git describe --tags | sed 's/^epoch-//; s/-/./g'
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
