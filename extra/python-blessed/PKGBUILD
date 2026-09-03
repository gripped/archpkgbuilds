# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.49
pkgrel=1
pkgdesc='A thin, practical wrapper around terminal styling, screen positioning, and keyboard input'
arch=(any)
url=https://github.com/jquast/blessed
license=(MIT)
depends=(
  python
  python-jinxed
  python-wcwidth
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-rerunfailures
  python-pytest-xdist
)
source=(git+https://github.com/jquast/blessed.git#tag=${pkgver})
b2sums=('a0e40b344835f7e4ca72f2cd01e28bd2ee4dfdfbc4df74e5f2ea67979f36eb7d8034182ec890a9eb15ab89eebbd0ce955f01328b12e20560bca76619a4733578')

prepare() {
  cd blessed
  # flit-core 4 dropped compatibility; bump upper bound so we can build
  sed -i 's/flit_core >=3.11,<4/flit_core >=3.11/' pyproject.toml
}

build() {
  cd blessed
  python -m build --wheel --no-isolation
}

check() {
  cd blessed
  pytest --override-ini="addopts="
}

package() {
  python -m installer --destdir="${pkgdir}" blessed/dist/*.whl
  install -Dm 644 blessed/LICENSE -t "${pkgdir}"/usr/share/licenses/python-blessed/
}

# vim: ts=2 sw=2 et:
