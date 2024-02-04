# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-extra-types
pkgname=python-pydantic-extra-types
pkgver=2.5.0
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
sha512sums=('873efb8173944dd3826f19f168268c4df313eeae991725c6df6404d5649478df2d405042e4e696f1e5278a124c3eec8f0809396353ad295e2f86284c30863746')
b2sums=('38881a5b9e31b26fc171c18798983c5aa086335d3052c4d9fa95acb7a582db95511b85b567265165a1c4af02810e408e5477513520058ab018d55d0c8a9105af')

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
