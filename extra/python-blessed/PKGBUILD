# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.33
pkgrel=1
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
_tag=405113b7643f513f1625b1860301b3fa08430aef
source=(git+https://github.com/jquast/blessed.git#tag=${_tag})
b2sums=('7a799b7f509c7b02be311b3a0a9207d5e6a24f5efa5bb18b8d7bc7154d0054f4d2c1f0cb158c1660472ac6ff31ccea7ce7ef6045ecd1c859c968085c613e3dab')

pkgver() {
  cd blessed
  git describe --tags
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
