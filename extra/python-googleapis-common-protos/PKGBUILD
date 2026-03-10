# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=googleapis-common-protos
pkgname=python-$_name
pkgver=1.73.0
pkgrel=1
pkgdesc="Python classes generated from the common protos in the googleapis repository"
arch=('any')
url="https://github.com/googleapis/googleapis"
license=('Apache-2.0')
depends=('python-protobuf')
optdepends=('python-grpcio: for grpc support')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/googleapis/google-cloud-python/archive/refs/tags/$_name-v$pkgver.tar.gz")
sha256sums=('f3086396a85fc0c0e6fa44309e77186645ad38856dec3a82c079922e8cb2476a')

build() {
  cd google-cloud-$pkgname-v$pkgver/packages/$_name
  python -m build --wheel --no-isolation
}

package() {
  cd google-cloud-$pkgname-v$pkgver/packages/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl

  chmod -R +r "$pkgdir"
}
