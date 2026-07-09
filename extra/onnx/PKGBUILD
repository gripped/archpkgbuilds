# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgbase=onnx
pkgname=(onnx python-onnx)
pkgver=1.21.0
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
source=("${pkgname}::git+https://github.com/onnx/onnx.git#tag=v${pkgver}")
sha512sums=('72d1225f0cc622b22dec29e6dad56a97a95bfd55ba3d9f4fe23814b3dd5ae33034785d463c47f011c458220cc19dba6bf795e17620d9237d6eefd8cb949eaf00')


prepare() {
  cd $pkgbase
  # Remove cmake and protobuf dependencies since we don't want to pull the
  # corresponding packages from PyPI
  sed -i 's/requires = .*/requires = ["setuptools"]/' pyproject.toml
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
