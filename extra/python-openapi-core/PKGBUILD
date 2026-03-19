# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=python-openapi-core
pkgver=0.23.0
pkgrel=2
pkgdesc='Client-side and server-side support for the OpenAPI Specification v3'
arch=(any)
url='https://github.com/p1c2u/openapi-core'
license=(BSD-3-Clause)
depends=(
  python
  python-isodate
  python-jsonschema
  python-jsonschema-path
  python-more-itertools
  python-openapi-schema-validator
  python-openapi-spec-validator
  python-werkzeug
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
optdepends=(
  python-aiohttp
  python-aioitertools
  python-django
  python-falcon
  python-fastapi
  python-flask
  python-multidict
  python-requests
  python-starlette
)
checkdepends=(
  python-aiohttp
  python-aioitertools
  python-django
  python-django-rest-framework
  python-falcon
  python-fastapi
  python-flask
  python-httpx
  python-multidict
  python-pytest
  python-pytest-aiohttp
  python-pytest-asyncio # a dependency of python-pytest-aiohttp
  python-requests
  python-responses
  python-starlette
)
source=("git+$url#tag=$pkgver")
b2sums=('1398bfb8ab5e9aadf0f216d5967b0dde8ef11464f4b4a4fab47b102f37f5f6066743c9390e1fcd08736fdb0433544862cc47df71d03db6d58adbf9c19a821407')

build() {
  cd "${pkgname#python-}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd "${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
