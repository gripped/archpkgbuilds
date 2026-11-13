# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Letu Ren <fantasquex at gmail dot com>

_pyname=pyxbe
pkgname=python-${_pyname}
pkgver=1.0.4
pkgrel=1
pkgdesc='Library to work with XBE files, the executable file format for the original Xbox game console'
url='https://github.com/mborgerson/pyxbe'
arch=(any)
license=(MIT)
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
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha512sums=('cf4025cd4589cf8e9813ded7fecd810d8b28d6e0f047a4d8db0def6637dac38955f485335787a407b6d3baaa2f6ccb5855e814a38f4daff113d69fe0a5a362db')
b2sums=('7a134fb06150e52f6eac9183477610bb0496811180eafef9c87ba7215f511c9550efdab4721575b3ff48247d60f23d597d2d1726127097c8798626da7e7897b9')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}-${pkgver}/tests
  PYTHONPATH="${PWD}/../build/lib" pytest
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
