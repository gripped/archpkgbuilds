# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-s3transfer
pkgver=0.12.0
pkgrel=1
pkgdesc='Amazon S3 Transfer Manager for Python'
arch=('any')
url="https://github.com/boto/s3transfer"
license=('Apache-2.0')
depends=(
  'python'
  'python-botocore'
)
makedepends=(
  'python-awscrt'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=('python-awscrt: use AWS Common Runtime')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d090d03bc9abad5df5201e1ec1a0372965230f4beb9e4b34f69d2e634fde07ea')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  # Many integration tests need real credentials
  pytest tests --ignore=tests/integration
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
