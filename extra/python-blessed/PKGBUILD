# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.21.0
pkgrel=2
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
  python-setuptools
)
checkdepends=(
  python-pytest
  python-pytest-rerunfailures
  python-pytest-xdist
)
_tag=e4554e12a5f33d7fd2236b1e2be976842c110e7c
source=(git+https://github.com/jquast/blessed.git#tag=${_tag})
b2sums=('02f61a32ba0a75346a7ad47856be614ce9f61396a0d743402fe7751fe4925b9f31c35e3fc4126a3a2621866892de19003ddbd3f8a9d12d5f7640a708ad5f0af1')

pkgver() {
  cd blessed
  git describe --tags
}

build() {
  cd blessed
  python setup.py build
}

check() {
  cd blessed
  pytest --override-ini="addopts="
}

package() {
  cd blessed
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-blessed/
}

# vim: ts=2 sw=2 et:
