# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.6.7
pkgrel=1
pkgdesc='The ultimate Python library in building OAuth and OpenID Connect servers & clients'
arch=(any)
url='https://github.com/authlib/authlib'
license=(BSD-3-Clause)
depends=(
  python
  python-cryptography
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-django
  python-pytest-env
  python-requests
  python-django
  python-flask-sqlalchemy
  python-httpx
  python-starlette
  python-cachelib
  python-pycryptodomex
  python-python-multipart
)
source=("$pkgname::git+$url#tag=v$pkgver" )
sha512sums=('b23c2bf938b33a65de8fa5754a866f689fb373031d0a5400bd04b0b5d8e416cb523b05ec8af9a51d2d448b1e4cb905afbb943239aa7c49b7cc8a479f0a15118a')
b2sums=('fe0d5de4a65e9e72fe0037b1052514781910fb6768818d6c2ea5d665349e6cf90e834202f47f40e33ac6885a6b67ca5b4bdefbde4024ce4f8128ae5ca78b4670')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  export PYTHONPATH="$PWD"
  pytest tests/core -v
  pytest tests/jose -v
  pytest tests/clients -v
  pytest tests/flask -v
  pytest tests/django -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
