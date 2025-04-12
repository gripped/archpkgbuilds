# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=python-django-ninja
_name="${pkgname#python-}"
pkgver=1.4.1
pkgrel=2
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
sha512sums=('039bb92b874b5d8684e2bd55080a81df15e8376c981c2ff2bda6a48eae282b86deb7d26592a634353ee4d6dea5e73cd32fb55bb261375399ac09fee903fab317')
b2sums=('f9496afcb1bc88cb71381d3d599bdca9751cd240f0572cdd983a175d2eec6f933323a3138cc6e9892fa94171e41f718610d6f9e9ad285e403b8b95be5d093eaf')


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
