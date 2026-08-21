# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: shadyabhi <abhijeet.1989@gmail.com>

pkgname=python-google-api-python-client
pkgver=2.199.0
pkgrel=1
pkgdesc="Google API Client Library for Python"
arch=('any')
url="https://github.com/google/google-api-python-client"
license=('Apache-2.0')
depends=('python-google-api-core' 'python-google-auth-httplib2' 'python-httplib2' 'python-uritemplate')
optdepends=('python-oauth2client: optional backend')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("google-api-python-client-${pkgver}.tar.gz::https://github.com/google/google-api-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('50f7e953d05d3f3b42fa7453e7b3c5fb5d2d33e5ced77a466d02c91a6b8d365f')

build() {
  cd "google-api-python-client-${pkgver}"
  python -m build --wheel --no-isolation
}
 
package() {
  cd "google-api-python-client-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
