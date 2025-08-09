# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=svt-av1
pkgver=3.1.0
pkgrel=1
pkgdesc='Scalable Video Technology AV1 encoder and decoder'
arch=(x86_64)
url=https://gitlab.com/AOMediaCodec/SVT-AV1
license=(
  BSD
  'custom: Alliance for Open Media Patent License 1.0'
)
depends=(glibc)
makedepends=(
  cmake
  git
  nasm
  ninja
)
_tag=cc569c1eb16832b7f1a649cac0b3bd1a8e4a814d
source=(git+https://gitlab.com/AOMediaCodec/SVT-AV1.git#tag=${_tag})
b2sums=('c28d4a1f288de94be6b5563a48f3aee001cca9a147d49cfc6a25543420292b0cd9340380710ed459919c0bd9f818ae8f54f979a25c4dd788f13ad039b4546051')

prepare() {
  sed '/CMAKE_BUILD_TYPE Release/d' -i SVT-AV1/CMakeLists.txt
}

pkgver() {
  cd SVT-AV1
  git describe --tags | sed 's/^v//'
}

build() {
  cmake -S SVT-AV1 -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DNATIVE=OFF
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 SVT-AV1/{LICENSE,PATENTS}.md -t "${pkgdir}"/usr/share/licenses/svt-av1/
}

# vim: ts=2 sw=2 et:
