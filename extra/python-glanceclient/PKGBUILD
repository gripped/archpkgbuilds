# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-glanceclient
pkgver=4.3.0
pkgrel=1
pkgdesc="OpenStack Image API Client Library"
arch=('any')
url="https://docs.openstack.org/developer/python-glanceclient"
license=('Apache')
depends=('python-pbr' 'python-prettytable' 'python-keystoneauth1' 'python-requests' 'python-warlock'
         'python-oslo-utils' 'python-oslo-i18n' 'python-wrapt' 'python-pyopenssl')
makedepends=('python-setuptools')
checkdepends=('python-stestr' 'python-ddt' 'python-requests-mock' 'python-testscenarios')
options=('!emptydirs')
source=("https://github.com/openstack/python-glanceclient/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('54f6595b56b73dc2a9f366e1dcfd3a39f9dc0a433051ec874c1c02b3be9ee9d370a92cbfd58fd74a317439d969bcebb8dafaf1c93f289f2925e38bb67211da18')

export PBR_VERSION=$pkgver

build() {
  cd python-glanceclient-$pkgver
  python setup.py build
}

check() {
  cd python-glanceclient-$pkgver
  stestr run
}

package() {
  cd python-glanceclient-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
