# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-config
pkgver=9.7.0
pkgrel=1
pkgdesc="parsing command line arguments and .ini style configuration files"
arch=('any')
url="https://pypi.python.org/pypi/oslo.config/$pkgver"
license=('Apache-2.0')
depends=('python-debtcollector' 'python-netaddr' 'python-stevedore'
         'python-oslo-i18n' 'python-rfc3986' 'python-yaml' 'python-requests')
optdepends=('python-sphinx: for rst-generator')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pbr')
checkdepends=('python-testscenarios' 'python-stestr' 'python-testtools' 'python-oslotest'
              'python-oslo-log' 'python-requests-mock' 'python-sphinx')
options=('!emptydirs')
source=(
  "git+https://github.com/openstack/oslo.config.git#tag=$pkgver"
  "$pkgname-python-3.14.patch"
)
sha512sums=('85eb31f8d7a0f50bb5b141becdbd797db58187750b8a36e8304fefe019802924f9ee4c5d3fd33c398d5372b3342ca3de8e2997bd91a4c6a73852cc5852fb940f'
            '84c6db3076dcd0190f467313efb3df66925bdf0c3db377bf118564af341304eaae0799aaa746058549b9c6cef4199daf5b8c272d29ffb534432411863dcfb5d5')

prepare() {
  cd oslo.config

  patch -Np1 < ../$pkgname-python-3.14.patch
}

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
