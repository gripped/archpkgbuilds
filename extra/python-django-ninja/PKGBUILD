# Maintainer: David Runge <dvzrv@archlinux.org>
pkgname=python-django-ninja
_name="${pkgname#python-}"
pkgver=1.5.2
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
sha512sums=('9cc65a51a272e3de3348e99de36d2ec49b0d509ee284a51bf0336a6f5139268b5abd9a7b6ddb7de1ffe45757437b537312a7682aed1c78cd673f1de8361591fa')
b2sums=('cf3f788b00cec4a991d439ba9dc440616b4c8bf90f9c17057756b013e024d9eb24f6181565e8d58610916bbc9ef1b5af6971ae70eada03050ab3f209cac1e58a')


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
