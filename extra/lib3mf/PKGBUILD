# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgbase=lib3mf
pkgname=({,python-}lib3mf)
pkgver=2.3.2
pkgrel=3
pkgdesc='Implementation of the 3D Manufacturing Format file standard'
arch=('x86_64')
url='https://github.com/3MFConsortium/lib3mf'
license=('BSD-2-Clause')
depends=(
  'gcc-libs'
  'glibc'
  'libzip'
  'util-linux-libs'
  'zlib'
)
makedepends=(
  'git'
  'cmake'
  'python'
)
checkdepends=('gtest')
options=('!lto')
source=(
  "$pkgbase::git+$url#tag=v$pkgver"
  '__init__.py'
)
sha512sums=('97a41e0ff66e69c3e0667aa7013012b43b4cf0f4f97125f8c4be64623e420ea30fcd322390d35a9bbf60155cb31b521dd42b34d508c09dcafb2ae5392a4219ab'
            '56cbdd17b95bb98c0d40c294d6a1691594da9630ee0d7ba1e5f0cc4c8be8276edf51af30509b32ba8336a1f24a5b45e3e7436792afa246f3c54d6d8adae47d7c')
b2sums=('a7f6acb1c9d535b2b504e972ec9514d037769d99d1695ae060b60a38f955c47b90de1fdcf9ca16f0ef4813719d3ff3cc2d162a4e647e3bb96c334ff49d1eda09'
        'cf8f3e695861af2fdacb0d82bce0dc9c9424d8d671ffd37cf59250d3def01f957b57a80b4eb84b7ce0a1ddc339ce0b3a1da5c2bb2e7f2852f9602706b89f9ada')

build() {
  local cmake_options=(
    -B build
    -S "$pkgbase"
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_INCLUDEDIR=include/lib3mf
    -D CMAKE_INSTALL_LIBDIR=lib
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
  replaces=('lib3mf-1')

  DESTDIR="$pkgdir" cmake --install build

  # some packages expect lib3MF.pc instead of lib3mf.pc
  ln -s lib3mf.pc "$pkgdir"/usr/lib/pkgconfig/lib3MF.pc

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase/LICENSE"
}

package_python-lib3mf() {
  pkgdesc='Python bindings for lib3mf'
  depends=('python' 'lib3mf')

  # provide a python package in site-packages
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vDm644 -t "${pkgdir}${site_packages}/lib3mf" "__init__.py"
  ln -s /usr/lib/lib3mf.so "${pkgdir}${site_packages}/lib3mf/lib3mf.so"
  ln -s /usr/include/lib3mf/Bindings/Python/Lib3MF.py "${pkgdir}${site_packages}/lib3mf/Lib3MF.py"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase/LICENSE"
}
