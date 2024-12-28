# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-vobject
_name=${pkgname#python-}
pkgver=0.9.9
pkgrel=1
pkgdesc='Module for parsing and generating vCard and vCalendar files'
arch=(any)
url=http://py-vobject.github.io
license=(Apache-2.0)
depends=(
  python
  python-dateutil
  python-pytz
  python-six
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/py-vobject/vobject.git#tag=v$pkgver")
b2sums=('59b95bd5120aa8ef85a8394aa665271a0e3fc9c73dcf06d2df8c40984eef256166d96e4bd51aede90f2fee0d4328a6c3b64357f6c8c1c3a8caad407cc7f5fd64')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  python tests.py
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {ACKNOWLEDGEMENTS.txt,README.md} \
    -t "$pkgdir"/usr/share/$pkgname
}
