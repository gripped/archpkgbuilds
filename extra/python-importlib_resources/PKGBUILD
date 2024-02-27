# Maintainer: David Runge <dvzrv@archlinux.org>

_name=importlib_resources
pkgname=python-importlib_resources
pkgver=6.1.2
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
  python-pytest
  python-pytest-enabler
  python-tests
)
provides=(python-importlib-resources)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('6622708adc8aa8ebbea742ea8498e2e6290bef966c00025a814f7daa53525aa013b2b2c5234a064d757a771fa73082cf8d1ceaf9f8eb3c0e2afad4e0be17ab70')
b2sums=('10da0c46163f55411514d647734881bf5ba0d9237e751f1fd15c276f248c407455d0d5190f37c34149b2f24ea06014060a0a97f7a604c92af2295a70f9173985')

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
