# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-api-core
pkgver=2.44.0
pkgrel=1
pkgdesc="Google API client core library"
arch=('any')
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-api-core"
license=('Apache-2.0')
depends=('python-pytz' 'python-requests' 'python-googleapis-common-protos' 'python-google-auth')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-grpcio: for grpc support')
source=("https://pypi.org/packages/source/g/google-api-core/google_api_core-${pkgver}.tar.gz")
sha256sums=('5ab9a396965c1227d7dea4581e562b7018aa2bca96d2de0be5eb70dc9c8ab3a1')

build() {
  cd "google_api_core-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "google_api_core-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
