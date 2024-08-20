# Maintainer: David Runge <dvzrv@archlinux.org>

_name=importlib_resources
pkgname=python-importlib_resources
pkgver=6.4.3
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
sha512sums=('0985468159ee8de9d170bb1e4bb9aecef8f4c42c22b163173e84ae538dce772bf086742690e29bd6b3ec9ffc3466a4b01d3792ca7f9b7b5af5ad909e88d67865')
b2sums=('aa0588e60637e18c1948af9e9a657a61255b12740cb929eebe7e655b1b8f00a1823df4892fdcef5cf1e6f05686475baad2348784c2a4cf19ca695609bc9d4fd8')

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
