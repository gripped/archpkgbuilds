# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=rocm-core
pkgver=6.4.3
pkgrel=1
pkgdesc='AMD ROCm core package (version files)'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm/rocm-core/archive/refs/tags/rocm-$pkgver.tar.gz"
        'rocm-ld.conf'
        'rocm-profile.sh')
b2sums=('10e9143ec4ae161a9e02d44f74f0d3420526a6e12c3da5ae5931aebbfeb1df914c7f33c6c7b8f2ec187569ba6c44c26f750c7c972b775d2dde89b73ff9cb854f'
        'd045c357d8e7e8a4840ab137404f12cd08419444ffc478046c13ed3bd13a5d33358c1443bf76ee571a7a062454e2bdda1a5507a70edbd001bce004f18775e4b2'
        '4372bcbe97d7c95d4918ad4beacc4fe9bfc8bfb8cafcf08d9ebbcba7df3e3bf535ff51f90c2d0f653858b0ae03b108ac3cb32b61b4ecac3abb609acc06be3ee3')
url='https://rocm.docs.amd.com/en/latest/'

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
