# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libldac
pkgver=2.0.2.3
pkgrel=3
pkgdesc="LDAC Bluetooth encoder library"
url="https://github.com/EHfive/ldacBT"
arch=(x86_64)
license=(Apache-2.0)
depends=(glibc)
makedepends=(
  cmake
  git
  ninja
)
provides=(libldacBT_{abr,enc}.so)
source=(
  "git+$url#tag=v$pkgver"
  "git+https://android.googlesource.com/platform/external/libldac"
  0001-Allow-build-with-CMake-4.0.0.patch
)
b2sums=('1719c5c4cc227a592deefa3e765b925a2a9cfdf4212823a31efdc767f7f3e5044a6626a2880fc051e935254ab9fcda41dc4ba2880dd2a33cc2e62a3c5eccc7e8'
        'SKIP'
        'c19a3e4fc33eb4394c8466486b04d9a71f632b77fc4d0cb5df4751b705a938405346495bcf2942114604651a2ff24369bcae78711c5bceca86ecacbcf851c0b9')

prepare() {
  cd ldacBT

  # Fix build
  git apply -3 ../0001-Allow-build-with-CMake-4.0.0.patch

  git submodule init
  git submodule set-url libldac "$srcdir/libldac"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D LDAC_SOFT_FLOAT=OFF
  )

  cmake -S ldacBT -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
