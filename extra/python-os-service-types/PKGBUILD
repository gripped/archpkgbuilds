# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-os-service-types
pkgver=1.8.0
pkgrel=1
pkgdesc="Python library for consuming OpenStack sevice-types-authority data"
arch=('any')
url="https://pypi.python.org/pypi/os-service-types/$pkgver"
license=('Apache')
depends=('python-pbr')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-stestr' 'python-oslotest' 'python-testscenarios' 'python-requests-mock'
              'python-keystoneauth1' 'python-six')
options=('!emptydirs')
source=("git+https://github.com/openstack/os-service-types.git#tag=$pkgver")
sha512sums=('4ca875999d3dbf7143bf3cc2495a99413d8ac650c1b2622e91916eeb3b0d44ffaa02364be934ee67fafe0ec721e1a84a16a8c794185288c936dec5e27fe02fa2')

build() {
  cd os-service-types
  python -m build --wheel --no-isolation
}

check() {
  cd os-service-types
  stestr run
}

package() {
  cd os-service-types
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
