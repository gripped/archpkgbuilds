# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-fixtures
pkgver=4.3.1
pkgrel=1
pkgdesc="Python fixtures for testing / resource management"
arch=('any')
url="https://github.com/testing-cabal/fixtures"
license=('Apache-2.0 OR BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-testtools')
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
b2sums=('c302900848e1e5e9dbf39a09abc37b9518e2f0c2c41403e9542e678cd781268e1b0d60f73fe38dff2a85f1e146712c3789b7d8f672e9d231ae8792ccc1fdd65b')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m testtools.run tests.test_suite
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING BSD
}
