# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-keystoneauth1
pkgver=5.13.0
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
sha512sums=('970e833d8d8c39c4119f5c7f1aee2bee5c02dfe2334d137317fcef73e5c40cefa79c85a76e817270da886aa1c47bdcf4386adef51a6085c2cc545e075b99927d')

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
