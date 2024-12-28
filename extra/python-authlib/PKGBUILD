# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.4.0
pkgrel=2
pkgdesc='The ultimate Python library in building OAuth and OpenID Connect servers & clients'
arch=('any')
url='https://github.com/lepture/authlib'
license=('BSD-3-Clause')
depends=('python' 'python-cryptography')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-django'
  'python-requests'
  'python-django'
  'python-flask-sqlalchemy'
  'python-httpx'
  'python-starlette'
  'python-cachelib'
)
source=("$pkgname::git+$url#tag=v$pkgver" )
sha512sums=('6de9bc25eacabeb3644d7f49e58b0b9edfbae86b80a32ae134ee76158996e80095d51d75128d139a0ff25cfbe3e2b00d8970b1b60be7317cb9ca5b22b3e3add0')
b2sums=('c2b6c18b92b7cb879663d03cd1c11f0d739c58770c56c89b9d4a58d51fd296344bc508889f3c42ce67274ff49b36141d22d00a41ceab1631eb70c87c0f5362f4')

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
