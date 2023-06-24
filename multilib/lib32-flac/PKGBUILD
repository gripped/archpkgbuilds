# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=lib32-flac
pkgname=('lib32-flac')
pkgver=1.4.3
pkgrel=1
pkgdesc='Free Lossless Audio Codec (32-bit)'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
depends=('lib32-gcc-libs' 'lib32-libogg' 'flac')
makedepends=('nasm' 'cmake' 'ninja')
source=(https://github.com/xiph/flac/releases/download/${pkgver}/flac-${pkgver}.tar.xz)
b2sums=('c4f441aeaa0493433347b8a110ca01865fd40d5b21150174372af2fee4fa5c3397a67add31138e92999eab9d9abe6c46a5ac29e13cbac60093fbff6d7a672ad3')

# https://github.com/xiph/flac/releases
sha256sums=('6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70')

prepare() {
  cd flac-${pkgver}

  # Shorten tests
  sed -i 's/FLAC__TEST_LEVEL=1/FLAC__TEST_LEVEL=0/' test/CMakeLists.txt
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cmake -S flac-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DBUILD_SHARED_LIBS=ON \
    -DINSTALL_MANPAGES=OFF \
    -DWITH_STACK_PROTECTOR=OFF \
    -DNDEBUG=ON
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j1
}

package_lib32-flac() {
  provides=('libFLAC.so' 'libFLAC++.so')

  DESTDIR="${pkgdir}" cmake --install build

  rm -r "${pkgdir}"/usr/{bin,include}

  install -Dm 644 flac-${pkgver}/COPYING.Xiph -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
