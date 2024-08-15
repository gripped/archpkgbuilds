# Maintainer: David Runge <dvzrv@archlinux.org>

_name=importlib_resources
pkgname=python-importlib_resources
pkgver=6.4.2
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
  python-jaraco.test
  python-pytest
  python-tests
)
provides=(python-importlib-resources)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('0a967e3e182a5b390810d7dc860d0bae1f0b87c2043e4e62bf5f9b4c50ccb080ab768a5358f84243dc63b60cb1dffe9666d6d712c86ed57728ef30ee8416d89a')
b2sums=('6e02639a19c90db117123bcb8e60898359125719aa1d327f9e364297a80ee55b2f299f4665323f3bbd9d449d906b0ce5fb053ee4fe53680464b04ca949cc4322')

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
