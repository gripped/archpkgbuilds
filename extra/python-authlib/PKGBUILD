# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.6.2
pkgrel=1
pkgdesc='The ultimate Python library in building OAuth and OpenID Connect servers & clients'
arch=(any)
url='https://github.com/lepture/authlib'
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
  python-requests
  python-django
  python-flask-sqlalchemy
  python-httpx
  python-starlette
  python-cachelib
)
source=("$pkgname::git+$url#tag=v$pkgver" )
sha512sums=('1200ffdc810e9c9d4e44c73033f1e6a3c614479d6e5ae8ca1e183a9766c479e159b4dad8627a9f88a1fe8d58a0e26d53de2a78e44f7eb2562a6bf656310a29e0')
b2sums=('8be4c34fb589cfb95220269ce61151e5ada0c156041936f76cbe74f5562d1e20d54ff3eed3474e32cb99b02fc19b5d40ac5f4dd03966f28f50432bbcc5cb28cd')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  export PYTHONPATH="$PWD"
  pytest tests/core -v
  # TODO: Disabled as the tests fail
  pytest tests/flask -v
  # https://github.com/lepture/authlib/issues/456
  pytest tests/jose -v -k 'not (test_dir_alg_xc20p or test_xc20p_content_encryption_decryption)'
  export DJANGO_SETTINGS_MODULE=tests.clients.test_django.settings
  pytest tests/clients -v
  export DJANGO_SETTINGS_MODULE=tests.django.settings
  pytest tests/django -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
