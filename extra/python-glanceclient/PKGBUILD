# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-glanceclient
pkgver=4.12.0
pkgrel=1
pkgdesc="OpenStack Image API Client Library"
arch=('any')
url="https://docs.openstack.org/developer/python-glanceclient"
license=('Apache-2.0')
depends=('python-pbr' 'python-prettytable' 'python-keystoneauth1' 'python-requests' 'python-warlock'
         'python-oslo-utils' 'python-oslo-i18n' 'python-wrapt' 'python-pyopenssl')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-stestr' 'python-ddt' 'python-requests-mock' 'python-testscenarios')
options=('!emptydirs')
source=("git+https://github.com/openstack/python-glanceclient.git#tag=$pkgver")
sha512sums=('0efa51eb0267e94c80b12f49796612abf6679bde1b95c89694881ef783adb01ab04a42c3da53b9c6cfe81e4d1139f664fff03f341904cdcd2455da750e367a37')

build() {
  cd python-glanceclient
  python -m build --wheel --no-isolation
}

check() {
  cd python-glanceclient
  stestr run
}

package() {
  cd python-glanceclient
  python -m installer --destdir="$pkgdir" dist/*.whl
}
