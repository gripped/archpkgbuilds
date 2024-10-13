# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Chris Warrick <aur@chriswarrick.com>

_pkg=cloudpickle
pkgname=python-${_pkg}
pkgver=3.1.0
pkgrel=1
pkgdesc="Extended pickling support for Python objects"
arch=(any)
url="https://github.com/cloudpipe/cloudpickle"
license=(BSD)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-flit
    python-wheel
)
checkdepends=(
    python-pytest
    python-psutil
    python-tornado
    python-numpy
)
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('81a929b6e3c7335c863c771d673d105f02efdb89dfaba0c90495d1c64796601b')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH=. pytest .
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
