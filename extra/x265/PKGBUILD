# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>

pkgname=x265
pkgver=4.1
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder'
arch=(x86_64)
url=https://bitbucket.org/multicoreware/x265_git
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cmake
  git
  nasm
  ninja
)
provides=(libx265.so)
_tag=f21b135c3414ade4e22305d008bf07d23d0595fb
source=(
  "git+https://bitbucket.org/multicoreware/x265_git#tag=${_tag}"
  0001-Fix-build-with-GCC-15.patch
)
b2sums=('26be1f78e43a93ddbec87003d26e302b0759913bd500c571a5bbdd73d62d787b81529729988743a146b955983483d1067e9934f61d915b3b6854ac6aae459191'
        'af2ee0460c0c2f6f36e4f124a9ac16610e3884001262a6f08043fa1de4a85e2b5fd4fb12c64b8c94cfb59c3031bb7a1324e307fa2049e3378e2add9a58f5bd9e')

pkgver() {
  cd x265_git

  git describe --tags
}

prepare() {
  cd x265_git

  # Fix build with CMake 4.0
  git cherry-pick -n b354c009a60bcd6d7fc04014e200a1ee9c45c167 \
                     51ae8e922bcc4586ad4710812072289af91492a8 \
                     78e5ac35c13c5cbccc5933083edceb0d3eaeaa21

  # Fix build with GCC 15
  git apply -3 ../0001-Fix-build-with-GCC-15.patch
}

build() {
  local common_options=(
    -S x265_git/source
    -G Ninja
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_HDR10_PLUS=TRUE
    -W no-dev
  ) hdr_options=(
    "${common_options[@]}"
    -D ENABLE_CLI=FALSE
    -D ENABLE_SHARED=FALSE
    -D EXPORT_C_API=FALSE
    -D HIGH_BIT_DEPTH=TRUE
  ) final_options=(
    "${common_options[@]}"
    -D ENABLE_SHARED=TRUE
    -D EXTRA_LIB='x265_main10.a;x265_main12.a'
    -D EXTRA_LINK_FLAGS='-L .'
    -D LINKED_10BIT=TRUE
    -D LINKED_12BIT=TRUE
  )

  cmake -B build-10 "${hdr_options[@]}"
  cmake --build build-10

  cmake -B build-12 "${hdr_options[@]}" -D MAIN12=TRUE
  cmake --build build-12

  cmake -B build "${final_options[@]}"
  ln -sr build-10/libx265.a build/libx265_main10.a
  ln -sr build-12/libx265.a build/libx265_main12.a
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
