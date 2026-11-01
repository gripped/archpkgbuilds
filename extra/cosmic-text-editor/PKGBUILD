# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>
# Contributor: soloturn <soloturn@gmail.com>

pkgname=cosmic-text-editor
pkgver=1.11.0
pkgrel=1
epoch=1
pkgdesc='Text editor for the COSMIC desktop'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-edit
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-icon-theme
  glib2
  libgcc
  glibc
  libxkbcommon
  wayland
  oniguruma
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
b2sums=('a23216a3381d8686d1cc4a1c6d077dcde4cc7cbd079a62ec87bd24dc9299706f83e10c07bb49c0cb890695a4165428efcfed7160ddf70ff00a8feeeaa4e8f51b'
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
  export RUSTONIG_DYNAMIC_LIBONIG=1
  just build-release --frozen
}

package() {
  cd cosmic-edit
  just rootdir="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
