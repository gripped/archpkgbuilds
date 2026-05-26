# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.43
pkgrel=2
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
b2sums=('43a3f5aa1075de5b0834fbca3f8df1caed794db7af562003d02e661b93e3b80132288db025441510067021f5972c862d87d8489d7ce890676871c630e9f459cc')

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
