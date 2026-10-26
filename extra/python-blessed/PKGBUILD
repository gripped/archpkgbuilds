# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.52
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
b2sums=('d734c423d862445f879d041d27a3924dd19faf13d77036373430e9700e0819f9d02fa491e5acf9d079a8df8da6f1db43da2bf417c4f590a837d50e3227f993a1')

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
