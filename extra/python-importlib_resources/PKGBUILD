# Maintainer: David Runge <dvzrv@archlinux.org>

_name=importlib_resources
pkgname=python-importlib_resources
pkgver=6.3.0
pkgrel=1
pkgdesc="Design and implementation for a planned importlib.resources"
arch=(any)
url="https://github.com/python/importlib_resources"
license=(Apache-2.0)
depends=(
  python
  python-zipp
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-jaraco.collections
  python-pytest
  python-pytest-enabler
  python-tests
)
provides=(python-importlib-resources)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('c640738067e973b9e5dda707fc2465c99e9c4904da35ff9c5164980e50be9a6ea0295f3087bc14444f2618cbfed418060174fa1229cd55b1a996f1ee24287fee')
b2sums=('1c821552376970efe89abe36020ef5b1f5f5131f03e553fe03dc4efaa27d7d5e41bbeb1384e9c06a3ed890ed653189548e2d8e1f7aa4e1328fab9917e97e755d')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD:$PYTHONPATH"
  pytest -vv

}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  # remove tests
  rm -frv "$pkgdir/$_site_packages/$_name/tests/"
}
