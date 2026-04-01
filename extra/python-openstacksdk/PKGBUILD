# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-openstacksdk
pkgver=4.6.0
pkgrel=1
pkgdesc="An SDK for building applications to work with OpenStack"
arch=('any')
url="https://developer.openstack.org/sdks/python/openstacksdk"
license=('Apache-2.0')
depends=('python-cryptography' 'python-decorator' 'python-dogpile.cache' 'python-iso8601'
         'python-jmespath' 'python-jsonpatch' 'python-keystoneauth1' 'python-os-service-types'
         'python-pbr' 'python-platformdirs' 'python-psutil' 'python-typing_extensions'
         'python-yaml' 'python-requestsexceptions')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-ddt' 'python-fixtures' 'python-hacking' 'python-jsonschema'
              'python-oslo-config' 'python-oslotest' 'python-prometheus_client'
              'python-requests-mock' 'python-stestr' 'python-testscenarios' 'python-testtools')
source=("git+https://github.com/openstack/openstacksdk.git#tag=$pkgver")
sha512sums=('1a054caebb3c179575a320a57312e27d4874b19e4ae715b731c2d98419a69a68f6c9454958d6a3ed6b8613ce6219f9179630de69dae190f0aa1cbb39876dd1d8')

prepare() {
  cd openstacksdk

  # Fix Python 3.14 annotation introspection on Resource methods
  sed -i 's/data: list\[dict\[str, ty.Any\]\]/data: "list[dict[str, ty.Any]]"/' openstack/resource.py
  sed -i 's/) -> dict\[str, ty.Any\] | list\[ty.Any\]:/) -> "dict[str, ty.Any] | list[ty.Any]":/' openstack/resource.py
}

build() {
  cd openstacksdk
  python -m build --wheel --no-isolation
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
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
