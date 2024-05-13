# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mako
_pkgname=${pkgname#python-}
pkgver=1.3.3
_pkgver=rel_${pkgver//./_}
pkgrel=3
pkgdesc="A template library written in Python"
arch=(any)
url="https://github.com/sqlalchemy/mako"
license=(MIT)
depends=(
  python
  python-markupsafe
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  # python-lingua isn't packaged
  python-babel
  python-beaker
  python-dogpile.cache
  python-pygments
  python-pytest
)
optdepends=(
  'python-babel: for i18n features'
  'python-beaker: for caching support'
  'python-dogpile.cache: for caching support'
  'python-pygments: for syntax highlighting'
  'python-pytest: for testing utilities'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha512sums=('d8ffb04d935f47b6559e29cb22337b99c63bb6f5daeedc728d8046b772320f0baed8608bb9d36e1bc69243017a4e9e0c3d4317c98477b416a7beaabb8483983e')

_archive="$_pkgname-$_pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
