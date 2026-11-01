# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Achmad Fathoni <fathoni.id(at)gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_name=types_python_dateutil
pkgname=python-${_name//_/-}
pkgver=2.9.0.20261029
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=(any)
url="https://pypi.org/project/types-python-dateutil/"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('23e7b3c5452199fc6e2738a38204eec10c30513524aa5d44d585346c5485537f3bfc009cac9152b66e7500b6551928c74838cac4e106626aed44391c312c28e7')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
