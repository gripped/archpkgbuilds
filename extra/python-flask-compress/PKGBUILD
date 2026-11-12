# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=python-flask-compress
pkgver=1.26
pkgrel=1
pkgdesc='Compress responses in your Flask app'
url='https://github.com/colour-science/flask-compress'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-brotli'
  'python-flask'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-flask-caching'
  'python-pytest'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('55551ebdb8391f36b49f22b71a7ab70a076157d52084c3afbe5f2fa8de71e03614dfad55500a5c5ba4c30626e545ab79e8b2f056a1000cf74ade24bc30db1410')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
