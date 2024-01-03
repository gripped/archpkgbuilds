# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-extra-types
pkgname=python-pydantic-extra-types
pkgver=2.3.0
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
  python-phonenumbers
  python-pycountry
  python-pytest
  python-ulid
)
optdepends=(
  'python-phonenumbers: for phone number support'
  'python-pycountry: for country code support'
  'python-ulid: for ULID support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('741e465c63a9ec3d7149f892bcd308a8f72df4743ee0c2a22b1b4854bdd71d0c0b9c3a8e8525f0ab38aadf67ebcdfddd12f915a7f698757a4551a829743556af')
b2sums=('8e284df755b367f138280594a6421cc9a59ecc4fbc694cfdaf1082eaa716fc03166480becc0b14a2631f9d80be391113dd287f20e185ccad7918f7dcbad72ecf')

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
