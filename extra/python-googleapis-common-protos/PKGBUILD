# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=googleapis-common-protos
pkgname=python-$_name
pkgver=1.73.1
pkgrel=1
pkgdesc="Python classes generated from the common protos in the googleapis repository"
arch=('any')
url="https://github.com/googleapis/googleapis"
license=('Apache-2.0')
depends=('python-protobuf')
optdepends=('python-grpcio: for grpc support')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/googleapis/google-cloud-python/archive/refs/tags/$_name-v$pkgver.tar.gz")
sha256sums=('eb2708c651b1b8d20c16f8eaefa9ccb4e18cb0fc70a4851e1e2de65fb8b0854d')

build() {
  cd google-cloud-$pkgname-v$pkgver/packages/$_name
  python -m build --wheel --no-isolation
}

package() {
  cd google-cloud-$pkgname-v$pkgver/packages/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl

  chmod -R +r "$pkgdir"
}
