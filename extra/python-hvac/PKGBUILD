# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
pkgver=2.4.0
pkgrel=1
pkgdesc='Python client for HashiCorp Vault'
url='https://python-hvac.org/'
# The license defined at https://github.com/hvac/hvac/blob/main/pyproject.toml#L17
license=('Apache-2.0')
arch=(any)
depends=(python python-requests)
makedepends=(python-build python-installer python-poetry-core
             python-pyhcl)
checkdepends=(python-pytest python-authlib python-flask python-flask-sqlalchemy
              python-parameterized python-requests-mock python-werkzeug python-jwcrypto
              python-pytest-mock python-pytest-xdist)
optdepends=(
  'python-pyhcl: for HCL parser'
)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('396759e83eab0a9a104720746418e052716e790a1515f4b25c2a0ceacad5592e33907076360e64aff8870e580f1b318b726f27e7ff3ff7f4b30a5ac8fb9babb6')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  # Integration tests often fail, particularly when vault is upgraded to a new minor version
  pytest tests --ignore=tests/integration_tests
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
