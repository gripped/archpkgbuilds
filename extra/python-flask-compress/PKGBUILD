# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=python-flask-compress
pkgver=1.17
pkgrel=1
pkgdesc='Compress responses in your Flask app'
url='https://github.com/colour-science/flask-compress'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-brotli'
  'python-flask'
  'python-zstandard'
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
sha256sums=('99a910f784b9a78b352a5a20dc182de09c59294a64519c598a5345b6282a4f03')
sha512sums=('5f3a4e75610c367d184027f6d01dabdc2a4e55146a4613dcaab3415a905f8f240ddc7a63b7bf1208db21c832489375f3cf600b2d361ca1fc564bf4d4c4737bad')

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
