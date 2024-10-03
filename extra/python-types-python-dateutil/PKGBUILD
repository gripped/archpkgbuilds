# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Achmad Fathoni <fathoni.id(at)gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-types-python-dateutil
_name=${pkgname#python-}
pkgver=2.9.0.20241003
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
b2sums=('5acdd917e2c20e8d1f1644e3f15736022d81b2da793bdef191f1c8633e527a5ac6bdd68bf6dbd9312a5923aa0123c5ae7e9f949bf2d47eb51a64e961a6acfb12')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
