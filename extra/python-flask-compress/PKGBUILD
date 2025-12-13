# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=python-flask-compress
pkgver=1.23
pkgrel=1
pkgdesc='Compress responses in your Flask app'
url='https://github.com/colour-science/flask-compress'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-backports-zstd'
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
sha512sums=('54754e6676706e67ffc4fecbb714300b9da47ebe41b461be87800143bc3b35c2ce0d44f719370264296c55d358e1dbb5b58c2c5f5a43cb988793006b82a81df6')

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

# vim: ts=2 sw=2 et:
