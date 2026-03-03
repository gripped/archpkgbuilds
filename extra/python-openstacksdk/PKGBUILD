# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-openstacksdk
pkgver=4.1.0
pkgrel=1
pkgdesc="An SDK for building applications to work with OpenStack"
arch=('any')
url="https://developer.openstack.org/sdks/python/openstacksdk"
license=('Apache')
depends=('python-cryptography' 'python-decorator' 'python-dogpile.cache' 'python-iso8601'
         'python-jmespath' 'python-jsonpatch' 'python-keystoneauth1' 'python-netifaces'
         'python-os-service-types' 'python-pbr' 'python-platformdirs' 'python-yaml'
         'python-requestsexceptions')
makedepends=('git' 'python-setuptools')
checkdepends=('python-ddt' 'python-fixtures' 'python-hacking' 'python-jsonschema'
              'python-oslo-config' 'python-oslotest' 'python-prometheus_client'
              'python-requests-mock' 'python-stestr' 'python-testscenarios' 'python-testtools')
source=("git+https://github.com/openstack/openstacksdk.git#tag=$pkgver")
sha512sums=('3490661cdb91012c85e240dc3f1da6e430b75de3254111cfa2c6b9a5c43de2be48d4cf99abd7e1710a15790b7dece6e2364e1764adbb2290908870e32e411148')

build() {
  cd openstacksdk
  python setup.py build
}

check() {
  # From https://github.com/openstack/openstacksdk/blob/master/tox.ini
  export OS_LOG_CAPTURE=true OS_STDOUT_CAPTURE=true OS_STDERR_CAPTURE=true

  # Deprecationwarnings break the tests, so we exclude these tests
  # TestConnection.test_create_unknown_proxy and test_unsupported_version_override
  # test_ost_version checks if os-service-types is at the latest version, but we use the latest available

  cd openstacksdk
  # TODO: package statsd?
  stestr run --exclude-regex "openstack.tests.unit.test_stats.TestStats|test_unsupported_version_override|TestConnection.test_create_unknown_proxy|test_ost_version"
}

package() {
  cd openstacksdk
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
