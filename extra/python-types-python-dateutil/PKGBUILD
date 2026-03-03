# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Achmad Fathoni <fathoni.id(at)gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_name=types_python_dateutil
pkgname=python-${_name//_/-}
pkgver=2.9.0.20260302
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
b2sums=('cf702e53ba1422ed18b51f408687f461fd01bfd3fa12db9031a4a3c04b450eb68e7dede845c2f1a044ab620eb412d6a0e9e4a567d2c3cee5f38d9a806a37dfc4')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
