# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Achmad Fathoni <fathoni.id(at)gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_name=types_python_dateutil
pkgname=python-${_name//_/-}
pkgver=2.9.0.20260518
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
b2sums=('f6ef79697cb7a225c155753490433dcb831d31d580953d8c364662d94a3e250ff3d5f7a2c23ca592b1da8abd76a66e32a207f126feda7b356b460906bc1aab1e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
