# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@cs.uni-freiburg.de>
# Contributor: fermyon <antifermion@protonmail.com>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>
# Contributor: Greg Land <landjgregory at gmail dot com>

pkgname=rocm-cmake
pkgver=10.1
pkgrel=1
pkgdesc='CMake modules for common build tasks needed for the ROCm software stack'
arch=('any')
url='https://github.com/ROCm/rocm-cmake'
license=('MIT')
depends=('rocm-core' 'cmake')
checkdepends=('git' 'rocm-llvm')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/therock-$pkgver.tar.gz")
sha256sums=('41b034780028684a3ee281fcc2b8ed0573a64b55a5ef38d10bb59deddd3d9710')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

prepare() {
    cd "$_dirname"
    # Silence warnings that turn into errors with recent cmake versions
    sed -i 's/-Werror=dev/& -Wno-error=install-absolute-destination/' test/test.cmake
    # Git version tests fail because we're not working in a local git checkout
    rm test/pass/{version-norepo.cmake,version-parent.cmake}
    # sphinx tests require a python module named rocm_docs,
    # https://github.com/RadeonOpenCompute/rocm-docs-core
    # As we don't package it, disable also this test
    rm test/pass/doc-sphinxdoxygen.cmake
}

build() {
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

check() {
    export GIT_AUTHOR_NAME="builduser"
    export GIT_AUTHOR_EMAIL="builduser@archlinux.local"
    export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
    export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
    cmake --build build --target check
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
