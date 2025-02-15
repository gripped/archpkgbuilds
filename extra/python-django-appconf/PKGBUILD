# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-appconf
pkgname=python-django-appconf
pkgver=1.1.0
pkgrel=1
pkgdesc="An app to handle configuration defaults of packaged Django apps gracefully"
arch=(any)
url="https://github.com/django-compressor/django-appconf"
license=(BSD-3-Clause)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('fc532ba692358d1d0d090ac2c60b01fe6b6e5d1836c2731c5132e07dcd41767730c69b6478da616fdd0b59be249addee475897829d76e93f2e6d389fbcf7e979')
b2sums=('1f7efe40362813a56f435a640ab81a7a4f548fc19eb8699c29a67e7c8d90e04158d0eca901fd8087e91d89d5d85c126eecb398ed610b2ed0ac1843a0aeb8ce06')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD:build:$PYTHONPATH"
  DJANGO_SETTINGS_MODULE=tests.test_settings django-admin test -v2 tests
  rm -rf tests/__pycache__
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
