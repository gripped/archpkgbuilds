# Maintainer: Peter Jung <ptr1337@archlinux.org>

pkgname=cosmic-viewer
pkgver=1.9.0
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
b2sums=('baf5b4f897ba54e41bb0890d2ea88bdb46a7aa5debfde8301acfcc9920c7b76d5b8569763c13a788e787dcba42f4cff8b4e3aa5dfba70c1ae3192c60f6fd4573')

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
