# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

_pkgname=CGNS
pkgname=cgns
pkgver=4.5.0
pkgrel=3
pkgdesc="Standard for recording and recovering computer data associated with the numerical solution of fluid dynamics equations"
arch=(x86_64)
url="https://cgns.github.io/"
license=(Zlib)
depends=(
  gcc-libs
  glibc
  glu
  hdf5
  libxmu
  tk
)
makedepends=(
  cmake
  gcc-fortran
)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0286ff2faf9102e5fb6d9bed764fd553756d62ae9be9dbb8b37ba6e2d3a7fec9337715320ec38a001960e39d397e846f2adbd4b54930c20e0304edacdd48fc92')

build() {
  cmake -B build -S ${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DCGNS_BUILD_CGNSTOOLS=ON \
    -DCGNS_BUILD_SHARED=ON \
    -DCGNS_ENABLE_64BIT=ON \
    -DCGNS_ENABLE_FORTRAN=ON \
    -DCGNS_ENABLE_HDF5=ON \
    -DCGNS_ENABLE_LEGACY=ON \
    -DCGNS_ENABLE_SCOPING=OFF \
    -DCGNS_ENABLE_TESTS=ON \
    -DCMAKE_SKIP_RPATH=ON
  cmake --build build
}

check() {
  LD_LIBRARY_PATH="$srcdir/build/src" \
    ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" $_pkgname-$pkgver/license.txt
  # Remove broken .desktop files
  rm "$pkgdir/usr/bin/"*.desktop
}
