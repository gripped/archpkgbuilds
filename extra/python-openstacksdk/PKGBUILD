# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-openstacksdk
pkgver=1.3.0
_commit=377d734de09f3ce3f0a413dd4d4e452e3c248562
pkgrel=1
pkgdesc="An SDK for building applications to work with OpenStack"
arch=('any')
url="https://developer.openstack.org/sdks/python/openstacksdk"
license=('Apache')
depends=('python-pbr' 'python-yaml' 'python-appdirs' 'python-requestsexceptions' 'python-jsonpatch'
         'python-os-service-types' 'python-keystoneauth1' 'python-decorator' 'python-jmespath'
         'python-iso8601' 'python-netifaces' 'python-dogpile.cache' 'python-cryptography')
makedepends=('git' 'python-setuptools')
checkdepends=('python-hacking' 'python-ddt' 'python-fixtures' 'python-jsonschema'
              'python-prometheus_client' 'python-oslo-config' 'python-oslotest'
              'python-requests-mock' 'python-stestr' 'python-testscenarios' 'python-testtools')
source=("git+https://github.com/openstack/openstacksdk.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd openstacksdk
  python setup.py build
}

check() {
  # From https://github.com/openstack/openstacksdk/blob/master/tox.ini
  export OS_LOG_CAPTURE=true OS_STDOUT_CAPTURE=true OS_STDERR_CAPTURE=true

  cd openstacksdk
  # TODO: package statsd
  stestr run || echo "Tests failed"
}

package() {
  cd openstacksdk
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
