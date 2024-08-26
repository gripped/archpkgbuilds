# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-keystoneauth1
pkgver=5.7.0
pkgrel=1
pkgdesc="Authentication Library for OpenStack Identity"
arch=('any')
url="https://docs.openstack.org/developer/keystoneauth"
license=('Apache')
depends=('python-pbr' 'python-iso8601' 'python-stevedore' 'python-os-service-types' 'python-requests')
optdepends=('python-requests-kerberos: for kerberos support'
            'python-lxml: for saml2 support'
            'python-oauthlib: for oauth1 support'
            'python-betamax: for betamax support'
            'python-fixtures: for betamax support')
makedepends=('git' 'python-setuptools')
checkdepends=('python-hacking' 'python-oslo-config' 'python-oslo-utils' 'python-oslotest'
              'python-betamax' 'python-requests-mock' 'python-stestr' 'python-testresources'
              'python-testtools' 'python-yaml' 'python-requests-kerberos' 'python-lxml'
              'python-oauthlib')
source=("git+https://github.com/openstack/keystoneauth.git#tag=$pkgver")
sha512sums=('43ac1e85d7d55e5b43ad030cd127534a5e351c81f1ce6b75773b4f014058bafa32f129862d891a13a4280d12ec3c350c2eaa64e4d53c9f17d53a39595cc1ab97')

build() {
  cd keystoneauth
  python setup.py build
}

check() {
  cd keystoneauth
  stestr run
}

package() {
  cd keystoneauth
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
