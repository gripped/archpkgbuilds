# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-api-core
pkgver=2.17.1
pkgrel=1
pkgdesc="Google API client core library"
arch=('any')
url="https://github.com/googleapis/googleapis"
license=('Apache')
depends=('python-pytz' 'python-requests' 'python-googleapis-common-protos' 'python-google-auth')
makedepends=('python-setuptools')
optdepends=('python-grpcio: for grpc support')
source=("https://files.pythonhosted.org/packages/source/g/google-api-core/google-api-core-${pkgver}.tar.gz")
sha256sums=('9df18a1f87ee0df0bc4eea2770ebc4228392d8cc4066655b320e2cfccb15db95')

build() {
  cd "google-api-core-${pkgver}"
  python setup.py build
}

package() {
  cd "google-api-core-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  chmod -R a+r "$pkgdir"/usr/lib/python*/site-packages/google_api_core*.egg-info/
}
