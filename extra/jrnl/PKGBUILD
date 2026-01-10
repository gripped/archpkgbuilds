# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=jrnl
pkgver=4.2.1
pkgrel=2
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-colorama'
  'python-cryptography'
  'python-dateutil'
  'python-keyring'
  'python-parsedatetime'
  'python-pyxdg'
  'python-rich'
  'python-ruamel-yaml'
  'python-tzlocal'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pytest'
  'python-pytest-bdd'
  'python-pytest-xdist'
  'python-toml'
)
_url=https://github.com/jrnl-org/jrnl
source=("$_url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('dd2a1aebb336f1457415bbb43a8338357db3c70a1f021486af4d8e567c6384f3e8c0c815e7bf713db9d0d61cf230d67528d4d03ce1aec692b7a8c963728c2ce8')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  # Deselected test fails with Python 3.14
  pytest --deselect=tests/bdd/test_features.py::test_override_configured_linewrap_with_a_value_of_23
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
