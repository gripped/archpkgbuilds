# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-os-service-types
pkgver=1.8.1
pkgrel=1
pkgdesc="Python library for consuming OpenStack sevice-types-authority data"
arch=('any')
url="https://pypi.python.org/pypi/os-service-types/$pkgver"
license=('Apache-2.0')
depends=('python-pbr' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-stestr' 'python-oslotest' 'python-testscenarios' 'python-requests-mock'
              'python-keystoneauth1' 'python-six')
options=('!emptydirs')
source=("git+https://github.com/openstack/os-service-types.git#tag=$pkgver")
sha512sums=('869bf5f8018b503f83ca8a1326c8ebf6ebfc95e1b384642faa525022cd2e94cf541fd6088ba85aa7ad0c7133ea8449e6545204d580fdfac4106a2a28fca2fde0')

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
