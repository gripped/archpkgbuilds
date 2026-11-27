# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=amdsmi
pkgver=10.1
pkgrel=1
pkgdesc='AMD System Management Interface library'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/amdsmi/en/latest/'
license=('MIT' 'NCSA' 'GPL-2.0-only WITH Linux-syscall-note')
depends=(
  'rocm-core'
  'libnl'
  'libmnl'
  'glibc'
  'libgcc'
  'libdrm'
  'libstdc++'
  'python'
  'python-yaml'
)
makedepends=(
  'cmake'
  'python-wheel'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
_git='https://github.com/ROCm/rocm-systems'
_esmi='https://github.com/amd/esmi_ib_library'
# Must equal ESMI_GIT_HASH in projects/amdsmi/CMakeLists.txt
_esmi_commit=d494a3194ceb4cc4dbb2debf9fcbe8773c6d3bef
source=(
  "$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz"
  "$pkgname-esmi-$_esmi_commit.tar.gz::$_esmi/archive/$_esmi_commit.tar.gz"
)
sha256sums=('550ecc98dd7e73f7b70fb0c0eeb66fa3bc9fba19644622e76dfb67f8529e1a70'
            '8f9cf10922276ca35872ca0bc27e29e717a472ba704a575c5497622b62049e75')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"
_esminame="$(basename "$_esmi")-$(basename "${source[1]}" .tar.gz)"

prepare() {
  mv "$_esminame" "$pkgname/esmi_ib_library"

  cd $pkgname

  if ! grep -q "ESMI_GIT_HASH \"$_esmi_commit\"" CMakeLists.txt; then
    error "esmi pin changed upstream; update _esmi_commit"
    return 1
  fi

  # HACK from Fedora's spec: Replace git tag with version of our tar archive
  sed -i "s/NOT latest_esmi_tag/NOT esmi_pkg_ver-$_esmi_ver/" CMakeLists.txt
}

build() {
  local cmake_args=(
    -Wno-dev
    -S $pkgname
    -B build
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_BUILD_TYPE=None
    -D BUILD_TESTS=OFF
  )
  cmake "${cmake_args[@]}"
  cmake --build build

  cd build/py-interface/python_package
  python -m build --wheel --no-isolation
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/esmi_ib_library/License.txt" "$pkgdir/usr/share/licenses/$pkgname/esmi_ib_LICENSE"

  # cmake also installs the module without metadata, the wheel replaces it
  rm -r "$pkgdir"/usr/lib/python3.*/site-packages/amdsmi
  cd build/py-interface/python_package
  python -m installer --destdir="$pkgdir" dist/*.whl
  # cmake also installs python package under share.
  rm -r "${pkgdir}"/opt/rocm/share/amd_smi
}
