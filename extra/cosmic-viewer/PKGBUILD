# Maintainer: Peter Jung <ptr1337@archlinux.org>

pkgname=cosmic-viewer
pkgver=1.11.0
pkgrel=1
pkgdesc='Image viewer for the COSMIC desktop environment'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-viewer
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  dav1d
  libgcc
  glibc
  hicolor-icon-theme
  libde265
  libjpeg-turbo
  libstdc++
  libxkbcommon
)
makedepends=(
  cargo
  clang
  cmake
  git
  just
  lld
)
source=(git+https://github.com/pop-os/cosmic-viewer.git#tag=epoch-${pkgver})
b2sums=('5c9a910f286bd6c34561cdb50db88ea128542cd150485dae9a04468577c49c6338b79559aea65c97725526b5e6266120b908e8f02499028b64fcb5e1990daf09')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"

  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  # embedded libheif is a static C++ lib; lld can't read GCC LTO bitcode
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  # link against system libjpeg-turbo instead of building the bundled copy
  export TURBOJPEG_SOURCE=pkg-config
  export TURBOJPEG_DYNAMIC=1

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install
}

# vim: ts=2 sw=2 et:
