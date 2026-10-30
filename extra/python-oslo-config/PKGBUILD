# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-config
pkgver=10.8.0
pkgrel=1
pkgdesc="parsing command line arguments and .ini style configuration files"
arch=('any')
url="https://pypi.org/project/oslo.config/"
license=('Apache-2.0')
depends=('python-netaddr' 'python-pbr' 'python-stevedore'
         'python-oslo-i18n' 'python-rfc3986' 'python-yaml' 'python-requests')
optdepends=('python-sphinx: for rst-generator')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-testscenarios' 'python-stestr' 'python-testtools' 'python-oslotest'
              'python-oslo-log' 'python-requests-mock' 'python-sphinx')
options=('!emptydirs')
source=("git+https://github.com/openstack/oslo.config.git#tag=$pkgver")
sha512sums=('c66f24761d70d3d611a25a76cdb90a334094b399a281cdd9f2827d1c0864350199390f79eca5b3e684da203255f000c61ef801d5175153f86d29196f30fc3ff0')

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
