# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=python-django-ninja
_name="${pkgname#python-}"
pkgver=1.7.0
pkgrel=1
pkgdesc="Fast, Async-ready, Openapi, type hints based framework for building APIs"
arch=(any)
url="https://github.com/vitalik/django-ninja"
license=(MIT)
depends=(
  python
  python-asgiref  # implicitly pulled in by python-django but required directly
  python-django
  python-pydantic
  python-pydantic-core  # implicitly pulled in by python-pydantic but required directly
  python-typing_extensions  # directly required but not specified
)
makedepends=(
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-cov
  python-pytest-django
  python-psycopg2
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('515e7194b672a31de1fbf651be4ea145137e95529dcbfb6ec069e46e4ed9943d30a48507e41a859fb362b8ee112792ce5be5a31c50598c46d10a7ef2e3c67790')
b2sums=('7c5a2b9e89771a5c2e854c777c4ceccc393451d2cf94dcc6a0d080e55e25c00a75d32cca4486d9a1b267bc6a7edc6035f9ea50453f1a3200e3d5b321a66fdf23')


build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
