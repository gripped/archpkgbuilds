# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-glanceclient
pkgver=4.10.0
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
source=("git+https://github.com/openstack/python-glanceclient.git#tag=$pkgver"
         0001-Fix-bytes-related-test-failures-with-urllib-3.patch)
sha512sums=('1d66a17fff810e19e17e2aa800b0efd642f8dc1031c0f30022735963f1228e1a3192143e1a7c214fc39a7ab29d785944a6defa3249c02d68b06a9872121ba2b2'
            '7d97c196adbd5ca5de6dbee12f25abd8e22394e81594180103fc0bd3e4a968f2d76b4943400f28805c4dbef5c2e0147953da699308b8997a50bc92643ae6416e')

prepare() {
  cd python-glanceclient
  # https://review.opendev.org/c/openstack/python-glanceclient/+/922179/2
  patch -p1 -i ../0001-Fix-bytes-related-test-failures-with-urllib-3.patch
}

build() {
  cd python-glanceclient
  python -m build --wheel --no-isolation
}

check() {
  cd python-glanceclient
  # TODO: Failing ssl tests starting 3.12, needs further investigation
  stestr run --exclude-regex 'glanceclient.tests.unit.test_ssl'
}

package() {
  cd python-glanceclient
  python -m installer --destdir="$pkgdir" dist/*.whl
}
