# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgbase=onnx
pkgname=(onnx python-onnx)
pkgver=1.19.1
pkgrel=4
epoch=1
pkgdesc='Open standard for machine learning interoperability'
arch=('x86_64')
url='https://onnx.ai'
license=('MIT')
makedepends=(
  cmake
  git
  protobuf
  pybind11
  python
  python-build
  python-installer
  python-ml-dtypes
  python-numpy
  python-protobuf
  python-setuptools
  python-wheel
)
source=("${pkgname}::git+https://github.com/onnx/onnx.git#tag=v${pkgver}"
        "fix-protobuf-32.1-build.patch")
sha512sums=('8c2bbca029376797251a02c9e1d2aadd13396a94edc1bf465a4f4a5745768162db13a9dc4751e5324564eb53083afc1544fbc8753127093155995504df07b24f'
            'a5a4baa20ca110341562f98816134ace03d26e864a10d1ae79ec3c457263238a235e742407e6737686415b02732b234669c91406c5b3e6ba1a9095415239426b')


prepare() {
  cd $pkgbase
  # Remove cmake and protobuf dependencies since we don't want to pull the
  # corresponding packages from PyPI
  sed -i 's/requires = .*/requires = ["setuptools"]/' pyproject.toml

  # Fix this issue https://github.com/onnx/onnx/issues/6579#issuecomment-3341916229
  # with this commit https://github.com/onnx/onnx/pull/7087
  patch -Np1 -i ../fix-protobuf-32.1-build.patch
}

build() {
  local _cmake_args=(
    -DCMAKE_BUILD_TYPE='None'
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=TRUE
    -DCMAKE_VERBOSE_MAKEFILE=ON
    -DONNX_USE_PROTOBUF_SHARED_LIBS=ON
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )
  cd $pkgbase
  CMAKE_ARGS="${_cmake_args[@]}" python -m build --wheel --no-isolation
}

package_onnx() {
depends=(
  gcc-libs
  glibc
  abseil-cpp
  protobuf
)
  DESTDIR="$pkgdir" cmake --install $pkgbase/.setuptools-cmake-build
  install -Dm644 $pkgbase/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-onnx() {
depends=(
  onnx
  python
  glibc
  gcc-libs
  protobuf
  python-protobuf
  python-ml-dtypes
  python-numpy
)
  cd $pkgbase
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
