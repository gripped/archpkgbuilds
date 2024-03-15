# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-extra-types
pkgname=python-pydantic-extra-types
pkgver=2.6.0
pkgrel=1
pkgdesc="Extra pydantic types"
arch=(any)
url="https://github.com/pydantic/pydantic-extra-types"
license=(MIT)
depends=(
  python
  python-pydantic
  python-pydantic-core
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-dirty-equals
  python-pendulum
  python-phonenumbers
  python-pycountry
  python-pytest
  python-ulid
)
optdepends=(
  'python-pendulum: for datetime support'
  'python-phonenumbers: for phone number support'
  'python-pycountry: for country code support'
  'python-ulid: for ULID support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('6b93891e84e3b706d676e7b98ee76eccd23f4d82b975d8f9e10d295abc6b182aa4d0983b7667ac62c44023e337c8bc25788356436371a44a1e0563769e275959')
b2sums=('0aa2f93d873511a41acf8e3ed609daec22a58fea9a17b59f1e3f195fd07b15e770c5e128a146579a207cf1348234d0468458f8d4267cdcc87c83cf797b3044dd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
