# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-config
pkgver=10.6.0
pkgrel=1
pkgdesc="parsing command line arguments and .ini style configuration files"
arch=('any')
url="https://pypi.org/project/oslo.config/"
license=('Apache-2.0')
depends=('python-netaddr' 'python-stevedore'
         'python-oslo-i18n' 'python-rfc3986' 'python-yaml' 'python-requests')
optdepends=('python-sphinx: for rst-generator')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pbr')
checkdepends=('python-testscenarios' 'python-stestr' 'python-testtools' 'python-oslotest'
              'python-oslo-log' 'python-requests-mock' 'python-sphinx')
options=('!emptydirs')
source=("git+https://github.com/openstack/oslo.config.git#tag=$pkgver")
sha512sums=('855900967f10673e701858e2d5ab0d5cf536111a5b3e7a50258bf8d23957ae3f976bd0864aabe38ec4e69a88cde959e4fc1d590f8c5a31ddba75fd9c81f80cf5')

build() {
  cd oslo.config
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.config
  stestr run
}

package() {
  cd oslo.config
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
