# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_name=pycuda
pkgname=python-pycuda
pkgver=2025.1.1
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
sha512sums=('fb1710ea9a77ea70c9e6955e6db0a7cfea1f52db28fa0f48b17717d4fe3222d61d324879297cb34059a7c943bfb1faa02ebb935f4c8ffb800c7c8110088107db')
b2sums=('99c74e5d06b2917385beb64a594b95b5996aee90c585eb0c5f8640aac42a4a7e2e61840b4bd3820c980b05007b84f93f3c391928d449ea0d848365d28c754eb1')

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
