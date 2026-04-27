# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-keystoneauth1
pkgver=5.13.1
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
sha512sums=('93a1c75bdfa93ed64b4e8f2f315f4f3f6d6a61fe1825851b8eb47aa3dafb57b2460f6a8feaa7993636f0c1769bac6120fd42a08f3df064afe3a6ad4641a4e62a')

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
