# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.25
pkgrel=3
pkgdesc='A thin, practical wrapper around terminal styling, screen positioning, and keyboard input'
arch=(any)
url=https://github.com/jquast/blessed
license=(MIT)
depends=(
  python
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
_tag=864a8f7d6de752d7fede2c030758d245f1bb8e21
source=(git+https://github.com/jquast/blessed.git#tag=${_tag})
b2sums=('abd1bc99026547ce266e03554f685f07fa446964f92dbab99fc7a42321baed3ce96a7b1db3ce34369d861c0e96ae20939b57641fae43facb5a4faaa1a6e95c56')

pkgver() {
  cd blessed
  git describe --tags
}

prepare() {
  cd blessed
  git cherry-pick -n e4ec8f00033c99719171074010331457d227cd1b cee680ff7fb3ad31f42ae98582ba74629f1fd6b0 # Fix tests
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
