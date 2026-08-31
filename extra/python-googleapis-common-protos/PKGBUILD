# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=googleapis-common-protos
pkgname=python-$_name
pkgver=1.75.2
pkgrel=1
pkgdesc="Python classes generated from the common protos in the googleapis repository"
arch=('any')
url="https://github.com/googleapis/googleapis"
license=('Apache-2.0')
depends=('python' 'python-protobuf')
optdepends=('python-grpcio: for grpc support')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/googleapis/google-cloud-python/archive/refs/tags/$_name-v$pkgver.tar.gz")
sha256sums=('2d96e23075535b7169caebd83dca556121c5643070bafd77208269dbb0c147fd')

build() {
  cd google-cloud-$pkgname-v$pkgver/packages/$_name
  python -m build --wheel --no-isolation
}

check() {
  cd google-cloud-$pkgname-v$pkgver/packages/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests/unit
}

package() {
  cd google-cloud-$pkgname-v$pkgver/packages/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl

  chmod -R +r "$pkgdir"
}
