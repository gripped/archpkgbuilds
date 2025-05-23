# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.147.0
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL-2.1-or-later')
depends=('python' 'python-ifaddr')
makedepends=('python-setuptools' 'python-build' 'python-installer'
             'python-wheel' 'python-poetry-core' 'cython')
checkdepends=('python-pytest')
source=($pkgname-$pkgver.tar.gz::https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('6f47281790eb4a013abb613a8c22bdaf9e2ce8e1a667106b65ab36252d8793d7')

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
    --ignore tests/benchmarks \
    --deselect tests/services/test_types.py::test_integration_with_listener_ipv6
}

# vim:set ts=2 sw=2 et:
