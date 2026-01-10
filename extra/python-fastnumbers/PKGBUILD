# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=fastnumbers
pkgname=python-fastnumbers
pkgver=5.1.1
pkgrel=2
pkgdesc="Super-fast and clean conversions to numbers"
arch=(x86_64)
url="https://github.com/SethMMorton/fastnumbers"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-numpy
  python-pytest
  python-typing_extensions
)
optdepends=(
  'python-numpy: for conversion to numpy arrays'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('ba84a0a03c9ddce24c6aac195d98ca1dd4e68b8d37cb0dd27fe81fd954d00f4763ac51c2a31645ce374cdfee3a185fece86a2e88753a9e5f556ec75a9012165c')
b2sums=('909dac4205587f575ebed12d8d8ab8f235eb40bde1d581674f8e30d297632411e56fac13b81f25a9a4c8a0d94b8ddf98004b8e41c77ea09810e2bfebb69aaafa')

build() {
  cd $_name-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
