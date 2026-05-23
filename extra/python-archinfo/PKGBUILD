# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.217
pkgrel=1
pkgdesc='Classes with architecture-specific information useful to other projects'
url='https://github.com/angr/archinfo'
arch=('any')
license=(BSD-2-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
optdepends=(
  python-capstone
  python-unicorn
  python-keystone
  python-pyvex
  python-pypcode
)
checkdepends=(
  python-pytest
  python-pytest-xdist
  python-pypcode
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f9834d70428b0d0250ff15d741ed03f8ff5289b73ce0974725bf9c1e5a53d03f023086ae7f15cfde4ee0e5a4f77b60ee040efd530a329fdbdbe4ef7eacc70605')
b2sums=('5243e46cf320b62609afce7524deb5d1d32ada59f500d53549ffe91aa269c0364b75fe69eb536d5c8b42b0db33bcc69e53fc304007fe445a346830c64c647575')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pyname}-${pkgver}"
  python -m venv --system-site-packages .venv
  .venv/bin/python -m installer dist/*.whl
  .venv/bin/python -m pytest tests
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
