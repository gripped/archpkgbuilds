# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Greg Land <landjgregory at gmail dot com>
pkgname=rocm-core
pkgver=7.1.0
pkgrel=1
pkgdesc='AMD ROCm core package (version files)'
license=('MIT')
arch=('x86_64')
depends=(
    'gcc-libs'
    'glibc'
    'python-pyelftools'
    'python3'
)
makedepends=('cmake')
source=("rocm-$pkgver.tar.gz::https://github.com/ROCm/rocm-systems/archive/refs/tags/rocm-$pkgver.tar.gz"
        'rocm-ld.conf'
        'rocm-profile.sh')
b2sums=('51df17b0724bb588a97cc7cd0fad51fb3e2173ecd53783bdec0f7e7134ab1a772431bcc41d467ba3b1085be6f6ef33e83af948a3c5879f0db243c67bc04e0d1e'
        'd045c357d8e7e8a4840ab137404f12cd08419444ffc478046c13ed3bd13a5d33358c1443bf76ee571a7a062454e2bdda1a5507a70edbd001bce004f18775e4b2'
        '4372bcbe97d7c95d4918ad4beacc4fe9bfc8bfb8cafcf08d9ebbcba7df3e3bf535ff51f90c2d0f653858b0ae03b108ac3cb32b61b4ecac3abb609acc06be3ee3')
url='https://rocm.docs.amd.com/en/latest/'
_projectDir="rocm-systems-rocm-$pkgver/projects/$pkgname"

build() {
  local cmake_args=(
    -Wno-dev
    -B build
    -S $_projectDir
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
  install -Dm644 "$srcdir/$_projectDir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
