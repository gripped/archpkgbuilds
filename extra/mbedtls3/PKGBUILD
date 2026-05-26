# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=mbedtls3
pkgver=3.6.6
pkgrel=1
pkgdesc='An open source, portable, easy to use, readable and flexible TLS library'
arch=(x86_64)
url=https://tls.mbed.org
license=(Apache-2.0)
depends=(
  glibc
  sh
)
checkdepends=(python)
makedepends=(
  cmake
  git
  ninja
  python
)
provides=(
  libmbedcrypto.so
  libmbedtls.so
  libmbedx509.so
)
options=(staticlibs)
source=(
  git+https://github.com/Mbed-TLS/mbedtls.git#tag=mbedtls-${pkgver}
  git+https://github.com/Mbed-TLS/mbedtls-framework.git
)
b2sums=('647eadc869e588d9bb44399fa1e24177793075e5ab8131c9672812aaca431702266165d6615338e13c1e343bc1c80a8eed078d489649b38034ad95aa335ccea5'
        'SKIP')

prepare() {
  cd mbedtls
  git submodule init framework
  git config submodule.framework.url "${srcdir}"/mbedtls-framework
  git -c protocol.file.allow=always submodule update framework
  scripts/config.py set MBEDTLS_HAVE_SSE2
  scripts/config.py set MBEDTLS_THREADING_C
  scripts/config.py set MBEDTLS_THREADING_PTHREAD
}

build() {
  export CFLAGS+=' -ffat-lto-objects'
  cmake -S mbedtls -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DUSE_SHARED_MBEDTLS_LIBRARY=ON \
    -DUSE_STATIC_MBEDTLS_LIBRARY=ON \
    -Wno-dev
  cmake --build build
}

check() {
  LD_LIBRARY_PATH="${srcdir}"/build/library ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # namespace includes
  install -dm 755 "${pkgdir}"/usr/include/mbedtls3
  mv "${pkgdir}"/usr/include/{everest,mbedtls,psa} "${pkgdir}"/usr/include/mbedtls3/

  # namespace libs
  install -dm 755 "${pkgdir}"/usr/lib/mbedtls3
  mv "${pkgdir}"/usr/lib/{cmake,lib*.a,lib*.so*,pkgconfig} "${pkgdir}"/usr/lib/mbedtls3/

  # rename generic utils
  local _prog _baseprog
  for _prog in "${pkgdir}"/usr/bin/*; do
    _baseprog=$(basename "$_prog")
    mv -v "$_prog" "${_prog//$_baseprog/mbedtls3_$_baseprog}"
  done

  # fixup static lib permissions
  chmod 644 "${pkgdir}"/usr/lib/mbedtls3/*.a

  # create symlinks for shared libs
  for _lib in "${pkgdir}"/usr/lib/mbedtls3/lib*.so.*; do
    ln -sf ../mbedtls3/"$(basename "$_lib")" "${pkgdir}/usr/lib/$(basename "$_lib")"
  done
}

# vim: ts=2 sw=2 et:
