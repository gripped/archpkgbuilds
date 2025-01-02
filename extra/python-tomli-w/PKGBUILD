# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-tomli-w
pkgver=1.1.0
pkgrel=1
pkgdesc="A lil' TOML writer"
url=https://github.com/hukkin/tomli-w
license=(MIT)
arch=(any)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-pytest
  python-tomli
)
_tag=179105660c367874818f2cdd1e06ed98eea668f1
source=(git+https://github.com/hukkin/tomli-w.git#tag=${_tag})
b2sums=('e466f80759c30cd0e3a08c680f78f7bf1a52166555b43b6c0d62686bbb9dcbf4cba1b987d6815910c2fa1da96fd497fb5037f5351f7eda7fd6db981f04afab95')

pkgver() {
  cd tomli-w
  git describe --tags
}

build() {
  cd tomli-w
  python -m build --wheel --no-isolation
}

check() {
  cd tomli-w
  PYTHONPATH="src:$PYTHONPATH" python -m pytest
}

package() {
  python -m installer --destdir="${pkgdir}" tomli-w/dist/*.whl
  install -Dm 644 tomli-w/LICENSE -t "${pkgdir}"/usr/share/licenses/python-tomli-w/
}

# vim: ts=2 sw=2 et:
