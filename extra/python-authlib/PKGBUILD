# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.7.0
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
  python-starlette
  python-cachelib
  python-pycryptodomex
  python-python-multipart
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('7d27fee8e3f6381db3b34eeec64dd380f8362a0d5b952baff954bf99cfcc57af70b26ec8491135e01424bd13af955cfc3b7be0e569d6e0b948f9db32a276c23d')
b2sums=('1612b69594c2e3315d402d3d61e63acbd35fbc81cd7018c583f6e1f19b5c22fb1018cd55279690204d960c93969f33c4131781bea0f9285e845bc4b3baea6b19')

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
