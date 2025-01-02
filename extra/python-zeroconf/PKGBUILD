# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.136.2
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL-2.1-or-later')
depends=('python' 'python-ifaddr' 'python-async-timeout')
makedepends=('python-setuptools' 'python-build' 'python-installer'
             'python-wheel' 'python-poetry-core' 'cython')
checkdepends=('python-pytest')
source=($pkgname-$pkgver.tar.gz::https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('787277bc1f4ed398f3d8e8bd1a1de8df343eb4e949585a6105fe819542e45774')

build() {
  cd "${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd "${pkgbase}-${pkgver}"
  pytest tests \
    --override-ini="addopts=" \
    --deselect tests/services/test_types.py::test_integration_with_listener_ipv6
}

# vim:set ts=2 sw=2 et:
