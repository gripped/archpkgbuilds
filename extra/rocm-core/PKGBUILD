# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=rocm-core
pkgver=6.3.3
pkgrel=1
pkgdesc='AMD ROCm core package (version files)'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm/rocm-core/archive/refs/tags/rocm-$pkgver.tar.gz"
        'rocm-ld.conf'
        'rocm-profile.sh')
b2sums=('6daa08e3b7bb916ce9ec66914cfcf10b87264c6eb4e6668aaedadf526d1632c37cf2cd052936d5dd7ff09e5e10ab879a595b2d92dd01edaa45f90d11365278d6'
        'd045c357d8e7e8a4840ab137404f12cd08419444ffc478046c13ed3bd13a5d33358c1443bf76ee571a7a062454e2bdda1a5507a70edbd001bce004f18775e4b2'
        '4372bcbe97d7c95d4918ad4beacc4fe9bfc8bfb8cafcf08d9ebbcba7df3e3bf535ff51f90c2d0f653858b0ae03b108ac3cb32b61b4ecac3abb609acc06be3ee3')
url='https://rocm.docs.amd.com/'

build() {
  local cmake_args=(
    -Wno-dev
    -B build
    -S $pkgname-rocm-$pkgver
    -D CMAKE_BUILD_TYPE=None
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D ROCM_VERSION="$pkgver"
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 rocm-ld.conf "$pkgdir/etc/ld.so.conf.d/rocm.conf"
  install -Dm644 rocm-profile.sh "$pkgdir/etc/profile.d/rocm.sh"
  install -Dm644 "$srcdir/$pkgname-rocm-$pkgver/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
