# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-ujson
_pkgname=ultrajson
pkgver=5.12.1
pkgrel=1
pkgdesc="Ultra fast JSON encoder and decoder for Python"
url="https://github.com/ultrajson/ultrajson"
arch=('x86_64')
license=('BSD')
depends=('python')
makedepends=(python-setuptools-scm python-wheel python-build python-installer)
checkdepends=('python-pytest')
source=(https://github.com/ultrajson/ultrajson/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('2cc096d767d2aebab36da95a5c2cbf9fe78f19e9ab231d40c9bf65ccef9d29ce9bf25377b47a2b4974bf9be8acf06f76e144c45c7eda7e23ce750cca4242f345')
b2sums=('8e9c1dfed99f417ebfd34d277c84f0eb406a31c811ff0f263b93cdd7b02d5ca9b8f1ff150b8c8c9cdaaa9745fe3df16ce7ff106e0d32e4ec538df1b21846540a')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  local PYTHONVERSION="$(python -c 'import sys; print("{}{}".format(sys.version_info.major, sys.version_info.minor))')"
  PYTHONPATH="build/lib.linux-${CARCH}-cpython-${PYTHONVERSION}" pytest
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
