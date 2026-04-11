# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-keystoneauth1
pkgver=5.12.0
pkgrel=1
pkgdesc="Authentication Library for OpenStack Identity"
arch=('any')
url="https://docs.openstack.org/developer/keystoneauth"
license=('Apache-2.0')
depends=('python-pbr' 'python-iso8601' 'python-stevedore' 'python-os-service-types' 'python-requests' 'python-typing_extensions')
optdepends=('python-requests-kerberos: for kerberos support'
            'python-lxml: for saml2 support'
            'python-oauthlib: for oauth1 support'
            'python-betamax: for betamax support'
            'python-fixtures: for betamax support'
            'python-yaml: for betamax support')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-hacking' 'python-oslo-config' 'python-oslo-utils' 'python-oslotest'
              'python-betamax' 'python-requests-mock' 'python-stestr' 'python-testresources'
              'python-testtools' 'python-yaml' 'python-requests-kerberos' 'python-lxml'
              'python-oauthlib')
source=("git+https://github.com/openstack/keystoneauth.git#tag=$pkgver")
sha512sums=('b661b5eadab07b385cbd9ac8dc77751d4f398414302c191cf0cd545a927f620860aa31953a45b7c586d3b757241f6b9469b31616d75aeb0f9bcd878a926e8806')

build() {
  cd keystoneauth
  python -m build --wheel --no-isolation
}

check() {
  cd keystoneauth
  stestr run --exclude-regex '(.*test_keystoneauth_betamax_fixture)'
}

package() {
  cd keystoneauth
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
