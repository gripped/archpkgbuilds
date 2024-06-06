# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-extra-types
pkgname=python-pydantic-extra-types
pkgver=2.8.0
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
sha512sums=('15addde64d5ce1c32dbb12fad2ef457c6eb6920b6e04beb4f3e24967d06e1066ee487e2bda0c490dab6765a43c18601e23167b5ce07ec014d748fbc73d23addf')
b2sums=('1e3b8b7b139e8d52deffc83bcb515c7388a8eed03a6a31ba693be8b425dd09ccdd5f41171ef8326a7aa2637cd84faedfced9c9ad7e4b4d7bc60551c6ea6af749')

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
