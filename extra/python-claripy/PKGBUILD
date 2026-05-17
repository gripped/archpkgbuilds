# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=claripy
pkgname=python-${_pyname}
pkgver=9.2.215
pkgrel=1
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
sha512sums=('231da5163ca4453559942fd39d8c8d3409e81a97bd2644c1e12df757c48f4fed0ae0058b10903060b889bd4f93b4607e179eb062e227c8059bf7b94cb21d7437')
b2sums=('2b8893312af9060621f1f06811deb3c2bec6b6bec298c446526b48ac057ff0ce2b15b0d46eeb719ab2129fb1fccc2df77e2e4aa6a883548c301656a78c9458e7')

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
