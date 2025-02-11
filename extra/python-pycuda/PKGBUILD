# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_name=pycuda
pkgname=python-pycuda
pkgver=2024.1.2
pkgrel=2
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
source=($_name-$pkgver.tar.gz::https://github.com/inducer/pycuda/archive/refs/tags/v$pkgver.tar.gz
        python3.13.patch)
sha512sums=('42ab9355ab13b7a955c957728edf9b67ca376b2e45a98662ba49732a364af6661740d2b1c56abf1cd6715ac089877a861944cbb472055a7b881bbc86ec8b8ced'
            'e2553877a780c825ab7ab9b2378f816ded7eb587fcfdfc8a6235a882cfeeb2b5a9cf2a3ed1775209ec97f42d0a5a4c0ff04f086b01d157e3cfd80fa9ff7dca78')
b2sums=('173e4f08b475c4fcdad7982b9f826a19b478ec688c62ed4fc4ee135eddb6ebe474bd44f9aee0308a13d6895eb6bd4e5806cbd2fba08131a1640dab6d3da1500c'
        '69c00ae3c5eb8598d67600e3c8f81ef80f2616dd7c15c22ae5391405fbb0c9f15b4d804ab8ca3b0f409a2acfe79c89420b75c8875a24a17ff490786a64808338')

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

  # fix build with numpy 2.0
  sed -e 's|\"core\"|\"_core\"|' -i $_name-$pkgver/aksetup_helper.py
  cd $_name-$pkgver
  # fix build against new Python 3.13 C API
  patch -Np1 -i ../python3.13.patch
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
