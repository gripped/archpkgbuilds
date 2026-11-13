# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=claripy
pkgname=python-${_pyname}
pkgver=9.3.7
pkgrel=2
pkgdesc='Abstraction layer for constraint solvers'
url='https://github.com/angr/claripy'
license=(BSD-2-Clause)
arch=(any)
depends=(
  python
  python-cachetools
  python-typing_extensions
  python-z3-solver
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-xdist
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f8d9d9b0b6697f8fc0cc40523180ece79ca3da1cf2b78efc5981dca2d3f162bc9932998bcbf3f01e43de005ebe783e24a843606b0ec007e9034a8097cd824b59')
b2sums=('e045cbfb1968d311caabce54736832e568ce572524ae6536509ca480c8e67373279ab4d4b6f42e8c02f0ac2ed5b689b0b1c3be77dbc65a65772e0816c408af08')

prepare() {
  cd ${_pyname}-${pkgver}
  # we don't support version pinning
  sed -e 's/==/>=/g' -i pyproject.toml
  # we don't support post-release and developmental-release
  sed -e 's/\.\(post\|dev\)[0-9]*//g' -i pyproject.toml
}

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}-${pkgver}
  PYTHONPATH=build/lib pytest "${pytest_options[@]}"
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
