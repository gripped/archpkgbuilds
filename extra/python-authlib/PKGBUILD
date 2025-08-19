# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.6.1
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
sha512sums=('e5c99921f9b4dd885e7d9b91e2aff1d3d66a7278dd640363f1304bea90b37fddefa0a3581903bbc2395acd0bcc1bd22abe618597ad95692a153094e95690e49b')
b2sums=('c084023260c2e6858d21c9da18ba7c9ff00f2c5755eaf7204d310760a754f48f15dc18183973cc6a395189bd4693e598926a3ceb78ce82cd76341fe33df794ca')

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
