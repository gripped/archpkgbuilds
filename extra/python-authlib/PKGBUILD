# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.6.3
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
)
source=("$pkgname::git+$url#tag=v$pkgver" )
sha512sums=('4a8d7ff2dedf9902ece35643a3dc57c43bb3c48301f9be7e8ef7b40df97eade4916b4416427d40074b641d260eb74b8086cc4eb5df08e9bf41055006169bcb5a')
b2sums=('e087646f656a8ea4331505a759bc680d4638f7944c0f19e0e6330c1f882d2fe8b85b1d4fe70b432ef87d72f514ebbfc6431a7e1bfa9e705f5419d1d8538703e0')

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
