# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=bear
pkgver=3.1.5
pkgrel=8
pkgdesc='A tool to generate compilation database for clang tooling'
arch=('x86_64')
url='https://github.com/rizsotto/Bear'
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'grpc'
  'libgrpc++.so'
  'fmt'
  'spdlog'
  'nlohmann-json'
  'abseil-cpp'
  'protobuf'
  'openssl'
  'c-ares'
  're2'
)
makedepends=(
  'git'
  'cmake'
  'gtest'
  'python'
  'llvm'
)
source=(
  "$pkgname::git+$url.git#tag=$pkgver"
  "disable-lit-tests.patch"
)
b2sums=('d9d5ef329df478ea767b3904f1e908315e77231ff98461a4aadf8bfde5522f0fc47625c837ead7cde2c4bcaab9f7d061ef94d5ac13cd51fa0f1b22fade270093'
        '9bc603ac82c4b2c8bf1263e7d24205f7445b265da16c21935f58c651c5ed78fdb81d00565a3f2b81415831564b81384cd71c799f58c85bce0445ecdf67b7c3b8')

# XXX if this is moved to build, tests fail.
# there must be some environment variables that
# are discarded inbetween functions.
prepare() {
  # temporary workaround for failing bear::func tests
  # lit errors out when failing to acquire semaphore locks in python multiprocessing module
  # probably related to chroot environment but unrelated to bear::func tests which are not even executed
  patch -d "$pkgname" -p1 -i ../disable-lit-tests.patch

  cmake \
    -B build \
    -S "$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname"
}

build() {
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
