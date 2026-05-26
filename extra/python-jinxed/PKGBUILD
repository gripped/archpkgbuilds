# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-jinxed
pkgver=2.0.4
pkgrel=1
pkgdesc='A curses replacement for Windows and Unix-like systems'
arch=(any)
url=https://github.com/Rockhopper-Technologies/jinxed
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(git+https://github.com/Rockhopper-Technologies/jinxed.git#tag=${pkgver})
b2sums=('a5e10c52224935739a01510116f24bacb422c7339293a38f64d5fed27dd6bc9b5365c71aa2ee72bb156c651202b2d5954b7b5b88221d9c9cbeb4fac39e6bad56')

build() {
  cd jinxed
  python -m build --wheel --no-isolation
}

package() {
  cd jinxed
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/python-jinxed/"
}
