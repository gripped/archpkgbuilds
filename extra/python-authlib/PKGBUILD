# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.6.9
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
sha512sums=('bc1fa3a9472051aaaf05dd3ae88d57c6fed3bafd8e8e9d423c579327a86600fba34b48c09a578efe1fd0fa6a8cf1a09c5e8bd7838c6ca84bb725517c2f8c21fd')
b2sums=('d3deb5b8c010de444119f30ef7358e3d1f26b8ccd32651948edac826f89ced73919d88e1610e8ddf2f754f773ac3e80a61ca55bb3b0c934a5d341540700b77ac')

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
