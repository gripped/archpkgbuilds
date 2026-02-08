# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=claripy
pkgname=python-${_pyname}
pkgver=9.2.197
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
sha512sums=('1c2605b1f6a6cc84fd63ded5f60b18be0ca55d25e7788596e94ee0466cc8a4db8e141ecbac25755edc625a7ffe4e0ac5a8799df6a2bd2ada652a1bb1fdcbb44d')
b2sums=('541e815665c3339c7f8556e7424b3ca6ba68fe3a12ccac52432ba9e5fcbe6022d622c4686ed94c22e8db1f2972ef9d3e65fd1276d338556df29154750b9f1d6f')

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
