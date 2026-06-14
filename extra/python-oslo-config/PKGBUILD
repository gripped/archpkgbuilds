# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-config
pkgver=10.5.0
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
sha512sums=('41d66eb891f300ba69fbea4653b0f85bf6a2c29f057c4f481480478221e195c1865e86c02264ca43e78021624388623ce91a33f168251690b7645f4c00be6f1e')

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
