# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-config
pkgver=10.4.0
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
sha512sums=('6b18da2b9c1701f38e6370ed4824b0b6fca8eedd8e34298b7374f6cb0411d484119807b9fd1ae227329a1d122a4646d1765976496a2abbd5578289cb5302c027')

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
