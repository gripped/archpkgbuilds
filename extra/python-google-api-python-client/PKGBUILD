# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: shadyabhi <abhijeet.1989@gmail.com>

pkgname=python-google-api-python-client
pkgver=2.198.0
pkgrel=1
pkgdesc="Google API Client Library for Python"
arch=('any')
url="https://github.com/google/google-api-python-client"
license=('Apache-2.0')
depends=('python-google-api-core' 'python-google-auth-httplib2' 'python-httplib2' 'python-uritemplate')
optdepends=('python-oauth2client: optional backend')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("google-api-python-client-${pkgver}.tar.gz::https://github.com/google/google-api-python-client/archive/v${pkgver}.tar.gz")
sha256sums=('ebef5002d1d95072bc6e650e0ab8075aebb4b239a5bed3638effda2195588075')

build() {
  cd "google-api-python-client-${pkgver}"
  python -m build --wheel --no-isolation
}
 
package() {
  cd "google-api-python-client-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
