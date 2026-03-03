# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-keystoneauth1
pkgver=5.8.1
pkgrel=1
pkgdesc="Authentication Library for OpenStack Identity"
arch=('any')
url="https://docs.openstack.org/developer/keystoneauth"
license=('Apache-2.0')
depends=('python-pbr' 'python-iso8601' 'python-stevedore' 'python-os-service-types' 'python-requests')
optdepends=('python-requests-kerberos: for kerberos support'
            'python-lxml: for saml2 support'
            'python-oauthlib: for oauth1 support'
            'python-betamax: for betamax support'
            'python-fixtures: for betamax support')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-hacking' 'python-oslo-config' 'python-oslo-utils' 'python-oslotest'
              'python-betamax' 'python-requests-mock' 'python-stestr' 'python-testresources'
              'python-testtools' 'python-yaml' 'python-requests-kerberos' 'python-lxml'
              'python-oauthlib')
source=("git+https://github.com/openstack/keystoneauth.git#tag=$pkgver")
sha512sums=('23daddcc4e0009cd256b0fbb8ecf9010a57b69ae643acb4f4d8a3b4dfedc1736e89d7a2d2de9f35a9fd91e6b647fc102a2bda17734947d7e5e8a04ee88bb32f4')

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
