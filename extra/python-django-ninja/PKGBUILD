# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=python-django-ninja
_name="${pkgname#python-}"
pkgver=1.4.5
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
sha512sums=('3fbd058bdae28810dc9d69f765c9741a2c7a392f0727cafbfa6c1e185de9ba02e3938c4eebcd9d90d3b2479d7decfa36d17803cde98df2ac7fc4eab8f203252d')
b2sums=('75b89bc01d5ae317dfcac341ac9946998f7a79938fc91671b9a28a3a0153c7e5a9860c33aaee499c38c19053e92b56fe006d68da91d829a320d1915ec540d77e')


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
