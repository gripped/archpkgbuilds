# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgbase=onnx
pkgname=(onnx python-onnx)
pkgver=1.23.2
pkgrel=1
epoch=1
pkgdesc='Open standard for machine learning interoperability'
arch=('x86_64')
url='https://onnx.ai'
license=('MIT')
makedepends=(
  cmake
  git
  nanobind
  ninja
  protobuf
  python
  python-build
  python-installer
  python-ml-dtypes
  python-numpy
  python-protobuf
  python-scikit-build-core
)
source=("${pkgname}::git+https://github.com/onnx/onnx.git#tag=v${pkgver}")
sha512sums=('0dd0d01eefb8bc76ac52fcde2bb06bfc7a1c8424498a1a187338093b62f5e87e69d831bef626395c2c5edb8aae089a03713347f217201b800449d50dea6f05dc')


prepare() {
  cd $pkgbase
  # Drop the pinned "protobuf==4.25.1" build requirement
  sed -i 's/^requires = .*/requires = ["scikit-build-core"]/' pyproject.toml
}

build() {
  local _cmake_args=(
    -Wno-dev
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_RPATH=TRUE
    -DCMAKE_VERBOSE_MAKEFILE=ON
    -DONNX_ML=ON
    -DONNX_USE_PROTOBUF_SHARED_LIBS=ON
  )
  cd $pkgbase

  # Since 1.22 the python bindings require a static onnx
  cmake -B build "${_cmake_args[@]}" \
    -DBUILD_SHARED_LIBS=ON \
    -DONNX_BUILD_PYTHON=OFF \
    -DONNX_INSTALL=ON
  cmake --build build

  CMAKE_ARGS="${_cmake_args[*]}" python -m build --wheel --no-isolation
}

package_onnx() {
depends=(
  libgcc
  libstdc++
  glibc
  abseil-cpp
  protobuf
)
  DESTDIR="$pkgdir" cmake --install $pkgbase/build
  # The header install mirrors the source/build tree layout but only copies
  # *.h files, leaving behind empty directories (e.g. CMakeFiles).
  find "$pkgdir/usr/include" -type d -empty -delete
  install -Dm644 $pkgbase/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-onnx() {
depends=(
  python
  glibc
  libgcc
  libstdc++
  protobuf
  python-protobuf
  python-ml-dtypes
  python-numpy
  python-typing_extensions
)
  cd $pkgbase
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
