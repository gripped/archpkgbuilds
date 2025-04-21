# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-blessed
pkgver=1.20.0
pkgrel=8
pkgdesc='A thin, practical wrapper around terminal styling, screen positioning, and keyboard input'
arch=(any)
url=https://github.com/jquast/blessed
license=(MIT)
depends=(
  python
  python-six
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
_tag=d404d8ccde9ba900bc968c1213b915a691581603
source=(git+https://github.com/jquast/blessed.git#tag=${_tag})
b2sums=('194e081007d155eb7a27a3ab2d8243dd17d574f5da76844d30ea9d405167d5f248f5ff745b11f397a4446a3444f26499151654a95a6cf85277c8a2b1e8c04cf8')

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
