# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=python-flask-compress
pkgver=1.24
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
b2sums=('3ef19bace75e7f53734149fec867076eeafd623c859aad49c7556b51088c493c822112cb02af03926e814b49077bbaa4ada53bd509db926e66ce085d7ba348d4')

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
