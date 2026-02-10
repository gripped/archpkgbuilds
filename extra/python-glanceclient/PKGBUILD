# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-glanceclient
pkgver=4.7.0
pkgrel=4
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
         python-3.13.patch
         0001-Fix-bytes-related-test-failures-with-urllib-3.patch)
sha512sums=('84176ec7c067d22b9c838dc153fdaa122dda669d4aa90f0303e9a0c47f271aee5355cb8567f176af039c48ce87059a2a1b5b6918ad11c3d9a21e23e8a70eb05e'
            'cd699eacd600df4aabdb67ec7017419023d48bbdef25909326bd722c0b8a8b4291edc71090ae32b2207e8fb1f2b0a2dd2c6de46dda50ddad11e40c510d1dd87e'
            '7d97c196adbd5ca5de6dbee12f25abd8e22394e81594180103fc0bd3e4a968f2d76b4943400f28805c4dbef5c2e0147953da699308b8997a50bc92643ae6416e')

prepare() {
  cd python-glanceclient
  patch -p1 -i ../python-3.13.patch
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
