# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python-lsp-black
pkgver=2.0.0
pkgrel=1
pkgdesc="python-lsp-server plugin that adds support to black autoformatter, forked from pyls-black"
arch=(any)
url="https://github.com/python-lsp/python-lsp-black"
license=(MIT)
depends=(python-black python-lsp-server)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('6387584c38e5758431f5d61c269860892f57b7442c0cf9bd712ad64231b9bb1c')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python setup.py install --skip-build
  test-env/bin/python -m pytest -vv --color=yes tests
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
