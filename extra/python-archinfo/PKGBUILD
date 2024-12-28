# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.134
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
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d722b7b51d5c9aa1751ad581cccdde82c1c5ad7096fdb9be87055346909c8a50bf1a2aa3b2d989377a83e00e4ba96da532f4e738ae3a8299d176172bd1a9fb85')
b2sums=('9c94bd96cb88cd40d2cdc0632de477c31e180ef34bfc7623b7fc6391da78297d4c75348b9fe1178f13635be90d152160bdf68961304fcf4f0e5a241c750674c3')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
