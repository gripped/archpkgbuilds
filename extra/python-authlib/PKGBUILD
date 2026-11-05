# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.9.3
pkgrel=1
pkgdesc='The ultimate Python library in building OAuth and OpenID Connect servers & clients'
arch=(any)
url='https://github.com/authlib/authlib'
license=(BSD-3-Clause)
depends=(
  python
  python-cryptography
  python-joserfc
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
  python-httpx2
  python-starlette
  python-cachelib
  python-pycryptodomex
  python-python-multipart
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('5e931aaeb85e4c4c42ba2a34d06faa17e82d410fec5bf579a58772f589ee02d58f37a5539f2c6434afb54566dbc9d2bd72daec2661d532146d4d4e576510f52e')
b2sums=('0e24770870f5de84f7f13b86987b76514c92ef4fa36671f66042f9f8585b90e6c12570266dc49a5d437bf4ef4895fd8df16998a5126d891ba0505ca8749de7c7')

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
