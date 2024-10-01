# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-vobject
_name=${pkgname#python-}
pkgver=0.9.8
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
b2sums=('e3a0337ad053da91282b8d57f0f1ea614974de299538c98605e1f8b90e8cdfbc11f8843648eac69341891e9794a27417981f85a3d8e47edf07a5e26425d41040')

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
