# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-arrow
pkgver=1.4.0
pkgrel=3
pkgdesc='Better dates and times for Python'
arch=(any)
url=https://arrow.readthedocs.io
license=(Apache-2.0)
depends=(
  python
  python-dateutil
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytz
  python-simplejson
)
source=(git+https://github.com/arrow-py/arrow.git#tag=$pkgver)
b2sums=('53a5d9a7f966fe7d3cd1b188e4f46d30faffa1951967f1e60c423ae149ef9dfbe49d9425bf1b090f90dfa03e7d9aeb506c148e9d4c17ec1fa5f5bb1904be34aa')

prepare() {
  cd arrow
  # Remove upper bound on flit-core allowing version 4
  sed -i 's/,<4//' pyproject.toml
}

build() {
  cd arrow
  python -m build --wheel --no-isolation
}

check() {
  cd arrow
  pytest -vv -o addopts=''
}

package() {
  python -m installer --destdir="${pkgdir}" arrow/dist/*.whl
}

# vim: ts=2 sw=2 et:
