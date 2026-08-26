# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=python-django-ninja
_name="${pkgname#python-}"
pkgver=1.6.3
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
sha512sums=('b1da4b54a0c289db17f94f56192a3ef140f1d80c58b0947e087e5a3e3f054a41ab3d413bf9830a4825f592a0e11bab6e05c83cab1d8414bdc55af725d45c4ad1')
b2sums=('19a401e86194730e0b9a01b09c9fc5467751699c550c599033162fa491fa745fa75af56724f3d70011f68b631c6df93b3afca5a6bd8866cdafc5f131f82124ea')


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
