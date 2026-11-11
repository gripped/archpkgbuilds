# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

_pyname=arpy
pkgname=python-${_pyname}
pkgver=2.4.0
pkgrel=1
pkgdesc='Library for accessing ar files'
url='https://github.com/viraptor/arpy'
arch=(any)
license=(BSD-2-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-cov
)
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('305260fdcb4666b0a331f82be9db2c33e5b8a3cbb22a7adf46c2b82f263d37c536c442e6bd2a2c2d5a9633674ab166da0ae590abe6eaf818c5326db2b7ba6d4e')
b2sums=('405832888fe2c703ecf6c0e0b17a8763acd597db63dad2b889fd07001cba0fe6777e8651832f0e39a7732a2842993413d9d6a6de5bd67b3a125ff19e62bfc2ca')

prepare() {
  cd ${_pyname}-${pkgver}
  head -n30 arpy.py > LICENSE
}

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}-${pkgver}
  PYTHONPATH=build/lib pytest
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
