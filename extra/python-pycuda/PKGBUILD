# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_name=pycuda
pkgname=python-pycuda
pkgver=2025.1
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
sha512sums=('d9327192e27e5ae5b6703b3843fa2d394ab99d78bf8d4602dcb1e564900994c6abe2f0b1fe27de925f33bd949a20c2f7067bd84d7a53ceef44fb1a2c979c5f11')
b2sums=('f545c79308b7d752c74054f9e6da5ab69acbd9c694382377be91800a3eb92086f53c477ff9d61c5f085f90e8051bd258b76d2374eeb510b581106553f57d8b89')

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
