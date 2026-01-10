# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgbase=lib3mf
pkgname=({,python-}lib3mf)
pkgver=2.4.1
pkgrel=3
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=(x86_64)
url='https://github.com/3MFConsortium/lib3mf'
license=(BSD-2-Clause)
depends=(
  gcc-libs
  glibc
  libzip
  util-linux-libs
  zlib
)
makedepends=(
  git
  cmake
  python
  ninja
)
checkdepends=(gtest)
options=(!lto)
source=(
  "$pkgbase::git+$url#tag=v$pkgver"
  __init__.py
  fix-missing-header.patch
  fix-install.patch
)
sha512sums=('c34e768ef4c1f63c2910d245036ebf9b74040ebc98c13c3456f261303d5ecf6c3a516ed17bbf7098f857a254213e24af4d15573e826c4801d20a8c62d99cc0f1'
            '56cbdd17b95bb98c0d40c294d6a1691594da9630ee0d7ba1e5f0cc4c8be8276edf51af30509b32ba8336a1f24a5b45e3e7436792afa246f3c54d6d8adae47d7c'
            '576f146007b2831f819f4f2b5cbfc130aed88750b1ec91965ab2cb5a125b4e8bca489eaa11dcde88762755b7fadbd847b52729463923b6724149dc5fe8507f8c'
            '03461ce00fd64125e0cef7ed62d98d4216b1bc9a202eab7844aaeccfca4ac39408abc8501b495ecb2c3ab8b956078f85ee35029f505e433b276c0078776ac44a')
b2sums=('e5b8ea1060b99d800fd23bec0e55163cbe4757e1298ae13c851410e54f4eb153ad62e29da8fd6effe50358fd240635fa1f852e7a8b19a3fe7655379d8737c5da'
        'cf8f3e695861af2fdacb0d82bce0dc9c9424d8d671ffd37cf59250d3def01f957b57a80b4eb84b7ce0a1ddc339ce0b3a1da5c2bb2e7f2852f9602706b89f9ada'
        '21668c04fe6bcb632dc7ed5a9cee8a5fbef71d8a14d110403fba23396aa1718d65920c10eb823187cef41bd7fd3d52a94345561f496ea0ab166f4dfae3cd091a'
        '3bca01a0504624900aee18fabc9e8e1d4182fdb8ae7db0e6310836ea2029bbda0b9cd4bb6c65d46fd414fc25dfe3a549b0b6e6cf94ee7e0dc8ee3f28d2565df3')

prepare() {
  cd "$pkgbase"

  # PR opened upstream:
  # https://github.com/3MFConsortium/lib3mf/pull/445
  git apply -3 "$srcdir/fix-missing-header.patch"

  # fix broken install
  git apply -3 "$srcdir/fix-install.patch"
}

build() {
  local cmake_options=(
    -B build
    -S "$pkgbase"
    -G Ninja
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_INCLUDEDIR=include/lib3mf
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D USE_INCLUDED_ZLIB=OFF
    -D USE_INCLUDED_LIBZIP=OFF
    -D USE_INCLUDED_SSL=OFF
    -D LIB3MF_TESTS=OFF
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

# NOTE: gtests needs C++14 and with it tests fail
# -D LIB3MF_TESTS=OFF
#check() {
#  ctest --test-dir build --output-on-failure
#}

package_lib3mf() {
  optdepends=('python-lib3mf: Python bindings')
  replaces=(lib3mf-1)

  DESTDIR="$pkgdir" cmake --install build

  # some packages expect lib3MF.pc instead of lib3mf.pc
  ln -s lib3mf.pc "$pkgdir"/usr/lib/pkgconfig/lib3MF.pc

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase/LICENSE"
}

package_python-lib3mf() {
  pkgdesc='Python bindings for lib3mf'
  depends=(python lib3mf)

  # provide a python package in site-packages
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vDm644 -t "${pkgdir}${site_packages}/lib3mf" __init__.py
  ln -s /usr/lib/lib3mf.so "${pkgdir}${site_packages}/lib3mf/lib3mf.so"
  ln -s /usr/include/lib3mf/Bindings/Python/Lib3MF.py "${pkgdir}${site_packages}/lib3mf/Lib3MF.py"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase/LICENSE"
}
