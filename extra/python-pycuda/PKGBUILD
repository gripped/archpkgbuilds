# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_name=pycuda
pkgname=python-pycuda
pkgver=2025.1.2
pkgrel=1
pkgdesc="Python wrapper for Nvidia CUDA"
arch=(x86_64)
url="https://documen.tician.de/pycuda/"
license=(
  Apache-2.0
  MIT
)
depends=(
  boost-libs
  cuda
  gcc-libs
  glibc
  nvidia-utils
  python
  python-numpy
  python-pytools
)
makedepends=(
  boost
  ctags
  mesa
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
provides=(pycuda-headers)
conflicts=(pycuda-headers)
replaces=(pycuda-headers)
source=($_name-$pkgver.tar.gz::https://github.com/inducer/pycuda/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('6d71d17ce03c95f7e5663a16110a6ab76b0c3aa3b8147242649ecb69439f6f3ca78ba60f026d8929a8d991b27eaf0e85dbb88825e3416ada747cab702f09aaf0')
b2sums=('8d3ad8325e829b83ec44bea48415625a4ec78b9fa8b19cac04044801d68dd887f93ad30967314668f3ff7a17ee95ed23f530e3b540dd3acd81e7a5ec0e9e74c6')

prepare() {
  local lib_arch=''
  [[ "$CARCH" = "x86_64" ]] && lib_arch='64'

  # create local siteconf.py for build system
  # defaults can be compared from running the ./configure.py script
  {
    printf "BOOST_PYTHON_LIBNAME = ['boost_python3']\n"
    printf "CUDA_ROOT = '/opt/cuda'\n"
    printf "USE_SHIPPED_BOOST = False\n"
  } > $_name-$pkgver/siteconf.py

  # we ship python-numpy
  sed -e 's/oldest-supported-numpy/numpy/' -i $_name-$pkgver/pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# requires an Nvidia graphics card to run
# check() {
#   local pytest_options=(
#     -vv
#     --ignore examples/from-wiki/simple_speed_test.py
#   )
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

#   cd $_name-$pkgver
#   # install to temporary location, as importlib is used
#   python -m installer --destdir=test_dir dist/*.whl
#   export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
#   pytest "${pytest_options[@]}"
# }

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
