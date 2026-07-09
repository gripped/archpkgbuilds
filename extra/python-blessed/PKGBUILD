# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.46
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
b2sums=('987d6fc76cd342f29fe9c228c367174ceb8e62a304045aff7291dfd99cdc7f584315b655564c391f6f5749cbcce767dcdc5c7883279acc2bab7365845f27c025')

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
